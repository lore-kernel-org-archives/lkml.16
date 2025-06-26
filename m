Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBE1D2F0E59;
	Thu, 26 Jun 2025 20:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750969981; cv=none; b=qo3cIWoxDyPysycsHkZZABcqBct7jD0yQu+1x89uun4UWIqKR6rUfzMa7r7HHqXTRa/yl8QP9GE00YsoY+m0kh03MKmoEti6ePb12cbc7wGp3N9eZRxfL91WCQeAVgDnPmjUl5faOloa2+vO6cj+pGgTa83Wv+A6avWG9DzLeqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750969981; c=relaxed/simple;
	bh=N16eX1TgT89kfpHG9PYWXoAMefgvBMCfuB8Mx8Ad8LM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t4X+CHVVdh8wDuAUKhwxbZvGojxZ3SscWKe5s1AYtw1CR4unzxTcJoELsqkOnS65U0IqBfI1jAO9hbXoj5lXsGgv/tbExHr1jvKeWb1Mko1Sr5OBvPMianhEjg0iRHIBO5Bfe09FAmeonBfetepwv0IfwXHTgavs62XcxL6gMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXhfvMt4; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXhfvMt4"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-555024588b1so1790413e87.1;
        Thu, 26 Jun 2025 13:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750969978; x=1751574778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxKCMMODcsFDUMNOQiqlz6WxnPiyIIv3UbzjwD0C5UY=;
        b=DXhfvMt49iaowMm1gDJIL/caMnppSGFZFSM8cavidN/SyRP1d6xWJDZKH4NXT/rHGB
         nJNWbxPBzEnhsa3rbu99WstvW0DfW+ex887tFa11RNuMUXnW5ZcY73lMzR/kki/Kf5FN
         qlxoLUEbkUCq1C126RCY6Yr5p2U0INoJ+venSoDrdXZU9i+x/v8MuX7Qjdwkd2wusGWp
         27Uu+sdeBFLTCXnqAue4vih5MVjilvkudEbH0vfdB7obLp6jRKRjgoaicUnnY34LLZcw
         Sv9vIscnnNLrUbZ7U1uSLgwQPwKxzM9zvTeTDqRI/ZcL5wmd/kRsUoCggJ6Jc+2D9lgA
         tAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750969978; x=1751574778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxKCMMODcsFDUMNOQiqlz6WxnPiyIIv3UbzjwD0C5UY=;
        b=mZvoUXsKYyg37HO1Dgb9Fc1AEP/wV7m2LLrkl/dlBrnq5opUvIHzHToWRW1pNdGZhG
         ABKM6fX7f65zvsnHIOAmg/HwWg26z2aqRNRAnHidl2mfFqGw1Nz5LHL/gqHvhlXy9Cpq
         2hZGGhOISA00BqK3sKkxjbpBY4IEP4lArfbosSLUpPfpxTl/YDwnBvysuyK9dmG2VENL
         11AxX2umTkfkKBVgtzwARK/BSFPV6BhGdhEqHUOBStq3voQdG9Hfe5Mn4S2uLZJSXrJ5
         e8ziyuh4xo70seQPe8L8zEnJlrj6/o2nCUklmAwoj9Zel4A9HQYlfdhHO0ja+LKI7xVJ
         OYyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+sRVxYOUBKdRBjxtPAg2soBPd0MjipDAy5z4hwaDK7ez1hvvT794yDOIRSqOQySTunp605rEV9QZAByWz9cE=@vger.kernel.org, AJvYcCWgGKnBxEuvbtNL2Hfi1cPDaY1fTLWwdflFUb3ulSX0Mw5kT09NDFrk8oOhQde2gCX3gbHG/fkA7y2oJ/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxiHvZg2+Jabu28Lo3q1JS4MSRwaWL4pZPr46niwHeWgTK7Pz7
	ks9cN6qlNSEdxxnEo6UJQipnkKyis9idoc7n0gqgFNEa3cfBajaoJ6XR
