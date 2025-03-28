Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E714B21ADAE
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743163986; cv=none; b=rOfGek0DZDlsN65pTRTm7wCyuCh+Uum9X5u59OdaAqP/NglhOcdVftbbgRqrOZG2q9hQ6Loa+5UKSYcGL2xPpeAA2X13EhaPu4qrjWbqPhP9JZaulDuANV7OiBfzUuXt82MTKioTTZQjHo/y6dyKI+UHzyT9LXBD7gnb6q37wTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743163986; c=relaxed/simple;
	bh=PITk7ZepSP3vP9TSRahatxSR2909Bg60eq2pEC3BMkc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LXV1JFHEzbbE2WMnDH4yaad8Vm4NqX79mre0y02OEaOBNJuCvVkVAty1GMPnhLGdyqBtA/VSi4NKGplo4AEoB/7m3tNcuuvZztJUah1hJX7ADJHT0WfhACDsyTC7e+EVZ75YsUXvnDgCDtZeEjpz3wJ0U9kFmiCcsY3QexJxg+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lmajczak.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RqokCIY3; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lmajczak.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RqokCIY3"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5edcac160b6so400884a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743163983; x=1743768783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=;
        b=RqokCIY388R9SUMEFfeBm+L+YIKqcuRxlJAl8wIcBIkDIL56CSe382ENsun6bdEa9k
         YhvrZhx5qliGlbMcH2W6bahX4vrd2wjSwjAuDkqDdZcmp8FwNr+/s7sbwej8narnousQ
         QKR/DBe6akvjFkzPkBFm9sg9dENtzv76svMXR3M92iZF3RFjUoYgdnNdiZbHrAugLvoC
         kuXp5avYzU4bjtCp+K8hGLZAV8sXpoHrUP9H1ECvIluk6LuvGow1a6Yg9zkrwBT0EIyh
         7VJw6EF6poxqPn2N6BFMhzkqwCMSQNdEnp6klXN2WRC1veeJZA9IdKTDzWr1tkyN50ZS
         BzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743163983; x=1743768783;
        h=content-transfer-encoding:cc:to:from:subject:message-id
         :mime-version:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o8yZxDWKVuGdJufLroOp7bVTav6VTJyysxYI8wso148=;
        b=fUQopWt50PGQVmDaUgLcgk5SceNbKL95mYqlW7z8cguqhRHBHYrp1YcmK0rLLHql2A
         8m8/yJby3xU/+34WwwajaCOfe1RydbuhJUtvDdclAYVYnZyGEB4Tf7Z7hrONwEXyBskP
         +/0Y5fLgeD06P0FAbZyrmbRW2tQYaSX7FmEeEB0eCFL2nK11BWmx+CxqX4M1yiKchinj
         F8Qnmmc16sd1TuMNXXtgWvtwlzz/tEqhRqQJ1Ipyz49zIZ9edel23tBvgfKalQxNSNQK
         LXXD7oQQBhyy6VC/T4I25RPm5A15FTV6C8ZNwmxc05y590RdXpAxMVyObHgiYTqoMio+
         5ieA==
X-Forwarded-Encrypted: i=1; AJvYcCWkqqnHOeNFdCeXlOre4Y+TlI67Rjfcfdunn+RoVHSQc8J0mENcLl/RD41HOV0huDl1cyUngkAcsThxpc8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr6KPhEZhnv+qcbS4qvVDXfBvYLWpglPS7yQ8c8+bz7BJkMRcI
	ZlznzsMmRLGTaruUpFe+C8arQChrsCV8jB8QrL27mfoWlIiUS9zrJz2B1mRZ5YtY/typA/CWH5G
	a6vlvhBF7OQ==
