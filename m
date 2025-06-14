Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532732DECB0
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749911710; cv=none; b=FGyuaiGaH3P0SqpsBUKOo/0C/npRISkqbNCEUyrzFK1rp7dtxmIJftVZaf8VkzRogJAVScECLJUe7jpX5KUXWEHj+47kKxBM/b+RbGzPBcYjny9gM8T75/+ecp5+nZXRHiukla/pWkcgGR4XIZKa8fzoLWC01/FE8gWErpqZ4t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749911710; c=relaxed/simple;
	bh=XngLg+UTC2r+gkvpHZBWpkkEKwZaiIp7X3MAB3zKVGk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/it8TXLaxqT39oInJA20rp5AmcbFsIEnz/ioKP5eqvw02bF5hVk6XH4E5d7AVP9r+nW2kT4yzbNA4nKPD2ZSOpLflF0HiRGnJXRND8XIS2fqsrrccuAWGXu9c6DYy8R0cMz4E8TddyRNQVKsr3igYZ25tczjhJM97+41vk8nu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bKJfp6rPgztSLv;
	Sat, 14 Jun 2025 22:33:54 +0800 (CST)
Received: from kwepemj200003.china.huawei.com (unknown [7.202.194.15])
	by mail.maildlp.com (Postfix) with ESMTPS id 0948B140154;
	Sat, 14 Jun 2025 22:35:06 +0800 (CST)
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemj200003.china.huawei.com (7.202.194.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Sat, 14 Jun 2025 22:35:05 +0800
From: Qinxin Xia <xiaqinxin@huawei.com>
To: <21cnbao@gmail.com>, <m.szyprowski@samsung.com>, <robin.murphy@arm.com>
CC: <yangyicong@huawei.com>, <hch@lst.de>, <iommu@lists.linux.dev>,
	<jonathan.cameron@huawei.com>, <prime.zeng@huawei.com>,
	<fanghao11@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <xiaqinxin@huawei.com>
Subject: [RESEND PATCH v4 4/4] selftests/dma: Add dma_map_sg support for dma_map_benchmark
Date: Sat, 14 Jun 2025 22:34:54 +0800
Message-ID: <20250614143454.2927363-5-xiaqinxin@huawei.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20250614143454.2927363-1-xiaqinxin@huawei.com>
References: <20250614143454.2927363-1-xiaqinxin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj200003.china.huawei.com (7.202.194.15)

Support for dma_map_sg, add option '-m' to distinguish mode.

i) Users can set option '-m' to select mode:
   DMA_MAP_BENCH_SINGLE_MODE=0, DMA_MAP_BENCH_SG_MODE:=1
   (The mode is also show in the test result).
ii) Users can set option '-g' to set sg_nents
    (total count of entries in scatterlist)
    the maximum number is 1024. Each of sg buf size is PAGE_SIZE.
    e.g
    [root@localhost]# ./dma_map_benchmark -m 1 -g 8 -t 8 -s 30 -d 2
    dma mapping mode: DMA_MAP_BENCH_SG_MODE
    dma mapping benchmark: threads:8 seconds:30 node:-1
    dir:FROM_DEVICE granule/sg_nents: 8
    average map latency(us):1.4 standard deviation:0.3
    average unmap latency(us):1.3 standard deviation:0.3
    [root@localhost]# ./dma_map_benchmark -m 0 -g 8 -t 8 -s 30 -d 2
    dma mapping mode: DMA_MAP_BENCH_SINGLE_MODE
    dma mapping benchmark: threads:8 seconds:30 node:-1
    dir:FROM_DEVICE granule/sg_nents: 8
    average map latency(us):1.0 standard deviation:0.3
    average unmap latency(us):1.3 standard deviation:0.5

Reviewed-by: Barry Song <baohua@kernel.org>
Signed-off-by: Qinxin Xia <xiaqinxin@huawei.com>
---
 tools/testing/selftests/dma/dma_map_benchmark.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/dma/dma_map_benchmark.c b/tools/testing/selftests/dma/dma_map_benchmark.c
index b12f1f9babf8..c37cbc7e8766 100644
--- a/tools/testing/selftests/dma/dma_map_benchmark.c
+++ b/tools/testing/selftests/dma/dma_map_benchmark.c
@@ -27,6 +27,7 @@ int main(int argc, char **argv)
 	int fd, opt;
 	/* default single thread, run 20 seconds on NUMA_NO_NODE */
 	int threads = 1, seconds = 20, node = -1;
+	int map_mode = DMA_MAP_BENCH_SINGLE_MODE;
 	/* default dma mask 32bit, bidirectional DMA */
 	int bits = 32, xdelay = 0, dir = DMA_MAP_BIDIRECTIONAL;
 	/* default granule 1 PAGESIZE */
@@ -34,7 +35,7 @@ int main(int argc, char **argv)
 
 	int cmd = DMA_MAP_BENCHMARK;
 
-	while ((opt = getopt(argc, argv, "t:s:n:b:d:x:g:")) != -1) {
+	while ((opt = getopt(argc, argv, "t:s:n:b:d:x:g:m:")) != -1) {
 		switch (opt) {
 		case 't':
 			threads = atoi(optarg);
@@ -57,11 +58,20 @@ int main(int argc, char **argv)
 		case 'g':
 			granule = atoi(optarg);
 			break;
+		case 'm':
+			map_mode = atoi(optarg);
+			break;
 		default:
 			return -1;
 		}
 	}
 
+	if (map_mode >= DMA_MAP_BENCH_MODE_MAX) {
+		fprintf(stderr, "invalid map mode, DMA_MAP_BENCH_SINGLE_MODE:%d, DMA_MAP_BENCH_SG_MODE:%d\n",
+			DMA_MAP_BENCH_SINGLE_MODE, DMA_MAP_BENCH_SG_MODE);
+		exit(1);
+	}
+
 	if (threads <= 0 || threads > DMA_MAP_MAX_THREADS) {
 		fprintf(stderr, "invalid number of threads, must be in 1-%d\n",
 			DMA_MAP_MAX_THREADS);
@@ -111,13 +121,15 @@ int main(int argc, char **argv)
 	map.dma_dir = dir;
 	map.dma_trans_ns = xdelay;
 	map.granule = granule;
+	map.map_mode = map_mode;
 
 	if (ioctl(fd, cmd, &map)) {
 		perror("ioctl");
 		exit(1);
 	}
 
-	printf("dma mapping benchmark: threads:%d seconds:%d node:%d dir:%s granule: %d\n",
+	printf("dma mapping mode: %d\n", map_mode);
+	printf("dma mapping benchmark: threads:%d seconds:%d node:%d dir:%s granule/sg_nents: %d\n",
 			threads, seconds, node, dir[directions], granule);
 	printf("average map latency(us):%.1f standard deviation:%.1f\n",
 			map.avg_map_100ns/10.0, map.map_stddev/10.0);
-- 
2.33.0

