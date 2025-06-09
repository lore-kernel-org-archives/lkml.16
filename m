Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3987922F778;
	Mon,  9 Jun 2025 23:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512516; cv=none; b=iX2nfpEHimuZ7f4q854vu8tT8n71MvDfMQqrx07b8PoaXJRTfjKlhgA1S+lC5cLU49e8xg7P7KjVSm8hISjjs6G6t2V/oeYqEA+mA3+sPQDoAn72M4HyVfuY7uBt6mqYFN8zxpbwtYhsc+KhmVHYFd4W1UZzzPKMuVlQ9ZLw5hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512516; c=relaxed/simple;
	bh=qmujCDQlx9R4vpIX4LhEDjpBMWa2asx7kRQoNdgHhZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNsLO+FLrlFpjechpKWba1K1Cm6rwH0x03jxMvLQhOjqEDam5an4jFxxdTsH8W0mlFKDJK1DDAAIrFb4Qac6dYaLThQ0ADO7lqg4f65T6/LMRwdLwXZj52YL4AEv3yCMTl+U3vRN+aJOWSkbAgF/+duzI9duCy8obEC8wdjY/Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FejmtLCf; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FejmtLCf"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so1806938f8f.3;
        Mon, 09 Jun 2025 16:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512514; x=1750117314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3W+usCMR5B4Z7Ti6DZpHujd0vdEi0Zy/kIoGt2GNLY=;
        b=FejmtLCf1BCVyUwTzAc8kOdu4neIBqHqX5/sGotZCrLBQXcJ2rXN6EyJMZrioJIneg
         j8Yv/ooityJOed5UuSXyv3rBURarlp+p2+S24hGkWuDT1zh0OchdVk3TWR/xc1rqSTxX
         tsszn0xQlq7EysWo3cOK9SBCiMdmVPvRXrFheE8jlufCYzMleNdlLxYgGLiBWYBWmttS
         WepOU7W/6jK24ZCHGANYLkZNYFQx+Hw/AUjPHmdVut9p7irnkFBWZLKkDZ8jv9S9VT4n
         0t7ty0WbMn9RVvB9yQu99yS7tLaCBY3WqEraFlhkBZCORHacvjqE0LixmknERYk+0teZ
         rfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512514; x=1750117314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K3W+usCMR5B4Z7Ti6DZpHujd0vdEi0Zy/kIoGt2GNLY=;
        b=my3c/6Rn3yRaUtT7uFr5JCLxSX0W8Z24hpYB//7kB7Ht4kuJUUBgHVuRUWIt2VvLYL
         dPfCwctMOna8dfYO7swrqLWYL18b0Bb+8XiwBc1Hn6jIV4pxPNj2+2gJW3E0KJO4Fx9I
         gKNNLREdZDXpPm4mKOn+9t2gWxav/bBiLWRZM/Pt+L7wxiQe2Ctxz9tFkSeZ4dn7tQ5g
         +J6LAzZo2ZUJ2xyRRZNCi8ncIbyFK6kJJFv68GRduo2DKqNNAObjXt29jw/45F+ci2pp
         pyCh3QOneIoYyv8BzPTPMNvoXB78y5lmK05hGf3rio1P0euEK3ny8exQ2ZfHtkUiiz45
         ZEcg==
X-Forwarded-Encrypted: i=1; AJvYcCVPqz3ucbWVjLw6mv4t+IO3M7CJngdw/FEWCdfaW4eiUT3n7HeJ2NV+1MoUlehoHss6czQKhMP3h/nYdnyf@vger.kernel.org, AJvYcCXUt7U8azfGWduaYSKDpRFMJyQuj5aiZ9IBJteM0p0cjxbrcLSoibAr5az6QtCySY3Xx/+E1oYUlTR1@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1JlA0gmkLbA55iYcvwOPFX9kvsB0jMrRZxgSn3liToo5lUAc/
	ZOmO8wXRzbgN5Vp/XlX5xBVo7TlIpyA+Cy6zc7xel4pNWLw7Fzwna5M7
X-Gm-Gg: ASbGncs0Tx++QCIf8rwxcwWm6ZlaptWJ+0T+taCjNR02Mq5F15jeUX1UynnE8q1rxZv
	SS02eUU2eZ+qW9xZcnFtp7GTPrEV0rO/RMElAJLHNRVlCObJEqXbDIiWd19R59WaUW0cVocM3Ge
	Z2EKj9H1QxfETezvWJbc9aEFPXqWoUZINgw5Sr6y9dqqrwcKzmnaArxZDf1Uuid3TruL0+QnCfy
	ulgVfSQuacC+s5zVEJ4Uy3sbJDhaFUkLezrFrBAV7d3Pyte8UF+uLNcQ+EcX4lskqChbz+gLOWO
	AQ7B6Yhczgu/rICe6g2ViaOlRdLLlaLE4pK3LUenSe90FZ+kYcuulOZj5wohd/T9WQTGO6KiYcM
	=
X-Google-Smtp-Source: AGHT+IHG+23gSY7lbz1gITYGdcTpMahA14EmzL8S35xxT7RAijs9v4mF7qIfd+85zAEt9lbZCMJf7Q==
X-Received: by 2002:a05:6000:18ab:b0:3a4:c9d4:2fb2 with SMTP id ffacd0b85a97d-3a531ce1809mr12878839f8f.46.1749512513652;
        Mon, 09 Jun 2025 16:41:53 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:53 -0700 (PDT)
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
Subject: [PATCH v6 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Tue, 10 Jun 2025 01:41:16 +0200
Message-ID: <20250609234125.722923-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
References: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..af74bcc3c861 100644
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

