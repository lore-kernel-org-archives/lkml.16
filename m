Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89A37160;
	Tue,  1 Apr 2025 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743522786; cv=none; b=MornddQ7Y2tbr8FAs2hUuJ6NhLfiZwF/gp6Bevz5dPO3DcchiwySWwoWLZDow8qzkJ7MofURN+CGvfNWQhExIpwku9RhXtnjR6iyCeM9sbmzugub3JmV2Ahf2quJ1+1Rp7wcKK1YEUO9ELloguSiSDB1iQwjX9+bjKG5GXF/Apk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743522786; c=relaxed/simple;
	bh=q8Uj41nPJAfO4cLbFQrSRc9hjdT/n0weZ8jWM/s+Oa4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=i+F3725rZCP/rWsC8OmbxboySwOCq0gjSzJScXhU/wU5dok57DpnSVInKrnG2nPu/0YyIrluhsxrUpevewKRhKrXrQ7x0zTIs7PV/UDlypj8TQDEe8DSHvTREaHsL1FqHEaquurhU2HXo5xR0rcHuZ1RM4WllhMhWqv5t30BsUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TM+GXwYn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TM+GXwYn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394036c0efso39129855e9.2;
        Tue, 01 Apr 2025 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743522783; x=1744127583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kITiRQQrnD33DOiE+C+JBAjD6rrVk5TPx/ro5x/mJl0=;
        b=TM+GXwYndTuEMVCE4xPMq3dDsfkuE0Mv/m+ZQhx4imU1npgr2/usjok02Hao515Q1y
         hj/3AIJl3Vk2BYQGj2zgMjDKtl/88qCEM8O4DEkpW7iiihh7jzbVyMFL+ToBOd40SME2
         FVquOyflTwoWMIlEEawFxTgf1pJ1YqowcJLraIj1I0xqxtF8fgLhUDJ9KGxndvLW/cmf
         /BaFs3bupParAXvUVZhQgVbETRfENXJfHrnpjuDO+DZnYO6iyuqNka6X5UbCyp9Y0cBD
         HwmR0phRndtVNojjNKnaKiRRmkXgl1ZsbrOpssAO1fBR8BLd3cNxWp8JP5OOE/cy3oZ5
         HAbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743522783; x=1744127583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kITiRQQrnD33DOiE+C+JBAjD6rrVk5TPx/ro5x/mJl0=;
        b=bJhfvet1lN/UtCJLJkgfHGLAoVSgqHmg8r6dvRRuctSjQkmVo910N9hDpgkCaQhnMs
         P3oSAUzw+eIX2RAry1Tlyiw8FPAluipZ7Hlc8aPEcVu3jwNrJLHC27neI0g61T0L8kUe
         20EB28jqeLhXFmNmogZc3vMIHs7W2uwlaph/PExxZ6mgrkkNQjOFUZHHGKeIITSXBsHF
         3REZ+6y58OrV61ZlQzx4VLWy5JXS9+ehT0mfOjr4DU0jdI35bTnhZogdZFcqS4mny7zT
         rNY09g35BJGBxbdinu5Nf3NFFqmb0KTML2j2lnPPSxjyCZqHUl5aVkdOLBuPg0LsaFZw
         Vv8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVz0Xi8sXBO/Pttg9kCpb/+frkuk7CW2J4+rho1g0Ol6hi/ZKBNhBUd9E0uDuMIqn5cHYoPA4/tslfidpBo@vger.kernel.org, AJvYcCWNymcBXdy7z0D1VmszmLmHKPOtoLiTWx+4IpXIw+ONgD8wWmWyREfU3rP5+PyTTvl0mWMDnR0b8jcK@vger.kernel.org
X-Gm-Message-State: AOJu0YzioyXFZDSYfi5/ZZRrsiUf5A3tS/jhjVLj4bU0OsGxYPoODbBx
	xqwPPGGtYJ7V58/o/pOsTI28t556dFUsiSL3tYapSolFIW8Qj772tcsLi8JG
X-Gm-Gg: ASbGnctkzOZIzgEyiYZrnVmhD5GxkSpvTq/LemxE5GPadhrF7BWKtPEaadmzuXAhfmK
	Uke3ZLbtuXMfh91bgbr6sDottHKWK/tA0nU24MbcaW2wUZDE8/3Yevv5os7ymvk/oY7C2+FnqQ4
	7WYJMeD80GBeVP8JR1AerjiBvxfXls7jN9qIoVMFJ7ozl86XqUg0yqtR2Hchi0y/RutYqO6aYeu
	2Tt4gTxTa2vMj70tzlQ6Yf1iCvyuPDC6DTj5wF/+P+XLI+7qE97/HC8OWPZp/AcbHVpEhAgn47C
	1jV0QUjueu0L8EBU/HP297JeVgkAW3WpRWitZ3KWdh0j3e09LbtO5nXD66El5WwhnrQiXDW/vIa
	hX5vZybI=
X-Google-Smtp-Source: AGHT+IE+beBF8OgJ1mJr6OkCFfzKqGsQqpmFHMqJYTzDl+77IV2PROx2yo8oGc/N6za9BEbNxq9Krw==
X-Received: by 2002:a05:600c:4e12:b0:43d:db5:7af8 with SMTP id 5b1f17b1804b1-43db628c48bmr110750555e9.21.1743522782395;
        Tue, 01 Apr 2025 08:53:02 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b66363fsm14938762f8f.36.2025.04.01.08.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 08:53:02 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8qxp: shrink dsp reserved memory
Date: Tue,  1 Apr 2025 11:52:44 -0400
Message-Id: <20250401155244.46239-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Shrink the size of the memory reserved for the dsp to half of its original
size to avoid an overlap with the 'dsp_vdev0vring0' memory region. 16MB of
reserved memory should be enough anyways.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 05138326f0a5..a65c5a2c4a81 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -185,7 +185,7 @@ decoder_rpc: decoder-rpc@92000000 {
 		};
 
 		dsp_reserved: dsp@92400000 {
-			reg = <0 0x92400000 0 0x2000000>;
+			reg = <0 0x92400000 0 0x1000000>;
 			no-map;
 			status = "disabled";
 		};
-- 
2.34.1

