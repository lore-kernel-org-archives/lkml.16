Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69220186E2E
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 15:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746630171; cv=none; b=gPMvZW2Jr91Tb7g5ZgusblhmikhVy3qSbNfYe4zn+Yr3g2g2AYRnJ8FcnIkH2TH5ORuuh4GvmgKgwSLffG2gfSrSFma4kz/E/mUfjC2Ce4NHTAuR7J7MQsFLCfX23wrg/LVRYD1T7bpoJkd1RvLY5JvtF5sZbYML3wdMVRjTA7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746630171; c=relaxed/simple;
	bh=VE+aLPjfOksXk4O266e8PqL8QT1UL6xWrwQS7bEc86o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pz9JTiUX47KmJtRPTvlaMtt3ljQ0oISsbttrEEtjamFBqIFUTvkvXZkI41wlVHWE3e7hN7Oif7GS6PDP6prN+OdtL5805iTYaP+CuZ2okNmnC/IfAjhLx4yuEh1Pv56AP6AsAuZ6Romr0HWaEbKTqTPJ2KXByF9mSrMeaZvXaGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ToKH7x1r; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ToKH7x1r"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ad1e8e2ad6bso216678866b.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 08:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746630168; x=1747234968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PvCQsEtnh2TDP3TsTaRREibOrpi3QlqsGJ0VRdAePO8=;
        b=ToKH7x1rhSmRdNePMUY765IRIId/dcc18wno8pCi3gDxhFJKGojYJGDfhd/Jd3AmXv
         IfGr/6vHCXTxH7SpRjtZQokO55Zyjv4nzYTkQ/J2ql6OnDyF8RUlQAshtfe1xH4gtQU5
         gYJyBSrnt6iDTIkANbbGG7CtEZDrmHjT2sDGyAKizE1gp92XgQpNc7qj75obHKaE2xDg
         nQHgJ6eh1TIq8TxBaIOlNCBqOcajIwypsAeadWulIatHdTeH38QTaPgMHqIvILzOpZKt
         OB0REDXnQZpP/7SahGcWR0RRhB97geAIwZinidqffVOs8svl4HY+jguKlvIrsPTOAVHo
         +txw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746630168; x=1747234968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PvCQsEtnh2TDP3TsTaRREibOrpi3QlqsGJ0VRdAePO8=;
        b=g3D4Yc73c1Q8Nh5KTMufajCz+BAIO6tkwL5aJW4Oh2dacyYsznOqnsGZj55hxfgF4X
         YapIZQx6xkWfH2xCtnofBbiV9IsEsKJ+x7jUh3KZkJ9PXkgdIKRG9Kp13wcVzqUCielC
         VNa84zMloNCthLow6DqVvPGe5KAvxmNtm1GIDRyKO6V6VSC7A1TtBYev3EqjedIYneXS
         7RYzuCm/vrqxMd/XXJNLG3h9iXoA8vCPfOBvPe9VQtRN2YVcY0JLTBDzaSjFNyJzN0A2
         jN+/iSO8GOyGU0XSJxXr5YuMjauXYCCK7QOw9BFKz2RiTRhRGb1niomqTQj0rAAcT9UW
         /NcQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3Rb3LBI7XD/LDf/Jvy+RUvCh+eBanhQRHL9CYsHLTXPVDBITUjvNQuPGYiS3WNBnW5HPKbGQIDpreFDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfV/Lg0cp2JUxuGIQ2PxjYbIPAoiBXHqDyiVo5mzVZXhn/uz75
	MnV1hl0bkKSXpnQWUqCbIVrqw7eU1BZoaBcwacgbISX52q/5+tOp
