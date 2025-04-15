Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90D3221FDC;
	Tue, 15 Apr 2025 17:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744737674; cv=none; b=g52dLqIAzw9tNIR0zmy7vpgAekdq0xRlP0S8lB3OmvyZWdJ+ByMIjq8uvy67lxF9ECg/U7r6AF3lFvDl7EgcEvpPQ8orsM+AEkUfq+Hu3OHaVluto6ansDtSwk3UQQK5+ZVCsh2ozR6BGNHVKJ33DNdOh72L0lJP17xlvY/ie9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744737674; c=relaxed/simple;
	bh=NfgaXQBvNUUvr0jFlV9J8eVtkLOh24tR5qYNGiYdAo8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fzpnmsHT3MiVxvjvwcJBl2yjGODBEGRubWlUSyOe0IaRPJdt6UFLPvy0qCt5bvuo6j+y5kubBk4DdFDUY8yTgIu0iKbDqpaTU1mrIP+y9MQJWjTZ4O1O+/oE+QFnCtUiUAD3re/ugfGwtfZzxASgW7doJxItkVrR0dme9QfsQzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SfsYktNR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SfsYktNR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a823036so58390905e9.0;
        Tue, 15 Apr 2025 10:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744737671; x=1745342471; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HBQF3LhiaELkhAhvThHHQLxtoJjXQ7QMmkLPCh9kTRw=;
        b=SfsYktNR7zqS1hNBIG5CpkneWeMix26k+Au8F8SPeBj9jvHWqohvOedqPa0LR6RXh/
         bkpe3rlWgRiRHsCtFb/kwdUfXZX64yhd3FwxKQp4SEiDhOgz6e/xOxsH8bSnFjBaTUpc
         0C7GGlQ0HlWO+//RW5CuBfiWFmSZl7OGVtvYRHhvFN81igd8geEx2r2/R/No/iKBNxe6
         HUSCkUDaVyUu8sywLPp51ZNpo73bVdYDsnrKpjXR++QxncKSF7H1Uv6EiuOmORY/9iwO
         GX5Pa7oS6l2umf4QDy/l8Pva/pHips9eppj/qE7cexETg0kKDSiLDgb/cAw76c3T2PhD
         e26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744737671; x=1745342471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HBQF3LhiaELkhAhvThHHQLxtoJjXQ7QMmkLPCh9kTRw=;
        b=f2IEoiI38zAizX200TNlhXAdjS54z6Ol10DL+KRRQk/9LNqEATPAnm0FzHa3atzM0F
         LyrBfNQfJjLxdXFSJh/fbNmtBafXaCjxD5kYC6M/+qtzxoxUzCP7Dh8Y3l0wAD0g5hRs
         vK961Y3hFUVtC3sdTNWnEajFjfbMzvtaEhAfy3nqyX8gbSKxAiDvwXJO7TSb44FsE5SU
         ju36tVay+ZM8t0xxapMeHgBTJU5j2gl3thLCeBkQIxGIc5IGxutkQUhg+mUndpsCXNa0
         vaueFISPyJyxO/WUWNRlMzw6TXgjp8e4hsOw2QcQkdI22V9GurUXcYFYMMcgj4hZREIQ
         ZLvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgbfhvD0ixXK0xKSCNmAzdUKmlojrU8En1/RgwiMvbLpMD8B4oQu24NBwurmna22rKC1pd9G/8GNsP@vger.kernel.org, AJvYcCVGr35sC4Kfydq0+ue00ojVJMYszRtTyCCFnVeiFitN+JVDK1XpUZMzjm9/ScFgduCoDMRKpilJI99e4MfY@vger.kernel.org
X-Gm-Message-State: AOJu0YyTH0UFyvmlz4qZ+Cjx+IWqMD0mn+8QpbBPNUR/fXI2MWkujM2H
	RYnHYKeWu7YsM3oXE0pwlMxxMrBxSZ3JxTtcPnAnWhFcFE3rkYiv
X-Gm-Gg: ASbGncuFMiyQtFgOZs0ySDkX7mkRxcdsZm8w4P+m//5Ev6TGssSgqi+nvWELp+DUcQV
	u1KXxInRaWGZv2jd53i/+Gip5eyjHZtzXtCxlrt/yWlVNFIMDN+Lmvig+PltVh24xc28v5KRTqN
	f20KR4HNexlcb6lgcHmtQPW4W48To0EO0qdeBDlp01LUpRZ+f14Ah3WQIhHSQJyLPzRx3zGKiBE
	1pcC8Shm4V2RSTSuTYgkC+NZ+ojejGWtdlcLZafiPURPcowLlOndCk3+GlZhzbwE68rXsCjbC4W
	gu9wrZHeQW3XLU5kuDPGiTELDCRi1Eg+v9Q4LExzL8lAffJysttIAAMTRVLeuZW3MFxRQh1Fz5n
	6xgI=
X-Google-Smtp-Source: AGHT+IHmlSKDjijdhVP4MsrrIOmDn69e4RJTHJc1yap6d2BaTmoYqDqW9yK+cYJfmW31Obrp3rSSKA==
X-Received: by 2002:a05:6000:4310:b0:39c:268b:8b66 with SMTP id ffacd0b85a97d-39ee27632c2mr255465f8f.43.1744737671070;
        Tue, 15 Apr 2025 10:21:11 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.157])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14987714f8f.16.2025.04.15.10.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 10:21:10 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue, 15 Apr 2025 13:19:19 -0400
Message-Id: <20250415171919.5623-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
References: <20250415171919.5623-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..d0d24fe92c3e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,11 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5
+				IMX8MP_AIPSTZ_HIFI4
+				IMX8MP_AIPSTZ_MASTER
+				(IMX8MP_AIPSTZ_MPL | IMX8MP_AIPSTZ_MTW | IMX8MP_AIPSTZ_MTR)
+			>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

