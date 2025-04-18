Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED36D215056
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940566; cv=none; b=bah7FfV57Eo3zcSpENXieWfjecYJCKViSbKqIqFy7us/rih0IYmD6E5vPMaQ6msH8PN9w6N2yydRjsZS9nSI3/WboC7PSHsqVAW2wd8rIFQdZP+bbYjhM5dl0axl6nIzczslZBmY/Joh3riCYbvfxTsMkbx7yHXTp/Nr/6LI1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940566; c=relaxed/simple;
	bh=Vwy36Ffl1DT6zz2igWNVCn3+TcrjRpJfR4hfiCOhhes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RiU5m58WvIIoQ1Ks0qoLqTg9xDikklWH7ymDAOLp1fafp1jY7JcyRBNCDec0XCXDitPAgnBv3aDWEMVjj3t5Pdx/OROKgkHBQJpVCa0/6iBjq4xT6MZYJKaiIRsYrQqU154gEd5Wehcpc4Kzv5pBkwIZt9YDg2iKoVDjN64jpR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=hMXExIai; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="hMXExIai"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6ff0c9d1761so13331687b3.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940564; x=1745545364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zF4RhtkUiDGLOyYG++VtWMWiCEIKK28FF1uyz34QswM=;
        b=hMXExIaiaicZPqGjWQ0SYF89RAbFbGnR1JZ0fVakDTkHobP8zcqZE49hA+iiQRlay+
         ffs8iNI8cpDIeAhBr2t26wOKL8pN6zEiGG5g367PgRilnMp6HQZKPLVyQZC2mpdC2WRO
         /Ax3kWqnM3VSobOuvH3bSk1xSb+TPeFnUnPtzHSqUGOSoDFEVLn80R39+SSoYpfU/I2/
         G2X+w9VS7aWyD4Qt0mRB6Y6zfn+LjBWqwKGMo059gwq8DFb6onT0YlJAzI45nI5slJw+
         jmKU2vJAkPdP/4r5PxTIBfKb6ycat6CM5MXmsraiDwaEAiwTgSaDIL5/T5robUbPmscL
         4FHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940564; x=1745545364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zF4RhtkUiDGLOyYG++VtWMWiCEIKK28FF1uyz34QswM=;
        b=Mrhe3V0Z19NCrrHlUy1WFu1TLvzUnFo/64DjNrPQMllFqvbZnD6C4BciDtng7ywQ0D
         PNXaFlh8SCu5pyLqnIIIwJeSUca70gy+BN96Eb2H4/6bGV9KbACzp2W2lVa//ps6RuWu
         7rnVM+REuNkFv/D3k6TaBpQBBSDDUXp7ex1Iwa/7ero8iR72vptyW4sXfuAto8nn5DII
         lbSbI7yIA6XnybgbNk8ZAG61ylIbrg4uQQXMow5cjUr/3wXnjqxAmt81HBP5YI0Z2fay
         xnnCw525VYncy74/RPUFYX4PWlx3nZGKDAFreudQbMQK+/mUy2doehn/URos/J8uB6at
         fu9g==
X-Forwarded-Encrypted: i=1; AJvYcCXQdkf0kRfOA9QNDiUFULfwiaguIBao8DsaGqXJrAF66+JdZaWd8EwEnW5H/vByaVaL0IeVjxOXkb+fUW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YycdJ9Q3nTZ2HaTvSnr3e64ZU6jZ1g1AoVOZD+lPnWEq+uydlli
	dIGxEM5KifIV1vZ7MyxJLnxJGDmDP8YvFWBS/IVO9KMP2/oZ/jLm/D9a11fWHGU=
X-Gm-Gg: ASbGncsEkgKbNMgA/99K38K5Uq31//yxbOPnuchj51wYP90LKNVMGLzEdFBiZZOZxz6
	UIQ//TPpTMmc4wVgUL3rKaEeoIubEGry1/2SK0fTlRd4XuhL4amcFtOXIGAsATQKPhzl3eUj2R9
	eAZT41gP1oPpALPS7sVcfGc8ADmMp/QR9LIWiCQ/zNfARaXvrVhphJnMT1DW6tdTop77TMosVZz
	mnVIE65uoL4xm7IRlDsgHWBeyIuFb3GyLPTuwNm4AJDdz+Ev+iPq5wWLIjoC7Vb55vXW7vkGAfn
	NMab/oMUC0CTkdNrTlAiPATIbZbU6aszQH1tQzscyTE8FwlbWrYp8sRKbxdBb9+YkUhaM0FkKqD
	VR54npEe15t1JNPEf1b28CUvOQdqOl79K6UX/
X-Google-Smtp-Source: AGHT+IGOfJZrq4SGhm601peohIgL80Conyklam8qQuR6Ew+Qk/SwIRI8plqLe2b/3lKSy4c4eP/GsA==
X-Received: by 2002:a05:690c:6ac5:b0:705:a92d:cb7c with SMTP id 00721157ae682-706ccdc6e71mr14108907b3.24.1744940563880;
        Thu, 17 Apr 2025 18:42:43 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:43 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 16/18] rust: dma: refactor to use `&raw [const|mut]`
Date: Thu, 17 Apr 2025 21:41:37 -0400
Message-ID: <20250418014143.888022-17-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/dma.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 8cdc76043ee7..8a63c0e83c92 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -333,7 +333,7 @@ macro_rules! dma_read {
         // dereferenced. The compiler also further validates the expression on whether `field`
         // is a member of `item` when expanded by the macro.
         unsafe {
-            let ptr_field = ::core::ptr::addr_of!((*item) $($field)*);
+            let ptr_field = &raw const ((*item) $($field)*);
             $crate::dma::CoherentAllocation::field_read(&$dma, ptr_field)
         }
     }};
@@ -384,7 +384,7 @@ macro_rules! dma_write {
         // dereferenced. The compiler also further validates the expression on whether `field`
         // is a member of `item` when expanded by the macro.
         unsafe {
-            let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
+            let ptr_field = &raw mut ((*item) $(.$field)*);
             $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
         }
     };
-- 
2.48.1

