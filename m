Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F142571CD
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749464222; cv=none; b=gS5iR6i8vTYLoTvQMOstjDdDudzMlXeRtnrkFm42l5Ugn/p5hHI6CiZstrScXgfawdoBGAl4Z5qlK/fLbynSlgYtPnxOJbulNZu+6PWAu33JC+ekendpdqQuQvu15G/l0E8QvsuBvmB4Xp6J+cWllLaUP5bEt3TSHk4GwSsqQBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749464222; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZOYR5wupzslo5BWRqjl+WN5KrQmj2GSmVvDYP2SQ9akIWGlYD64UitfAuIUHNswtR75ztjYEk0htCQRLA1CJ7ZnJYsi/5qOmeEuFs57RJSontKh1nfEny6JLF86gnQHgwiXIbit18M4+VUuw0Fgqch+GC2s14UVKg3Y5krqicno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=PzBYyc+s; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="PzBYyc+s"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acb5ec407b1so739991166b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 03:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749464219; x=1750069019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=PzBYyc+s7kxLNAy/Mg/jfhEE3J2VG4ByUtYeDD/xWelX9EmcHr0nsxMzzCDSoSdjw+
         csD17h2P2koSIxb+Wknkj0ylQ8brGTbvjZjRkM9tFdteK3qPOVydmZOshx7P7Gtysgbp
         kxBpZLSPe8m2BPSvQ3agaChmnhww5KDTvmDIs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749464219; x=1750069019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=Wgwiw24KT1G810RgjY+kymJuxRg6rbPPbPrnxGRM9fNgswhKOKXmnFdNJyuL1e7BtJ
         O7vnTHh0IFADlIDZwQCxy/57jisE7udkg2naiZQhWFda2qLoSoNO0QCPL0IJ4B8csxqC
         X+UlOYPyNTrQ86lOfE4tT46ZrAI7p4/6FDRuSybtVYMIj16MP7U4M2XKYnr0IbbT/H1j
         uqCQH1NhkmCruxkHbGPHqyMu7fJ8mOaW1Kgwl4Bn1tk9r/hSuYVcTzE7uglQ6gNfwwdP
         hbjcGL8pKIKPr5IMZOmqd3yc6nrhBLh3h7eSXoCH4samn7DYjrtMH+0HuH6EuBI/1xaB
         J7bg==
X-Gm-Message-State: AOJu0YwoYX8Ex+T4OvKw4cyEFqu4nZdgozlFNPKvKPiGBjQWHs29wKyv
	pHx29TWxa8StUes6gC60u3BPZHaDz+c7iifP5UMPlxLqHNey7Y9SxrA/P9f1vzhFPHh8F/97csT
	PEPBf
X-Gm-Gg: ASbGncvq9gwaLRBLSeShhg7w82m5izFz6Ybh3doTVRvemzw61twfkMqr/3kaLFW8OvI
	nfNrlM1NEMy3Kcu0a4jfLQuNj2oeS+XZL9j/0Am2T1Sz2hQs3/WabsmUpboY7q+6s0m+GH0Jn6i
	63zXhbaFsnD0IaYbi1LmdyGV1UtVTkILSQ0OnRFqql4VOFEKNbQnWi8zHVnTuQyJorfbELvg93c
	I0Q4rEegdbpDFCifPaVXpWTi5ielDy+OBiV50uu7nvc7n5FGMAkM9aT7h6Yp5Q1PEuyZ6SKFf+m
	Kq6txcz3StkQV8VgpMQcb+Yp+LRrWAec9Ohcwt8byHzR0MA7j3+v061nIFy/S+6OSata+B9khfV
	KBX2C9bX5kHQzM0yD409Up0/amAngo/dzILEvL9WulAZ0d7kWb4M=
X-Google-Smtp-Source: AGHT+IH3gsxVUUgw8pn7niv+7bX9R//knvGpYp8ip0Yy0FzSdBl9gPYD+Rs9VowG2jDeFdePscxQDw==
X-Received: by 2002:a17:907:d02:b0:ad8:9b5d:2c23 with SMTP id a640c23a62f3a-ade1aa5d45emr1170457766b.10.1749464219247;
        Mon, 09 Jun 2025 03:16:59 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1db55c7esm529257066b.49.2025.06.09.03.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 03:16:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
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
Subject: [PATCH v2 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Mon,  9 Jun 2025 12:15:43 +0200
Message-ID: <20250609101637.2322809-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
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