X-Gm-Gg: ASbGncubdUt3w/LkYVC83k9sg9c6jRZpz4er0pAFifsvHvo9IiKzs7Ah39ec5+MqNaL
	wGNvcYIjbqp17p+jA50h5E/2kCHoFmziaacGJ4YYjbPvEUPlWpsdyr+fh8bkEBtxQQfa1LhJOIG
	WFaOFJkP0uxe4zysAUBQOHDdJpIDgaObCaJINqgbmLqCUz1b37RVUCpBvr8PGFwpNAI6gXnXvB2
	mXzhh7Z6icrdYi98oqJpSrx39HV3xRCnDLENG6AD48PSTxbTJxZlt6J4pS7bDnmRtwuEXH2VIDx
	8YJ8zh7Oo+gt0BSHOO4Wb1GCwaKUyS5fFIG1PgXt0OnfzedyweLV3zNzY1XKnWU+AUrcdCWi1vB
	pDAzv0/xKaNoQPM26J1sIvhbcRFU5CtlkVCsUQQc=
X-Google-Smtp-Source: AGHT+IHhelbMccE1wyl4JQIW3n1qUc3KDLpVaSCWUrNmeE2bWUgrgC7Z2IhEY0d3dBUVv2Hf43R4rQ==
X-Received: by 2002:a05:6512:3d2a:b0:553:2ef3:f73d with SMTP id 2adb3069b0e04-5550b82effcmr315925e87.14.1750969977823;
        Thu, 26 Jun 2025 13:32:57 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2401f7sm142363e87.30.2025.06.26.13.32.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 13:32:56 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: acourbot@nvidia.com,
	jgg@ziepe.ca,
	lyude@redhat.com,
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
Subject: [PATCH v2 2/2] samples: rust: add sample code for scatterlist bindings
Date: Thu, 26 Jun 2025 23:30:08 +0300
Message-ID: <20250626203247.816273-3-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626203247.816273-1-abdiel.janulgue@gmail.com>
References: <20250626203247.816273-1-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add simple excercises to test the scatterlist bindings.

Signed-off-by: Abdiel Janulgue <abdiel.janulgue@gmail.com>
---
 samples/rust/rust_dma.rs | 29 ++++++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 874c2c964afa..c4d44e5a45b8 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -4,11 +4,15 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, device::Core, dma::CoherentAllocation, pci, prelude::*, types::ARef};
+use kernel::{
+    bindings, device::Core, dma::CoherentAllocation, page::*, pci, prelude::*, scatterlist::*,
+    types::ARef,
+};
 
 struct DmaSampleDriver {
     pdev: ARef<pci::Device>,
     ca: CoherentAllocation<MyStruct>,
+    sgt: DeviceSGTable<PagesArray>,
 }
 
 const TEST_VALUES: [(u32, u32); 5] = [
@@ -34,6 +38,18 @@ unsafe impl kernel::transmute::AsBytes for MyStruct {}
 // SAFETY: Instances of `MyStruct` have no uninitialized portions.
 unsafe impl kernel::transmute::FromBytes for MyStruct {}
 
+struct PagesArray(KVec<Page>);
+
+impl SGTablePages for PagesArray {
+    fn iter<'a>(&'a self) -> impl Iterator<Item = (&'a Page, usize, usize)> {
+        self.0.iter().map(|page| (page, kernel::page::PAGE_SIZE, 0))
+    }
+
+    fn entries(&self) -> usize {
+        self.0.len()
+    }
+}
+
 kernel::pci_device_table!(
     PCI_TABLE,
     MODULE_PCI_TABLE,
@@ -62,10 +78,20 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
             Ok(())
         }()?;
 
+        let mut pages = KVec::new();
+        for _ in TEST_VALUES.into_iter() {
+            let _ = pages.push(Page::alloc_page(GFP_KERNEL)?, GFP_KERNEL);
+        }
+
+        let sgt = SGTable::alloc_table(PagesArray(pages), GFP_KERNEL)?;
+        let sgt = sgt.dma_map(pdev.as_ref(), kernel::dma::DmaDataDirection::DmaToDevice)?;
+
         let drvdata = KBox::new(
             Self {
                 pdev: pdev.into(),
                 ca,
+                // Save object to excercise the destructor.
+                sgt,
             },
             GFP_KERNEL,
         )?;
@@ -77,6 +103,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
 impl Drop for DmaSampleDriver {
     fn drop(&mut self) {
         dev_info!(self.pdev.as_ref(), "Unload DMA test driver.\n");
+        assert_eq!(self.sgt.iter().count(), TEST_VALUES.len());
 
         let _ = || -> Result {
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
-- 
2.43.0

