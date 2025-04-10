Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B230E20C460;
	Thu, 10 Apr 2025 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275567; cv=none; b=LNwEQPLbmCpB6wR7Ca0fJ4YW69PpNlcBDImPBS1cTAB3sfYYJMh0SBjnrtiXrcuO3OuluufGMOlK9y1lsS/CpkpeSbN4zBq6Y3qD89QyXpptpUQZm3dMpHYWfGzZdzY4iF7zGzfBm5tDeAUEm5Qn4lx7JOFBybbrzJqc7un+pak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275567; c=relaxed/simple;
	bh=WqzuZjN2OlAEP5U+WrT20wORev7uTKByfRxp1ekMkR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t9zfQcVerKbG7cKphVMR8QR7D3UvAfqmU0MNoBpBY3QJi6tg5FKpEOfYQYk8BfWL801xt7d8HpHYULFzk8glnzm8KsjlsYUOe+wIHL+fft1RksegIt617+QKnMSZ8SR0MvMTmVCiipu+sA6NMhqQn+H+HYAsifMiTLXmwQW6ri0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUOjcFDi; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUOjcFDi"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54298ec925bso850903e87.3;
        Thu, 10 Apr 2025 01:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744275564; x=1744880364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4Cn3iGXk2B43PzN7CtJiYrgGpJ21xhd2OrhojDiLX8=;
        b=fUOjcFDiEwMlcZ/uOwK8/3CyRCqVBZD0NX3cZuwFxqX8VUtw6rPUvX7yo8PuVz9yam
         7ujm0xzb+QWXgn20BldOWbPlQ7ai0RvYDdISkrJRu0Eh3zkv4zsgsCevJ9nbCyqp4sC8
         mQcEyRmeEMctyUGt1oFKmNZjins3IeloNbEVqyeNuNWNNe/G5pd8iemDhqKCnAUiy/Hd
         C2SS9SmNizlqixQXgR/t/LHXdFnhqDAx0eXjI2EbtsMvzOLY7Q6k7om1gW+9+ZK12TUf
         QAWM1XcEghPK9QBZm4Ew2b9qYy4y7bf5CRzBVWDB+0nF0J3ZbDa9Ud/HgZb2wwzxvadm
         D9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744275564; x=1744880364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q4Cn3iGXk2B43PzN7CtJiYrgGpJ21xhd2OrhojDiLX8=;
        b=gfOFB9SUu3iszTUTPbVBgK9JSH7d0yThjyYNQ/5V5jybXoRXwziC1w0Ha8jbleO8KZ
         BM906EHS0ZhWcxBXWLbA4wYlT1LFxTlphjE6s1nAy9g1UAkSdTfIGtA/tMrZB+igLEzC
         q7TJ7bfDhJAv1/Cb+EhHRQbxQHMLrI8VfiB7rqEWQx+IBClQ5lMwjBT5PwdqUNWLAis3
         t3Iqej/G+WiJztxnJatHNIOjnbrwkYYcYz+1hhu4o1Qp+QmTCcDFJZUUGzyO8r4Dud4f
         NpdDMPgpQx9/5S7obt4Yp32GFWDP0SmqL+WWsGdkHlHomYVW74FavH6WfShyHfL+374n
         HVFw==
X-Forwarded-Encrypted: i=1; AJvYcCUOnMhUsbsW4vTsbRUugOd9fU5D9IybcUgCHOBkvPrVqcE3PfkbApU+SipgavOrKdSNzzmaAQHNgR7x+sE=@vger.kernel.org, AJvYcCV91yb3L2hKpGtIKogKpSgim8kgJD8ZcizkbDquEOmMTMZw+G31P0DYk544WrbF/4ldtvcp12HokNWxVZIZQoU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpdSX60qDImw6WBD6o26XUwI5PK9s1E6gIAbhO+4v9+ObJo7ED
	AimcmdMS5dJuXX3fIfxhUmI8H77KNDbsLAqzgxRrp4usddeRDCKM
