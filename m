Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EBF1DE3AF
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738867915; cv=none; b=ALgByTnP0t7khbxP4nGNmDpNje1JV15uDbrggbQEs9FONJtnMzZWgmR8pxvkkwexF4BJGy18hCbMDIOP4bJX1ElMs04eGW6oqx2XPnp9Vvhk1eBIBINPuL9N4rM8GuyyLhckIlCoaxH/wUzho0p4eU6bJk/tdWBfoLdah1lIkJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738867915; c=relaxed/simple;
	bh=VSTQXHUskWfH73SfXN+tCVhEcDsqnHB53YedVPhqCp8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BRobLQwZ80w7ei2zo+FlvLzQLuUW74p1WSYE9zhsQV7iKqrG9m3YKKnZJAMqhJ3mz4WFKDU+Lysm4eZpUlcedYnIKBETAgC3oL4nYke+E0nQA0v1S7sKqN883vjCafXrAA7X7YoR8fPBhtfBtTK+xWBQSeRR8puvuxnyRI8elyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qSX7fTj+; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--fvdl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qSX7fTj+"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166464e236so39898325ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738867912; x=1739472712; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p7TeecwDbtqxeCEQgMqbe8f8xJagmIFoeC0bQBtv3nE=;
        b=qSX7fTj+EnLOsWUNChn/3dUrkuiSKJ5XdS4KJkAGXf92IK4UmWN7fWmYJjgVMYF9hq
         yL6Pb26L463Wnqb0rje1glkSl3cxKtU1p3XhICu07+xhRXyMW/cXvIquer0F5UC/A+yC
         0bFe6UBVOR8QIPymw7YbNrVj0sgwfUzHgDSTx4owiW24ub3nBbxJe7nseF4c/tknTYUu
         GDdnn/47qh30SnpretvVCM1/4qXeM8WgISB0RHkBgzAqtx0dq+erJu3A7MwM2vDnWxJX
         8PDsREyvJQhJk08+MB95MtTB2aPHIXhoa0rXK5CkJlLCHd2pZCgrLRHTiDQEVj9cI8ff
         cT9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738867912; x=1739472712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7TeecwDbtqxeCEQgMqbe8f8xJagmIFoeC0bQBtv3nE=;
        b=HHz1jrCDbp1fYjnDaUYkO7XuOvevyECJqmunVOVPxgSectxz8fqg3e95KVZw4OEDH2
         B/PQ+IoKmHQ28lHRYClzSKun1spfXArG29bjjZ9teJ1jbiwHfL72fgjc9vdFQ2wHnMyZ
         mMSuJAHbPDM7ZjiuM98eegbDmwZh+KzhKKIkwnRbLIDo7XBDk3Omqfu/OLqXlW/W8KuF
         oPNH7Mxobx0RDyjHLcsmz4GgINS9Yo9FM0drXEsGZHdTne9K/3XRA6ftAX2ezS9te4vl
         axNm/f/9gxEZiQNpie+hLB06RcHoOv+YKTsjka3bPOuVTVskDYKIS3r4mLZ6owIZOEiL
         d/pQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+ApJa7Af2vdhCa5Y8imeXeMm1ZHqHCRozIDvIbeu+h8eYQY/MGOc07ltTRVcIJcinuHK1Jlhpzc3+DIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxVd3Wqh/FWkPeGhHPksd48GBcIBdQYxRgqycCDwai25y4YJBO
	JuhgzkqDsbYEsr6mbawQQyUyUNd7YhfIrM3T5W01PT43gGiue7Sd8LCUah093w+hfJ5CWw==
X-Google-Smtp-Source: AGHT+IGTkHaS4WsaD1MB5yDYw0Ec61JJnhUDeKTqMYnnbssbsNlTFClrJPdlXWxU8MqAbVgIpap4v6N7
X-Received: from plec12.prod.google.com ([2002:a17:902:f30c:b0:216:5566:3c11])
 (user=fvdl job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1c8:b0:215:b74c:d7ad
 with SMTP id d9443c01a7336-21f4e73b574mr2943595ad.36.1738867912218; Thu, 06
 Feb 2025 10:51:52 -0800 (PST)
Date: Thu,  6 Feb 2025 18:51:02 +0000
In-Reply-To: <20250206185109.1210657-1-fvdl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206185109.1210657-1-fvdl@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <20250206185109.1210657-23-fvdl@google.com>
Subject: [PATCH v3 22/28] x86/mm: set ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT
From: Frank van der Linden <fvdl@google.com>
To: akpm@linux-foundation.org, muchun.song@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Cc: yuzhao@google.com, usamaarif642@gmail.com, joao.m.martins@oracle.com, 
	roman.gushchin@linux.dev, Frank van der Linden <fvdl@google.com>
Content-Type: text/plain; charset="UTF-8"

Now that hugetlb bootmem pages are allocated earlier,
and available for section preinit (HVO-style), set
ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT for x86_64, so
that is can be done.

This enables pre-HVO on x86_64.

Signed-off-by: Frank van der Linden <fvdl@google.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 87198d957e2f..ccef99c0a2ba 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -146,6 +146,7 @@ config X86
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WANT_OPTIMIZE_DAX_VMEMMAP	if X86_64
 	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP	if X86_64
+	select ARCH_WANT_SPARSEMEM_VMEMMAP_PREINIT if X86_64
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select ARCH_HAS_PARANOID_L1D_FLUSH
 	select BUILDTIME_TABLE_SORT
-- 
2.48.1.502.g6dc24dfdaf-goog

