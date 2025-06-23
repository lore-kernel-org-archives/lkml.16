Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7462063FD
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750668264; cv=none; b=fwK6qnDXJElpz5bTkHrUZcwMnDVnTJp9k9LzH8zyStzraVCEQtk1gVX+6oIskGCP0hgccJJqO8t8rmCpCd2BdOnYbBrAmv+HGd8vvKqwJ5D42ggUG0wCBj9buGKLSgO3ay4/07S95aql9bVFbZr//A8sGVsZk7EQ8ZlVxSJg5TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750668264; c=relaxed/simple;
	bh=gI1ErGb0vQdrPAGEAUZHDjNpr3h9UEqh+5lgNTiM3h8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S1wqqFvZBCHwBaCUzTiQj8+M0513eC4NawiJWcn4bRndyLWYxPBMkDGdlnw6SlFllKvUZ0f46oLKp/qSWYjyoQo26nF3BOpusqdhP8UdRVUPmw5JMTqZ1VA/fWePqEK4uTCtMbkWzdCF/hnxxoRl3kwLBRcXr2LhfWucKoWpIVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de; spf=pass smtp.mailfrom=innosonix.de; dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b=OYPxXfra; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innosonix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b="OYPxXfra"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4e62619afso487654f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750668261; x=1751273061; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/wEOD3FOK1XNyQ/YyTEnECjOhDUHmpEcYDOM9V4Bw4Y=;
        b=OYPxXfrap46d1cCt/vHigFJxgJuK+9Owg3rKD8NbsoFxhiOYNl6d7eSjFP7KYVSBEK
         +X7pmvJhHAnZB4N4CvMhwuVLSTx4xXVbeK7XSg1LRGcFNHoAuhVAd5ExtbryNPUCq8Yd
         HsKqIv0NiXu6SIKv5pWeReHbhUFOANcgWYq5BrYQKSTko3GXhFDjb2vbTR3kVuQwqghC
         CVsvboPotuLIdVqVfg6dhYx2b5a3oGNGap8yGxOetzzy5lb3oxbxbok1Kw6Hs0z0CwVk
         dDn7TOfDdL2oVDJB8kjcav7e4J4KW9yC/I/5lzwl3UEWbG4d6jXSTsXfNbJ/uqLbUzn/
         1BTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750668261; x=1751273061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/wEOD3FOK1XNyQ/YyTEnECjOhDUHmpEcYDOM9V4Bw4Y=;
        b=WGbCM4fBNlau8QPCJd2RCFPy26Iqcosh4MM5PGS6RYmEQua5ms2AmaoZzY4JSNfrfD
         W/kx87Kku5pdbIY+4d+K5dB2gjm2C+u6Hqwio6spHBP6FNgfugQ9vad0bIhINAGzHwVl
         vPNB+oTC26pdX2wpd8XMRGD51LoZ944Udlwet8HCtStBqlAG7WboZdqhRVulDek+8Iz+
         wCUVcJX39tEaSk+UzDAmJsJf/G7VF2vXUbGX5pOwOhn8+Sy4VwYn5aVwaZoseb8084KP
         mwVpeejYjCtvEgI8AAtUpIft8Ynb+8ABFU8iztrkMkoec6GpKQS7Zjx6SPOjxFHFQKln
         Pgow==
X-Forwarded-Encrypted: i=1; AJvYcCXR8/1n4+i8MqWv9/wmvQveJ4XaqPESDh8MLCz6DUCDR3YyGuWrkjzdUxoe2cLRdE5MddZG5kPxpEFVgLk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1xw8t9Psd9ziPpA/zaRkEhjc5udTPgQjytzNXsynSA5U5Dn6Z
	El+YV9g9Ar54fxa2yViQ1sEyc5Bw3x6csNeapO1EU4uIz+nv4gv7Eh945qPDHLgNIsEEMFcpG7E
	36XZPB+cQfK9I+ydi2hyNw7i93rgububKEyGgyecZ6o/C/FGSC19IassUCFc=
X-Gm-Gg: ASbGncsFKNvPYP5//pivM4Y5YrxTBA4ZUBITf/7lk8dKG5lowe7eJQEdGVEVUbFc+eY
	pVvzj8OQ/1ytJbUUTpLu/yPHHZQju9CUtm1iavpx3ikRfg6ilmxm1jKXgve3P06KZqsigXleBoy
	/gJDCC6EnooMm/rcwcFJY7YE/sZKNZylYjGp0hxNm8OEfPY6PRa2WpfmEXiJgnVIJf6zynhlDtM
	Qx9T3zNxg44D0LHf5JkTRvtVckpqs/+VLV383FeCEzOHGBgih5ZJPBTQCVvNDXkPq7Q+Zww82C+
	VVV5zK0Jyi5x8Nap1JCgIfpao5Kfvr3bbe6P9JtGIpQKDv/wUROt5wAhYnT+NXHH73JxVXmjCNQ
	qbfjA7smpayOJLhMLpqCO1w==
X-Google-Smtp-Source: AGHT+IEWhvT9kJ4u3LtaSyEodBMjwnY5987G/5eQkLBt7VVzz2bNjSEBbmFEI7Y+I6ci+DYcirb26g==
X-Received: by 2002:a05:6000:220e:b0:3a5:1306:3c30 with SMTP id ffacd0b85a97d-3a6d112f3a6mr3539913f8f.0.1750668260596;
        Mon, 23 Jun 2025 01:44:20 -0700 (PDT)
Received: from steffen-linux.. (p57b79c3d.dip0.t-ipconnect.de. [87.183.156.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1057esm8987316f8f.10.2025.06.23.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 01:44:19 -0700 (PDT)
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
Subject: [PATCH v2] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 10:43:45 +0200
Message-ID: <20250623084351.1734037-1-steffen@innosonix.de>
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
v2:
- Add Cc: stable@vger.kernel.org as requested by Greg KH's patch bot
 drivers/nvmem/imx-ocotp-ele.c | 2 ++
 drivers/nvmem/imx-ocotp.c     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/nvmem/imx-ocotp-ele.c b/drivers/nvmem/imx-ocotp-ele.c
index ca6dd71d8a2e..3af7968f5a34 100644
--- a/drivers/nvmem/imx-ocotp-ele.c
+++ b/drivers/nvmem/imx-ocotp-ele.c
@@ -119,6 +119,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
diff --git a/drivers/nvmem/imx-ocotp.c b/drivers/nvmem/imx-ocotp.c
index 79dd4fda0329..63e9974d9618 100644
--- a/drivers/nvmem/imx-ocotp.c
+++ b/drivers/nvmem/imx-ocotp.c
@@ -228,6 +228,8 @@ static int imx_ocotp_cell_pp(void *context, const char =
*id, int index,
=20
 	/* Deal with some post processing of nvmem cell data */
 	if (id && !strcmp(id, "mac-address"))
+		if (bytes > 6)
+			bytes =3D 6;
 		for (i =3D 0; i < bytes / 2; i++)
 			swap(buf[i], buf[bytes - i - 1]);
=20
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
