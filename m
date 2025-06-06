Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F65028980E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 13:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749217693; cv=none; b=m2yVdMf70Pa5Pr6LhwhurlWB32Y2tVK2HQfTwAe25Yyw0wUa3zPGQfZ8M4rblQWEik5rBfU/nhqv4Km+GBU9qXQLXgfbE+/S1E9/47HMFs5+oMwqW2zUd04rttOadNmk9raN6RfUHVtDpk+rrfRP+LEP5YY4jvvkt+wdqipYp4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749217693; c=relaxed/simple;
	bh=NswgQ1t2swuHv8wddM8n4IMJSh/NdUsfmZylZ40IPmc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CtEfOb47lApaztWSb00by73umLnimoXykQwdzGP79sMBRlBIfpcNEO8hCgkgYVbJk+n+0bKpIAdzFzAKD5wOvONzJdH3+s0kK3E0rrvmr/KNecV455jfUzNYa9XS5b8EIcQ2KHk7FG6ar3lH/xf837uLf/01z44fnP1pJW/4r1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXIEYfOZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXIEYfOZ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-747d59045a0so1488090b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 06:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749217690; x=1749822490; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=iXIEYfOZFUEcOjlv+C+Ku0pfdhwaX7desw0QMKnUygx+lVrQOhFauJVmZD9A0tzRiN
         Dtw4yzQZFgg74DK9yIH1Ps8dxpfL+LlGvFKZJ3rJ4Zh66XQRj+XFl8ZO0NndIxyPWW4a
         1X91Khoux0xQRk/wxxfb2XBDsV3faxI93ntEun/Bsd2J2c+gEqvMtgSb44dMb+J9wk/n
         NM0YDkzMyF7GMjk4e7YW3q3kDsqot5zc/CZViYakiEoLRGw+EnZ6bzt3uqHqob/hkBpp
         3m2qny7kN7CuDTccezx1Q6OutM7tVKKEswmewR2KnLtosyDp9LcRzJkuFHWVfGvBHfZI
         4ByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749217690; x=1749822490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FT74bOydnUw1XVZ+DksJusFTfOc0V0/ESQZbybugO8=;
        b=hp7FaLtaJte23mzNXpFB9OsyP746UtVE+/nWYcsgz98OOiDD246hCPe1DOhDSKLYV3
         Timua/Yfstv3y0rr5HX+zTr7OxBmh70mmOSLTQuoSGmtgOMmanyNEBRgPdPZXOmCeit8
         WFuWmn7Sfd/P3Nj3DnIa5u5LE2WIx469ZVONTxDq9fqmul71ndQoTD4FSqaIvGovCuRP
         gAUp6F7r8SoP3SnouG7SyjqXDtlDkCKBTBFXo1zjXS23d0AED4hE3t0lJSCZ6R74GNHS
         1S5ADYzXHvqskfClhNOIBS+dilZOx7tbPN5jV60C2pjK+3wBu0AlkwVFitzy+7Hq43y9
         xFNw==
X-Forwarded-Encrypted: i=1; AJvYcCXnB2S0BcmpiY5VGqLGrPayFyt8Hl4+9ZZN7Kck3xohgrGCtuvzKxFhg8CbEABc5SIXYnyoGAGUg5ZqOmg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR1J6OIQDypLETFS39TdoYa+j8Vlme1IJTuxYiDPjeOGkE+A1d
	er3wCS4E+7WpUD/1eO0uU5jG2aZsHsXfXkGT3hBBlsdlzPSvADB/U5Pf
X-Gm-Gg: ASbGncscNQIAJYzi2b5tG4pO4SrWcwrSJrlsmcXX3H7ktajjiEnX8qLyxYLtkbkOKq0
	gTtwVrMECPWsTtE/iR2tiiRItuLkZrWeVRKn76m6YAJX8F6PZSWId912+Y1c65CnwnMHPgN86me
	uau/dWtC2QekpKiQSAmQPfh7Usi62Sjsa/Dbg2MQVuwmsM+fbpccOChYBRw7pHlQNG4am+MKW8x
	TPeoVcXk2qt6l8brUe0+KJ11zBveER7R1yqN9UFczAVI+7+fqjO68sOcIGb8W9qbJ+Q0t1Q0MGt
	MhyuqXvqDxXqZ6vI1nXfiF32baRhVL+bvYHo88OhR6Pzh+E3zsl05q6+iyP0tsNdib0svNLaiCU
	oidzdHw==
X-Google-Smtp-Source: AGHT+IG3Kv6F9aF4jSJA62zhy/5qbGz+kSKhCfE+F4DJ3V6XCScYluGiO1lVGNxqP0lX0yuL5Q9aAg==
X-Received: by 2002:aa7:8891:0:b0:748:33ab:aa3b with SMTP id d2e1a72fcca58-74833abbae5mr823623b3a.4.1749217690203;
        Fri, 06 Jun 2025 06:48:10 -0700 (PDT)
Received: from visitorckw-System-Product-Name.. ([140.113.216.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c1168sm1296798b3a.136.2025.06.06.06.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 06:48:09 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	akpm@linux-foundation.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	Kuan-Wei Chiu <visitorckw@gmail.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH v3 2/3] riscv: Optimize gcd() code size when CONFIG_RISCV_ISA_ZBB is disabled
Date: Fri,  6 Jun 2025 21:47:57 +0800
Message-Id: <20250606134758.1308400-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606134758.1308400-1-visitorckw@gmail.com>
References: <20250606134758.1308400-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The binary GCD implementation depends on efficient ffs(), which on
RISC-V requires hardware support for the Zbb extension. When
CONFIG_RISCV_ISA_ZBB is not enabled, the kernel will never use binary
GCD, as runtime logic will always fall back to the odd-even
implementation.

To avoid compiling unused code and reduce code size, select
CONFIG_CPU_NO_EFFICIENT_FFS when CONFIG_RISCV_ISA_ZBB is not set.

$ ./scripts/bloat-o-meter ./lib/math/gcd.o.old ./lib/math/gcd.o.new
add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-274 (-274)
Function                                     old     new   delta
gcd                                          360      86    -274
Total: Before=384, After=110, chg -71.35%

Co-developed-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index bbec87b79309..f085adc6f573 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -95,6 +95,7 @@ config RISCV
 	select CLINT_TIMER if RISCV_M_MODE
 	select CLONE_BACKWARDS
 	select COMMON_CLK
+	select CPU_NO_EFFICIENT_FFS if !RISCV_ISA_ZBB
 	select CPU_PM if CPU_IDLE || HIBERNATION || SUSPEND
 	select EDAC_SUPPORT
 	select FRAME_POINTER if PERF_EVENTS || (FUNCTION_TRACER && !DYNAMIC_FTRACE)
-- 
2.34.1

