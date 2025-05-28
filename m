Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BE1221D96;
	Wed, 28 May 2025 22:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748470567; cv=none; b=hQIeEUNhAh6f8F8IentQj7BroDhGH8caobCBXZkF1pacsQe7wM3m5KyhwWvBoAHYnckIB+R/qK+JF/E9UeAqATTxCrHCVdynavc/PFVlMbY1WNPoCDfCuhtX3ACfEDm6bKiIB6mmmQYK63aueEgIkKwQJcUWAP4gAKUMGCnTP6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748470567; c=relaxed/simple;
	bh=7gsOR0gNkU5/T2lBGTTXQjhgAghPoA/RiREki0cgJdw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpbzZoHCKsARV4gmIwD0kE3sC6we2gWse8j34J28JVEZcZWvOpDmfobTBsHOMenv9EgK7j+s+Ro6ogikiv4hfYAqqys72mprTb74D1TVSKt6ec2CWlaryK/OeVSzfuyrOnEm156h/zfLpMR3X4Zbycm9jtHs62GulPpTBzOjiqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TGzzzlKp; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TGzzzlKp"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-32a6fc6f1e2so1394631fa.1;
        Wed, 28 May 2025 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748470563; x=1749075363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Enihz6/HCS20B4CFOBmO5EOpNE5vpE5s80nw+pNvgk=;
        b=TGzzzlKpZtm/22CmYeRJM8niZ6ZskhUK8HLerqj9nZ3fINz2o4K5tTqQo0TJ/6Kni6
         xa4T01u/rEwURF24M7mvD5fqEdYQMCnO1wLijki6rE2F2WwfNyFYYUNgFlXEDNz6qljl
         FfZLcww8n6kXMzG9GX4Uhlwt1ROjNzuFnJfoFV+HbNLpGYiXGgfOkKnJukZHOitQKHHI
         lXTXXQ50o16b/Bt4+Rq7moPTBfa4kQT94lkSpQ0oHn4cmP8YkmMPjWJjcoBU08JPCAUT
         NpDlq9/6VBklOW0FtPUqG9bjvIxIy0luGLnz5d4Yl48ln5x0jhvnHRJUDth869jLzB9c
         /W3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748470563; x=1749075363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Enihz6/HCS20B4CFOBmO5EOpNE5vpE5s80nw+pNvgk=;
        b=m4CXKnmX/+VNDar0hifuGU/A2HtH0yMikwTkT9xnjf+tjZ4hQH43Beej33h+/dcozz
         GTdjJSI+oTTi5JUOuprIs8+HBhrqwtV6LFJVKBsMUCOnbTwPJEpRkVa3I3ODvKYRWwR0
         7fQvSQTRp1tiRIfhNJWtVZLYrFWZtZUx2KBj49xVsEBbjO0/OwIWPyU3HxTf6eESc98j
         32jPnwpWZEoIP2mC9woUebsgVCDmubJN1e7Np4QBjaS0z76ao3jd42QfMKPEs6tcwWGC
         rikkpgp7duXxldj5vxlWDprEHbJKDGFDSx78jsxwkmxRUrglo2Ijuk8WtRSQjX2GwrGf
         sOtA==
X-Forwarded-Encrypted: i=1; AJvYcCVjevCJF/AbWEbdLSiBCmZ6OAIx/zz9eRhf1OfB+DTMT2qZ8ssdzUANJfKZi+emru6XGLynUk1WwtrXAEo=@vger.kernel.org, AJvYcCX9KqBUSLXBUbbtrp+u6VPo6n/CBE6welKwUbUB26jXbvtQoKkOqH4PS4c2HrBtRkS+8ASydpOr6Tgkw4BlreE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyycHsKOCJ6+dKTAEExfBqkjAK3Z7oe/v5osiriPirMzTJ1/1bI
	wNrdDchCyP99yOfLE7pNY/H0k5SwZ3/buJJ6RUH0k321cHR/FSQc0MUx
X-Gm-Gg: ASbGncs6oo8A2h9G/+us8t2ARxOOg/X5eZxjlgfPfbxCtyrVHzneYhDZyipxhzzwIAa
	UHsK7sue7cl/aV2ggtm7NEC/q12J9egi4GgNOLbkrbuywWf3/+hxtb80Bd0J6xaF317XpgQT51+
	62qHyNZNYhKTCBOL+7xkqr2NOqnPDa5bfWLiRO312mEcDJH/ETTnVVZ8sJRFXPNLnlb2KIQJGZR
	lu/l5hIe749k4VTvd+EFUlrBJPr9AzTSNQpkYTMSwjX8DCBzRI/iuYPGkXpNSJB1KwhZqhV4uML
	9G2f6BL0RViPAhuJJXT8SGPeO60dlZcuDHV8WdxRo266HY0xTJRP2Q6sr05VnD+Wx7Tx4dTjZzH
	xa5XMKJiKWZhsJuZqzZ+XtrLv8+as52bl2X8iAYk=
X-Google-Smtp-Source: AGHT+IEKeeMrKUS/lOmd1TUP76CFI8k+PQghOOyWCL7sH6eA52cW3EaSl6yniwFeOoZuYVfomlK4Fg==
X-Received: by 2002:a05:651c:985:b0:32a:81a2:ebb with SMTP id 38308e7fff4ca-32a81a20f8emr6871911fa.1.1748470563272;
        Wed, 28 May 2025 15:16:03 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b55de7sm156911fa.53.2025.05.28.15.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 15:16:01 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: jgg@ziepe.ca,
	acourbot@nvidia.com,
	dakr@kernel.org,
	lyude@redhat.com
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
Subject: [PATCH 2/2] samples: rust: add sample code for scatterlist bindings
Date: Thu, 29 May 2025 01:14:06 +0300
Message-ID: <20250528221525.1705117-3-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
References: <20250528221525.1705117-1-abdiel.janulgue@gmail.com>
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
 samples/rust/rust_dma.rs | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 874c2c964afa..8c8f514bb27d 100644
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
+    _sgt: DeviceSGTable,
 }
 
 const TEST_VALUES: [(u32, u32); 5] = [
@@ -62,10 +66,24 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
             Ok(())
         }()?;
 
+        let mut len = 0;
+        let sgt = SGTable::alloc_table(TEST_VALUES.len(), GFP_KERNEL)?;
+        let sgt = sgt.init(|iter| {
+            for sg in iter {
+                sg.set_page(&Page::alloc_page(GFP_KERNEL)?, PAGE_SIZE as u32, 0);
+                len += 1;
+            }
+            Ok(())
+        })?;
+        assert_eq!(len, TEST_VALUES.len());
+        let sgt = sgt.dma_map(pdev.as_ref(), kernel::dma::DmaDataDirection::DmaToDevice)?;
+
         let drvdata = KBox::new(
             Self {
                 pdev: pdev.into(),
                 ca,
+                // Save object to excercise the destructor.
+                _sgt: sgt,
             },
             GFP_KERNEL,
         )?;
@@ -77,6 +95,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
 impl Drop for DmaSampleDriver {
     fn drop(&mut self) {
         dev_info!(self.pdev.as_ref(), "Unload DMA test driver.\n");
+        assert_eq!(self._sgt.iter().count(), TEST_VALUES.len());
 
         let _ = || -> Result {
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
-- 
2.43.0

