Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AC1C831A
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 06:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749278418; cv=none; b=uvuHdtwu+hmodag4GAhLbzkWdUmxScpJn7zco2yrXiilY5QVsfqR98T5EuYKFBSk0MoXV0NjbnSfF2AqbRz+C/8cMLd3kzMGEqpN3Ti+Oh9vNJpXv9s/e7ft0B/7cul2fLZTBTIl63d2DLF2Nr8IywMKZC0jM+V+AF470HgkVDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749278418; c=relaxed/simple;
	bh=n8v8jQPEHBDi3OBta5pBlj9xOrKQ3fNVoKSw2MhnIFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O/K0YfJrq/iLL8+u1Z4rs+xW72HZ4zaaG1nSPUmyxxRDAkPVppZGMbZkPyj29EumpgF5KlV7Ln86SNJuU4veujycjw3KGSSHsTMLSQpuX5qjoBjkfSbQtZJjJMzidsGPm+UKPBFBNEfm9Nbcm9259Y/nDIhIbQTXAPuUCJ72jZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VoZQaagw; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VoZQaagw"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5576QAql031267
	for <linux-kernel@vger.kernel.org>; Sat, 7 Jun 2025 02:40:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=eaF9ZDIYfaNPwqo33y/LzhOGAoT+trG57Ins5sBuVJU=;
 b=VoZQaagwt5enjptpd1TPl1Zpsx9Lh8tfd1l1+TN2m8NquYeF6qRzFvoPHMwHfKLEW7J/
 qVFs1HsUl8OTJ+bwCWlGjyykPPSyFM1hMKLwuYBCeOi1BHqQIoSdi611Ru3eBYn9UEsx
 yjlPt6UC0QxmRNDcJSuN+yTd9fkOwy9QLn4izW7wtKTSM7TP5OmXoDPdKY05a07ng2DW
 U4FJ4tkMup1KSVmfZATnGzHOduYxGe0c5fhoxtLNaqk3hXKvnV8tL1AWCYvSEEnOiUU3
 UKM4DZp3DNpQecnEVE9YecJeeJoY5yHq91ZG2vtKg6MA8EvOZXZ6d3Ros0/ElAAjdZDf Gg== 
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 474efj089k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:40:09 -0400
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6facd1cc1f8so61066636d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 23:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749278409; x=1749883209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaF9ZDIYfaNPwqo33y/LzhOGAoT+trG57Ins5sBuVJU=;
        b=blP4DfUX6Y44EJC/Ir9yDWeG5dRx/LEiKLXlQoGC3cG8f+YZaxR6R8hVSGbGwkVtiL
         wLhSDpHIOkXohWj2g2Gh5Ngpkz5Q+dAR8NwPCPIa+LvWRU8qChW67xB3DxdXOaw+USFh
         1fLuNPrR77nttl7rS0cOgEn5+KFh4xjOQMY0R4ZtpF3AjaXV75kf/ZKnj1qVQxbJvVtY
         YJZMn5FBgDVaFB4S5ZSnJyGtebH2vVYghppDfjJJMQMI8lRSMwk1Y72iMtmiBcrmC+2t
         UkAXNDcPiqU2OPvjv+ImVVJ27pP7EsrK50Tvy8xvH60NDNhZK1ELB3WTVHEeLFLOt2VJ
         KRXA==
X-Forwarded-Encrypted: i=1; AJvYcCWjPgNwtfYVXVcAORZpBT/gP4HBeimLy2jhHcTUyc/u2XRzEXwAkgEaAOuNysdYGAjeZVIQNc2pjAoN4Wo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgq6rBRXkFfB2FlnfT1o3fv3o/k58/clyFngwuir+Jk2HWNl+m
	RdbRsdyDlBtnUsfJe34a1H9ypt0BMAGetSrS6XDiPnJd41rsQTfYxfycFv0uDP1NeGHAsyJCIQx
	QOqIMtqI+crnROB6VoeScXVY5SKiirWi3aJ4teG7JIRfRDZtimCaXo4yv8ufrz3JGvKzByA==
X-Gm-Gg: ASbGncsmdrdnZs0yExqRuZ3vu0AStm15Q0MbPhDobD9KUFaOj+GP6aZEuSv/6Iu/m+F
	lfzR53ML/HwUqH/5fgKE29M0vHOcae+ck+GsGMF+COE7+kASeJ+uupr9KPRz8TLZdwspRIeJgJo
	aFM+SfduQORJc2sl1O92ZW7QJRVy1yAGG0s7jzvBV5K9gS7nbsOdmqnVK52BJ5NIK4kspdiWswm
	3eUs62OtyAcnzV2am/gLVGJXu+0fcZt1Lgn+vwKv35zvvYX/CxHYWYgD9B/1NHMjRpbUynIeaQs
	KZpTta/iOPfYR7bETZ2pQrmlN8UokS5dg4pfCtYHqzwkd6eZbWlTy9SjcSoNoTkUQJcl
