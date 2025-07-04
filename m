Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E36C25DB12
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 18:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751653126; cv=none; b=KRqxqolPq4xJ0ejImsNhYEiWDVrJtLAS4wCgQy5ICsWmq4Ng8a+5Km1PTgSLn7RgoU4L/NkrVmUdmFNCO7WxzpLV38CZknMNQUrV2klHR33dZ5gDDRXu98e8hliRJue5GbOhD9QrPWvcgDz0t6iVMXKt24f3Jd0oz8W6Goox0Wk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751653126; c=relaxed/simple;
	bh=D4bHcWdI5D695XmC0DcbE5uLfT/yv66WjyIRRzNBIF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q17xUeO7cqrQiUARbt3Bw8RmSFQZZ0Fwq68Ig2RLxMp7K9IO1OKrcYFlpUSpNSEmaF71ireiHPbTVg9dnFGSVzpRlyWaJdDhPIQE0LADg3ykZvxFC0BCsryLlxhXzrweiGU4ylB/O+6fLZpO9E+u5AJ0Od25cmQPXxAHQ4wSPr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gVAJE5ne; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gVAJE5ne"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d467a1d9e4so230566385a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 11:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751653124; x=1752257924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SySL2jmSZf+IwbPGxTWXoVXdX1jiyaz28t5V3h6OpcI=;
        b=gVAJE5neEsFUVX12psefWzd6DXHbsiMq0u6eT3q04ZbFYPieNPEvj1cd0Sqx93IC0J
         m72x73u4g7l5foEmlEx+ePOSo66DFL6ycsG1H/+4koKGv0z6rVswKyIc+quwDpjU7FsO
         zv8q01lEHwqt8m5T+c6xEMbqzeyHvlSqmq4clF0IVwBYf/r5AU2+yVqKMfI8egL/B39p
         kbny5a9IoMxFvN0Lth6uv1SSKujPpL3iF/StB8POup4jlU0kkeQi4Gi5KXAZBvgyQAiJ
         08cDbqyYeeR3Uig8D+wjY2elpfnF/OwTyd5mXYWoxmo37bc/gC+XluEQUzFtxE66pRB7
         1JDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751653124; x=1752257924;
        h=content-transfer-encoding:mime-version:reply-to:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SySL2jmSZf+IwbPGxTWXoVXdX1jiyaz28t5V3h6OpcI=;
        b=WIdJ5dd+BfveTZTMy8gfsJHciVCDzFaSaEvDdcAXLuJb6NjO2CGcQjrpN/V5uzTop9
         Fh6aMZ5jHgufdsr5pBgDOp0yu5HvDnZTcZC1ZTDia+2Wiw+suLlawehWSBGa7n/pfcO/
         3CFbBZCUyBP/HDL71Fh1TuOiETWgyde3oGnbRweHsZJ30ARBdBXPop3wOiPkH8UiNZy8
         ljhUH3551OvANZlifrDqblW/QqMC/wpixt8e9E4S7BkD0qF1lI7j9sp6HkJIeBm1pmDH
         H7LPSCE168l5WfRQE8Vyw1si1AGi26LnkcEAepSfKLBf1uWz7L5wA4b5AAMghiHog1fV
         5b8A==
X-Forwarded-Encrypted: i=1; AJvYcCW0xag26lR/Lr9HYoPaozm3bVW0S7Rq+bmjgp17m5932yg341vIDZedE6Et3REv3s2qMAqxA3BArhBAUTM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvWb7/RsbSuOSgsggdCelV2qHem30mIbOpKdeEvvgKdvQReP62
	bvZSPESeuakG4C3tytKgrMS+XBgTvn/E3+vLUveQcJ9xhTEpd1bcEMR5
X-Gm-Gg: ASbGnct7xGGClgrje3ked+u2su3gCWMilyKoyfogiY4zTtvOtUVN2AZBD0+06tblKUn
	1xmcpFH58w5vDOf6awXVuutr4zkDA9yHwD3L9D8L6dqpj2tFJf8i4bd9NRPlGfUD9l7nukAxB8P
	yHupSptJgRCtvOP6Hb9usSLJAnu0sdo/qLY7kIKs63HE/Fjc9V3Pqlzm7TgjeWZ8yXsCqxzi9PV
	W6y/kYJ2o1UECrHyaNNjzONhSLrLHtZyop3Y/wFvVP6DTPGTE0s7jaEkNswAakCwtgj7ziV+xoZ
	SK9mQ5roZsH0eC6qEMHHbU2qNfKaDTqCTZa0NNRiIMKTdkadCS+wbmU+e5G969xEwSk=
X-Google-Smtp-Source: AGHT+IGPsEESA1JToeYXhuEkFG+0ssxexxcX9oiBTKNbVP6yi9xfkhZnssssTwAiqhhq3LtkJSSg5Q==
X-Received: by 2002:a05:620a:618b:b0:7d3:e56e:4fd8 with SMTP id af79cd13be357-7d5dc66a567mr493346285a.12.1751653124279;
        Fri, 04 Jul 2025 11:18:44 -0700 (PDT)
Received: from KASONG-MC4 ([101.32.222.185])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbe7c188sm183300585a.59.2025.07.04.11.18.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 11:18:41 -0700 (PDT)
From: Kairui Song <ryncsn@gmail.com>
To: linux-mm@kvack.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Hugh Dickins <hughd@google.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Matthew Wilcox <willy@infradead.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Chris Li <chrisl@kernel.org>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: [PATCH v4 9/9] mm/shmem, swap: fix major fault counting
Date: Sat,  5 Jul 2025 02:17:48 +0800
Message-ID: <20250704181748.63181-10-ryncsn@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250704181748.63181-1-ryncsn@gmail.com>
References: <20250704181748.63181-1-ryncsn@gmail.com>
Reply-To: Kairui Song <kasong@tencent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kairui Song <kasong@tencent.com>

If the swapin failed, don't update the major fault count. There is a
long existing comment for doing it this way, now with previous cleanups,
we can finally fix it.

Signed-off-by: Kairui Song <kasong@tencent.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
---
 mm/shmem.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mm/shmem.c b/mm/shmem.c
index 646b1db9501c..b03b5bf2df38 100644
--- a/mm/shmem.c
+++ b/mm/shmem.c
@@ -2321,12 +2321,6 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 	/* Look it up and read it in.. */
 	folio = swap_cache_get_folio(swap, NULL, 0);
 	if (!folio) {
-		/* Or update major stats only when swapin succeeds?? */
-		if (fault_type) {
-			*fault_type |= VM_FAULT_MAJOR;
-			count_vm_event(PGMAJFAULT);
-			count_memcg_event_mm(fault_mm, PGMAJFAULT);
-		}
 		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
 			/* Direct mTHP swapin skipping swap cache & readhaed */
 			folio = shmem_swapin_direct(inode, vma, index, swap,
@@ -2346,6 +2340,11 @@ static int shmem_swapin_folio(struct inode *inode, pgoff_t index,
 				goto failed;
 			}
 		}
+		if (fault_type) {
+			*fault_type |= VM_FAULT_MAJOR;
+			count_vm_event(PGMAJFAULT);
+			count_memcg_event_mm(fault_mm, PGMAJFAULT);
+		}
 	}
 
 	if (order > folio_order(folio)) {
-- 
2.50.0

