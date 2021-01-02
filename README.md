# PoV of the Ruby 3.0's ractors true parallelism

Ractor workers VS Threads workers in brute force tasks (vs IO tasks)

## Benchmarks
```
                                                               cpu         real
Workers::ClassicWorker calls `Tasks::IoTask` 4 times      0.000562   (4.003749) <= reference
Workers::ThreadsWorker calls `Tasks::IoTask` 4 times      0.001412   (1.000744) <= almost 4x faster with concurrency
Workers::RactorsWorker calls `Tasks::IoTask` 4 times      0.001025   (1.000896) <= almost 4x faster with parallelism
Workers::ClassicWorker calls `Tasks::BruteTask` 4 times   4.471339   (4.471443) <= reference
Workers::ThreadsWorker calls `Tasks::BruteTask` 4 times   4.485730   (4.483423) <= no benefits with concurrency
Workers::RactorsWorker calls `Tasks::BruteTask` 4 times   5.164506   (1.319021) <= still almost 4x faster with parallelism
```
