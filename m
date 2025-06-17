Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50361FDA7B
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 14:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750170941; cv=none; b=pTNfm2quFRlYfDuwjetto8zUunfB460MB7KxjvMkr3MUq/kDyPlnWasc+Uxx4i7nRBoOK4Qyh02oJY4swYqXOweTC3D+mm0yeaoqc3fFX6DcsXv3UO2ZKdkpJ0RLghsYYCabI1f/8lEGvl1tv1aG6peM1XTC//eDNCBmoaDP/qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750170941; c=relaxed/simple;
	bh=FemY+hsQFrUD5ZAGM9NrybsPZvSowNvRmXOgYe8eQXU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KLRgLYwljqHRKB/gFb8PT2DZOx2UtUNRdfyNoHv/5Jjf53q3OyZpxtCcxpg6FIidm1S2JK3b1lUgFD+qSmUFpOmYW6GcRoiWA1+WHrhSZbKl9IyVomG26M/WcRQVg0UwFRYQdXK9chjmK3goS1cNhwP59/yxYjf8+fMV1B/5bNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fswuEnnH; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fswuEnnH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750170937;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jgNdlNRbfBs1E1Ur5QzUEwyVJhDqK+C7eqNF6/N6wfM=;
	b=fswuEnnHWgLDBD0CEeR1bzUFLXjVu0dISYUcWcpcNzTT9IlVBmEuAdFtfIyt/IpST7xxM3
	7Zl9aZV6CoJZBgyMKubSFgxz0CN17uTf4GQFQ+vNiQ/arKFJhXv9h2JwFjqA+vYvwPQdVo
	yqIE5GsVLRTnROWPQPnoqzKavZZD+Jg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-1egTKZD0Myit2jU_eok3HA-1; Tue, 17 Jun 2025 10:35:36 -0400
X-MC-Unique: 1egTKZD0Myit2jU_eok3HA-1
X-Mimecast-MFC-AGG-ID: 1egTKZD0Myit2jU_eok3HA_1750170935
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so34468625e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 07:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750170935; x=1750775735;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgNdlNRbfBs1E1Ur5QzUEwyVJhDqK+C7eqNF6/N6wfM=;
        b=I4JYNeDlW3iPeE8V3jjr9MAT2PYz2ftnZjJAcLOEOHOGeJ7videcuOn3LRRUN+jw3V
         QrPTn8YCWJJnQ907si1RJIKh8Aomzwocrfjq9t+kK64YzlsUH9O/gX907MfqYQ3dS3Z0
         WWfWYVJB087nMj2oH8IgX279+PYD9B3AFAhZp/uwWFyNKBb7vfSaYRPpG4MRGZfR0Vh4
         TBNn1Ae+EnUXJZ/oOWD7w7SgniAtV6XqT2FYdxGtig8CnZyl1p7/7lvggbZYzwRTccOX
         uw1G3beahc8ZM5U8SmQPv1V7kmHm4lxcHQ07bca5nxqI3X7qrqHd/YqYyTXSiS4Dwses
         p7+g==
X-Gm-Message-State: AOJu0YweyqIDZBDPQNdHCnpLlhJiSbExRrOh3FEVUmLGMC4ncNGvmXRe
	pr4XmIMVfAli+Z2OE/TZXauYqlMKmpn9nkwRlJV21PvH2PAsq2CiHQ839d9dXB+u47wVOyYNDCj
	juxKksBnC0gcj/e8aW5lntx4Jg6BLFa8b3eeexKazmEGq9x7L1BfihjyTdnm1HjLBdUtpCsodfr
	qjKvexr8JAXmvl62aLNBfa+nRi85pRiLIEePSK90ryU0rRuPMA
X-Gm-Gg: ASbGnct3PDM+TxAQPwZihYc57ielp4m42vM3ibq/UBlekoBFlNFnwhjlTz8MC+jhtfH
	cQUBV1uhokOZ/EGe9tvHeu5k/3tYueyNrveXikc34asb+Uc4tFu5VcIN7xN54buTERK7IRYlPQ7
	86/O96YLfLm3j9jh6m0JkSdycOU4FOrG6yUDuG4g8UMM7hgxQp9ZwfjHOpVvzUQU/9yR4/HZzFA
	PjgKtMxJyYVRtwafV+QZ113b8I/o2MT+i4yU5JSxbUeDxqAfvBI9zWaC+RFIeR8TudxhZhKF6IQ
	T/GkFF7B4DKOn0S8yJQpukp/3hzNLdgoJvIKo3sUin3wU3mMveFRwHXLwZV4b7XPxwUq0oXi2dV
	oukpb1g==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f902:3845 with SMTP id ffacd0b85a97d-3a5723a261fmr11736178f8f.21.1750170934788;
        Tue, 17 Jun 2025 07:35:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPkPKlpTmwMDIOZJAPGaDCPoTWf6kGLLVQZf/ykyAoEKvG2AJhCQQXS3FLdC7hGH+p405nNw==
X-Received: by 2002:a5d:5c84:0:b0:3a4:f902:3845 with SMTP id ffacd0b85a97d-3a5723a261fmr11736147f8f.21.1750170934317;
        Tue, 17 Jun 2025 07:35:34 -0700 (PDT)
Received: from localhost (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568b47198sm13954565f8f.81.2025.06.17.07.35.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 07:35:33 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-fsdevel@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Subject: [PATCH v1] fs/proc/task_mmu: fix PAGE_IS_PFNZERO detection for the huge zero folio
Date: Tue, 17 Jun 2025 16:35:32 +0200
Message-ID: <20250617143532.2375383-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

is_zero_pfn() does not work for the huge zero folio. Fix it by using
is_huge_zero_pmd().

Found by code inspection.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and optionally clear info about PTEs")
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Probably we should Cc stable, thoughts?

We should also extend the pagemap_ioctl selftest to cover this case, but I
don't have time for that right now. @Muhammad ?

---
 fs/proc/task_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 27972c0749e78..4be91eb6ea5ca 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2182,7 +2182,7 @@ static unsigned long pagemap_thp_category(struct pagemap_scan_private *p,
 				categories |= PAGE_IS_FILE;
 		}
 
-		if (is_zero_pfn(pmd_pfn(pmd)))
+		if (is_huge_zero_pmd(pmd))
 			categories |= PAGE_IS_PFNZERO;
 		if (pmd_soft_dirty(pmd))
 			categories |= PAGE_IS_SOFT_DIRTY;
-- 
2.49.0

