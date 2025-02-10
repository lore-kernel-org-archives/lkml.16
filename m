Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD82723E226
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739199704; cv=none; b=NI4vn0eZvaYufHCnjGbjvMyxc280MheCfRijF/5ORdKp+Q7t6zK2JSKaOiyjCBw3wPKB/9shwPnrSRW8e01nSmiFcvt11/uuN9jBBdVQSUzk6anUH+mubltmwdVwQWPVnkvF9vHB9jBFoWo6VEcU01P7C8G96klWvUQkDSaRlH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739199704; c=relaxed/simple;
	bh=ra186LwKS8pvRQ+ulkF1Ob/abglWAThWB5JzaYpqjE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M1OoD9ClrRnNgLWdeQUFQonNvd+pE0mylMQAFqnimwB97H9h40w/rqXoitlyuv3w8GQeCVVnLEGdOC7Vxvf2AJwrc+09TLexx8fO7nPsX8VYJIvEcABDoEiYv7iZz1Um809djH1Xtpt109zjtPExXLdZdAsyLyoa/dmBztrdcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y2FluRXZ; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y2FluRXZ"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ab7d7f0a2cfso12946666b.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199701; x=1739804501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XDwysfrxYdnvpIdJT7USDkw1h39r5hFh2YykRChg6Kc=;
        b=y2FluRXZpalIasDu37YaPRWxbZbxwoBOfegKmrERc6D/uS+n2GvH4Eok2Y8tO5qN1h
         e1F6mjDTbUzA6Xvu3qC1nzGTVCJHyJNcLRX8jxSGLZM5G7aH2HPXjFXPCrsuO7GcZO7L
         4CtshYEf8I0kHP3Wgt0CMqBDU175aK1xz2Ipx1oMzAdu/2H8iqodr8KznJY4MNQrLKng
         rNEquzYJPlDNBJf9CPevWrU08ByTDc2kNIOkadqlJ/7j8act7OYFiFVCULaI4shvf0Lw
         uVKas3iYUBYxh0OpmRXwmiRnCU/EpkS9R1Rv9hysdhZDF/21JkYsyGJMHnU5Swc3DeCZ
         U36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199701; x=1739804501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XDwysfrxYdnvpIdJT7USDkw1h39r5hFh2YykRChg6Kc=;
        b=VQd2jOMpqrJiksrL9m+ys9yT1tkawcZU0Am4FaBDkMKT2iMyAwJeabYKZF1zXgxU8D
         qyRdgNiz6a36Lr6KTO8vSo4tZUfqBytNczXn+7wGJZKsnDXGrR0gAiZY8p8AOVYXPOUA
         QxorwltDmE7uMyvWORjTi+r1bZW6R/u/lvWzCFkbZ5h46jfd16E/aVIEMudRKdWCwnr5
         JgC5hmIXf4EVZib4SgbBR9409gW5uFvpCG3YWYYgoFO0FstL0i60z+n6BdVOyCYW/97S
         RHb6xbMej1oN16sGL1kyy3+nd5v0aBMEOTd2oWH3D/IOzIxNXnPH565jYJ1sV6/+9HSC
         /9dA==
X-Gm-Message-State: AOJu0YwlostrWg3to5A8EUOhHDVDVybrSKkLaoB7fzB906bfIej6N+MK
	6/k4ouuD97HgxzXE4ITccCcHeLCzhIxmTR8JvQUyViaqcXMIGojzUg0TZNwcIg0=
X-Gm-Gg: ASbGncttSBaj+MgVw+mDvsEU1HNg9seYsI8WOnYqxohsbvje7LUizl1q5Wo+GukRxkW
	cP4hIiBmCBCDAwDlXR3TT/kY+KhYMYU7A0gMDoxFoCcIYESIPHZZUaRzjrNRqsHPUpi+F27nv3x
	YDK/ATXToX/sPJn2z0BPSubohzZyOB/ioAK04qk+9Dw45b4gAlgcUllr+S5g7TB1Xc7FW0RaDf1
	zxliQx6Tv8BSf3Sr6X7TNzkEatXl5Q37XStocU5hmAZL7aebRs0uTTRwatSPUanaX+hGFnTXedt
	TlGMLVe9ddj5ROSpZFSjpWAoTYBM
X-Google-Smtp-Source: AGHT+IGGApn1+B5eCaOcf/7nnDOcbipSWzqajWhFXoUzR2omWufSb2FAoBNmw4R/1Cmqf9KlenerKQ==
X-Received: by 2002:a17:907:9411:b0:ab7:b84c:361 with SMTP id a640c23a62f3a-ab7b84c05e6mr572978266b.25.1739199700513;
        Mon, 10 Feb 2025 07:01:40 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:40 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 6/6] arm64: dts: meson-gx: enable audin on odroidc2 platform
Date: Mon, 10 Feb 2025 16:01:29 +0100
Message-Id: <20250210150129.40248-7-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit adds the TODDR #0 module to the Odroid-C2 platform.

Note: this not enough to be able to start recording data. An addiditional
dai-link node should be added with a reference to the external codec
being used. For example here's what should be added when an NXP SGTL5000
is used:

		dai-link-4 {
			sound-dai = <&audin CPU_I2S_DECODER>;
			dai-format = "i2s";
			mclk-fs = <256>;

			codec-0 {
				sound-dai = <&sgtl5000>;
			};
		};

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 959bd8d77a82..a83373739019 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -10,6 +10,7 @@
 #include "meson-gxbb.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/sound/meson-aiu.h>
+#include <dt-bindings/sound/meson-audin.h>
 
 / {
 	compatible = "hardkernel,odroid-c2", "amlogic,meson-gxbb";
@@ -210,6 +211,10 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&audin CPU_AUDIN_TODDR_0>;
+		};
 	};
 };
 
@@ -217,6 +222,10 @@ &aiu {
 	status = "okay";
 };
 
+&audin {
+	status = "okay";
+};
+
 &cec_AO {
 	status = "okay";
 	pinctrl-0 = <&ao_cec_pins>;
-- 
2.39.5

