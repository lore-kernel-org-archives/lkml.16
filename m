Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B29288536
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623427; cv=none; b=awkM+5ebmWcERBb8H5j39KYZVKv/yD+LxquMOjvzt6hNz2z2lif3xz9IUf5R4Bx0APEHWTf4a8XXH9rCFed/SjRLLfNq19Ztz+XAzq1iY/MHAzSjWppUhZ9FOE0Ydlp3IO3UOURz/GIlg+39f13MNggnB9Ye93mk651s/2WbmSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623427; c=relaxed/simple;
	bh=1HoIK1dob/FCUr/9gIAYkb91WZQksbFf+J0PqJUCxhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hX2PNLWniEJtbVBvr82R0lFub2aUUVEt9mgSxFwc5oFor3VrWC4jSh3YJScMT2jCsHYFX1NRf528OkxsHMRB6dq7xYMlFakIA9cjygGNYOJAZqe7WPtyHoTZl29IFZ68jtQ+qz2hB6Dw70kygSoWPy9iLQBDNTR3xxAsRPlWYkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=E0vBkxbR; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="E0vBkxbR"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cf7c2c351so5667725e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1746623424; x=1747228224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Y9rpyN4yLEJrlewSRVGRCn2URs38bBszmjv7HdQYkM=;
        b=E0vBkxbRG4dE/EO9JMUkEjc3EFu+iWH9pJmXKOLlputPBKV3zo/I1ies/bqW+7ktlE
         lVqdc2WGv2vNTKC43RoSsJHQgq8K/BHAkWMJEHmb9QKE+maXo7B9Nj7hy4eDn+iHbopY
         +FfMXyLvoJAz+eBke2Fd5QNYAXhJ+Z1/jsjL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623424; x=1747228224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Y9rpyN4yLEJrlewSRVGRCn2URs38bBszmjv7HdQYkM=;
        b=j9zr+cfcxOuzpDOXkJDrAByIeuRmcOOkYVHrvgZE3o+HAyMoX8nuyIOg6TSBIbYBn8
         go7hgS8Y5xSHlmBHYWHxyy0fX3G4GVhMUx4XO/3qBE8+TYRiVIHM6Ou3euOzzvi6soPj
         u89tQRzkS2QJWpBVA2VMqJoWVojBC3mlSEtMH8JsqC3eUzWnuTxUp9zVqDPbjSykReae
         3AkxsUxBH2HNL/ZCNGnzAS6ANf6fMOHCWcvauClStbokvWqgu6SsY90Ekqtf5yrdOzv/
         0R+pqI9lvFVZjyPJ4Wudj/kzqtohLgM1/VGU3CKZI5BmJUpfRp5Y9sRxvM8iGht06asP
         DALA==
X-Forwarded-Encrypted: i=1; AJvYcCXOUUD3XU9OG2qFSKldbjrqORgIAfPiW6AQxWbQ95cXOD2B+PtkwolV8Hc8Lm4t1qajJYUHOZREEbZ+q4I=@vger.kernel.org
X-Gm-Message-State: AOJu0YznoLbrteYKzYvsUbRbuXPHTzZwayM3/3AfOdFE6TlAIQxojOHt
	KmZtCyVeYv8R6qYvLAFwlsp8jdrokcOPN4j4i9PZCRJHb48raq4foIKGdK80eTHZzqtUtvFhURH
	kcw==
X-Gm-Gg: ASbGnctREZb4IZ34OT301xnHDmxH4BTWJ23492NAv2VvY+6uFASucyXcNW8oW/X4EzH
	+dkdj+lHjeP4pRMsFZ3gR5652ciadZUoJ3Jg6Lviz+PJ5vlj46wYUnpDr9De/U+Rps4DNDJurT/
	t9LefDTkqaT4VYLTtydkIdbE8uWLc4BJFqKbSmLVsa5lO04B2FMix6BzfAG4eOOvv5TR1pvvgwQ
	21guvkSJ5C0+6U8baoe2Hu5xhzni/GWNJyj6zuv4mh48dv9jZOXGBIZUiZahzbvvVGh3idxo2ue
	E6Z15Qr9gJX/B4zZ0DY5pikRvOAZslEDIPP5L+yR2hY71ERUaZaqQJNQ
X-Google-Smtp-Source: AGHT+IGAHrJrwAiLSC3RwdUM1dYZaf33fAuwlrAULQijJUqxqu70I8Scjch/eI8CbDwOeg7SeJPHZw==
X-Received: by 2002:a05:600c:4ecc:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-441d448cab2mr10128165e9.0.1746623423817;
        Wed, 07 May 2025 06:10:23 -0700 (PDT)
Received: from revest.zrh.corp.google.com ([2a00:79e0:9d:6:558d:e1fb:c2ec:7513])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32adcasm647435e9.6.2025.05.07.06.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 06:10:23 -0700 (PDT)
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
	Florent Revest <revest@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/4] mm: fix VM_UFFD_MINOR == VM_SHADOW_STACK on USERFAULTFD=y && ARM64_GCS=y
Date: Wed,  7 May 2025 15:09:57 +0200
Message-ID: <20250507131000.1204175-2-revest@chromium.org>
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

On configs with CONFIG_ARM64_GCS=y, VM_SHADOW_STACK is bit 38.
On configs with CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=y (selected by
CONFIG_ARM64 when CONFIG_USERFAULTFD=y), VM_UFFD_MINOR is _also_ bit 38.

This bit being shared by two different VMA flags could lead to all sorts
of unintended behaviors. Presumably, a process could maybe call into
userfaultfd in a way that disables the shadow stack vma flag. I can't
think of any attack where this would help (presumably, if an attacker
tries to disable shadow stacks, they are trying to hijack control flow
so can't arbitrarily call into userfaultfd yet anyway) but this still
feels somewhat scary.

Reviewed-by: Mark Brown <broonie@kernel.org>
Fixes: ae80e1629aea ("mm: Define VM_SHADOW_STACK for arm64 when we support GCS")
Cc: <stable@vger.kernel.org>
Signed-off-by: Florent Revest <revest@chromium.org>
---
 include/linux/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf55206935c46..fdda6b16263b3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -385,7 +385,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
-# define VM_UFFD_MINOR_BIT	38
+# define VM_UFFD_MINOR_BIT	41
 # define VM_UFFD_MINOR		BIT(VM_UFFD_MINOR_BIT)	/* UFFD minor faults */
 #else /* !CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 # define VM_UFFD_MINOR		VM_NONE
-- 
2.49.0.987.g0cc8ee98dc-goog

