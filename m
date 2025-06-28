Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A0C1A3166
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751133636; cv=none; b=pLI8hyC79K8xXtyLKpx/9VXRdtTwKoVggJjbmhdxzTJ0be9C2pNWw27NwcDsiw6W8nQOqlSM9jC4IHUCek+pOBVRqnMekuawqvf0H3eSC/8lLJt5/+YeyuKWMZ9pzwt8igVpiea3Yjmgpi7X2q3xkt91yBBhpIBVLhBZqqfOU1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751133636; c=relaxed/simple;
	bh=Wpd4062Hg4zs8I/RrWFr4ghaFslVhjOJfaz/6/aD9RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nppqWwaklpUfXt45DPBBynCGktom2M54BN9EzohNhDj1gXcEMmb5tBBlzqBFBZp1ocIP2I4ZIaxsxh6354KL2FNzPdla+lGWeVLnQxGO01v7g9iP/6P40eBbXOa6qZ1mwYJXKVgW22cdQNr4w4FxiTvtCVNtO65BSuoSmouWSxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=RshAk85S; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="RshAk85S"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6060a70ba80so493171eaf.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751133633; x=1751738433; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NWkzZlNmYBpQdzkeKGqAYEk53GZizX7PxwwGKL+egU8=;
        b=RshAk85SagWUKXBebRzW9fKKTggl1DYSPtYZfe14dt8e3PwhF/lSqP90KbUhSIS6Dh
         Gmn/ERyUFfivaWPrwUIgUWXBeSSSzrpNFeKJMSsBvNlKpchwxDwoYQD92dj3gEefRkob
         JJza19Qp4qnGZ4gcTU0VD03zhfvo1XZdHorzltg/OMphalrSoLbD1a/Z4gT3UKS60R1N
         XdWWbj243nZJtvYOcx0Mj6nLLz3yeBUZPvryfs7sJRzzE1L3/MFJQR30EPPwkHIdstCp
         Q45UDe+iL5gFCtxVgvnMKJI8L9ZMegqB5Gv0FcthB38ZuDn0ErRVP4l9a1csY91TGr2g
         d7jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751133633; x=1751738433;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWkzZlNmYBpQdzkeKGqAYEk53GZizX7PxwwGKL+egU8=;
        b=vVkhQkdjKNUuVFeN9Z83ZfoQsnJY5DqiVwf1Dc70S3MZmQn/5Zqnicgh6geIr4TQg6
         qDIAl2SK0nyr++ee1h1mP6g7o3obSdbwqSuz2S+DcqPT7a+5Waq+YCpdRz7EcgLOUs+u
         ekaF30P0m+ZJmV4+NIgPrMnzUKTqqwZiFnZN++9W5CFpxntW7D8a+9XpbO9G/B6gkqeu
         nFN/Rs8lypOn/eJYrGjPLPbUobpnVcL6X+EAjm7VRTF7llbVXspmhe7jERcNtn0/s1k8
         96JChJ79l6gwD8NUDqkvjc9T/PZqFyMv0UIhtpMu+2iSiitDY/ziSd0Jm0LJdy/o6Cb5
         tY3A==
X-Forwarded-Encrypted: i=1; AJvYcCVjMu5BFumGo4o6Q4TsDciPO1vHuVt3kD0yoac+NHzSPuZwABPriaKKSuFnK0McrTicXtd2XKtw4WsTD40=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOeHN6wzDlE4/1n0n1vz0MebSzKgwiLbXi6Q1VFsSWflENhwWI
	ZvRKMtM9G2c5JW80bMo1T6vjUClqs7pacnIt+qTH19UHrnkiusTYu7F6HPS3tMrBKLw=
X-Gm-Gg: ASbGnct0weoDjVuYaHVIMc/JgXiK44GGDowdbc4A32/QbJOfs5RD7MaLGkIz2jV+aG7
	VN1Mjy5Gzmudzsjwgidq+eIxSUnJGEr+j7evVD7DelmI7EBogHMAgynKsym7nfOB5l36xQ4oVkA
	xNDnZJytx1ny4C/rZQuTNOHGj0LRdia1Xa3q9mMH5Vvlv8/KhaXxbl8lp1H0AO6UTjgtItOyYJY
	E4M2Qem5CVmVVcgmAU2g1EczmuWaoKxa1U2Lhw/gBPKXufeZM/gmYjPdRrjxGSAhztnTgal9kym
	yYuIEyl6bJW1882pVtIrjVOAwYKyQcJkDFQsxD3bhICttOWIpwRaexYni0lyTHzd7Dis
X-Google-Smtp-Source: AGHT+IHeIbhJ0VPsfz11jfIB5EOVE52kX4SaHdgM3QHa2Q2CssMf5SeFCoEo/FbLnt8TxnhDGw3Fkg==
X-Received: by 2002:a4a:ee17:0:b0:611:b073:7c31 with SMTP id 006d021491bc7-611b9174eb9mr4656001eaf.8.1751133632662;
        Sat, 28 Jun 2025 11:00:32 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afafee2c0sm901159a34.9.2025.06.28.11.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:00:32 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 13:00:23 -0500
Subject: [PATCH] iio: pressure: dlhl60d: make dlh_info_tbl const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-24-v1-1-353b97281534@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALYtYGgC/x3MPQqAMAxA4atIZgMa/CleRRxim2qWVloRQby7x
 fEb3nsgS1LJMFUPJLk0awwFbV2B3TlsguqKgRrqm4EMqka0MeQTHZ+M1GHHVgyxGVfvoHRHEq/
 3/5yX9/0Ah7859WMAAAA=
X-Change-ID: 20250628-iio-const-data-24-4ace82a87bfd
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=905; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Wpd4062Hg4zs8I/RrWFr4ghaFslVhjOJfaz/6/aD9RQ=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYC25C4ncZ9vs5sMtS+5XdGYUbbbz4B6fiWbZD
 fA4wL2gFEeJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAtuQAKCRDCzCAB/wGP
 wKXTB/sFWxRKm1a4jF2//AQJMypr/dtiYhWX6ocVKuzfWqntCa2BBFTFG/4V1tcQ1LiARtcw+uZ
 FH5uuR5GZeOxb4iP54xhk6xSk4+QCvjD5dkK+9ZDS34OXXxuDF5pdxp0Fsgzs8/OdI9pBJqybGB
 X0MJtokqvsTSJE3Kf3/Y6a4+s3I6cCDIRFZE5gzARqW7PemwbCB3KEZEtNZQq3DtgoyjnYFaD5u
 k97OjESHgB4AlsxJuGylzYR4g2Iok9DG286AQQmVd7gprzxZqtEVzaeSLzFRkr20+9ho8NVXEwg
 CaG950y/vo+g8+iao1gsXGpt/IwLsK1g/KoPFDDKpTb92s6K
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct dlh_info dlh_info_tbl[]. This is
read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/pressure/dlhl60d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/pressure/dlhl60d.c b/drivers/iio/pressure/dlhl60d.c
index 48afe5c94000b44eb324d7631f3c0db8e3d0079e..1c39b873cecb24c6273720852bb13cf5ce15e518 100644
--- a/drivers/iio/pressure/dlhl60d.c
+++ b/drivers/iio/pressure/dlhl60d.c
@@ -50,7 +50,7 @@ struct dlh_state {
 	u8 rx_buf[DLH_NUM_READ_BYTES];
 };
 
-static struct dlh_info dlh_info_tbl[] = {
+static const struct dlh_info dlh_info_tbl[] = {
 	[dlhl60d] = {
 		.osdig = 2,
 		.fss = 120,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-24-4ace82a87bfd

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

