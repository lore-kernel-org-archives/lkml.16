Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9238265623;
	Tue, 10 Jun 2025 20:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749586371; cv=none; b=NnMvdb4AvJBdGXvpj71CD7IlIC6NBl63y9ChC/aQPfAV4fBxKVhVfqaQLTeIZPoi1kFf4UMNxX+SRCOp3G/cSqRCYCPe2FY6NVSae0nq5HYRohpjRVOJSCi6snngS6JTI5UlnABqZdTWC+iKp8cRFGg0ynKml6tBeixgNfy1AaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749586371; c=relaxed/simple;
	bh=z8TUXJr5QsqnYYZqY2zibHKBXHeJjmjKYYu3RcdvDME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYO5mC7XqMpCnMcvGYELtBjrrCCMv7MOEouZnjNfUd1UGnethv0JDmaLcbX0YoW5zF3mP6BD6ofh3hCKa7lhUBNtH0p9N67WulMkpWLyIiyY+Ao5ZhXMnigXCobic/Xq+t2m1P0qAwBwWueqBClAR4dZ0a2o+XQb2AxYX0olthk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PL1GH+Dt; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PL1GH+Dt"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a5096158dcso5009754f8f.1;
        Tue, 10 Jun 2025 13:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749586368; x=1750191168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=PL1GH+DtfVsUJEyAB/EkgiUGK/0TUm+6oThQVhRUk2XKVVLuSrOh/GOoK0N7jYlmIT
         S0YpCTJVOuJZa04X+EMTRWfXCg/C6MvZyX6YBBUgRDygwr3MoHWFwGIfKM6V7vLsYITD
         OzcSHNwXQfxDzAfqIJ+Ah8GN2mwmG6Y8Nj+EGaanUZsxTp2DeHDTkLfFhM8yklqslcM7
         ZZMLbDPTu/B2EdaddSM+qpSM7VuEfnltOVfULUeDfE3qyiaiFK8ieSKUGz1Uegn6t7tj
         fiUTXm1YYTUk1uKC9Sa06H9fjR0F/U/mD3bi+tj/ADj9ctbxfc4LwKVx6PCeRtq8e9th
         WBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749586368; x=1750191168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=LDKBq/qndh5d8JVmrig0iwYDyhi7Ns/bfCmkJS6F0sXmIwkHU54GbMrpRMf//8OhBM
         aox2Rn0EH7rEiicSfySMl3vELTJgu325iglpW5OW/ysE/7mywi6Sw8ackM34ybZRzTh3
         cBhWgH11QJWfpmt274HDNwlQM6dPv+MKsHHeQfFUk2MgCikOrwf5D4PKf5NkAATbZeHZ
         B0Ofq4lUj1R/Ul1jt1kurIvc+BxJxwh6VuWRtFQtDP6MX6UBT3aEZvWw5HTOk/0dKvxL
         tkNQbujGdT1ZcKTv4WkhgZRVmIeeMsFE84b3Yf2Am216d1iUgbsNrrE8C45H7iK4V5tP
         /LLA==
X-Forwarded-Encrypted: i=1; AJvYcCVOT4SBWicPk2H4q1XlAAa8vsGdfGKlEGHkp55+YSYf8L98c/O3dlARnd+z0q04961z5la230LNTIx0rV/A@vger.kernel.org, AJvYcCWLvFA5upgrQRJfmRMRtDne1B+myd0iD67NA1Ar2BvTWPy1CNc418tBtjeAPDrOqYaxOBgJ3GU6LgbC@vger.kernel.org
X-Gm-Message-State: AOJu0YytvObIG0+DzUvrTfrrKbaex+8ZUkyEICztODRj/aC457eVlEJz
	j8AyByFApLu5XOOitkpGmwGR5IIhlpWU+Icl3oBQLtUbBTG/MfQx5FuQ
X-Gm-Gg: ASbGnct5G+nTCyQXiQZGuW4No3MTb9grAxR7ldS+5plCYyn7hnHsLTb+0dUJmtUHUgh
	BywwP7crBIDJiUskaS7O9ifDY9ByLY0uzWyRgorXvn01FQOHzzjzsRhEzhhkgJCKCaynQnoMn2b
	CB29SA91ZcKvPkl8tWg7/TF8bHgdv0VHHdW9fx1h5esYEhwjWKAI96ZOonCCzAkZnPPdpN/bV1B
	c6fKLPPGfA+5CftdorBA1OtN7NE18OBesBm6yAy2Ti1BKJA1VIIyqRWyNunvfcOsHPkd8EO/O6e
	aTca+X+yxv2E1XPAPA57l4ojdPA/mo7VlVmzmvAzwAl9UAom80W0r+OLUXXw/Q//8wVjAZApl90
	=
X-Google-Smtp-Source: AGHT+IGXmvAFjqs4pjoEAShXCvFmqNbo5KEX4EdMZLZduwvdNUPzMRl0S8PE3/LwGX0j1lxRKthagQ==
X-Received: by 2002:a05:6000:288c:b0:3a4:eb92:39b6 with SMTP id ffacd0b85a97d-3a558a4277cmr315642f8f.54.1749586367885;
        Tue, 10 Jun 2025 13:12:47 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532462d93sm13434970f8f.91.2025.06.10.13.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 13:12:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Tue, 10 Jun 2025 22:12:18 +0200
Message-ID: <20250610201241.730983-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
References: <20250610201241.730983-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..8c23aa111e94 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.49.0

