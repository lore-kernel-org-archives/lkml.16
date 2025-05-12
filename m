Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E142425F962;
	Mon, 12 May 2025 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747043785; cv=none; b=o99rCfpMss4JagfACw8PqXc/mAWdm+rUxb5rrmmlcYoYc+vM8lPZDunngUSqHSvOtgmrJ52znW+3iFM79YB/oMqsCDVUkAK95sEqARKjUrvka1dzrgN8odmYe5SR2CWBU+jr0sOrPzqVYDgJtQQO2U9RcgA/73Hx2Aa2rvSLIyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747043785; c=relaxed/simple;
	bh=CXSs7qlL+ovSxslTb8/w3rSuLo2Zvof57vQkEI7kgGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rjFJp1WoPTuoCdhqpDe9NO+oxgIpDQ1mXhWBXlZP5wgdzIzuoUxSj+/G38r6TK3ciWnUaxI5nLCwbH1dvnDkO3Udz8ihhXNDhzyFoDXUZRHX8nCv2RuUI4hIWNaqwtlWnanl+HVkL4h/Hv+C0s3mOAun4V8pvmbmIvn9iq+Y7yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMcu4Cs4; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMcu4Cs4"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54d6f93316dso5368948e87.2;
        Mon, 12 May 2025 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747043780; x=1747648580; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1lhhLHV59fpZK8mISaf1NFm71EKTLsq0mDVPXUzJQys=;
        b=hMcu4Cs4IBloVNz22njUgDd91qWgRTyM6w/IO2MtRer3dnZcXHhJNUEgDBbxJsucc/
         YJTj5MtGVeYg8U8CvntTaZxHPbxxbTqKaMYGfULeMgdOxNXQWAGjjfWRWbVv5C4Ay0it
         T6pX9xV5R+rAViMhvDnFcEZQi8NsnqC0wjCajRW2GLe0WMjN1Nr7+4NYrb17TyDoh846
         rjeIC9EvDAgUQ703GMRTh+uoy1iSEeWGQ5Er+ZFSnXCSbXz/pUbSeMAjYUGqubKNRNyG
         z5Uh/29Jy5b4+Ll4a15prVTFsvjjFZCU1IGQ+t+XqAeISRjdzr7UHjH9gJ/aTpSnkVF1
         Cfkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747043780; x=1747648580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1lhhLHV59fpZK8mISaf1NFm71EKTLsq0mDVPXUzJQys=;
        b=M8jPEFh8ydYU0u5mfC1H3FjhM6mh6Bde3TQpSBfr7Ej+LBRtpND0NbY7duZV+DR6YN
         rgrAXG6bqBNWy8coLNy/a7PXZZJ7orxJn4Jmwq2OwARCFz3sDEntpzKRdy8Eeh+mmL5p
         pO6QHk37PvpV1npnAyqNl1F5x6kZZzph0/Rvlt6Q3bSshmeTUm4w1jltVqJmxYfL/RLK
         SM9U1zqyPbndC93y7bU8GKDlWbQNZFjAWsT6pON3+uuVEdOpuTNfRCXP4NH+Anp9V/0V
         sovicVU6zMyIVP/bzPtZzHAPHuM3x/a/g6Kb5UV/cQ3lhVinWbcWC3JMcDLrQu/zFP23
         tOHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJW07lM0MUEf2KWv1bx9NgfVFvdOx+bZkB/beAtaj46Jw9K3aeX9qtN44LGwyKZQnwZFxP5AgoipzHvfs=@vger.kernel.org, AJvYcCVVjWfP3v0DqmY+alm0rpLdhoY5xDHmYICNHnDohOKgMuvx1kNNDhMvRQsG3pyvZ0ZmIACByOAq0JXwpZgNG3o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyi06ZMCdbOIeHC5/Euf7PRmWAp9axtA6V7R+fnkpM/BuvxXbuG
	JpIs/wbmZJjFiqs6kWHopZ/AbaZra2XhLsB67b1P1/INuJ/7qFTn
X-Gm-Gg: ASbGncuG6kDqP2jmvxhqZWbnPcTV62YJFu/R3xJqNl0Ar6vCsEh3xQGNBtdBdzwGmBl
	LNNyYLsfSeJhgvLkYLfMPmyJ7JQ7fbgjV6YBCrdeLU17bMZRzIFhMHWgu1Yq1vG6Etwa7pF9ZOe
	GLvmnCMSmdzcA6RC2LLjHSRarVEHquiUFI40lvjgnvRSHKdXXctH41FUa9bKwvJX/lRJfi9XQ17
	NXsR5Bm+RSyWQ+z4x1aqfRr2EaS9v89r30N+n9vyYuyO5lk2vQNWVMsIpE3HJSMvBuBSLprqPHs
	KmQDc3T9HbhqMi++eYKWLd3zi7X7k2hqxBm/swKyRQH9j6uiG/W6SVVofPaz1zYo3yqFpfeKFLR
	oyGirkNVMqWo7yMTDJpG8605GYAe8
X-Google-Smtp-Source: AGHT+IFI8TxoLK1NKbk3tvddAdOAbk0BUota4Fsp+CVn5FAlFmpMvZoBH1/nsB6nGuA5il7Ek1JJAg==
X-Received: by 2002:a05:6512:304e:b0:54f:bdf4:169e with SMTP id 2adb3069b0e04-54fc67ecec8mr4075048e87.56.1747043779735;
        Mon, 12 May 2025 02:56:19 -0700 (PDT)
Received: from abj-NUC9VXQNX.. (dsl-hkibng22-54f8dc-251.dhcp.inet.fi. [84.248.220.251])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc644fa48sm1460449e87.1.2025.05.12.02.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 02:56:19 -0700 (PDT)
From: Abdiel Janulgue <abdiel.janulgue@gmail.com>
To: dakr@kernel.org,
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
Subject: [RFC PATCH 2/2] samples: rust: add sample code for scatterlist bindings
Date: Mon, 12 May 2025 12:53:28 +0300
Message-ID: <20250512095544.3334680-3-abdiel.janulgue@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
References: <20250512095544.3334680-1-abdiel.janulgue@gmail.com>
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
 samples/rust/rust_dma.rs | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 874c2c964afa..e3768c1a16b7 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -4,11 +4,15 @@
 //!
 //! To make this driver probe, QEMU must be run with `-device pci-testdev`.
 
-use kernel::{bindings, device::Core, dma::CoherentAllocation, pci, prelude::*, types::ARef};
+use kernel::{
+    bindings, device::Core, dma::CoherentAllocation, page::*, pci, prelude::*,
+    scatterlist::DmaDataDirection::*, scatterlist::*, types::ARef,
+};
 
 struct DmaSampleDriver {
     pdev: ARef<pci::Device>,
     ca: CoherentAllocation<MyStruct>,
+    _sgt: DeviceSGTable,
 }
 
 const TEST_VALUES: [(u32, u32); 5] = [
@@ -62,10 +66,18 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> Result<Pin<KBox<Self
             Ok(())
         }()?;
 
+        let mut sgt = DeviceSGTable::alloc_table(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
+        for sg in sgt.iter_mut() {
+            sg.set_page(&Page::alloc_page(GFP_KERNEL)?, PAGE_SIZE as u32, 0);
+        }
+        sgt.dma_map(DmaToDevice)?;
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
-- 
2.43.0

