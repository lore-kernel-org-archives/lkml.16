Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48959C2EF
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747884717; cv=none; b=ZCKt0x9clBCxSpTMmreOVf2Naj+ZKGctJRT/faMOhGIuBO96rbrWSLb+YtWyZVUuGuMvW6aRJBVUdocT7UP0Pqsk4FcqQgUWJXbohutWGwOacwKJk7CAUSnSpctGkuhKQ+/82oaMf1J5BkBK9/K2jPCvFTCbtC0U4lcqHa+AVAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747884717; c=relaxed/simple;
	bh=9WXWpq6p5CxnpaZUcu2c6bPZyeseTy1tkdDIOFq42aQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KOAbcMUFYA0kgZZuohBg4F00QPgiw5TJF53PXdHhBSyuyeSvUf6TpE+d7HClF50/A/cEnpShSvchm6ADsspQo2uwNb6yGlZmbCcl915xmZhYW9eAr+cZ5WZR9lPb8QYci0qwonzZjNk0FtQSXS6YoaXT9/aJT3dtA+QvFEnOn+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4b2v325z96z4f3jdQ
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id DFABD1A0F7C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:31:51 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgC3Z3immi5okKq2Mw--.19487S2;
	Thu, 22 May 2025 11:31:51 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: akpm@linux-foundation.org
Cc: kasong@tencent.com,
	bhe@redhat.com,
	hannes@cmpxchg.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] Some randome fixes and cleanups to swapfile
Date: Thu, 22 May 2025 20:25:50 +0800
Message-Id: <20250522122554.12209-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgC3Z3immi5okKq2Mw--.19487S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYa7kC6x804xWl14x267AKxVWUJVW8JwAF
	c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2jI8I6cxK62
	vIxIIY0VWUZVW8XwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xII
	jxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjc
	xK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IY
	c4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI
	0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY
	0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF54CYxVCY1x0262kKe7AKxVWUAVWUtwCFx2IqxV
	CFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_Gr
	UvcSsGvfC2KfnxnUUI43ZEXa7IU0miiDUUUUU==
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

Patch 0-3 are some random fixes. Patch 4 is a cleanup. More details can
be found in respective patches. Thanks.

Kemeng Shi (4):
  mm: swap: move nr_swap_pages counter decrement from folio_alloc_swap()
    to swap_range_alloc()
  mm: swap: correctly use maxpages in swapon syscall to avoid potensial
    deadloop
  mm: swap: fix potensial buffer overflow in setup_clusters()
  mm: swap: remove stale comment stale comment in
    cluster_alloc_swap_entry()

 mm/swapfile.c | 64 ++++++++++++++++++++++++---------------------------
 1 file changed, 30 insertions(+), 34 deletions(-)

-- 
2.30.0

