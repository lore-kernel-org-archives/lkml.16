Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6635021518F
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209398; cv=none; b=RRtnPWxMTALm5lM1xAC50mEltfgniXPHeUug+xTUwQ8BZrsfRySYcGr+94lmyd4gvcOU6lhjCbi7koX9pSGyHzBI3dD0gcEYs+OW64dQyjeBtXv9sYRYFGiSw1p3EwhYkNJWw276Bkmk7TOM1TDGwgcIiMvWfrtPac2kL/fyYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209398; c=relaxed/simple;
	bh=28ykJQNSlF3tR7W/1pFaKNz1/m9vLEoT+fFRt/kSaQA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=H643oHdIOb+RJYkjGQxG+kerMR3zhI+QuiIZtTnSjzBbE17XSksf6fIDYAbN8NldypVKgWQ899uUn5WS5MHAqlYWTm9skYfNLFamf8N+3EJXSdgz/gSpjW1DKN2d8SrQn5KxSxjwXl/aj72JNgHg4jsV6xoGrwxQVZLnzfDOU6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.216])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Zy5JF177Xz4f3jtP
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B25F71A12E8
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:56:32 +0800 (CST)
Received: from huaweicloud.com (unknown [10.175.101.6])
	by APP1 (Coremail) with SMTP id cCh0CgDXOnuvTCRoTNWvMA--.62928S2;
	Wed, 14 May 2025 15:56:32 +0800 (CST)
From: Kemeng Shi <shikemeng@huaweicloud.com>
To: hughd@google.com,
	baolin.wang@linux.alibaba.com,
	akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Some random fixes and cleanup to shmem
Date: Thu, 15 May 2025 00:50:42 +0800
Message-Id: <20250514165047.946884-1-shikemeng@huaweicloud.com>
X-Mailer: git-send-email 2.30.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:cCh0CgDXOnuvTCRoTNWvMA--.62928S2
X-Coremail-Antispam: 1UD129KBjvdXoWrJrWkXFWkurW5Kry5Wr1kGrg_yoWxXrb_ua
	4rJa4DWr43WFWUWa17KF4xXrWYgrW8Xr4qqas2qF4ayw1YyFn5uw1DCrWSvr1xXa1kJFsx
	Aw1kJry7AwnF9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbxAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l87I20VAvwVAaII0Ic2I_JFv_Gryl8c
	AvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWD
	JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gc
	CE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxI
	r21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87
	Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAa
	w2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
	Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r12
	6r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
	kF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07
	jSYL9UUUUU=
X-CM-SenderInfo: 5vklyvpphqwq5kxd4v5lfo033gof0z/

This series contains some simple fixes and cleanup which are made during
learning shmem. More details can be found in respective patches. Thanks.

Kemeng Shi (5):
  mm: shmem: avoid unpaired folio_unlock() in shmem_swapin_folio()
  mm: shmem: add missing shmem_unacct_size() in __shmem_file_setup()
  mm/shmem: Fix potential dead loop in shmem_unuse()
  mm: shmem: keep inode in swaplist when failed to allocate swap entry
    in shmem_writepage()
  mm/shmem: remove unneeded xa_is_value() check in
    shmem_unuse_swap_entries()

 mm/shmem.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.30.0

