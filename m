Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27472288C16
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623430; cv=none; b=fuGv7pMeYU0npFArMBY05w+t9GAKyUstGff0qPIK2A7n4N5d8YHfpiv/MLyu5IZWlPWSt5ePT6X3ZwYhJtHUibPgzLa4MBBsrMZg07J6bTKU19NoJa8Sx9g8pKqBhL655KwH2tg2Z2JAGlb7qsjU1Edi2XY6ZHgx7P8Eh8gmlLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623430; c=relaxed/simple;
	bh=lA1JmPEoVegiUw3C87TvPGhLFtXGyWz6ko8VMqECCsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ng3gGw/kTVxWBZ0VI3vslRYqaAaJq8YjWjFO3v+R51i9dYZWgaNFoFpntNu0xzWeGT88R5DVBFeVAjwDecHCYl2W5Sf1U+mUkrPdQskq4OyTJY8nW9jBJdKILT8sjOINBneWChpMIk5tycx9YF02/wGwD+McTpZJOmthyQk53fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lecOil88; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lecOil88"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d16a01deaso6352375e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623426; x=1747228226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRtiFa3E3rYiWsT4spswVI90f+55TGqnRsyWDvt/R9s=;
        b=lecOil88e3ZUmmq8U52LRofANotT+BxiNp8Ewh1LPgin1XrbD1atqFZGjkZJvNRTdS
         QYbuaQkhu4Jk2eQKSVvFqKbBbt70du3HAb56jbusMdDsMXRb9byel7KR2l6+utWVs0JW
         6VPpqvifInKK1YVBxJ8HtgKR7FKPF+l/qlync=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623426; x=1747228226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kRtiFa3E3rYiWsT4spswVI90f+55TGqnRsyWDvt/R9s=;
        b=M/zmM+6IdhSioSjBstiT7DyfYhFu4DjOAixujU1HzkDAnxZ1MuRZvjo1wPUhA2pLPQ
         XoHAa6iwahFSETxicwBPax6l0xIpvA98jQzkYbAkXTaXHqDeZshdKhEjg68PXFOTzdrn
         BW8OypOwrdOyFUVZ8rMKdfHBw9DmlxfqWkn6h3LwhJPP4YcofYwb+czfgHzt0UJJWRf5
         pTXRdXSXS5goXVSMwRMnjtNGxq6ADyL5mbefVNpqnImAWvG5GI8WlElzUUkL77DbMDuf
         0MfBs3HvlNuD4LgI8z84OmoBGkXpQOg+pwjzmOiJdaCY4DOp2fXxH0uj0qYDlZ6qSoGF
         Rvzw==
X-Forwarded-Encrypted: i=1; AJvYcCUJ3lOiZV+7d2bIzrD/YdNNiWWz2Q1zdU2rO+Ngwh7YButuAQ4D6Pcn+LGTnyEB9sjfNJjXuSdYiXL6Wig=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDyHZt3YMt65kk6LDv0QdQxhxh/dCUbyXaud1yu20fscyCDWi8
	oKk8L3ZguqHF66FOC+7EsZBGW0i4SDH+EQhBC094pgpGgM0PstSf4pm/h/kCgg==
X-Gm-Gg: ASbGnctk231czjGyAwZ5/GDkV6db2Aunxz4TYcm5P+1Iq6Ik6PHPdIo+ilfiPGvirjz
	K/errGoG5nXk0mJhzhrBsfxxIcLD6vCr/M5e+JLd0Qt1fJQNeeKRkHFclxAoxeWNuSreoKAkkvK
	TDzhRFsJZyRa0XnEmPF/mrqCd+Mr1VCqm2zK1Ipja5hl5FEgJL21NcI6M+vV6yyJ06ZdsPO0esr
	kR64Aw9Eemlb4VQG48dLqeXMv39MGXtBzcIqQWcoM++bSeW+D0A6vTUaIYV26m7fEUartofXYex
	OzrhYYQkeZtzS+92nRBW5zCHQ4+71OcVdO4nHWfjLS8yBRyKDqpK6s1tqZEUV5VUJo0=
X-Google-Smtp-Source: AGHT+IEkfIUkSWwoMahO6sAWL+HQVuKxqSNR1F791+ucIG23d1nTuEaaK/HEHbufmrKGP/mYe+538A==
X-Received: by 2002:a05:600c:cca:b0:439:a3df:66f3 with SMTP id 5b1f17b1804b1-441d44e57d6mr10556235e9.6.1746623426384;
        Wed, 07 May 2025 06:10:26 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:26 -0700 (PDT)
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
Subject: [PATCH v2 3/4] mm: use VM_HIGH_ARCH_* macros consistently
Date: Wed,  7 May 2025 15:09:59 +0200
Message-ID: <20250507131000.1204175-4-revest@chromium.org>
X-Mailer: git-send-email 2.49.0.987.g0cc8ee98dc-goog
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
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
2.49.0.987.g0cc8ee98dc-goog

