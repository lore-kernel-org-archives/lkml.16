Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0135328DB4B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749549725; cv=none; b=E/+uPiISqJZatfOk44o6G1LyzNwHoAK1sZAiOGYth5XXpZyb0LJ5mNgckuWoC+PZ4rsuAFJ9rTCsyxV/nQAI2deyvIWhxxL8F2U1LusbvvRJwQDh4t4ZVRBkbId0JMbV/9wkGOgN0r2MVqMpal6GmMEPKwTua0lP5I5cYl5y6N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749549725; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OQeFtUWl6C2hHET9HWnm20/1LYwe8JWWPRYIt4HDv86bE1VTcLIuxC1vLY34Wz0xhAelFZn5bi+eAkXethvyiy+6mGSbbcK7j6frKoD7Qm2aHzif8Aqnf/1gfz4RN+WqitXMy7/hhg9/zCRb9vMx/mAnQ/aVrC2UshFvdVP2ulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=i5emfSea; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="i5emfSea"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10314586a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549722; x=1750154522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=i5emfSea+eY27qxRk5ouRrE6+MHbjUappdKe97pFOt8yYiZbifh0t2rruY/uw9Dt8r
         y8BRgPjsT9cu2sJtH/RnrySp5C/8i19THeYEgZXZFG47lrkcOCWybMNvKgsFmZnwF6zN
         D8/auDJUJn9ERgSrwhlBaIlBKBwXmwCsIKoOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549722; x=1750154522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=ZJFhMmCgUZsI/X+8UjqKrOLJIASqAgVJ8kDD9MpV8+SBMRUV4mN2fAvyXQW5o/wrDL
         FUBfbvO2lFeS8EpB2ML+0kNftrOw+TdjTf8hTTaAuCtZ+/ajg8QzWzQYLEfl3Xt1Q7zD
         TM3bkuwMzPVghp9Md7jGTwO9KTolSSmjvmH8tDakOsFMxNkoc/7OtX1XPwiVmqM0+2ex
         iTXnrk/B3iOVuKrPZOpR8ddGY9bVusQ2D06lwqnvPNfAR+27+NoXmoiOWWH5uunaNupJ
         L5sEnLZFmQoma44HohHF56Y3GGLsDb/Y0uQypU+JRM9Uyrlr+sIgft/LUhevJKGPce9o
         gM3A==
X-Gm-Message-State: AOJu0YxusPW3DcSc0kKbX1iZVLqFpbI1DwYzkPYvp3oqEZLorxcE77i6
	JymBNH9xblPDfyR4kU8f1aZZOBYeOgpsSYJliWHyAssNBONiN1BhydOMy1rxUxI22ZWfFZsPGgx
	zRAD2
X-Gm-Gg: ASbGncu/+D2JU6RLpy4IwN1xOWq3s2fNpknFSZdMBcctiMy0iwrUzttUH1+IEfvfeEb
	DTs4Vo0+zQrD1gLi+yue6rwE3D2J8oW/cD54LwYuhaK4ii1EJ6jUe8K5SVMkCqc/1ZacCSFP+09
	zN34HVa4Fl5VsKJd5Qx7Q0KtslyqztUWdQ5VXILtKNv3Ghkep/CmLrFPj3gVPxe228ml9lga2+y
	x+mAMeNOfUSIwEQGc4w+OfWXQAXlODDiUSSvJeyK0Pfy3uL4TTTtx+FLmTQEtqhRyFQDTW0arz0
	M5ZmToIiSKgUB6iX1F4bhJQ72jloLbxG31sqYqZAjX0VO9dhmGxKmr6OM0fo/uA5/R/CqvqmHEa
	rN1BuJpsTCz7N2Q2wh4K11iZQZR0=
X-Google-Smtp-Source: AGHT+IFpzmTpzfXKwO7hSH+KrhiZpJlmcFC4ApFNg+muY/xafPN/5pLnUmMU8U65bPqg/2CnqXnQXg==
X-Received: by 2002:a05:6402:1ed4:b0:606:f7bf:86f3 with SMTP id 4fb4d7f45d1cf-607735120e8mr13987501a12.6.1749549721976;
        Tue, 10 Jun 2025 03:02:01 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837ed0bsm5953438a12.36.2025.06.10.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 03:02:01 -0700 (PDT)
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
Subject: [PATCH v3 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Tue, 10 Jun 2025 12:00:23 +0200
Message-ID: <20250610100139.2476555-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
References: <20250610100139.2476555-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v1)

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

