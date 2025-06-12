Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7E6239E62
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 09:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749719326; cv=none; b=LwOeP8CZCtPsUtytV7X8Zjd5ctljr5SfIJqrNJ1OebLP9Lo7BoChIpizUc5LKa0mJfk/24HbO9JooBNpv7JTynuZsyZ3pB/P59Pv91mBlcKrLgur4ypO+l2xpoKC1CqPHQobVEfMkkQBCQXXKctbsUApOiUWnlr6hZg0LUYFXTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749719326; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bD1cxmiysrNnHePyy9n+NkhY1zBAwoi4CWKF4PLu0akP275ovSo2eHrTE2RSCy64H8xtyFHcL9VHtGd8xERxbrZp8bhZfInGKL4mvmIxAz9LcJqwYsMXIpklFuCEtVqRLwBR8iBXNWOXRWvZPqosZK+MZ2pGD8TP/M9tGpP2uiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=BnU5iLnx; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="BnU5iLnx"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ade5b8aab41so156541366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 02:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749719323; x=1750324123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=BnU5iLnxj92cBE7L211VtAf6xpISMSRGo1U84PDt4jU2CMPdTug5376FRqeLUi/lRQ
         ykZ2xlrh1Vn1CppUI9tRUN6EtsRgPzgOaT1zFjWbrx51jDgi28Vk6BvLnQKY/flKm2j1
         astv3au60wEwQM2K3FGVfGoGXasaG2qjIC+KY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749719323; x=1750324123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=gHMXIUxAJEJevj2TvVBYy23ZkEwAyZNGNlDaYLD8PnO/33zRbZNGo8gHvKGaSOdrBT
         EmEhR/F7TzH2pguNnR4RWGwITof7+s03/JK7dT6NO5aOjCkDMDIjRlRqHfWUXXdDhVms
         t2AkqCAv6Jc2wb6CxF+4M/EFJUBdxdycQMPg0lKJ0N3pIg1KOLIg3TgIvKzSeIddUh67
         rLZB13GAeHPqcSpoa9ibIyy+JlbFho4Ypg/U765NO76Y9NvgSOHXH6dKkkNrrfL8E1v1
         DrxwUWgeE5OxUajw2nJ8MieYVLJDH6pyep/Y6Ih+DJO1unSMpjwtTPlROKiUlgI1/j34
         7JRA==
X-Gm-Message-State: AOJu0YwckhwQyCzdN66ETXGPZr36aXxkjKcjzL+isTqaxm9CEU877fod
	xUHebIwW8BmaOkeq/tjZe57NtMwidWX1NLKKL2UnI3v6ztGrgOXdg6JR1tJUtFC4ZUfZeBbZ7Uu
	3AS8n
X-Gm-Gg: ASbGncvb1u4QGMQzKtSG8P61AwhFkBRNNMcDUQK2L5u3S9AXNGpImANDiM4JTU8Y6sb
	wguhFFi1WESV9vnWJMbONlYw+gOHdze5LfcOs4a99MXgKHh4dxUjV4G6LwVMM5Z+yQES9HsuHCc
	RcHd4Ohv0ANpZC201wNilTDHpJ31wLZh6tpksAuIdZPa7aXwevIxKkgMXIj3ZrGj1bhbfygbU08
	n7oxx2lMa8lO3ZLnt3b2FJguGN/E8hz3uyo7XD5Le9plPLmsDqFFdxF2BTmnkSLUnA0gnsxYJRT
	hk5pcbp4eNrmKkq29s8EOTKr1nmOEtsXl+oa9WurNly2FKHDrZ3yxmpjOcDwNA1doZXdQCC/eJS
	xrbws0S0S9omOXOYE4GGGH6UKIQ==
X-Google-Smtp-Source: AGHT+IGLgxdTIlzHs7JaFpku8ceuQrPftbNjrc1l7HlbaXYmuJDrccDuH2O1OVWpwHgXuFJgjQprQQ==
X-Received: by 2002:a17:907:3d90:b0:ad8:adea:4b15 with SMTP id a640c23a62f3a-adea945fc49mr220539866b.48.1749719322553;
        Thu, 12 Jun 2025 02:08:42 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.42.38])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adead4cf274sm99933366b.31.2025.06.12.02.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:08:42 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Thu, 12 Jun 2025 11:07:55 +0200
Message-ID: <20250612090823.2519183-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
References: <20250612090823.2519183-1-dario.binacchi@amarulasolutions.com>
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

