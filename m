Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA362DFA56
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744852197; cv=none; b=Mmso4upS3k64G1kJNGvF/mwRQSQN1dRTetXHIoUhSIrDblicsYvjuydDGtoh7sk2dVlOklGRz7HC2pLf6x5R6Rm8H2WPBsqlx2nbySM4nbc39bCgD4yAL6tfIvgACvL0PlqLF0ffUtcO2S9VRToKO+RJqPN9B6A99HxbjW/o7Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744852197; c=relaxed/simple;
	bh=F5llYk/jvz/itdeLiJyPvg4xOwWa9USvY293RU1USxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GbuqfEMqNrKGNzTutu70McaxZ6JL5902FNnY5teeDy6GQNZ+UAqeKpAdo/6YHo73caPd2mfZIH4IItO7KbPIOhmRjegn3N7/7uv9hopAcFVYg4EeklzPTtcMqRSzKcwyx50HytCq6nV+mWFfVATUIzIWExQTT8G1aTseKa6vVRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YQNbjydI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YQNbjydI"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223fb0f619dso3148265ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744852195; x=1745456995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=KsBDMVl4tNJg6O1Gee8OEApious2Fe54yEWMkZNyBdY=;
        b=YQNbjydIS7q28aN+yxVDUhxjM/wiHkw2Lo0PD8sOCOSAnKU1ENCC/jGVFG2xHqGCh5
         a5IRJyWzxdZu7A+I4yNDvFDmhlAQicmyLOwEcqS9JhkK7H2OgyiOd8Hpw6FfiV4WfeMb
         l4jpNZtqNS6MZqmWz3QRLWHolBrGgzzD+wH43OjaRpKI7dV/cIhzoaNF7Flzo7unor7c
         8kaaE/WMXBg9llpJKWfQTUGe9l3tei3RSfM+tBGgGqZpadvSjMjb9NftyKRzocRrfLQo
         mT0ANtsdGPbKjuO/vfYJ3AlSIurZCspmAyWH99Xf7eBDNPY0ne2WZvdR5UWsJwguyoTi
         nygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744852195; x=1745456995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsBDMVl4tNJg6O1Gee8OEApious2Fe54yEWMkZNyBdY=;
        b=PMo2oSWPdaPsDLUfCxe7lg9PStbcnT7L69YVvHFURYXzK56EgWAAJwUbP48z8P+TRO
         nMp2oKuaOrUZ9o7bmm3AXlxKw3iS+hhfZ8foNVi1/xMrhnMLww45DKevrANpDSdvxYX3
         jROeEbymles7zZAaoD+LQuQA36O59/wPwXokOCcKZX5/dM89B4y4/38nRHAK2dXx9a+8
         IIy9aOatg85oiENWBAiOK1EhRgvBgNzVcasfJv6E7S/xAn8ujNn55ZVQ8Kqxj8QfH6Uj
         9C1Jg1xv4lFcPzXKF1WddFtHE8eI2ja/DpPmX/d8Cie8Q4bgj2DV6jXPGF/lNkh0js8R
         jyug==
X-Forwarded-Encrypted: i=1; AJvYcCWXEwjxrfT4o59Xy3OLsTvrB5LaSMrdekof51gpCR+QkGWXVRNFWRe95trbNEVP2c49bRpopw+GWs1WYys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiU7aA6jJmt7AL5Nj+P8qP/+c6GjShR/7Id1jyPw9uiM/J7DjS
	nmNzIOPmfBwJrm01XFu4i44DGwTJwwDc4Jb7pqlQ1uXpYPSYTIZh
X-Gm-Gg: ASbGnctRRv8jBlK4OT6VRlrNxVMWSqmgd9h/hHx5+mwG0cvXqPGhtter+64rcLGrUpl
	qiVicY0BYQegtRtmIZ8f9J8BdVtSrU4uWB8MtbJbIiQksIrF9sXQKve7F0xJbRH9c37XS46Sing
	2m/bWStKCrWY9bpKX94iBiu03vF7eaeU4py6cuPCukOmeGAdUxTYTAuT15m+Yc4Dl3YpTf4Dg+f
	BiKfKX6mPiVh1MyalS7d/fuDfXicaQkkbXbI4xDNd9kFAXz2+E4G7E6wkU4/KnUesaufLKlAnY+
	BQ/iXiHxBZYWXi6CIPmC7mpsHXSmNcS03A80Xqxl5Te60mrdNE9CRQ==
X-Google-Smtp-Source: AGHT+IEZL6pI4Ex/keg3vUL8nPRfLGBdHObS4FhlH+oHXonnYx6padUDmkTxJiGZ5TDCOtBhUrbTkw==
X-Received: by 2002:a17:903:40ce:b0:223:fb3a:8631 with SMTP id d9443c01a7336-22c358ebfe1mr71952975ad.24.1744852194837;
        Wed, 16 Apr 2025 18:09:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21949e5sm11110095b3a.4.2025.04.16.18.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:09:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: x86@kernel.org
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v3] x86: Disable image size check for test builds
Date: Wed, 16 Apr 2025 18:09:50 -0700
Message-ID: <20250417010950.2203847-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

64-bit allyesconfig builds fail with

x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE

Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
testing") as the responsible commit. Reverting that patch does indeed
fix the problem. Further analysis shows that disabling SLUB_TINY enables
KASAN, and that KASAN is responsible for the image size increase.

Solve the build problem by disabling the image size check for test
builds.

Fixes: 6f110a5e4f99 ("Disable SLUB_TINY for build testing")
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v3: Disabled image size check instead of disabling KASAN
    Updated subject to match change
    Updated Cc: list to reflect affected maintainers

v2: Disabled KASAN unconditionally for test builds
    Link: https://lore.kernel.org/lkml/20250416230559.2017012-1-linux@roeck-us.net/

Link to RFC:
    https://lore.kernel.org/lkml/20250414011345.2602656-1-linux@roeck-us.net/

 arch/x86/kernel/vmlinux.lds.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/vmlinux.lds.S b/arch/x86/kernel/vmlinux.lds.S
index ccdc45e5b759..647d4f47486d 100644
--- a/arch/x86/kernel/vmlinux.lds.S
+++ b/arch/x86/kernel/vmlinux.lds.S
@@ -468,8 +468,10 @@ SECTIONS
 /*
  * The ASSERT() sink to . is intentional, for binutils 2.14 compatibility:
  */
+#ifndef CONFIG_COMPILE_TEST
 . = ASSERT((_end - LOAD_OFFSET <= KERNEL_IMAGE_SIZE),
 	   "kernel image bigger than KERNEL_IMAGE_SIZE");
+#endif
 
 /* needed for Clang - see arch/x86/entry/entry.S */
 PROVIDE(__ref_stack_chk_guard = __stack_chk_guard);
-- 
2.45.2

