Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9DF1EA7C9
	for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 17:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746897924; cv=none; b=kJVxNRYY9gVrPhjsK1TqM7n5gWNiGDDGDbfkiSqwYQ9tDFiuwhg4GFvhjIWe+jn2KfVbsyBfMtfyNlQE5mOKg/icR5gNz3lUKlKTnkVeJsNNSIDlJgsYX6oALQGxFzgH5m7mulQ0jcXv4h5L44V3riKoyNEIhERfEZOVqQ/ACqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746897924; c=relaxed/simple;
	bh=FzWBBt43Y383q4HfZDh5aYt5Cg1Cf53Vj02cyZIuy1A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BWTRfCO+bn8pepy+EJSwyohyjsk6Iig/AZKbAC6PtGYm7rETAeyCN5VQdZHlw2vs114+FEVgrm6wL4IOw3QsYxI8Q4JdgDexbXSwxOG7VmWzQjBbY+D266jjpkm7ZLKp+KSpjflqZdjXQOqJjkW0NX+DK5PbBDShbgsX1byb0vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vr6IW7mw; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vr6IW7mw"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad24677aaf6so19166066b.2
        for <linux-kernel@vger.kernel.org>; Sat, 10 May 2025 10:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746897921; x=1747502721; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppzCaZZulN4ybunhQ0SeSkauTMh7T4bUjJ7VwEDaceg=;
        b=Vr6IW7mwuUpBjyf3oUbVHx8IKPiQwJ2V/NFcBBxgOg7EeQcoFs6WsOl+glVpmfmw0I
         vpnBT71zuZOuEsbafOI/ZAigGCy7WAaUg5cho/0/03jBKa1Y3cRzucbMVgk+vH0vv6ad
         YYemNyxSYFO51gKmB+ClUFuiI8WfaLiPc1gCwSWGZbfHumCt0kUs8mgcSUFz9/tzq0pI
         qWKr1yt1YVEngfaTbOEohclxz+50DuTY/sKjQ0gQNhDMT6N1Grj9ddfD079ORAiRotx2
         d9y31Y13Xd+WPb8MYQ8menLZtulk8ufblz3eONpMGkMiFfcX2ZxC3AaUPMzXMUx+qFDf
         9jLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746897921; x=1747502721;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ppzCaZZulN4ybunhQ0SeSkauTMh7T4bUjJ7VwEDaceg=;
        b=F9ngT5iCbPS+Xs6Sh/koWip7jIu6wkvsWBDlDAsrCu9Hy4kX7QGrmh8zUThen6soH6
         VNRte2NeQV0tijA7u9/OFsGtPramuahzO74V716T7k4k1FUzvOhrSoLxysb6Oaf+N7q+
         fL4jgFCyV+4FCfkgVaekAMFf/TspfnG93FPu90Rvl3uCHiiSPFkcah07AzPdH5uU+pJP
         SWKN3GFo3G4NKUVl8WVUDX9lEXLWWjsbI3XiSTGu92qXu4IDIQtXOJwl36zkZg8ixdl3
         oMWM1PGXaRQniNBGmDFYqUxGV3tthRf78oXYihQ3n+FisveNoLhzIRpHnO63Dy2vGkRT
         4aKg==
X-Forwarded-Encrypted: i=1; AJvYcCWmsFJS74vqPO2Aat13S1ott46sMXnUcHCqF8qks1bWny/AUNVJV1avLY1Kr6MUt5SIUlRFT6mxfwGjlgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9vyurBnYxo1GHPEe+MFN+qi2BDIzulb6LTqvLBJqgDEWKdocN
	bCha9GCKxtS697AerhB6kbRw+Q683tg6izJ7Pqq7hyIjujIFGIVI
X-Gm-Gg: ASbGncs09UIQl2qbD5BvitHTd1Xw5nAI4/rve5mp14/zPZ4sJ4qsicFKpZnuR5BvwhQ
	KHNOodas+U9YEAw3Bvf2UTpI4aLtWaF1U/fTtIllFtuMMAocbsZqPCrhsszRQnEZGEg6VwH+ufT
	eX11guYchMYUehrpIGnzWO7TasqUYYuxS3G+Kt2h81ndSGfQG0XPSRc9OpY7ELI7TOB8/EbzXBx
	wrKuzfFN17WveKVruc1j2wk2JNitUCqnn5ttTvr8TYsl8PUVjZP87uca5uOSejWHEo0V1gJO8+/
	CffUEJ0Lzzx6P28BNNomuVA7Z7QZhiBp7lYkr6Og2Q/QAg2C0konsLDnU9l4AhFy0qvd5ebXkRR
	deDuJcqXk6xgHlaWZZCrK+p/6heCKTJGw2DuOQl++tLAtCSuGLlHbk8FhE4OuoY0S6gU2NWkc4x
	FUBqfTrHKWAfI=
X-Google-Smtp-Source: AGHT+IH2jH92Ofi3qwYUF7/zNqhANG2Z7iCEB6Sturs5aIkxR5IsmC8vQqLvH8kQHxEPVsIVRFk8aQ==
X-Received: by 2002:a17:907:6a13:b0:ace:6f45:b5c6 with SMTP id a640c23a62f3a-ad218edd00cmr775048866b.22.1746897920527;
        Sat, 10 May 2025 10:25:20 -0700 (PDT)
Received: from chimera.arnhem.chello.nl (2001-1c08-0706-8b00-79cf-0e0d-6e5d-219d.cable.dynamic.v6.ziggo.nl. [2001:1c08:706:8b00:79cf:e0d:6e5d:219d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad2197465cdsm339717666b.115.2025.05.10.10.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 10:25:20 -0700 (PDT)
From: Thomas Andreatta <thomasandreatta2000@gmail.com>
X-Google-Original-From: Thomas Andreatta <thomas.andreatta2000@gmail.com>
To: dpenkler@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: [PATCH] Staging: gpib: iblib: iboffline check if board is in use
Date: Sat, 10 May 2025 19:24:20 +0200
Message-Id: <20250510172419.274616-1-thomas.andreatta2000@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensures that a board cannot be taken offline while it's still in use.

Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
---
 drivers/staging/gpib/common/iblib.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/common/iblib.c b/drivers/staging/gpib/common/iblib.c
index 7a44517464ab..0ab5680457ac 100644
--- a/drivers/staging/gpib/common/iblib.c
+++ b/drivers/staging/gpib/common/iblib.c
@@ -240,7 +240,6 @@ int ibonline(struct gpib_board *board)
 	return 0;
 }
 
-/* XXX need to make sure board is generally not in use (grab board lock?) */
 int iboffline(struct gpib_board *board)
 {
 	int retval;
@@ -250,6 +249,15 @@ int iboffline(struct gpib_board *board)
 	if (!board->interface)
 		return -ENODEV;
 
+	/* Ensure board is not in use */
+	if (mutex_lock_interruptible(&board->user_mutex))
+		return -ERESTARTSYS;
+
+	if (board->use_count > 0) {
+		mutex_unlock(&board->user_mutex);
+		return -EBUSY;
+	}
+
 	if (board->autospoll_task && !IS_ERR(board->autospoll_task)) {
 		retval = kthread_stop(board->autospoll_task);
 		if (retval)
@@ -262,6 +270,7 @@ int iboffline(struct gpib_board *board)
 	board->online = 0;
 	dev_dbg(board->gpib_dev, "board offline\n");
 
+	mutex_unlock(&board->user_mutex);
 	return 0;
 }
 
-- 
2.34.1

