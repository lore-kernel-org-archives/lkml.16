Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA69B1C68A6
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662567; cv=none; b=vBFb277tx7gyWDbM7oYvXhTeDKNvppBcZ8oCM4LlY1Osg5jwhluAzciD5mgAFiH1qkhqv+OlXkiG96nYq3X21LCBPg7pQ2LFsw44bDPvwCaPaimBWYyBADg1XOyaU2sBCRk+o6j7jZuMHumxuayBhD5zXejansZOp0n3TtT/ePQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662567; c=relaxed/simple;
	bh=qjtBHpJPwoiEI0Ss/TiZRBMBxL2W4LWb/70qaMWWLz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=epn35ddkZYQvJaFsfqoYah+bYkq39zvjWyG3K/BMgVD8+3rABnGBV2IbbgX1PoZ2Lg/B9j8jMguVqf2jpYHRpC8FJi1Y2tgvLwgTccOXsSr9tmYm8r5RwKIHz4XlFDPBmQ0RNj0oZ93w3TgnMAJK/EN3W9uUaa74YWjADrpu398=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de; spf=pass smtp.mailfrom=innosonix.de; dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b=IQspr9Yg; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=innosonix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=innosonix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=innosonix.de header.i=@innosonix.de header.b="IQspr9Yg"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450ddb35583so5444995e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=innosonix.de; s=google; t=1750662564; x=1751267364; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8mPzUKR6pDs+YdmrnvyhwiipFzKzX/hjhdrnWp861tE=;
        b=IQspr9YgGUl4DS1M5INtJ/yCl5b0Hsgrmtxr0U3HHJPcF0hpfl4wLYyQorq8r1vqmO
         Dlm4fUxaKeh11TtgfsPJuquVOD3ipgZzCVwLb04l1Vg/PnRWOQuSuT9+L6UDOquwvGFq
         0Ovp2KXCy2u57+6Hl0grfKMGzpmuPJ3S/1QNamGpt68q9VGOQORJQIQIM5AVCMmoF1M5
         AI8ozLK1zM4qiHDJhDvQBdiz/dJvUQU1nzuE1A5kpDfShV4OC9mJP9oA0hzuSNjDZG2z
         wC47Er88ras2y5MNsoyiU9FpFLZC8cdQFN512hgjH8ae8o+05VTeRT9QM0D97GQELv9G
         iZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750662564; x=1751267364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8mPzUKR6pDs+YdmrnvyhwiipFzKzX/hjhdrnWp861tE=;
        b=pxMLTPj0bkm2P9hpmRdX+Z6WHG/PPCe/SB0jFCg5b4j5O1SISCLEfRqDODFxQJmC23
         MwE+pLAj8ydpnpiMLYAP3qEcRVGWsjt+UuugRBzD717G8fZNdSrOPVHMnCriY66W3q8K
         kp6heWRNqZlUPVlSRBqfB+dNsbAtuMggHtu2DKxqb/V/ocIn2QrLHfPyxjGaP0fHGFcQ
         vZw5mVztKCoPgQAAr1l/wX/Dw6nNycCFC2ZsSlqgcbz4eGIb+CbfnYS7Es7XjJ1Twhfl
         miKJ00c8xjVOL0QZeEyWPqKopXutipbgh0JR57liyabjabqqQvt9IC9ho1hIExtN5/pi
         wcAw==
X-Forwarded-Encrypted: i=1; AJvYcCUbmcMIDK/airW4KgZhZFASmyZ8g/i9hFVNLu+kzBbTtnth3hM3IkcBNj+8Dr10KEfHIGTs4iXJ/hgrMns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/5w2AacbtjV8Bkp6vxwY51hPc2N9usADL/H3wu0ogfH2fAIE0
	EKMQ0cOMMs8H/UH3YAeuI1sZEe0F68UfLWqIn6laZa+tf4zcbnCp2ZFz/r6xeKldqSJnDnipPE9
	iQMWA3/mwZbC5BCAFe+Kuy/uJOXnrB9TBFLlanS4DlJiFYm7fQ64CE1OQzCc=
X-Gm-Gg: ASbGncvUOok7uM38W3Qu/RvQnrRTi8z461UGFXKNXiBCmEymOx2Qd6gFxDqLKi1XdrH
	47HxaRTXS05pJ6lYVUM9wUcWGbMUikm0xc0z/VvUkbgKRYwF9VQoB/lulClHc+w1s8uTsOdgQmp
	YeYsH8nxcvr7iJRNKhOMe86PSEHqZL/1bsfCMb7iZlW2wZBYRsy1n939CYw1tdGpotX10muz2Nb
	wN56RVC9A8TonXU0TIsaRh/Gnn7rJJKrLTVJ/bcStPqaQFWKNjsbjWxhqcSC0CQz8BtuCjDzXJo
	MVzvrgSYL8EgVuyp/BIkoBmf1e0C8YVsDvrqYeydIo6juEjIyWdtzxx64L6eIYWjd8k=
X-Google-Smtp-Source: AGHT+IEI5NpQNUMy1aJAjdYtizFyZ4FhXhpX1D2RY5hWJP9EHsy+nQxupmDpC1IL2ETakmaeoEEB8g==
X-Received: by 2002:a05:6000:210d:b0:3a4:eeeb:7e79 with SMTP id ffacd0b85a97d-3a6d1319d8dmr2308687f8f.12.1750662563989;
        Mon, 23 Jun 2025 00:09:23 -0700 (PDT)
Received: from steffen-linux.. ([24.134.20.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646cb57fsm102070475e9.1.2025.06.23.00.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 00:09:23 -0700 (PDT)
From: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>
To: 
Cc: =?UTF-8?q?Steffen=20B=C3=A4tz?= <steffen@innosonix.de>,
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
Subject: [PATCH] nvmem: imx-ocotp: fix MAC address byte length
Date: Mon, 23 Jun 2025 09:08:49 +0200
Message-ID: <20250623070901.1733755-1-steffen@innosonix.de>
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
Signed-off-by: Steffen B=C3=A4tz <steffen@innosonix.de>
---
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
