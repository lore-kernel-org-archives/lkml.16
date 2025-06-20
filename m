Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B66746BFCE
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750382718; cv=none; b=gbuL3rkDt66kQqL1Kj7b/zKs4evQCFfIHofxPr/9BM20fDbuQpX/FwJARzqpE1REDWrbwZ60g3JumotygguPtIkpbQ4ZUcCmwQ0fb8/IbvRSLCAdd9r3YSSxN12ZHGVKzwreyy5uyr0zSsYf9UOksx7i1IFQlxm7FMUbLGIGx98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750382718; c=relaxed/simple;
	bh=48H87QO2Pis/SoCKFWPY9K3keEwEH0YOZ4nBSSNwcvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nS7r1wB2lVKVuctzEgCCz906oeeRlJGAoCrAW+U8CpqNmCOkGorKM8ZsjL1fWOrWhfV1Tp1DpRL5TiczUFyCB4Hy9GYI9XTnkneOdD9sxQ/XKLmriMIwbMd86F0dvgevdEASrKpxIPSP36XyswDyxlvn5MpqaMcIKf9RdBjymCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=k3eSBrgQ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="k3eSBrgQ"
Received: from pps.filterd (m0167073.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55JGHmYZ015822
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:25:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=+FYO/0M59dmuE89lk57/ngo+KRWnkH8LVWe4hPQu/fY=;
 b=k3eSBrgQX8ugAmAyRe9Y8gTr+vIJTGwUdhWsl33rAVAvAreqvtjanDBu0qjPU8Oq7R+7
 YsDbmccg6QIu6OBC/zvL+r7RWga5vZOEqFhHjEVtPMVo/p9py7inWML+bxPmQxUmxoUb
 MWg+df+2YSh9fTRYsIOjAjSSpLQyVy5ZFGNXSWXoetYRK2QVxLJ0chcaAHRRTRYWXxdM
 XFp4MHrN5VScIMTxXI8+X/4ukqULTb//4zsYL/80h17AcXWhgXqW+s1D4HLcDX4ruCxS
 d6cHYpTQc5CAvR3Or0dJWrU3zokzK1F/AqEEXhQmW3ovbwBDwcJAMH8XU6/hcg2xJT4Q Eg== 
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4794yg4h77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 21:25:15 -0400
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a6f64eebecso21965601cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 18:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750382691; x=1750987491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FYO/0M59dmuE89lk57/ngo+KRWnkH8LVWe4hPQu/fY=;
        b=QMqpWylx4z1UdDpkJ8ntN+TI6RTIN9RQtjb8NwVqeLKesOIEf5e09m1icckYc+nxVg
         WZ2DfAGkvQE77NBciicMwwH9Lb+zQa2HtSablCA9ZnOyn16XBskuwF+PMbUedYFLvhIR
         xVM467bhZBhux/wqakvZusGnD4wcw8S8K1osOy1dkcwt1M6P9/S8ysXIJ4cfgiIoPgpl
         m8ccALZDcAAMit3aW3MFP7TaIhxPFa8Z7c/SKZpx5gsz45Qovc0GJEQC731M3YeKN9fA
         hSlO0ZEOg62hjDrW86CvDh5s86lykHWnQY+rASfNx/7a+gFWVbs83deWeWiX3lp/JoRo
         xj/g==
X-Forwarded-Encrypted: i=1; AJvYcCWZFZKnjnaPsLxAhYiqdc5823CV3j/sWVwyANVLwE9Cferb7+Zpzlh1zCJctxfIumD/Np1USkUfRdibWxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMZQMR5ihQ1pF79zMtsKW0xorCcX4coSehL3ahC65jEQhZcSM/
	i/wsgHOZJIGqwSb+X60KwS7MZ+dZfByR8Bhq2nZihGXd92cu2J5p5/5ZxZ8QSIlySVa/vD7AYTN
	sMg76Avah5+1GrL1K9434bwwd607ZDDf3DW2MJe712aNRKAyBcZ7FKF+rxAjBCA==
X-Gm-Gg: ASbGncv9GiyuzpHBxv4LbwZUaDW0YGdMPwsVFwrk2GxzgwTtmvDI2KYaIVNYEZ+pTpN
	6J5V//WAPoTB38RzwpgNBTPNyKDrfOmYKB9+1MDT/WDF2MqqUfw8QwRKvWz3EWygGjr3HX3hQSs
	YvTcMKrTNblDGWR07spgjb+a1ac60KANMSEfXxyJ+0D+iJbeZxDpl08u9qi64g1pZkI7Nh+rMgq
	n5K5KUunPLOZonmLzSNWMImYuRpED1o8DkxVUOtN8BcardjXV9snri6hw+KHtbcKjRxTuzcULCl
	0OfpNU6yJtcnJRLtkt5qlbEpOvJjgaohxH7j4BQkgUJDdOXuBjMYKazuqXARDQlCGwM2
X-Received: by 2002:a05:622a:40f:b0:47a:e482:2eae with SMTP id d75a77b69052e-4a77a229e06mr20311321cf.31.1750382690684;
        Thu, 19 Jun 2025 18:24:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpgKZPPSMphCZVQvNohMUiRd5i1lgxsJaw2otLFCbdmxNwVix523VQOy7E3/sJIy61nwUvHA==
X-Received: by 2002:a05:622a:40f:b0:47a:e482:2eae with SMTP id d75a77b69052e-4a77a229e06mr20310941cf.31.1750382690182;
        Thu, 19 Jun 2025 18:24:50 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a779e79c12sm3794321cf.53.2025.06.19.18.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 18:24:49 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 19 Jun 2025 21:24:23 -0400
Subject: [PATCH v3 1/4] userfaultfd: correctly prevent registering
 VM_DROPPABLE regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-uffd-fixes-v3-1-a7274d3bd5e4@columbia.edu>
References: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
In-Reply-To: <20250619-uffd-fixes-v3-0-a7274d3bd5e4@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750382688; l=1272;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=48H87QO2Pis/SoCKFWPY9K3keEwEH0YOZ4nBSSNwcvE=;
 b=anDw4BUOIaeEyJ5c4porbKpKkHrHAXlVWt+d9mp9dQbT/Aordkik+mDY6JLUsIbX3B3SmAthB
 I7FE0uQDxRzCy7TSGKnedagoQqrgduV4YtN885eaf3bwsgnhRjP1ODV
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: JlGgFJ-rA-bf5eJh6Gekv33t53-NF-AJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDAwOSBTYWx0ZWRfX4ax3rOh7rplh E7hW+o2r3Q+10k5wTveL2Pll6ak/Sfw96sEb4Paak7dW2ccGc6IwDJemltPZlH9cQYbWRxzUow9 zbU+Eq29RzCE6yV597nCf8og89U7io0Usmjyy1WyNktPrYTkvfvXL/iGR0a1p8q/kwVIOeU2O3W
 ZA0fBE8bK67aOUMrjDu5pKj5rkY45H4XLXEGpGzB2kLgSCwzRJ5Oa8VPpfq5F1XILjmmKRnag1L 5KzfJS0Nys1n9yiiCEq2p7oGycnim/TNFGNiQbfW+gR7vCWA70Pp0lQ4PkykbhYk0qQ2Gb82uoP 9Tc+GnlvG3NqDB5eQdODpfb/mqMtAtDXXwhJXshS3gAXwOMdEQ7cz+wleGNK2D5ui9W3GGNXhcl Gw/STN2/
X-Proofpoint-GUID: JlGgFJ-rA-bf5eJh6Gekv33t53-NF-AJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_08,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=927 clxscore=1015
 bulkscore=10 phishscore=0 adultscore=0 mlxscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=10 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506200009

vma_can_userfault() masks off non-userfaultfd VM flags from vm_flags.
The vm_flags & VM_DROPPABLE test will then always be false, incorrectly
allowing VM_DROPPABLE regions to be registered with userfaultfd.

Additionally, vm_flags is not guaranteed to correspond to the actual
VMA's flags. Fix this test by checking the VMA's flags directly.

Link: https://lore.kernel.org/linux-mm/5a875a3a-2243-4eab-856f-bc53ccfec3ea@redhat.com/
Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason A. Donenfeld <Jason@zx2c4.com>
Signed-off-by: Tal Zussman <tz2294@columbia.edu>
---
 include/linux/userfaultfd_k.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/userfaultfd_k.h b/include/linux/userfaultfd_k.h
index 75342022d144..f3b3d2c9dd5e 100644
--- a/include/linux/userfaultfd_k.h
+++ b/include/linux/userfaultfd_k.h
@@ -218,7 +218,7 @@ static inline bool vma_can_userfault(struct vm_area_struct *vma,
 {
 	vm_flags &= __VM_UFFD_FLAGS;
 
-	if (vm_flags & VM_DROPPABLE)
+	if (vma->vm_flags & VM_DROPPABLE)
 		return false;
 
 	if ((vm_flags & VM_UFFD_MINOR) &&

-- 
2.39.5