X-Gm-Gg: ASbGnctBsrunAdpZbPnNkSNsezkqKkSwO32yWu7Ut329Fcjk6NSOg/qDS7XBBL1ycAd
	56tYF36bFplc+eu4kntLGd4JCKCudzClA20i5FIe8QTJBTyjOvklcM/H3AKH60i7gxJERitb1Jn
	IgHLW6rSe4SVdD5x+vTWj084MBXlKDdUA2inkMYFfoiJTsgAOIYKvcjBx98EVP0zXDHycMbTo+Y
	13qi7fano0XKFNoPe1gaCFC1fAL9ROGxlPtWuLBdPeAXplaiDbdeI5w2Qh9X0DiGFh0nb3u3V6M
	JlSVNYyGvDkkVl5W+YknKSy9uypuGnWt2UqBypHG0cbRasmjsA1bYOvYDA6gkUdsd+ul+5EvZci
	1SE/b4kid2vz8XaUPqLM=
X-Google-Smtp-Source: AGHT+IGplFhlmPdENtVOHblHI4Aifx/JZlKRDKVxCGNuhfO/rD2149FEo3+r3YoKDpHZypP8PzzeIg==
X-Received: by 2002:a17:906:99d3:b0:ace:3f00:25f5 with SMTP id a640c23a62f3a-ad1e8c8c0bemr391262166b.2.1746630167072;
        Wed, 07 May 2025 08:02:47 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:14f7:eab6:23d5:4cab? ([2620:10d:c092:500::7:6396])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1894c0346sm926483766b.96.2025.05.07.08.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 08:02:46 -0700 (PDT)
Message-ID: <ea5b3a3f-9eaa-4335-b0ad-fb1a66a3149b@gmail.com>
Date: Wed, 7 May 2025 16:02:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] prctl: allow overriding system THP policy to always
 per process
To: Andrew Morton <akpm@linux-foundation.org>, david@redhat.com,
 linux-mm@kvack.org
Cc: hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, kernel-team@meta.com
References: <20250507141132.2773275-1-usamaarif642@gmail.com>
 <20250507141132.2773275-2-usamaarif642@gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20250507141132.2773275-2-usamaarif642@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 07/05/2025 15:00, Usama Arif wrote:
> Allowing override of global THP policy per process allows workloads
> that have shown to benefit from hugepages to do so, without regressing
> workloads that wouldn't benefit. This will allow such types of workloads
> to be run/stacked on the same machine.
> 
> It also helps in rolling out hugepages in hyperscaler configurations
> for workloads that benefit from them, where a single THP policy is likely
> to be used across the entire fleet, and prctl will help override it.
> 
> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
> ---
>  include/linux/huge_mm.h                          |  3 ++-
>  include/linux/mm_types.h                         |  7 ++-----
>  include/uapi/linux/prctl.h                       |  3 +++
>  kernel/sys.c                                     | 16 ++++++++++++++++
>  tools/include/uapi/linux/prctl.h                 |  3 +++
>  .../perf/trace/beauty/include/uapi/linux/prctl.h |  3 +++
>  6 files changed, 29 insertions(+), 6 deletions(-)
> 


I forgot to include the change for non-anon VMA, which Johannes pointed out (Thanks!)

The patch will require the below fixlet on top of it:

From b719cd28ae78de699c0f801a4283449f6ac767ad Mon Sep 17 00:00:00 2001
From: Usama Arif <usamaarif642@gmail.com>
Date: Wed, 7 May 2025 15:58:39 +0100
Subject: [PATCH] prctl: Allowing override of global THP policy per process

This is a fixlet for doing it for non-anon VMAs as well.

Signed-off-by: Usama Arif <usamaarif642@gmail.com>
---
 mm/huge_memory.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2780a12b25f0..c4bf8eae420c 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -177,7 +177,8 @@ unsigned long __thp_vma_allowable_orders(struct vm_area_struct *vma,
 		 */
 		if (enforce_sysfs &&
 		    (!hugepage_global_enabled() || (!(vm_flags & VM_HUGEPAGE) &&
-						    !hugepage_global_always())))
+						    !hugepage_global_always()) ||
+		     test_bit(MMF_THP_ALWAYS, &vma->vm_mm->flags)))
 			return 0;
 
 		/*
-- 
2.47.1





