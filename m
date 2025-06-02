Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738761DDC11;
	Mon,  2 Jun 2025 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748854495; cv=none; b=SAIbYJitx6WM49Z9RdcmvEDyfsZ3l2oI5dn3X8tK+mYOdYaMU5z+OKpDtifIbzqjoyCnKGlWnjLW7Ji8sknNfoK+7HjTxyg1gNIUpZdgb0SuiH8qeafdGgdXaq+hq7+r0t6hR5ExcXOaryEBFzHgbkQm13pOIka6Lj1f7fpyrQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748854495; c=relaxed/simple;
	bh=vdte7XjxyvO5sYF/1isE++FjO7g1ns05+zWEcuh9RwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VZlqUj2/kTBJ1ww3TUzdyZzO6MLisXUOBsAU08LpM/nIwmgsrBHTmVXLc+adZmJNzxtQzRxNfNVQPnxDPKMoRs/7Vvo+Y0P8V6AQhARZm0BG8vh9YGy7d3DbhyiDvW0qP9518Pdl7K+FLNNSXtsg6msnaGywvkOhCbUdrhC/WW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IgfDv43b; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgfDv43b"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-55324587a53so5894182e87.0;
        Mon, 02 Jun 2025 01:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748854491; x=1749459291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmm9TMxx1UWco/se+EJ0p1bxOhoMbO6epU94xaJakwI=;
        b=IgfDv43b+ijsCAV4j/rfwHNB+tQDhAUiM43p0rD6u2TRWoDGQTccFvAD/fiB/6TlbY
         /C7iR/HlAJi6AaS+DJ8e2WabwEp+OHX3gEKk2VI2D9l4enTFZrsD9hcqmgzSzpgFH4fn
         Y7T6MaJrO+h9jiC9DA6vlR5Y7gpBpo+y73BTShgBJtcsGH7AKaJTMQtZq5dpMuFme2iI
         vh4RkV8w2qn4rGjI8oogAr8ESZ4Fbl70B7uA4uOYqdjakUp8AvHn6/DPTyFHFZ3c/MRM
         DZ9FGZnss9zAUW2dQLptP5yW4SNivaHRzlni1bTQhg1ntHrELeXSN859D/Vt/U2J40ac
         LAig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748854491; x=1749459291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mmm9TMxx1UWco/se+EJ0p1bxOhoMbO6epU94xaJakwI=;
        b=gjhyC+YHVfDKcqUO8mCFxAWRfGiLX043rkLrFJ+eBo4SlIeh5z4I5GoXpn0FNEDXqh
         jccCIQx3Ko0gWDgu3CqPsIPKCBuNoH1M4nY2Hu/GYClga79xunfBQijWkmiVn92bus8m
         V8YO8ABznRvovjSixCBdhkx4zcQ05ZxIZUAHknSSw1hQrA5rEpiWmFHR6IJJSSH1u5bs
         6p3GZBWjTqPGXNT2Qb+kAlZpMEHe4fMilQ/fJvYC2hFdfo813VfzFxsQEr7/UIqCRbEL
         0CjdUHN7O6dF3bfZVWzWpg8Zj4PRQJoqxdUWwsO6d2tisiZfOwa8YFS6XMKvLuTSeXP1
         7f3A==
X-Forwarded-Encrypted: i=1; AJvYcCViaIh4xzk9dGqjTfw4kBK3VKnKohScTQ6aHXaZxI6vm/dSNTBywruGv7ACizbOm7j3jTtOIiW2Y9KTjqOwfjc=@vger.kernel.org, AJvYcCXYt/0+ug5JzEAxTW2k3phrHaJacmgq1uSXzmA5VQGpH4HkdLhnKYt5TgX/ZqiUIUrJ7tq+1gH1RkhXT0I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwL9KSoEkaFZ3trMS7K4JMmo5/CBJXKzW/apTrARmD88YsbRRKY
	fL9dmc1s8tja3quiYxGZXIsTy9fB7tPML24a6Vj3mW+hfyKBGv+cYspR
X-Gm-Gg: ASbGncsZcbfpOC9sUHx9Nf53vcNXPEkORbD+JR4IOuMU4X3XSJVeEc7P/1D505J1bDx
	QdKRMbpGAH6nIiwgIif7TXh6ntyU00GzzD8lpJPRT0xev8mRZNLxhQWvUvU5rg4jdf8SrbpXtg0
	afUAq7gtjBeYeY1cRUt8gn6y3Fu62kH14wQsMVQ3Js86FUHKkeZ/AHczUNBxiICV8thcpDz2niW
	W4EP6yQzDsGdzzZeAAKkpL+rMTPlOJDOFggYpTeJlRKGMl9efmcxrzXaao8ytMzyNx6fSwl3nwR
	hbevtgLwXkXOOe591X0OhXXSAG7OD0ojNMxhN172vMyec3Nw11WLg6iTfDHyykbIAEuOoQ0kgji
	jtoaXcoK0nhJAGk7oQ/A3zsX2XoIE
X-Google-Smtp-Source: AGHT+IGeQ2VJfS2pSQq9y4fFCIu/d3EP9UcOUYcg/V5Nm0QONGa3Ygn6eN+EP+hDSxJMw7LdEHQWFA==
X-Received: by 2002:a05:6512:1108:b0:553:2927:9864 with SMTP id 2adb3069b0e04-5533ba23ab1mr3493372e87.6.1748854491275;
        Mon, 02 Jun 2025 01:54:51 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a13basm1524325e87.81.2025.06.02.01.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 01:54:50 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: acourbot@nvidia.com,
	dakr@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	linux-kernel@vger.kernel.org (open list),
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	airlied@redhat.com,
	rust-for-linux@vger.kernel.org,
	iommu@lists.linux.dev (open list:DMA MAPPING HELPERS),
	Petr Tesarik <petr@tesarici.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Sui Jingfeng <sui.jingfeng@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Michael Kelley <mhklinux@outlook.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>
Subject: [PATCH v4 1/3] rust: dma: clarify wording and be consistent in `coherent` nomenclature
Date: Mon,  2 Jun 2025 11:53:11 +0300
Message-ID: <20250602085444.1925053-2-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250602085444.1925053-1-abdiel.janulgue@gmail.com>
References: <20250602085444.1925053-1-abdiel.janulgue@gmail.com>
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
 rust/kernel/dma.rs | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 35fd8a638473..c3fe39e7eb0b 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -89,7 +89,7 @@ pub mod attrs {
     /// Forces contiguous allocation of the buffer in physical memory.
     pub const DMA_ATTR_FORCE_CONTIGUOUS: Attrs = Attrs(bindings::DMA_ATTR_FORCE_CONTIGUOUS);
 
-    /// This is a hint to the DMA-mapping subsystem that it's probably not worth the time to try
+    /// Hints DMA-mapping subsystem that it's probably not worth the time to try
     /// to allocate memory to in a way that gives better TLB efficiency.
     pub const DMA_ATTR_ALLOC_SINGLE_PAGES: Attrs = Attrs(bindings::DMA_ATTR_ALLOC_SINGLE_PAGES);
 
@@ -97,7 +97,7 @@ pub mod attrs {
     /// `__GFP_NOWARN`).
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