X-Received: by 2002:a05:6214:624:b0:6f5:1192:ccdf with SMTP id 6a1803df08f44-6fb0922740cmr85295686d6.6.1749278408745;
        Fri, 06 Jun 2025 23:40:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcjl9GUbUvEFtWZ3GsQ4g7VepvswlFi7U+0OrNlaG/MUErefc5q5qG7CspnMXy4V+lIvtikQ==
X-Received: by 2002:a05:6214:624:b0:6f5:1192:ccdf with SMTP id 6a1803df08f44-6fb0922740cmr85295506d6.6.1749278408385;
        Fri, 06 Jun 2025 23:40:08 -0700 (PDT)
Received: from [127.0.1.1] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09ac95e5sm24461256d6.43.2025.06.06.23.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 23:40:07 -0700 (PDT)
From: Tal Zussman <tz2294@columbia.edu>
Date: Sat, 07 Jun 2025 02:40:00 -0400
Subject: [PATCH v2 1/4] userfaultfd: correctly prevent registering
 VM_DROPPABLE regions
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250607-uffd-fixes-v2-1-339dafe9a2fe@columbia.edu>
References: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
In-Reply-To: <20250607-uffd-fixes-v2-0-339dafe9a2fe@columbia.edu>
To: Andrew Morton <akpm@linux-foundation.org>, Peter Xu <peterx@redhat.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        David Hildenbrand <david@redhat.com>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
        Andrea Arcangeli <aarcange@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Tal Zussman <tz2294@columbia.edu>
X-Mailer: b4 0.14.3-dev-d7477
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749278406; l=1224;
 i=tz2294@columbia.edu; s=20250528; h=from:subject:message-id;
 bh=n8v8jQPEHBDi3OBta5pBlj9xOrKQ3fNVoKSw2MhnIFs=;
 b=rLCjnu3AuVjLMRsMouTDVAgFuy+fcnCkD8pTP58asoC4UhRlnYBPIGfGT7fICZTuJrXdQHyrR
 wFAzlGwgnCNACX8voDZpUDTUa7mpjPed0z1/ibxyJptvF9x6tZPNH0i
X-Developer-Key: i=tz2294@columbia.edu; a=ed25519;
 pk=BIj5KdACscEOyAC0oIkeZqLB3L94fzBnDccEooxeM5Y=
X-Proofpoint-ORIG-GUID: ieGrgtJ-RGfXKQeP-0M-n-MgxVQ3mZzi
X-Proofpoint-GUID: ieGrgtJ-RGfXKQeP-0M-n-MgxVQ3mZzi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA3MDA0NyBTYWx0ZWRfX1na80oSn7CYG XDyOIr6EtDK2ZOa+0w4ouUmMpJYksMo4XTkDNL1ZRzsIPmDetVAxT5kQFOMmipVfgAyQAPabkLX vbRfTrgvpSitt4FDZNQEZMEkDWwQfIGRhlqUljEkR+Rhi6Q4hmgdvUjRAgVdo6m0IP8vj1grhlm
 VS/B1S3RmbueDHE0wyipHejAl5ntYkdjf53djPeZqeDiuI1WXYrT3tpkLpz1uH3X1KJCor0AHlt Bdq9bGjn321MMMpzjcwV9T9vjt6vTskuRP/Dalv9+mlvlWEJHsy1111fuUdMCU3tUPYwnunrun9 iyUOlZbArQTbDv+g3/15Jl6gS5iSqM9bC3qkcMobWSASraH6q5zCg2Tb6i6pzeMTfcUW2rjC27v QxnEnTIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-07_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=10 malwarescore=0
 adultscore=0 clxscore=1015 spamscore=0 mlxlogscore=902 bulkscore=10
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506070047

vma_can_userfault() masks off non-userfaultfd VM flags from vm_flags.
The vm_flags & VM_DROPPABLE test will then always be false, incorrectly
allowing VM_DROPPABLE regions to be registered with userfaultfd.

Additionally, vm_flags is not guaranteed to correspond to the actual
VMA's flags. Fix this test by checking the VMA's flags directly.

Link: https://lore.kernel.org/linux-mm/5a875a3a-2243-4eab-856f-bc53ccfec3ea@redhat.com/
Fixes: 9651fcedf7b9 ("mm: add MAP_DROPPABLE for designating always lazily freeable mappings")
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Peter Xu <peterx@redhat.com>
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

