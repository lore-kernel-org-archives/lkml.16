Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4069822A7FD
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 08:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750406795; cv=none; b=o0lM3jVHZISXM0fa2J8D7UIvanXWXeVV+5oWVPEaCr5XpjPuK0g/WfGpVXqfxbnpWiCxTBY93YmzURrAhwZaI6h7GyQtxl1/PmKuf9TvBjBwMyig8fRvACA1fDfc/JWqOmD4f7fl7supdNpzxhYZMERZ8W3e2BGybo9cGtiCtyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750406795; c=relaxed/simple;
	bh=2GMl15IcDzSLUs4dQKt3zl70qRcqD67Weh9prpPTYRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ARVkMMfYpzDkxGDd9mJjccSf3Qp2VtTWd+IiBa8CsiYL1fOEMfal6zgi6tqXNLjWNyJhfAtGZnSG3RPqfyVSqE1x0MFFDtQTvXOE0iSzfHWyR1UBcJarBHKzCxDZ3Yct9edDA7wt4UVC3m+S5eYnEj3h6r5bgwD6K+A/JFU38gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MLZARYUw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MLZARYUw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4535fbe0299so7728825e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 01:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1750406792; x=1751011592; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=glG83oErz5ct/gt3NB4AwDuDkSFMT8IuwCqf35S7MTQ=;
        b=MLZARYUwTEMR4EqDk0mgGj/5aQ+0hvOm0QFdCJnA3LCk8cYLi4Tij3KrYqyNM3sNfC
         8lUP5CR73VSwbfMVC+z2OfnYJlKZ9jG6cpJwH3WVyxo8cIqjwCoSIl5I4O7qtq/Irey3
         v1uruKYw+yTwkGUKKMis4YNszMPZ7VfQwhdSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750406792; x=1751011592;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glG83oErz5ct/gt3NB4AwDuDkSFMT8IuwCqf35S7MTQ=;
        b=H59eP03RDnfNx2DdEUcaIcr+BU57Mz4j54wCfgeU8lE+QRxXha8OVfeXD3nOM8j0Hj
         2a9Iow8h8lYEeepukNxA27RvV36E3je4lSBgGfJf2Tx2bm+BwlSgB2f1xdC7t0KuBhxp
         SfBtj1TTOrX8faP3VJ4WSJJws5ywtMj1JR7QGBVyzWWBIbJBewUIiad182eV6mCM6Zt7
         IykaZgMOxOMyiRYjaYG+UI77tg8v6nxRDQjKT4EbtdLFcJ3/EFIhXAmhaVhDzm3gcGOz
         fJ0+DMXqZ6QW6iz2mQ8elepkLUIhW5NrHtJxGDBMw7d5qTe8Ux8mXJ9YpAqdLy8X1PLi
         V4Nw==
X-Gm-Message-State: AOJu0Yy/OU4E7cTSqlB09sGLMrT3FWuz2S76B9im61LVjkZDaoMWoX+Z
	G+2tilu4CBI+2W2a2UPb+ZqlTITbV6VvuemjWprDR6jgk6QgDUN3WyLgh1SlXrB9DVPdQjxEl6s
	RH8dh
X-Gm-Gg: ASbGncsJEvka2Uj+KNrONHaLCpmlFVWreX/ITyGHPfrPuLbTfK4dxus0qCPgT4LJRAc
	qKaOz/QqPdGu8x5HnuoFDDuTKCE65WKS/z3rizh1p0Q41X3LAA2BKbZ7eRbk4XqG93r3MNxhtK1
	drbmPiqDCVPvvb1xtNY4kx3bWqAkh86zGEYQLJvnbWuF54eZXLDdIOdu9zdbNaBmak84AJEjMXA
	Xf8VKQsNXfgMHCWWWQduQ+rnbwt4DMoVxrU++CPmO+xktvubvyMST3aYXFSWWXrenk1Brgtahz3
	2jWSRG6fHVtMM2qdyGJbdwZTJpwOLmIimBm9lA5Z04wVRfZwr9fYIli6KnTPusc1HeN1y/1fMF9
	bSZyfS5/9JNylF4AYES7dYt+xXHpzfW4BZr7o4rDD314g8qd0ucW0YPDqg5HD8oE=
X-Google-Smtp-Source: AGHT+IEvnp0x9nPi4w5DLvc1NncQW3DwrucsQPHAIzJHhVTF2FdHwkuDd/b3JKHhFP9x5StRdmgfuA==
X-Received: by 2002:a05:600c:5494:b0:450:cd50:3c64 with SMTP id 5b1f17b1804b1-45365a00582mr15702545e9.31.1750406792385;
        Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.43.224])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535ebd02basm50137905e9.39.2025.06.20.01.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 01:06:32 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 1/5] ARM: dts: imx28: add pwm7 muxing options
Date: Fri, 20 Jun 2025 10:06:17 +0200
Message-ID: <20250620080626.3580397-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
References: <20250620080626.3580397-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add alternative pinmuxing for pwm7.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>

---

(no changes since v5)

Changes in v5:
- Add Reviewed-by tag of Frank Li

Changes in v3:
- Add commit body

 arch/arm/boot/dts/nxp/mxs/imx28.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index bbea8b77386f..ece46d0e7c7f 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -755,6 +755,16 @@ MX28_PAD_PWM4__PWM_4
 					fsl,pull-up = <MXS_PULL_DISABLE>;
 				};
 
+				pwm7_pins_a: pwm7@0 {
+					reg = <0>;
+					fsl,pinmux-ids = <
+						MX28_PAD_SAIF1_SDATA0__PWM_7
+					>;
+					fsl,drive-strength = <MXS_DRIVE_4mA>;
+					fsl,voltage = <MXS_VOLTAGE_HIGH>;
+					fsl,pull-up = <MXS_PULL_DISABLE>;
+				};
+
 				lcdif_24bit_pins_a: lcdif-24bit@0 {
 					reg = <0>;
 					fsl,pinmux-ids = <
-- 
2.43.0

