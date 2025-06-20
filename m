Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854DA242910
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750408082; cv=none; b=Vm7Vd6Uzma5M7o4tDQKwOxpPcIBq4PC0i9JfgmKfgdbIuNoL6aiSxhUJZ+bcj9kOoGMMCrl+iMe6riX2u1rOhYuTu2dAOnpqTlVIA8SAv6kx49j+/drpAm/ltAabI7GB+jQw/LW17C7MO50TxB2Lav611XRRUrVEdDZHGhmC1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750408082; c=relaxed/simple;
	bh=DOJVEz79hyx4B5UpuGMdFTop/BzR1Uh0haptnlOJ+7w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e3ThDgANGfCQBB5n8gTZSzWYUrhL6f9wgNmB7i0u5yXYQgnKChj1qXmMSL7xZ3qI5ZSnKBoLOJk1rYaorYT9I+MvfA5Qm4BaMxdYfh+XgB6Ki+yNp2MvX39JYb8Pz8tOEsx76kWCXqYVMyPc8K/BKsU8nsPAZPTTCn5J8zOrMlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bGttUgX/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bGttUgX/"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4530921461aso13111115e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750408079; x=1751012879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=bGttUgX/vMQ3QltshW4thoEMLDHPFuQRDZ2zuCiHPx83uRIbSlMuB+mtAqF7uUPBFQ
         lbrxp6Vp/jm7wtNUCeKmfGJFDL8F6Lo6z1NRXrM2c1+YIAcTQ3t50KUI7PLQxRv468hL
         5kB3LGCP1xL3IMZOH1VeIzH52qodALMLrlrqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408079; x=1751012879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xtWnccZdwmekAeiqyQYk4mGsFpJfFAArYZd8KxoueRo=;
        b=Q7SNiwnv4RnDDMR3bCYcSHIjD0FQ7Hw4QBdpaTj3f/3cm0BLLf08eCAP5aNnp6CpjT
         VBxPvV3IhlliokXdWiqKS/pb740mYJWBnwqNRhQiLhgS9mWBSJW9ura8GsAsb2UwtCMy
         RWkGcrKXOlWydggvpQL3qWDFt0v/sqSWZapZg5YwORNns4NnSrjM/7Zj1g2Fc5Nj5Y/f
         +pr/e4CBEe3bvYNLBzy5nQl9IRVH0n2tLc35QOd46fhVIxzLdfkBmzIxZ7fnj6jLZU7G
         qHXdKGk6dEXzqlQXFNLiP0JJ8sWSDLwbmsIzJtY7WXN0Ygq3VifjmuWX7juMhWP+vfWo
         ILOw==
X-Gm-Message-State: AOJu0YxN6HBpzwBsVMOM5c8C44GGZUmeXYkV7xmkh3rR/vTh06b6q+ou
	fSz1O2VY5WItrjCPwngapeqi7E6Ghwo8pmfDcImYTqhCnyqqWAYfQS1HYmUOLGx4IQtD/T1YxSE
	C25Ep
X-Gm-Gg: ASbGncs0hrC8p0D8wgmGGwvqUqSyhqTMX0c58E10Z3di8/4dsPtdG8tXnahOCgM53I0
	imGFsqLfzGm/8pdk4mTksonMQRFHpJ1AtZSiLrhKvWPrWFZpXnTaKNoUzI9hKoBekh+9kuK4WhZ
	udWbtIiB55LcDr9DTRDajzBNwZJl7j5/fTZ/bYjW8NeqmZKa838+Jt5BSem6JXTIRJ8rjgmBvfS
	3DPMHyNBLOkaNNjnTTe497qJr5ZOsD/8YyRrC1RMrm51TgZkaxCE450w2GR7TXuvBhLNrmQecKi
	WtWY6vfjw/IadUg1EkKHg9w5vUB5O636Pcz29SRm9kihANH1C0KwpTqHply2eFxMKNlPdTmDy1U
	BQpyKkvxAxjuCS+sCr6bxG+xQbfaCntcUTxMu9h9dDvc8dTn/eiML
X-Google-Smtp-Source: AGHT+IEZqlrVkb8XWCDX/j/Hz1XI4PFQ6/Jwg9k4S2zDKT2iPFzlG39sL1OWvC8PeJquwOivITL15Q==
X-Received: by 2002:a05:600c:4f03:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-453653a337dmr16663085e9.14.1750408078875;
        Fri, 20 Jun 2025 01:27:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e9844a9sm52274285e9.12.2025.06.20.01.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:27:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Matteo Lisi <matteo.lisi@engicam.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Ard Biesheuvel <ardb@kernel.org>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v4 10/10] ARM: imx_v6_v7_defconfig: select CONFIG_USB_HSIC_USB3503
Date: Fri, 20 Jun 2025 10:27:14 +0200
Message-ID: <20250620082736.3582691-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
References: <20250620082736.3582691-1-dario.binacchi@amarulasolutions.com>
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