X-Google-Smtp-Source: AGHT+IH+URE2JNYwtr+vzakMr5FIwnaziOhvei4JU7ZPSwNs2+pFJiuJvdGrEEam/bZoSIkKiBoQnrek1y96ng==
X-Received: from edrc15.prod.google.com ([2002:aa7:d60f:0:b0:5e6:510c:9f00])
 (user=lmajczak job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:34d4:b0:5ec:8ef1:35c4 with SMTP id 4fb4d7f45d1cf-5ed8e4957d7mr7600952a12.13.1743163983409;
 Fri, 28 Mar 2025 05:13:03 -0700 (PDT)
Date: Fri, 28 Mar 2025 12:13:00 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
Message-ID: <20250328121300.2612942-1-lmajczak@google.com>
Subject: [PATCH] arm64: dts: mediatek: mt8186: starmie: Fix external display
From: "=?UTF-8?q?=C5=81ukasz=20Majczak?=" <lmajczak@google.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"=?UTF-8?q?=C5=81ukasz=20Majczak?=" <lmajczak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The dpi-default-pins overwrittes the same called node, defined in
mt8186-corsola.dtsi with the wrong set of pins, so remove
it from mt8186-corsola-starmie.dtsi as the first one is correct and
sufficient.
In addition, remove dpi-func-pins node from mt8186-corsola-starmie.dtsi,
as it is not used anywhere and also defines the same set of pins as
dpi-default-pins node already present in mt8186-corsola.dtsi.

Verifeid above with Corsola/Starmie device, by connecting external screen
with usb-c -> hdmi adapter.

Signed-off-by: =C5=81ukasz Majczak <lmajczak@google.com>
---
 .../dts/mediatek/mt8186-corsola-starmie.dtsi  | 45 -------------------
 1 file changed, 45 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
index 5ea8bdc00e81..a8e79c2791ba 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
@@ -375,51 +375,6 @@ &pio {
 			  "TP",
 			  "TP";
=20
-	dpi_default_pins: dpi-default-pins {
-		pins-cmd-dat {
-			pinmux =3D <PINMUX_GPIO103__FUNC_GPIO103>,
-				 <PINMUX_GPIO104__FUNC_GPIO104>,
-				 <PINMUX_GPIO105__FUNC_GPIO105>,
-				 <PINMUX_GPIO106__FUNC_GPIO106>,
-				 <PINMUX_GPIO107__FUNC_GPIO107>,
-				 <PINMUX_GPIO108__FUNC_GPIO108>,
-				 <PINMUX_GPIO109__FUNC_GPIO109>,
-				 <PINMUX_GPIO110__FUNC_GPIO110>,
-				 <PINMUX_GPIO111__FUNC_GPIO111>,
-				 <PINMUX_GPIO112__FUNC_GPIO112>,
-				 <PINMUX_GPIO113__FUNC_GPIO113>,
-				 <PINMUX_GPIO114__FUNC_GPIO114>,
-				 <PINMUX_GPIO101__FUNC_GPIO101>,
-				 <PINMUX_GPIO100__FUNC_GPIO100>,
-				 <PINMUX_GPIO102__FUNC_GPIO102>,
-				 <PINMUX_GPIO99__FUNC_GPIO99>;
-			drive-strength =3D <10>;
-			output-low;
-		};
-	};
-
-	dpi_func_pins: dpi-func-pins {
-		pins-cmd-dat {
-			pinmux =3D <PINMUX_GPIO103__FUNC_DPI_DATA0>,
-				 <PINMUX_GPIO104__FUNC_DPI_DATA1>,
-				 <PINMUX_GPIO105__FUNC_DPI_DATA2>,
-				 <PINMUX_GPIO106__FUNC_DPI_DATA3>,
-				 <PINMUX_GPIO107__FUNC_DPI_DATA4>,
-				 <PINMUX_GPIO108__FUNC_DPI_DATA5>,
-				 <PINMUX_GPIO109__FUNC_DPI_DATA6>,
-				 <PINMUX_GPIO110__FUNC_DPI_DATA7>,
-				 <PINMUX_GPIO111__FUNC_DPI_DATA8>,
-				 <PINMUX_GPIO112__FUNC_DPI_DATA9>,
-				 <PINMUX_GPIO113__FUNC_DPI_DATA10>,
-				 <PINMUX_GPIO114__FUNC_DPI_DATA11>,
-				 <PINMUX_GPIO101__FUNC_DPI_HSYNC>,
-				 <PINMUX_GPIO100__FUNC_DPI_VSYNC>,
-				 <PINMUX_GPIO102__FUNC_DPI_DE>,
-				 <PINMUX_GPIO99__FUNC_DPI_PCLK>;
-			drive-strength =3D <10>;
-		};
-	};
-
 	en_pp6000_mipi_disp_150ma_fixed_pins: en_pp6000-mipi-disp-150ma-fixed-pin=
s {
 		pins-en {
 			pinmux =3D <PINMUX_GPIO154__FUNC_GPIO154>;
--=20
2.49.0.472.ge94155a9ec-goog