X-Gm-Gg: ASbGncvDeogt+rl724mTiFYvVKR9h8Ikne/fHrUitddl9g3R/k5iU2nLWO/GAIeTd6A
	RZXoPQoBb68ZHKoiak9J8yPNxXKSfCYPo9dnoIK3SKYkUzpge0MEO1qC9VH6o7lkzQz5+tmqSYp
	s+BdNxI/iQMpOphMfX9yt1S30EMx+0SBAWZFNFZ+9ngKd4qNykeZLMBKy328rXXjN09MCm9zt32
	cMFmYnwrusyrkn1+qPTk84DCoO6fB0/ReZEyEb2JBbtmZ2gkJFNQ69ZNR+7YldZGtyssJlGcfbD
	KGRRFZ79+AfkZm0Od0aa+TZpckKlvy3XfexvUcsozFFWICGKI8boto6xBKcKTOMbn6ms1huXpFj
	AvdNW1FIF/equYLA2LFP2tDby+l1T
X-Google-Smtp-Source: AGHT+IGs/lD9lWhhqJTHnVSN2M7rMU3M0DOoajmMiMIfO1CH0MSvgj//lmfzQx4yyiHxY8DPuESrdg==
X-Received: by 2002:a05:6512:1109:b0:549:38eb:d68b with SMTP id 2adb3069b0e04-54d3c5c0554mr469398e87.33.1744275563485;
        Thu, 10 Apr 2025 01:59:23 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d50285csm80875e87.110.2025.04.10.01.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:59:22 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: a.hindborg@kernel.org,
	benno.lossin@proton.me,
	rust-for-linux@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v2 1/3] rust: dma: clarify wording and be consistent in `coherent` nomenclature
Date: Thu, 10 Apr 2025 11:58:16 +0300
Message-ID: <20250410085916.546511-2-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410085916.546511-1-abdiel.janulgue@gmail.com>
References: <20250410085916.546511-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the kernel, `consistent` and `coherent` are used interchangeably for the
region described in this api. Stick with `coherent` nomenclature
to show that dma_alloc_coherent() is being used, in addition to improving
the clarity in the DMA mapping attributes documentation.

Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 rust/kernel/dma.rs | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 8cdc76043ee7..d3f448868457 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -89,15 +89,15 @@ pub mod attrs {
     /// Forces contiguous allocation of the buffer in physical memory.
     pub const DMA_ATTR_FORCE_CONTIGUOUS: Attrs = Attrs(bindings::DMA_ATTR_FORCE_CONTIGUOUS);
 
-    /// This is a hint to the DMA-mapping subsystem that it's probably not worth the time to try
+    /// Hints DMA-mapping subsystem that it's probably not worth the time to try
     /// to allocate memory to in a way that gives better TLB efficiency.
     pub const DMA_ATTR_ALLOC_SINGLE_PAGES: Attrs = Attrs(bindings::DMA_ATTR_ALLOC_SINGLE_PAGES);
 
-    /// This tells the DMA-mapping subsystem to suppress allocation failure reports (similarly to
+    /// Tells the DMA-mapping subsystem to suppress allocation failure reports (similarly to
     /// __GFP_NOWARN).
     pub const DMA_ATTR_NO_WARN: Attrs = Attrs(bindings::DMA_ATTR_NO_WARN);
 
-    /// Used to indicate that the buffer is fully accessible at an elevated privilege level (and
+    /// Indicates that the buffer is fully accessible at an elevated privilege level (and
     /// ideally inaccessible or at least read-only at lesser-privileged levels).
     pub const DMA_ATTR_PRIVILEGED: Attrs = Attrs(bindings::DMA_ATTR_PRIVILEGED);
 }
@@ -105,7 +105,7 @@ pub mod attrs {
 /// An abstraction of the `dma_alloc_coherent` API.
 ///
 /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map
-/// large consistent DMA regions.
+/// large coherent DMA regions.
 ///
 /// A [`CoherentAllocation`] instance contains a pointer to the allocated region (in the
 /// processor's virtual address space) and the device address which can be given to the device
@@ -115,7 +115,7 @@ pub mod attrs {
 /// # Invariants
 ///
 /// For the lifetime of an instance of [`CoherentAllocation`], the `cpu_addr` is a valid pointer
-/// to an allocated region of consistent memory and `dma_handle` is the DMA address base of
+/// to an allocated region of coherent memory and `dma_handle` is the DMA address base of
 /// the region.
 // TODO
 //
@@ -138,7 +138,7 @@ pub struct CoherentAllocation<T: AsBytes + FromBytes> {
 }
 
 impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
-    /// Allocates a region of `size_of::<T> * count` of consistent memory.
+    /// Allocates a region of `size_of::<T> * count` of coherent memory.
     ///
     /// # Examples
     ///
-- 
2.43.0

