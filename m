Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73F3A22A80F
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747383333; cv=none; b=WNBH8/EJd0fnwmIFaaCk3b4soqupra3XtEYYJfwUXakW7MVSaRoo7yVRPsDK2zLIYzgP7PFyfZ9w4ta1/B+Hu8aRP+yIw5q0L5M5DWmg5s8EkOp1IK6nkdMezFEmoeMjV/6n7c8KAq/aNYmXnT5OgaJvzUZHv7FNetdugEpWUGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747383333; c=relaxed/simple;
	bh=VhY8qcYPgGp2RMAY783OqIqQkR/Hk+jPLnVv/E9bnUY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=biDGAHsCrUCPowuq9nYUzceUfvnUXRJcq4WjHsbG8Y+h+lW5r2HKpwVV60+5yHFI5Y416ABWSkU9k7UnnmoM3k9QhYLv6iO4S1BLIcWG7OLvl1fXH5sX3rse/CZ1t/tY5wuH4sUUfLU4K0F1Im1+eCgJOLWtqIsWWyFwjwvdCiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4ZzKd837T5z4f3jqb
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:08 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 18BE31A105C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 16:15:28 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP3 (Coremail) with SMTP id _Ch0CgDnOsUe9CZo9fSDMQ--.49450S2;
	Fri, 16 May 2025 16:15:27 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: ryncsn@gmail.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Some random fixes and cleanup to shmem
Date: Sat, 17 May 2025 01:09:34 +0800
Message-Id: <20250516170939.965736-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgDnOsUe9CZo9fSDMQ--.49450S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtr47JrW7GF13uFW5Kw18uFg_yoWxKFg_Wa
	4rta48GrWUWFW2gFyUKF4SqrZ8WrWxWr1kXa4FqFWayw1av3Z5Wr1DGrWaqr1xXa1vyFs3
	G3WkJryIkwnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl8c
	AvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq
	3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gc
	CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
	r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
	Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAa
	w2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
	6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	xUVcTmDUUUU
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

v2->v3:
-Collect more RVB and add Closes tag

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

