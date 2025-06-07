Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42599221F05
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 09:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749288845; cv=none; b=bPH9TIymUg+ba2pRZ4WnHSjHBlIOsWvQiJ2r/X1mYQ5fx687Gs4fBsCCV45Rutg+lqftNg6lsrThNpvSFpask506QdOqwCU4r7XtRUR/cRnciN3TLHOab8pYumSAY8+IuyU18Y2b6ElSPHGsldS2hkR7lOlVpTwNPeSOzv5bQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749288845; c=relaxed/simple;
	bh=5KQWjhoLWPA/krvVZwsgas9XRMich2nXKYzqUbLffzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kog+DJJ5/sZK2DWALmNTHpo13IJtos0KOCfl2CjYbceSTj/vIB6KhEtQU3Ak1uR4JbN9ftKwJb6w064u1P4Z4BbK7qPGiWuqA0a3v4/Hwj0Fmy1c209zvi+Y2LPlEsRJ8Lc3XpxfZqgdhH3EZo+UByYZpLJxL3D61JcQ9s0JiBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=iMjb+/VU; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="iMjb+/VU"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad891bb0957so452056866b.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749288842; x=1749893642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wep7qVH6kKRWEOlGk3kF7+QndMZjc4UpPN5qp8DyFqo=;
        b=iMjb+/VUE9svWiWdiUzXdxMgLLvhUfGeCHLxBWB1W9CA8G4lt/bf2dKG+Slk/Lx/kN
         uN1B5VQ7dwHHa5zwpDlPxfb186aJU2m9lyrWZsypEDNOlk8JWQMlDmxV/jx4XIM3iUq7
         nZWV0EoHwlXybO7lP+s+3KV6iK9dqwoK9BEFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749288842; x=1749893642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wep7qVH6kKRWEOlGk3kF7+QndMZjc4UpPN5qp8DyFqo=;
        b=uopv4H0VPJQPhwP6xSX/NAb4ttFdJkRmsQshJnd31QFZ3h160sOBTWIPrk0JYVZ23N
         0jEknJB+U1CjF4gVmh/2YR5c+4aZuiEEiMC/mZ9gko9D5J/LVxtOvr1COzG3WKtqVlGd
         OEgTx8eK7IEJfzFQF6H3r7UMrtmzwFO3P1oXi9EhmMv5peh5UUrLEPaAQDWQj73xOS3c
         UDW5rRMGr1VI5J8cNF7HHYte+BFmkJn7vV6rcA6p4vu/LUvOo6C0/7Q18GPTO6H6pJNx
         7dHkeZWUTWCEReZ5hhBIurHNJZPiEtinDpV2g1NoOGy7rv8N8M3sVTndhCvlXknT7aTF
         w0jQ==
X-Gm-Message-State: AOJu0Ywr4evJ4q6TuueYeZz0h7FVDRwDQ/ODa9EFX6pkyRDYtJN1PpUj
	H0HhQE0ODTfhmoQoFwAkjCgR19aXb6/d7E89Vhr52lpP9/Ew+kpte3i2/7R9MleBAb374Jx3Jj3
	CD8Xm
X-Gm-Gg: ASbGncvwTv0VpatkYaZsLIIMdX6xoDOWBPa6eEpDCv9NosDCx+15sinVePCaahHXC7E
	VmlVJBvEC7yqPZSZKFkxfQ7EUkF5Wxg+7k7A6P4+ZMrCT041t8Ky+KWNpopmcXDypy95BvVu1AS
	zRHv+nRpeDInPXZA8j5S4n9+u1h13VWRMURn9r3nNBOjxLFxMF/0SnpMrLxExTiaG6nzSHsjxz0
	Iwo63vft8eJZLniG6faWitZu4ZjoQunpnfBXHbnmIS2leg9PZEnCp6LazzkCcDN9R9N+uNu5dXP
	h9xetU0BXV0WFTevegvisl6GbvvXnwXzElomY9aJulRNZU65dulq+pPrESAMfyulCGLKy47/iTL
	+A0zslCkmGjKgmMmo3GrxXvnavzO/fgLO0K7GgkUVTTbDUxPQEcFGzef3cij0PGsur2qhBub2xo
	d9+kfSOUg/46sTNqrvLdP/vD/1XOrT9pRPkg==
X-Google-Smtp-Source: AGHT+IEr220dwqbHwABkZRanSaWg0ZAOBrjnV/y3GQiOc5eTmcmdbp1c3FhkJ6PtntZ9o0ybwDZdQA==
X-Received: by 2002:a17:906:1994:b0:ade:4304:6b7d with SMTP id a640c23a62f3a-ade430470fdmr89505866b.49.1749288842311;
        Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-87-5-95-99.retail.telecomitalia.it. [87.5.95.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc1c316sm251541066b.98.2025.06.07.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jun 2025 02:34:02 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Matteo Lisi <matteo.lisi@engicam.com>,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Sat,  7 Jun 2025 11:33:22 +0200
Message-ID: <20250607093342.2248695-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
References: <20250607093342.2248695-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is required by the Engicam MicroGEA GTW board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 917bc8a27794..3181775a214d 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -335,6 +335,7 @@ CONFIG_USB_SERIAL_FTDI_SIO=m
 CONFIG_USB_SERIAL_OPTION=m
 CONFIG_USB_TEST=m
 CONFIG_USB_EHSET_TEST_FIXTURE=m
+CONFIG_USB_HSIC_USB3503=y
 CONFIG_USB_ONBOARD_DEV=y
 CONFIG_NOP_USB_XCEIV=y
 CONFIG_USB_MXS_PHY=y
-- 
2.43.0

