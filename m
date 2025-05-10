Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B6C22CBD0
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746891490; cv=none; b=QuUEUm4Ju1QYyb9fIEiMLg/Q/2nj436HoGcW9XiBFR9rYy8k6IHcCO1tzMMKX2JrMYNjgQUN/N3XdxZ2g0D5RVJA4wm2ehdtwwgF2SslmFX3aCl8QVjw2ogMNvwrzolhhxvKTY4Qpn4G3m79+xrfRZ7qH9CtVZwbrRiygUBffIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746891490; c=relaxed/simple;
	bh=FI4bk2uvupimMFJpuFZh5GpeoaWpAnt1WVk6KoMoWlc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nEg87PAKX44BE7S7qZ1P7rwlWSUP+5pVbp7TuYQf4XlAmGeEs1l3LIZpxvVfMIX1Mscv0Lr6sRWBC7+9siXWuPYcTFgXgfP47uE3ddYeG6UsYHZxLgI0FSCLv924FdFvgoIDnWT8ERy495TyxDESqf10lqOk5YZIl0EZZhphvzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rtub3K4A; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rtub3K4A"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5fbee929e83so4813511a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746891486; x=1747496286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aCRLY6PSOaTqAxmVdWEjXCR36yqNhZAvTLdz/IG0MaQ=;
        b=Rtub3K4AF6NC1yihSSVxDtQuFRDfqmriCBPGi2XdwOceG9HzQizqiZVcPQJIq2ypc0
         nWV/IpYMx/0p1+TZha2y61DiEiTnBVwwX8Hz2DuO9tPkm9qcINB0um5oH3Wpyzp5vsTS
         Wg+Mbat0uumRqekxtE/duphTOIll+A2rdOEtNeT5TXBxvI0Lq5mYGxdfRqXpBIItIts5
         /3gVqbHaaaMaG54o9JC67r/c4BCzVPHmMNfIbj2pOo8z6VnUoEpzcZJbd76xE+5bIu9O
         U46qyVBpATjkW8G6Jh+awDRtOLyJAigtUkfpYCqCCGweDrmj1FNTOKFtLdNEDYvh9gRp
         rZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746891486; x=1747496286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCRLY6PSOaTqAxmVdWEjXCR36yqNhZAvTLdz/IG0MaQ=;
        b=bs7kyKoOk65mFXs9Ieuda5VDUJAXedQ1lXCksGA9zFdp9SM8X8iGRXR5WV0jYERUSB
         XyNdkyC5uxrXu9wXMCW8WzZofCwOox4dUNnGrjdBNO/XVc7U/m34dSivxODWFAKYBjFZ
         Ymv7YlQ3k9uSmBLtk1xQuRl49unETv+BWOiVTLwIyZ8aXTc3M7HPqZOdrhh8fFWb8nkf
         9SlYT9zk75/g4HnBXmhwbfT4o2GGy3EvFia0xToHYLhvgyzKcB98bNn5KHcX8rMZhT4D
         Gv23ajChgHMm70QQHnbHClIC7iOQ3TsBH4CKBbYF0Y7Yru9OAPM2/7q2GStVHOk8a2Yc
         PcgA==
X-Forwarded-Encrypted: i=1; AJvYcCWr2HkTdC/gI0WOD/g24TR2tCjwIk2rCccig//JDCgPpxiUaDp1YiiBf0YxRcimdMgvlbbRQ+3REVDCD1I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzr26yaXciLn40Wbgwx3SAyqis2qwpBIvxmMoUS4FOfnmSGzKgN
	E5icp3s8rpQs0VUSX+dQXGT4B/tQiV9a/7eULwGdgd3p7GuMUQOSteew8A70dp1V4A==
X-Gm-Gg: ASbGncsKe5HBEaBNELHgePJ/O8M8Nbv3d8IEtUFZIH6V1/wnEjAiOLPOVzshq/vjTqK
	0G2LoLPxf/hV6fRDORICi56/GkN/KGJm+Fl7YMPeAxWveAO6GT9GJcp3ua8zpeanj7RRuL67bRM
	4Y3PC6MYfufo+D4b9QI2mOY/MlykpyNSU9lolKck06F4nVJyXdENW7x7jfMjU0y+t6odAkDXHtt
	iKGQkw5LgVwjiVTQWVhuRJ3TNiJpTcnFbwG9xyFg1hd9M5C/8dgFIL2RXydA4nnK6TsufJ4ub7h
	BWQ7SpIYWga+e2zASVq8QPYvaTpFuBO5bKXsEuYwNuARw12DWTvJuxzrpwqQhl5geqRHD6CTwIF
	opigqPyIm2kRBZEYtVRdUVwbc3fbUN1hEFIIrkLINVl1PgQBlKEriS034WC3NJVV4nuhB9PcvsE
	9A3kEhvOjimKU=
X-Google-Smtp-Source: AGHT+IGFdMZcsOY7f2tt7vpbB1oV8Xxo5s/81U/bkxLxz5rk1rLAGldrYx5xLBlmMnknbg6GEMlasA==
X-Received: by 2002:a05:6402:90e:b0:5fb:1cbb:9390 with SMTP id 4fb4d7f45d1cf-5fca081bc55mr6639155a12.33.1746891486412;
        Sat, 10 May 2025 08:38:06 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d70e296sm2986376a12.75.2025.05.10.08.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:38:06 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 1/2] Staging: common: iblib: Changed ibrsc function type
Date: Sat, 10 May 2025 17:37:59 +0200
Message-Id: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function ibrsc type changed from void to int.
Returning 0 for success.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/common/iblib.c       | 4 ++--
 drivers/staging/gpib/include/gpib_proto.h | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index b297261818f2..8b4280309ae7 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -418,12 +418,12 @@ int ibsic(struct gpib_board *board, unsigned int usec_duration)
 	return 0;
 }
 
-	/* FIXME make int */
-void ibrsc(struct gpib_board *board, int request_control)
+int ibrsc(struct gpib_board *board, int request_control)
 {
 	board->master = request_control != 0;
 	if (board->interface->request_system_control)
 		board->interface->request_system_control(board, request_control);
+	return 0;
 }
 
 /*
diff --git a/drivers/staging/gpib/include/gpib_proto.h b/drivers/staging/gpib/include/gpib_proto.h
index 2c7dfc02f517..9ef1cc247289 100644
--- a/drivers/staging/gpib/include/gpib_proto.h
+++ b/drivers/staging/gpib/include/gpib_proto.h
@@ -38,7 +38,7 @@ int iblines(const struct gpib_board *board, short *lines);
 int ibrd(struct gpib_board *board, uint8_t *buf, size_t length, int *end_flag, size_t *bytes_read);
 int ibrpp(struct gpib_board *board, uint8_t *buf);
 int ibrsv2(struct gpib_board *board, uint8_t status_byte, int new_reason_for_service);
-void ibrsc(struct gpib_board *board, int request_control);
+int ibrsc(struct gpib_board *board, int request_control);
 int ibsic(struct gpib_board *board, unsigned int usec_duration);
 int ibsre(struct gpib_board *board, int enable);
 int ibpad(struct gpib_board *board, unsigned int addr);
-- 
2.34.1

