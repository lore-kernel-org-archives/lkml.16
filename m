Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB196271455
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 13:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352099; cv=none; b=K56ztEcUNyTmTxfzZj1MCRDsjNnwIjsaTb2aKTHDX0WyLCel9byjoGxcIon0zb9sQnGeanV2gnbIQ+CNvrebYfwJ4DkVZ/GXm1omc5WpCHLG2AzmZnoBdlil3PEQVTO+w1l5hJl1Qrk3LrdKibi0IpkMFztgsuuN+uoGGqwiwis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352099; c=relaxed/simple;
	bh=Q0RuftWqRTmI0z/0mzNToBYq8HBDJeREEk0wzhDz2Ik=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=spFBLJzTWTDnOeBrr2wKTKJN3kMniKQgkLRinlEL+uvSRvOWskArBlBqph1zfFgxmPF8uqhsFfoRX6j8DHuahvehvmAjxPlA5piPuXB3LqvabbXnokKF6X0/O0QpcJQTQ1w2oUUsqCZb9L2Q0NYN4WebEIq4TBLzNe8krkx4Kn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4b6CvF6h0Xz4f3k68
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:21:13 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 0F5D01A018D
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:21:34 +0800 (CST)
Received: from ultra.huawei.com (unknown [10.90.53.71])
	by APP3 (Coremail) with SMTP id _Ch0CgBX98FavDVoK9fhNQ--.12329S4;
	Tue, 27 May 2025 21:21:33 +0800 (CST)
From: Pu Lehui <pulehui@huaweicloud.com>
To: mhiramat@kernel.org,
	oleg@redhat.com,
	peterz@infradead.org,
	akpm@linux-foundation.org,
	Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	pulehui@huawei.com
Subject: [RFC PATCH v2 2/2] mm/mremap: Expose abnormal new_pte during move_ptes
Date: Tue, 27 May 2025 13:23:51 +0000
Message-Id: <20250527132351.2050820-3-pulehui@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527132351.2050820-1-pulehui@huaweicloud.com>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgBX98FavDVoK9fhNQ--.12329S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Wr43Kry8tF13uF47ZFy5Arb_yoWfJrgE9r
	4Fqr95tr4DAr1vyw15Cwn8urZIkw1qgr18XFnxtr92yr4kJan3ur929rWkZa9ruryj9rZ8
	Wr4kJrWIgr1UKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbDAYFVCjjxCrM7AC8VAFwI0_Wr0E3s1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l82xGYIkIc2x26280x7IE14v26r15M2
	8IrcIa0xkI8VCY1x0267AKxVW5JVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK
	021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r
	4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx
	0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxV
	WUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UCZXrU
	UUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/

From: Pu Lehui <pulehui@huawei.com>

When executing move_ptes, the new_pte must be NULL, otherwise it will be
overwritten by the old_pte, and cause the abnormal new_pte to be leaked.
In order to make this problem to be more explicit, let's add
WARN_ON_ONCE when new_pte is not NULL.

Suggested-by: Oleg Nesterov <oleg@redhat.com>
Signed-off-by: Pu Lehui <pulehui@huawei.com>
---
 mm/mremap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mremap.c b/mm/mremap.c
index 83e359754961..adb3a111b5c1 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -237,6 +237,8 @@ static int move_ptes(struct pagetable_move_control *pmc,
 
 	for (; old_addr < old_end; old_pte++, old_addr += PAGE_SIZE,
 				   new_pte++, new_addr += PAGE_SIZE) {
+		WARN_ON_ONCE(!pte_none(*new_pte))
+
 		if (pte_none(ptep_get(old_pte)))
 			continue;
 
-- 
2.34.1

