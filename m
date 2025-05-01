Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FB01E991D
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 21:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135044; cv=none; b=ZSqoUAwuAC7Zzp3AQgt5/EjRKAvBmW70u78MNfCToTDfzEmZDr7Bf6Xk/z5TCesQ9HEAsyKdrUKk87Ps0tNwozFH828xce0IpjR4zc/X4GjMHmFiZmJKr0h3wDcNd+esSQjXe5jt2uSHTeUpwF62xW/X1BePAFr7RaVM+mxlhD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135044; c=relaxed/simple;
	bh=BvqQ+CBpYAAVznTR42OPdLQU4WD8pPMFPt45Xuh5A6Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=V0o8Kvm3UpQ0A39KrqCmJuC2e+WoLOJ/gvlE63Uqq7wJlrbBhcHmgGKCLt5dULn2AdpUpWY4dUCz+BIZBVRyUP+u3VRrYllFhx099DK03U+G564OktU2tc5iGy6ZGZcA7dvo5qshB46WHYslm9V4KxCtOCR91RS0+0YIzOUbPk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KFrlyNFN; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFrlyNFN"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so147916866b.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 14:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746135040; x=1746739840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqUDyK3vGEqizw5TTGXv8tq5hFBthnGAWaurTJpA32Q=;
        b=KFrlyNFNpr7bzq1CXiL78nNb/rL4kI2euu1cu2H6ZGsVdgxScUno1O/7feTlbj2zEr
         27mf0M/YQGMw1DSM3zJOZdoaYcDETTjw0CYAAP5BtieBLw5viQviqWhyMscm9DU6OZyX
         6EN0V3mY3E+CN6BOHy7EXnihHYw/fw5Ejz3KNmtwnA6XmDi39I0jUBORbd3ZkrCQ8qJa
         wzaA1DQFaJSFzsIgVNZTEoKLWn/SVsPjEScAnv54F3+RegedVR75XYlGTsg99+vYxmmF
         L4E2/3JoOYuH7nixEfFUxNIPcC23Wkk4sMFU3oIQ8TtYgWguh7Gq2kaNTgShwtYec3q9
         lrqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746135040; x=1746739840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iqUDyK3vGEqizw5TTGXv8tq5hFBthnGAWaurTJpA32Q=;
        b=YprjVwP5iXirbwVBpP5CPxmtnDWNeNns1U4uBttTtGadRHfvC53UviMG4WLcw896jd
         cNemr5ajHkk4XqcJ95pW3Dg7gwunI6EFPzKkhFE0PpUPEDjIz+G1NB76pDzsnIcTr964
         4vY8mbG4S1Qy97s5MaTcSC8e84VUIdQ+HGzS7ByWv21QNnNFockwS3zoAs0Eq6VSGArZ
         +WbxpGEzvp85MlXSM1dTQ47JxbM4dtuNvA5W7SMP81lRfiNJDdZmoXKSbLpZek9qD32Z
         Fz2GR7jtu4jE1cmqaSGwG9ZGVi8Mb6gCCROPOwSLwyIk3OZdO0E+uVez/s5kJ8jZBdDm
         G3Og==
X-Forwarded-Encrypted: i=1; AJvYcCV2IEiRHjxf4RLc3KXLopJKPFK1Hg3/+fumJ/ht0AD0pj58fxJL2SGZZ7ZdUqCwzHatpHVj35baCJbrUkM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+4LLubkxB11k/W1gXH4GMgyGXRICx5wlqLPMceWzGuRwiEJb2
	1NL8ZwzWcFXgrTiG6909s1F4vz9M1CV/n8xc1K0sMrLXGTdEZ848BSdCblXLVJk4MJ8k
X-Gm-Gg: ASbGncvs5CSM/ZEv24+m8Y4LPE7BfVoEn6Ag3+43fFxR1fNMEnZByMRGuiYM4CICiFr
	A463h6GuhQZiohY+5CwVK4efM79+hNfnTOYIFQZVv76BaVz+7mFdw/UHFxPJOxgR8fEHShJDVbI
	U+qnaYo+hh5CW1AMpeRuy7mzQH4byfTm4CGSKmUOiVW/X7REhVdj7B6+UivsObwZ7g29BSETNeH
	AUWpHVu51N4lOvZEt3p3Lz9Q7H9bw5xb/eV5YUVdpIlsLZZg8Rh5j2FnNnR0tU3ERITQhDmcPX2
	1iR319W3ujyl3Qk2D9vFSDezxEMRRdH3RwWaxVSSDfnCVnE7IMltBoAtmzS42fRjzSPyJsAxFXW
	5g+8jAhf040H22eFChWFHd2q4yWZomrAfWVH6qBTpMEf2PKKvMIgtQq/Kc81xyqkvQkPa3kgbvT
	+9lQ==
X-Google-Smtp-Source: AGHT+IFen8NAa1gYV7IYZQFGgbEo+TNzKU6LwekucDQLxNs10VoAkrda6K2y1ptlUvY1rZ+ftPX/bQ==
X-Received: by 2002:a17:907:728a:b0:ac7:d7f3:86c6 with SMTP id a640c23a62f3a-ad17ad3a86cmr59649366b.9.1746135040050;
        Thu, 01 May 2025 14:30:40 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-41fd-2957-14cb-eff7.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:41fd:2957:14cb:eff7])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da560a63sm96466866b.139.2025.05.01.14.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 14:30:39 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH 1/8] Staging: gpib: agilent_82357a: changing return type void in int
Date: Thu,  1 May 2025 23:30:30 +0200
Message-Id: <e902b9d53283d350e6f97399dd3fea646fdb5d88.1746133676.git.thomas.andreatta2000@gmail.com>
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

Patched FIXME request moving the return type from a void to int.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/agilent_82357a/agilent_82357a.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
index da229965d98e..ce2d3850ba31 100644
--- a/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
+++ b/drivers/staging/gpib/agilent_82357a/agilent_82357a.c
@@ -754,8 +754,7 @@ static int agilent_82357a_go_to_standby(struct gpib_board *board)
 	return 0;
 }
 
-//FIXME should change prototype to return int
-static void agilent_82357a_request_system_control(struct gpib_board *board,
+static int agilent_82357a_request_system_control(struct gpib_board *board,
 						  int request_control)
 {
 	struct agilent_82357a_priv *a_priv = board->private_data;
@@ -765,7 +764,7 @@ static void agilent_82357a_request_system_control(struct gpib_board *board,
 	int i = 0;
 
 	if (!a_priv->bus_interface)
-		return; // -ENODEV;
+		return -ENODEV;
 
 	usb_dev = interface_to_usbdev(a_priv->bus_interface);
 	/* 82357B needs bit to be set in 9914 AUXCR register */
@@ -785,7 +784,7 @@ static void agilent_82357a_request_system_control(struct gpib_board *board,
 	retval = agilent_82357a_write_registers(a_priv, writes, i);
 	if (retval)
 		dev_err(&usb_dev->dev, "write_registers() returned error\n");
-	return;// retval;
+	return retval;
 }
 
 static void agilent_82357a_interface_clear(struct gpib_board *board, int assert)
-- 
2.34.1

