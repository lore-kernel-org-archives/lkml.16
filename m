Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813601A0BE1
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867885; cv=none; b=CqslP8xs8OCtDmXmm7s6cido7T5blJSTE09msRDS5lcnVG1IXMb/NHRZcyTmx5ESrLZzGhUzdWUcgYinrnM3+cj+yNmjKg4kBqauuIH+8kOjqB4dylhoejNslhq9bUlWqByOmq7AaK1I8S1rN5HthOHlpO2O0ip74kpv8Fk4tTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867885; c=relaxed/simple;
	bh=uqif3DVqjaaHwsC4GuL0urReugnTia1gdJmb4PcI+Ig=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XH0AIsWlqqz2OQyAO0y5A7ML4N19vOBSC/Ahakh8FYcWc+EdCEnQYI/rzQZrvYKPbKfPLkCiJ+gMHutSfjwlNL+s7wwk+mt3KpCTELcaHlxd4bMEG8ysiBNoq28jH0sOqkOHVpP4vbE41qTA1qBN5v+rtHGL5y23LK/byJYmdYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eRrfu/WJ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eRrfu/WJ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f9fbe0215bso2765691a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867883; x=1739472683; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=RHIk1zAzNzZzzd4zq0SrZCaGEXgiIYu2uBl1eqTVpf4=;
        b=eRrfu/WJbJTsfszXr++2YTKRUQ8jOLuc0SedO7vCo6LHOpMR1ovRWACaFmRRaeKi1i
         PrglvLK3GCIy5B8v4KqGRzHJNyEi7Dlkz5kQGymMafhVQ/JgYy1xFDtWD9XIfS8odBg5
         t+Uw++SnkarwEPMrKteIZeUoUfJLybFUOWDiF38GBEqqTR+cum9SGkL1gN0d9QOFOaf1
         AKl4t5jzXq1ExRCAVDqe2dV+0gc0niIHbUH9D+eFR66fiidmNNt1wrV4iGTZTUM6ErWp
         8PY1+rcjY+MnMGbRir5aStV/WE3pN4uwGqrqhrSmIle78LJCCayU6wI1TTZ9dGpSfcVy
         Oreg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867883; x=1739472683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RHIk1zAzNzZzzd4zq0SrZCaGEXgiIYu2uBl1eqTVpf4=;
        b=MJG7dtME7Z+chRy1DQqd88sfTPWhfLLMms21iBhxT8DEBSolrwHhfhHQKZ7NyR53x4
         0hetPPweVsX9Zw3pFGeeLwkSe88VhFqbemy5KGCYPHkuSMuL5JwD4rNrxBWIoVMZkK2r
         xUfhhemFVjbWFmFfYWWyLRhz475AnfAMttxzzLfmJuDv+rGbbSiqUmKATGDUkenda/FF
         +NldAU8PBeFmjX4M6W4zJngIeE8ek03zQqBRCnfH5lsRN77YTNGPuqiwY/2avgtw4q9L
         9tM5vChnCBW7Tond6qhHXHHZKrIKOTFiuW7ph3usYrOlGT5MXLFBzgSwTfYCc1qFYPp3
         bX6w==
X-Forwarded-Encrypted: i=1; AJvYcCWP5uWYc578A9p0IzZP4QHZAaokKsug4BfehIQ8gB62WuNNjtJVD6uVML+ZL6s+qBEqwtBuBetQGkPHORA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYxQ3K8QXZHQeWKeigmpoDnpibDQjXVDpx8gANeiVzgyPT/lRo
	qyGgq/p42w3yGn8b4OtNQAi6nlkAQ7HceMNfZQ4VifUrNx53vFyziA69zfdqWtOiXrZ7DA==
X-Google-Smtp-Source: AGHT+IG2C6Tqj4tol1eUNf+3cFodAFg6bV6h55pukBTkPfnQj74WsqcAVhR4si2RwXlaV64ND0j3yoTj
X-Received: from pjbsi17.prod.google.com ([2002:a17:90b:5291:b0:2f9:d9fe:e723])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4fc6:b0:2ee:cd83:8fe7
 with SMTP id 98e67ed59e1d1-2fa243f666emr158067a91.35.1738867882861; Thu, 06
 Feb 2025 10:51:22 -0800 (PST)
Date: Thu,  6 Feb 2025 18:50:44 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-5-fvdl@google.com>
Subject: [PATCH v3 04/28] mm, hugetlb: use cma_declare_contiguous_multi
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

hugetlb_cma is fine with using multiple CMA ranges, as long as it
can get its gigantic pages allocated from them. So, use
cma_declare_contiguous_multi to allow for multiple ranges,
increasing the chances of getting what we want on systems
with gaps in physical memory.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 mm/hugetlb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 65068671e460..828ae0080ab5 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -7738,9 +7738,8 @@ void __init hugetlb_cma_reserve(int order)
 		 * may be returned to CMA allocator in the case of
 		 * huge page demotion.
 		 */
-		res = cma_declare_contiguous_nid(0, size, 0,
-					PAGE_SIZE << order,
-					HUGETLB_PAGE_ORDER, false, name,
+		res = cma_declare_contiguous_multi(size, PAGE_SIZE << order,
+					HUGETLB_PAGE_ORDER, name,
 					&hugetlb_cma[nid], nid);
 		if (res) {
 			pr_warn("hugetlb_cma: reservation failed: err %d, node %d",
-- 
2.48.1.502.g6dc24dfdaf-goog

