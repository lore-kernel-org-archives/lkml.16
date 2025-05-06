Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B2426D4D3
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525184; cv=none; b=SyxP34dUtvHOmj1JHe0JBzTVjbe9qIAXzWoSdh75TlMOoiwWKO0pfOc7mO5F96taVbS9gtJKkVCgDNJQRAohY/daDn9iSFF6Zg0duQn51FL60OAq2aFtNnOZQzAWgWKhHBlH8qrZG1nThl2MRPUe1dKdnzUlU+7nGB/p/AfFhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525184; c=relaxed/simple;
	bh=tkPSV+NTckmSMZEGHHDFeF3Ly6vEPLu1YHOm7t9yPWk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRNGkjmlT5Yml6z2bFftRN67dED6O9vCraU76mjB1vdsK4BsbMBwN8C8rTfSAodIH0GieFL5sWmdrudnvVyHLPyNNuoD4y/Y98NAq7a840At0g83rqVUUIfUB5NWW25fzMqHPhfNdQ48+1GX/U954uhXvIKzacrnKtMC/uamjhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PXXRpfXK; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PXXRpfXK"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3912a28e629so137259f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746525181; x=1747129981; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbT2ahD6n7IJIA/hkl9Cgk/pyVc+H2AXLyHNEbzdhj4=;
        b=PXXRpfXK5Dx1S3no8ILnSEpRboOp7xKSi8uDowgKSba6SWdcJSU3eM+4s36gkPbX5A
         vyJidEoTnPQqKcLv5GErCh67+WHCMNf8T8c40cwEKzOrEy2QZ+KtDVpWQzPFN3Qq8JjS
         WYTsaRpAm2Q1fr7w9CePnN3k1EJs4b5msY81M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525181; x=1747129981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbT2ahD6n7IJIA/hkl9Cgk/pyVc+H2AXLyHNEbzdhj4=;
        b=tfLlVhkJn6gAsVUMOKtCqUuEHYPnL1ekQvAd0cjc3Vg4RGpPXULPrjuJl8ymDEP5PV
         hwyyslv4WFNpS6DOJAxN1IlPiG06dIJxqe79snKO6NbCvLXaEGzlJWusZvwN1ycxEnSx
         0dCRHT0gU/04fnee/mC7aoLalEJ5kk2QPov96KxVSw65hJu2/Fne4+M4EqBBEGuKsS+6
         rtukzrogdHVY0Fb/S3Dk2GNoLJgDmGYa/C/Sns+sempwkahwuNXNj3oQkZ7kdPWrwwEI
         FWFCSi0zP9TtErS03TTOW2HLoYzqGEvNUL1Z6cRPRIpox+eNZQ2Me/jhx3Y9npnZcGi0
         zhUg==
X-Forwarded-Encrypted: i=1; AJvYcCXUDOpi9tK4HQbnrpqflOqJCyxVj8AWgbQPkgZfIZr5qrYkmgQjAxbSGC1Ag04O84gzsv1kGicbY6qHIcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUME8R3pqYFKFICCDxoNn62bSz+kNMIcww0q2NK00We2GnuW9m
	FoiNGtO9Ik5MgczI8nRrcZIDNIKHF++YHC4PouTlsj3G4xTyB5fHZZ9Ai4EmLQ==
X-Gm-Gg: ASbGncskJo9a8tp2UeBAZE7nz2FcXVMYNcVRosG9lm9/gYmNqhzT3g18rUYwfARtM5x
	mpqlz44DsnzTRUY/9OPHmwJ7N4t3isZo6kfX8pto8Ny/ccG5AIRkaZ6gzpPjSSAH21q833iAYYf
	mcVyQCY+WUVRW+MkwyuZCiPWNKATPK+VXcIDN/ZjcQ8WNqcCyd4SmMNCKMRDnyjXVT2nQQiTn1h
	Ls6xMRERqdmoyWktYm0m3TjSpdkStHs/2kPhcpObgAScvrFponRh2f0ki3pIRkEi9tEmFw0Mx5R
	BnoxfYMQXzP/e0p51LY0TZQvhGTCc1Xc+crgWNVq4UkIUhU4MQZL/XTT
