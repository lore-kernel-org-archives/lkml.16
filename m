Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC5464D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 01:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744593232; cv=none; b=RseQ3IfcPDk0EcF1xWdaMpzXYKN68sCCp/YR25RP19GT09bx+PPWhe3eNovn2E4HvVl3y997+oSHiZAAYCmHgP4c6LIqCeau+309Tqu356BorXAo6o/M7CCuknjVWqguP+En2PVAcDQpRT0od45Vziu2uotM/4S02a4Sxo+RYs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744593232; c=relaxed/simple;
	bh=Ja4p+BV+mwKqNCdws04Sdu90fyjgme4cb8MeI1sUXgA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iBccXrP3wR73GY8Q4ew7HVllDBFEEolQ3BvogpVNoRizOmVWtrGq1KrH/mpxqgVjK4alkfvwg5XsqLYfs3tu6MHn4Qth4hqL8bWGGMlpvPDEYSNYj2DOwgQDgAsqSSqUEIwIL6suPsj6/+3OPQtTa0UHH92fa2q+VMvKO++3o2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJtF6pcN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJtF6pcN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-227cf12df27so29233695ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 18:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744593230; x=1745198030; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BdzdxCQ2boOJGAV0pkDm86ghGxjYuAwQcytLgVDzK9E=;
        b=IJtF6pcNZmvwbaEcH9e4hwqL/XeKVdgsSzq7To0zaAHZCPF+FpQ33FOlnNUNR0G9PP
         V+WKAkQzAELDQ8kTw49eRrb6pcJ0zVGBCc8GaHzQOglyuxzTRjx20jbtERGaVlxIIyac
         NVItSNXzJJzDw81Or1xB6Nd/JXbrfyfUDkiW1JtXvf3BREUGHQuUVZjlVc2MghiwJCIB
         GcBRb3RSHHnCNBydi5OQmFo1gs6t1D0ul+Y5XDNCNvVTEMQnlMHWIf/LxUf7KPMUwWnR
         kI0N67xB4fe+0FTCXKanPyI7raz5hKaFApCyVLKiwpfdCjwCjHSMRqhuZppeiaKcMwOA
         MB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744593230; x=1745198030;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdzdxCQ2boOJGAV0pkDm86ghGxjYuAwQcytLgVDzK9E=;
        b=C1cIfRxbXWhbtx8kaSseamD9PuxxaPrRBvkKzPegMuhbn9EcYZ87Y+/tWNRnu1P6jY
         2hqcHA8i8GmhmjSw0casLTXOpbuGH25lxu/CobACG36WZfFEGo5R3RuKg1CwIfBIcLvs
         yruhqYDgRoCX8bF4TIIuAnVXAq4Bqgqy8RZxQS1Ep/xWhfkKpEbwmur7n/PhltPbvT9z
         etscAovfnS6vZSPXNmLywb64ViXElP8pccHKMJXZqeKWCbf//yNi3sxaTJLrDKE4HJyW
         F/8onXvJG/TGkpuakastrZqisITCNFLORuBF7o2lYJ+RkU2/E4tPUFLGw8H0cEjQFN+p
         egrA==
X-Forwarded-Encrypted: i=1; AJvYcCWUmXHiNS4nuCgybN9PLZoQ7hClY0pp+yjub2Mvm6GWAUZ4R5zMilKqGhvxru7+g+4a+fbYBv1SUlEMh5I=@vger.kernel.org
X-Gm-Message-State: AOJu0YysTVpGUH0MqTwW7Ih+bBBENYlJE/cbHLnjb1o3EQ2JcSZXOWFM
	awm5FX0k2XNpdWaFheFuU9sbxwWYTWtrgpCOmYiu6PjhCWPJWJaL
X-Gm-Gg: ASbGncsKFsEBiHmYlHGdn0O8R9rF8n+gXWUOrrpKjBRUktivrhNQ7jhsyQr/jX+C5rh
	d9TXq9TGpqAPOhgvivrEmmonGuB94hBqpobcmOvpBdfLqorFq7KX+5wOvSBwWR8Sg/4Y65ghiWT
	tk1fGu4vEQjtHnlFTLtzanaLz3NEYzyAvxLE6qTOH6TjE378kKitYRE1cXh7AEpHyGs2h9mUrZy
	ntho4n1Yjc/P/MKruXjSrVIpLA5wTKcngw418XJHM4ZCIO3wccaG0tUpAVgFrNbubv76v2IjBO/
	xdGfGKrddxIT9iShfQ8UFWL3kpkD9GDTuz6a1Fz43vAISapdlE9yTQ==
X-Google-Smtp-Source: AGHT+IEK7GYkSKMhmjlJ5RX0Rf1xQ9OdmOzZCYA8P02eAZhAvm9kt1Hegembynecc8LrEt7Beh65IA==
X-Received: by 2002:a17:902:cec5:b0:215:a2f4:d4ab with SMTP id d9443c01a7336-22bea04195dmr125880425ad.7.1744593229796;
        Sun, 13 Apr 2025 18:13:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b158sm88447415ad.84.2025.04.13.18.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 18:13:49 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [RFC PATCH] x86/Kconfig: Fix allyesconfig
Date: Sun, 13 Apr 2025 18:13:45 -0700
Message-ID: <20250414011345.2602656-1-linux@roeck-us.net>
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
CONFIG_KASAN, and that CONFIG_KASAN is responsible for the image size
increase.

Solve the test build problem by selectively disabling CONFIG_KASAN for
'allyesconfig' build tests of 64-bit X86 builds.

Fixes: 6f110a5e4f99 ("Disable SLUB_TINY for build testing")
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
RFC: Maybe there is a better solution for the problem.
     Even increasing the maximum image size to 1.5GB did not help.
     Also, maybe there is a better way to determine if this is an
     "allyesconfig" build test.
     On top of that, I am not sure if the "Fixes" tag is really
     appropriate.

 lib/Kconfig.kasan | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830fa..fb87c40798cd 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -31,6 +31,10 @@ config CC_HAS_KASAN_SW_TAGS
 config CC_HAS_WORKING_NOSANITIZE_ADDRESS
 	def_bool !CC_IS_GCC || GCC_VERSION >= 80300
 
+config KASAN_COMPILE_TEST
+	tristate "KASAN compile test"
+	depends on COMPILE_TEST && 64BIT && X86
+
 menuconfig KASAN
 	bool "KASAN: dynamic memory safety error detector"
 	depends on (((HAVE_ARCH_KASAN && CC_HAS_KASAN_GENERIC) || \
@@ -38,6 +42,7 @@ menuconfig KASAN
 		    CC_HAS_WORKING_NOSANITIZE_ADDRESS) || \
 		   HAVE_ARCH_KASAN_HW_TAGS
 	depends on SYSFS && !SLUB_TINY
+	depends on KASAN_COMPILE_TEST!=y
 	select STACKDEPOT_ALWAYS_INIT
 	help
 	  Enables KASAN (Kernel Address Sanitizer) - a dynamic memory safety
-- 
2.45.2

