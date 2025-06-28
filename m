Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DB21A727D
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751100086; cv=none; b=q42qiboICKO/REQh+PlGjqedLNCKE9lYyftlSjXtIUUzaKyazq/xO8/dDUtU7iyTSvx00tjip0gWxkNsiL8uRTC5xvYpdJ8BenjqkEykDX5dT2NXttLwt9GLi6KLNF60aUzQG5b0NMXThk/p5L+YnmBJi9/6q/OEE9sOMCuDLmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751100086; c=relaxed/simple;
	bh=tFBk/EHR2UIa55btSERPFTCjsXJw+XYUInL4U3ebbco=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=uCBini4Ob1h+U2fO3PGQ/5FLxkXj8SO9NKXCnnmwQM72NGvSfR3JnWldTDSIJNtaQd+L4XqiDIOtmEL4p+cLxK2SzfW9ENAzTIZSG8IVGTUomxWR7bQyAFKDqaLSSD3b8rDOHPO2QD9tcr2GAzbrPOJoh2l/3N7rVDwZw0j49vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 55S8a14d028305;
	Sat, 28 Jun 2025 17:36:01 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 55S8a0QL028302
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 28 Jun 2025 17:36:01 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <11cb9a09-f66c-4c46-bd38-fc6080413c29@I-love.SAKURA.ne.jp>
Date: Sat, 28 Jun 2025 17:36:00 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH] brd: fix sleeping memory allocation in brd_insert_page()
To: Jens Axboe <axboe@kernel.dk>, Yu Kuai <yukuai3@huawei.com>,
        Christoph Hellwig <hch@lst.de>, LKML <linux-kernel@vger.kernel.org>
References: <685ec4c9.a00a0220.129264.000c.GAE@google.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <685ec4c9.a00a0220.129264.000c.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav305.rs.sakura.ne.jp
X-Virus-Status: clean

syzbot is reporting that brd_insert_page() is calling
__xa_cmpxchg(__GFP_DIRECT_RECLAIM) with spinlock and RCU lock held.
Change __xa_cmpxchg() to use GFP_NOWAIT | __GFP_NOWARN, for it is likely
that __xa_cmpxchg() succeeds because of preceding alloc_page().

Fixes: bbcacab2e8ee ("brd: avoid extra xarray lookups on first write")
Reported-by: syzbot+ea4c8fd177a47338881a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ea4c8fd177a47338881a
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 drivers/block/brd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/brd.c b/drivers/block/brd.c
index b1be6c510372..ed3eb931750c 100644
--- a/drivers/block/brd.c
+++ b/drivers/block/brd.c
@@ -70,7 +70,7 @@ static struct page *brd_insert_page(struct brd_device *brd, sector_t sector,
 
 	xa_lock(&brd->brd_pages);
 	ret = __xa_cmpxchg(&brd->brd_pages, sector >> PAGE_SECTORS_SHIFT, NULL,
-			page, gfp);
+			page, GFP_NOWAIT | __GFP_NOWARN);
 	if (ret) {
 		xa_unlock(&brd->brd_pages);
 		__free_page(page);
-- 
2.50.0


