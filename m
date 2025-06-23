Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111B24A2D
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750698788; cv=none; b=oAO53aIez4hizch0CfLoY0+PcsmucOvseg9+Bw6++XMwfU9J8p9g/Prkc1LeJGZYELYatVJY6Zrr37ZjLZ/D0IQFCQ93dhtG3zlUpJ/yUp62/1PDQB/S0PpEeGNXEQ1Qs45zsxHeD095ME5xiNpwuGBAk5HMcHmF3tjsD8npTI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750698788; c=relaxed/simple;
	bh=wv9r1Nau37bZDlcKTni8vX3dpCtckh8QUn8ksWrvjzc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=C2G6DVXi5EtDhuvd8qAGHS5ikvkAw64aUgPHK1bpgF5+pycWeZtT2aQuLsD1+JlBm2NgMZQBj4bpndKIpXGhpD9HzqAQpgPRlKTQvFexlOmc17mfb/vKEtWS9LaC2t1tqtB1rBgt+THqR87B3zFboH7JC1i7T4mM81EnSToDKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de; spf=pass smtp.mailfrom=innosonix.de; dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b=XlbTvCNW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innosonix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b="XlbTvCNW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a4eb4dfd8eso630979f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750698783; x=1751303583; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fFVerlv1rup6mF5IH5Ew1KKnD+3iU06ke4X3UNXN3IU=;
        b=XlbTvCNWP9sxrhEyqZdkwkzBAJ5IfMr2HDAC6vLqUiJhCOq6/ggza35dZU8AadHb1M
         O25xSG6UoxE8uHXQhQgPje7q3AyKGrM/F8gZeR3fHIciwXctD7d1xXL3HJGSDTImaxEM
         tJ5Hu1T3mGkeAdvxeUQn3os3VaP402tNrHtBPnz8VpA5ebMlmt+aaCwXvGXrHTvFT1hq
         tQ4wT5bLImPntWE4LTAcVbRZlcGeAC6on6kPEFigEhWpgVHUwtn8CSMYqYM3wg2N1qgz
         Di/V8qzu4CJsHllODDOayJAzzccR8Zr+Cj7ulL842b8L1kmMYvJR1Af3wlitTSl1rC7g
         NoYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750698783; x=1751303583;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fFVerlv1rup6mF5IH5Ew1KKnD+3iU06ke4X3UNXN3IU=;
        b=iqX61k1ApOurpHuA0fvu/wyZJcX3DBkvxWC75IEVKtizacliuyJpV4I0k9huy2H7HE
         pRZ/OZBQ9wayW4/EhRGHG+1QKWIurV3j3iAECYNsbFwvalYmvjSN1JIc+8NX98P+qIfN
         tchD8e8WMfff0cgmTY4Xnxc53nZZWwTMtIHP2oHFucsihG+ujRjBty2DYTpjHa+3x8M9
         SjPkaRRgS2PSo2VcFz9NIPvBBAxxiH9Q6P5jQqVEZjDb3flpV33NbWpqID1PXq+hUPrn
         cac2LiN55nr4qgzWCL3HQj7SzhUXh1jYrt2tOToaxetVsBSWJkO2qlMNQCfRuLkSksrS
         lWEg==
X-Forwarded-Encrypted: i=1; AJvYcCUHYOSOpMBNt5BtKHO8LDtjHuMMWdcwc3KY6hgdWWYLgTquRsaWDAr4cy9IRJbZJFimB92Pk9x5pr+zexo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4zXS+NW+tmioqTq+9GW09SAb49x3fNTm6U2dlRiEOI5Dt9hY0
	seD9PQJd0RS9PfG23u+NuW0jXFAcHmi/vTA6eMwnO2lKxtCh/rzMaKknEr+aXY8aPMpVvCyaO3U
	4aom9BEzEHrofY57r2uitHPMNa/bOHGo+bdUgT54sS+9p1RxvmwICIR9LZP4=