X-Google-Smtp-Source: AGHT+IH3Aw9R6eQGQyylIsisf/BriyDalEXmmHTIV0IM5P4uGRot/KrSe+pVAO+lSpHYSSWDHmWl7Q==
X-Received: by 2002:a05:6000:22c3:b0:39f:6d4:fd44 with SMTP id ffacd0b85a97d-3a099af36b9mr4255569f8f.14.1746525180660;
        Tue, 06 May 2025 02:53:00 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:7196:3093:b0e3:1016])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7a46sm12879860f8f.44.2025.05.06.02.52.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:53:00 -0700 (PDT)
From: Florent Revest <revest@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	akpm@linux-foundation.org,
	broonie@kernel.org,
	thiago.bauermann@linaro.org,
	jackmanb@google.com,
	Florent Revest <revest@chromium.org>
Subject: [PATCH 3/4] mm: use VM_HIGH_ARCH_* macros consistently
Date: Tue,  6 May 2025 11:52:23 +0200
Message-ID: <20250506095224.176085-4-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
In-Reply-To: <20250506095224.176085-1-revest@chromium.org>
References: <20250506095224.176085-1-revest@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, some high vma flag bits are defined using VM_HIGH_ARCH_*
helper macros but others are not. Use the macros consistently so it's
easier to spot which ones are used/free.

To keep the VMA flags space easier to read and think about, VM_SEALED is
also shifted down from a very high bit (63rd) to a lower one (42nd).

Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index da8f99a026deb..b12549f0a6dce 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -305,6 +305,10 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_BIT_4	36	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_5	37	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_BIT_6	38	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_7	39	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_8	40	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_9	41	/* bit only usable on 64-bit architectures */
+#define VM_HIGH_ARCH_BIT_10	42	/* bit only usable on 64-bit architectures */
 #define VM_HIGH_ARCH_0	BIT(VM_HIGH_ARCH_BIT_0)
 #define VM_HIGH_ARCH_1	BIT(VM_HIGH_ARCH_BIT_1)
 #define VM_HIGH_ARCH_2	BIT(VM_HIGH_ARCH_BIT_2)
@@ -312,6 +316,10 @@ extern unsigned int kobjsize(const void *objp);
 #define VM_HIGH_ARCH_4	BIT(VM_HIGH_ARCH_BIT_4)
 #define VM_HIGH_ARCH_5	BIT(VM_HIGH_ARCH_BIT_5)
 #define VM_HIGH_ARCH_6	BIT(VM_HIGH_ARCH_BIT_6)
+#define VM_HIGH_ARCH_7	BIT(VM_HIGH_ARCH_BIT_7)
+#define VM_HIGH_ARCH_8	BIT(VM_HIGH_ARCH_BIT_8)
+#define VM_HIGH_ARCH_9	BIT(VM_HIGH_ARCH_BIT_9)
+#define VM_HIGH_ARCH_10	BIT(VM_HIGH_ARCH_BIT_10)
 #endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_ARCH_HAS_PKEYS
@@ -385,8 +393,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR_BIT	41
-# define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
+# define VM_UFFD_MINOR		VM_HIGH_ARCH_9	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
@@ -399,15 +406,13 @@ extern unsigned int kobjsize(const void *objp);
  * if KVM does not lock down the memory type.
  */
 #ifdef CONFIG_64BIT
-#define VM_ALLOW_ANY_UNCACHED_BIT	39
-#define VM_ALLOW_ANY_UNCACHED		BIT(VM_ALLOW_ANY_UNCACHED_BIT)
+#define VM_ALLOW_ANY_UNCACHED		VM_HIGH_ARCH_7
 #else
 #define VM_ALLOW_ANY_UNCACHED		VM_NONE
 #endif
 
 #ifdef CONFIG_64BIT
-#define VM_DROPPABLE_BIT	40
-#define VM_DROPPABLE		BIT(VM_DROPPABLE_BIT)
+#define VM_DROPPABLE		VM_HIGH_ARCH_8
 #elif defined(CONFIG_PPC32)
 #define VM_DROPPABLE		VM_ARCH_1
 #else
@@ -416,7 +421,7 @@ extern unsigned int kobjsize(const void *objp);
 
 #ifdef CONFIG_64BIT
 /* VM is sealed, in vm_flags */
-#define VM_SEALED	_BITUL(63)
+#define VM_SEALED	VM_HIGH_ARCH_10
 #endif
 
 /* Bits set in the VMA until the stack is in its final location */
-- 
2.49.0.967.g6a0df3ecc3-goog

