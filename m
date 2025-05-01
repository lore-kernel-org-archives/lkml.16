Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E63D264F99
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135048; cv=none; b=t7RJgs9aq/WjHOSccUknUHmY/1NB9th/Yo1ljKUkBXaujGJvaSS0k15niiPQmgQerG/V0rM0NN6ji2+npZLELnVE6X1p0HH3Zf6M1iy5qeGBp6l6YLhh5otnpd/7u79oP87+BHrW7z2wPIWzafw7zWETB2wuzPz6ql6MfXs8S5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135048; c=relaxed/simple;
	bh=PIRMpgNUFY1ik0z+6dnUMY6vtFlnqbFG//tKiGZLUfY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WazWGMjWNR+ZHCHriOXVUfgyEE5+VwD/2UMO4fl2phN9V3ltmjd1/gch0VM8u2nM1d1VN1Bj6le7vtlBwGOuQpE1T/wa/N8qKq3NeL6/oOscqZgqRQTRNnNrUuHUwbsNr0jM5sneZhhlb78Lnugvxlkxbr2YZn7Ru+N/zeL+d+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhRH8g4f; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhRH8g4f"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2aeada833so268888266b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135042; x=1746739842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vx2BnNbw+H6yRd92Qc87LVyrq8/WbAmAtW8W0e6klY4=;
        b=JhRH8g4figt7IXiRCwbQHbt413wnNO8vMzyBW0zA8tO+mHanQGmTfwIDF5i6kyKY7O
         J6mehj/VbzyaEFw/A8cP9LHPckfjnud5RiaerXWzxeZ+9uasArQaZrJ6vJQnp4YY0b5G
         eQZ6OO5xh5DudgIvcWztQwi3HWnuM/6mB1EM5ohzE520BrEU5xebwtt2mDGB6zIMBmEy
         HIM//0A1z20lEwqRisJCUv1Pm2sqpTvoHxj0JBgc7+/ky9lrDD4TCx8PqgCBVZ5eDdU+
         dKDpEwOsJ1vK1h1jxGozu1HytNvdCWjLGWaKgLf1ahDYuGP3rtxTFVTWScazGmVkesPa
         LMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135042; x=1746739842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vx2BnNbw+H6yRd92Qc87LVyrq8/WbAmAtW8W0e6klY4=;
        b=KFdRKbe6QKqPTlaUOfp6SFnYKLxq50ytVkbMFPw2PPA8NOpxO5KF3suWTEA2KToTGW
         eYum4ge+mbdaUhtceB672ppXAvELDDVw05xCY6Ekl82QgTnh6UXX6Y9nRgKu3BJklzdT
         H84JfQZ0tnPMK+qSMq9qg/7WJ/ssg2H3bv1FCCELD17X2FMw41quhfJaRcC0OwYyr9v+
         gm1qqce42RBMReW2ttEPg5URTJnnzA04cL62Yl35ucii9OEKknoiXxByD7qJ+Bgx6wRi
         Pw/uQIyppxz86V516qilont//autaKRpwCwB3L1PMfmgE9jth8mUc2ob0CXHvDnBfM9T
         Ze2w==
X-Forwarded-Encrypted: i=1; AJvYcCVYoahGCIyIfaY46WBhW7pznZAo5LxLPwvh60Pbx8zQASJdjfYGQD9YF6Nd5NRYUXlHkGQv5+nu6ij5IqA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSKC+LpB0aowrLcdxf5sw2QKaJpU5Ewlact+YfypaWu02zD9d5
	sRaJDptD/Su9PjCWedyIU7xCGLsoTMWSgMmtDmWEcliK/FiHKfOj
X-Gm-Gg: ASbGncs+evNxzN2kKLGoRyCMx8S2w2wp34zf2VSREOkqX6hUdzxLT3U/PkMsqVIbA8I
	Bnr5LOZPkcJVK7DDaRhwlP02ptR8Q2b5qBMwzmWLGpWZsAKaJnm1/Gncj8SDiF8S1pNu68um7pY
	wd0DTpfEYDkdGeY/OtlmFLO0jMGNXlSyS5Us4M8FODQGQbZwNDaaBJ8N2PdYhdXKFwTcuMFdZ1H
	NwBOqrK5O/Q8NLNBbZbJprO8ZlIJdr0bUdehmaOlznNiMN3QIGfdBG3qnXtaaWYu25qXaPb9GyD
	qC89HOvfnFm+x397dTTNlru45R7ZGK80fBPmV3WHGXbO/Dpx8vuPNxKgXiwIwG1IiLHeDIDt27G
	Qf/DEuF+aw5Wi/oY2V1FTo6Ax5WycYkru68Oj2wC6VNLrU3YpV8VIWOX2djinCHkDHcCVAHA0OH
	avXw==
X-Google-Smtp-Source: AGHT+IFUJ5z+Wf6tRCevsNbth9+n/iTFmf2xbNXBAm07ufdrNRRQKVTPwyzOkjqVkNpgNVJZHDRMRQ==
X-Received: by 2002:a17:907:1c0d:b0:abf:174b:8ca6 with SMTP id a640c23a62f3a-aceff056cd2mr321833866b.27.1746135042337;
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:42 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 5/8] Staging: gpib: Updated return type for `ines_request_system_control`
Date: Thu,  1 May 2025 23:30:34 +0200
Message-Id: <226a7f00f7a5a332808aa4d058b000deb5b20c92.1746133676.git.thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
References: <cover.1746133676.git.thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Updated the functions used by ines_request_system_control to return int.
Currently there's no possible return errors in the functions due to them
being former void function, for this reason they all return success (0).

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/ines/ines_gpib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
index d93eb05dab90..2ca1b8659ab4 100644
--- a/drivers/staging/gpib/ines/ines_gpib.c
+++ b/drivers/staging/gpib/ines/ines_gpib.c
@@ -441,11 +441,12 @@ int ines_go_to_standby(struct gpib_board *board)
 	return nec7210_go_to_standby(board, &priv->nec7210_priv);
 }
 
-void ines_request_system_control(struct gpib_board *board, int request_control)
+int ines_request_system_control(struct gpib_board *board, int request_control)
 {
 	struct ines_priv *priv = board->private_data;
 
 	nec7210_request_system_control(board, &priv->nec7210_priv, request_control);
+	return 0;
 }
 
 void ines_interface_clear(struct gpib_board *board, int assert)
-- 
2.34.1