X-Gm-Gg: ASbGncteWECp3wTKSEbORa+zg9hBNdFnWtqYO4xMrkMhohKv00JrX7Y3JdAY5TpE149
	AKB00MkTH2o3JCkTVR10AGaES1cD3Ncp3zg0PadNsLPaQwP25agxLNl7eCPL3jMWpl1GbI69zao
	ZLvBNtefDSk5/zIudUompdwFYhBU/Jha1K+J60efz//SrXCTs5h2DXNMFetwXvXOcnrN4upjI/i
	Ylad2WGgybhxHH4P6BiY7wh5ROCHWBzzIHXVxrVCHNVbeLl6wJ9CvEEQJWjkFVouNwNLRVXEQDz
	14VPDq6aqFa4gmoPYLOV1I8rDv5rzuPmXaIz4JODtf+L51sIflMPpVKcs6gSOAKf/dA=
X-Google-Smtp-Source: AGHT+IErer93kOXokwq6+DGSfC4ugUszBo78NJco3EFwM9G1wiRi3El8E+vg0RKm5OXQE67tFwgtNQ==
X-Received: by 2002:a05:600c:5494:b0:453:590b:d392 with SMTP id 5b1f17b1804b1-453657bf79cmr45941935e9.2.1750698783204;
        Mon, 23 Jun 2025 10:13:03 -0700 (PDT)
Received: from steffen-linux.. ([24.134.20.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm118001245e9.1.2025.06.23.10.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 10:13:02 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 19:09:55 +0200
Message-ID: <20250623171003.1875027-1-steffen@innosonix.de>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The commit "13bcd440f2ff nvmem: core: verify cell's raw_len" caused an
extension of the "mac-address" cell from 6 to 8 bytes due to word_size
of 4 bytes.

Thus, the required byte swap for the mac-address of the full buffer length,
caused an trucation of the read mac-address.
From the original address 70:B3:D5:14:E9:0E to 00:00:70:B3:D5:14

After swapping only the first 6 bytes, the mac-address is correctly passed
to the upper layers.

Fixes: 13bcd440f2ff ("nvmem: core: verify cell's raw_len")
Cc: stable@vger.kernel.org
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
---
v3:
- replace magic number 6 with ETH_ALEN
- Fix misleading indentation and properly group 'mac-address' statements
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 6 +++++-
 drivers/nvmem/imx-ocotp.c     | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..9ef01c91dfa6 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -12,6 +12,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/if_ether.h>	/* ETH_ALEN */
=20
 enum fuse_type {
 	FUSE_FSB =3D BIT(0),
@@ -118,9 +119,12 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		if (bytes > ETH_ALEN)
+			bytes =3D ETH_ALEN;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..1343cafc37cc 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
+#include <linux/if_ether.h>	/* ETH_ALEN */
=20
 #define IMX_OCOTP_OFFSET_B0W0		0x400 /* Offset from base address of the
 					       * OTP Bank0 Word0
@@ -227,9 +228,12 @@ static int imx_ocotp_cell_pp(void *context, const char=
 *id, int index,
 	int i;
=20
 	/* Deal with some post processing of nvmem cell data */
-	if (id && !strcmp(id, "mac-address"))
+	if (id && !strcmp(id, "mac-address")) {
+		if (bytes > ETH_ALEN)
+			bytes =3D ETH_ALEN;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
+	}
=20
 	return 0;
 }
--=20
2.43.0


--=20


*innosonix GmbH*
Hauptstr. 35
96482 Ahorn
central: +49 9561 7459980
www.innosonix.de <http://www.innosonix.de>

innosonix GmbH
Gesch=C3=A4ftsf=C3=BChrer:=20
Markus B=C3=A4tz, Steffen B=C3=A4tz
USt.-IdNr / VAT-Nr.: DE266020313
EORI-Nr.:=20
DE240121536680271
HRB 5192 Coburg
WEEE-Reg.-Nr. DE88021242
