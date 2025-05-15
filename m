Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23F2296D35
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747292036; cv=none; b=W8ew3OHXTF907Zaa0xG5ccxfQC6BWiPnfg7w8hqEh2izpX3PjxWyi2MWeyhEhMQ3O1jms3JZPyIIZCikg045tUK6E9zxDGyyX5AK6AwJFMg3MEjiQ3EixnAkav77CLYhE8mtmKmJzbh10ka186xZv1kDES2h4P/Nm7pF1pIm37E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747292036; c=relaxed/simple;
	bh=RW/Mf1di1y3Yc0pu03/dwGdxv5sTTsexHWXv0Qg3IeM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HbYwTEFI9+c0rQOCv0vBsdG2eOIF3mSCD0r9I8EiUxx0InSn8WNdCC7P9tY9vU2sCx856UZFoEcBK8aMsiQXbMTuLvOSGT8MPH+r688ZZe41xQ9r70TnidYHZsDn5o0O7tuQdD9UPBCfNo4onlUrQ2VoC7qo8gT0pBZ4WIzK5MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZygsK6Q1zz4f3jt8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:53:25 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.128])
	by mail.maildlp.com (Postfix) with ESMTP id 7E03D1A14E8
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:53:45 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP4 (Coremail) with SMTP id gCh0CgAHbGB3jyVoyDnbMQ--.29023S2;
	Thu, 15 May 2025 14:53:45 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Some random fixes and cleanup to shmem
Date: Thu, 15 May 2025 23:47:53 +0800
Message-Id: <20250515154758.956521-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:gCh0CgAHbGB3jyVoyDnbMQ--.29023S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr47JrW7GF13uFW5Kw18uFg_yoWxCwc_ua
	4rta48Gr4UWFW7WF1UKF4Sq398WrW8Wr1vva4SqFWayw1avFn5Wr1DGrWaqr1xXa1ktFs3
	G3W8JryIywnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl8c
	AvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWD
	JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oV
	Cq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG
	8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2js
	IE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kK
	e7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c
	02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_
	Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7
	CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v2
	6r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07
	jSYL9UUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

v1->v2:
-Collect RVB and some minor improvements

This series contains some simple fixes and cleanup which are made during
learning shmem. More details can be found in respective patches. Thanks.

Kemeng Shi (5):
  mm: shmem: avoid unpaired folio_unlock() in shmem_swapin_folio()
  mm: shmem: add missing shmem_unacct_size() in __shmem_file_setup()
  mm/shmem: Fix potential dead loop in shmem_unuse()
  mm: shmem: only remove inode from swaplist when it's swapped page
    count is 0
  mm/shmem: remove unneeded xa_is_value() check in
    shmem_unuse_swap_entries()

 mm/shmem.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

-- 
2.30.0

