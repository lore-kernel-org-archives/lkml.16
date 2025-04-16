Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7D424BD1A
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 20:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836142; cv=none; b=hdp8j6aaachDHWCBqChoTVZv18L2txWVDZWbAswpouJp2hpx8khKp7Gb/FGfdnnQ1uVZ3J3j9h8Uv1HgeSgDKrF/dM1b7Ng9IZAKKhKIvSU9+vh9i5MIFuHBkJ/vYgoZ19nNh+KyKFK1g1jnfs2laHA4HbMYH0iCq5y3Zfb15HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836142; c=relaxed/simple;
	bh=qXuKC8wKMseybKQRKVoj0KYHcQgg1A92iFP+uea8iuA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N29aUIeKDLMHnie6dlH68eXqoflFELvdu7BhXC5blgvfNFbO4A/Ru2McWwjvfRMKjALes4ffrZSqm0O5sSdHss13KBbw05zK/uOrg4GqSRKWOWrExhaPThhihdw0IQ7w7US/xJvCQlt/dGhirEPUF4FqzKSkrgqTENindCZdwWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=eoPmunxM; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="eoPmunxM"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7399838db7fso114303b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 13:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744836140; x=1745440940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=eoPmunxMwBc0Y9FI47VdOcZ0hnahpmGIpHXnuJLwvSgvNhsLOANjlUa7dJa8aE1xw9
         SIk0vDCG0zsMt2cwlzZ6skrFawjl96Tk7JmpCN1wWSCxRiMjaBFxQCAdJjlcQr3TvRmR
         FBzC39oMkP7pqGmqD6o/yCmOWEc6hfDRX0I1VGuXMTJMGeJ3K/sQZwCzeM0hqtUGUoA9
         47N/jPezROJGkE57vQblL85ICYXsJgnvO9POy46WyboVJ5jdhHPBCKiC1v4RDT3mQIOK
         iW4yPWO+Y0Tl2XmY+BOGpdyRSXxoMmsfH/hq08LW6miTCOiGOqRyo56ibO5L+gFpNW86
         rBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744836140; x=1745440940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTuxdgSBH9onldJ0zjeMMUuM1GqYJzLHWyE75BJvR2I=;
        b=mNe6iITz6ndRHcR0YuBHKsORP5TPQAxbO199xwEaQ694x0l1/KroiWy0mdNaQ3lQPF
         gQ87Ma6Bv0REelf9Dj2FKpJyO8/fgtUEC+j4KxBWFIPJDWxUaqKVb3abz8TDSQcqYrvP
         0pmxPPT9HU8t+YukFgiHK8c2MWBOI+2wM+qubUJCBrcP4O2Atpg7hbdDcDMvx2f9KGIw
         TLJKMBxtsCbAA4X4/nOUMZpWhNlTw9oB3HXA3pEa603zqjCZoMDOKeAeN6GEQrg9BE/N
         iuc8yFFfuIaseBWoycArc7X9Z+5GBPcW4iXT1snHBCS/6KBI9IyfTXIwZ993BwzoTonS
         P5wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWjg16W0MLqdjuMZXAKKROZyYmplGVzxCB+QRW1Fgjut6eyMwWUTkaeSbuN4pzBJtAVMYCTwxTTGTY03kg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzxP3XU8dEJ+xBBL0ogkCixEQMtcdSeBRaqawsXfvG9lUadKRCn
	tGVKX5oeexmSWqG2AqRHrXuBpoiqVreQqjVdcIbIl/4D6YJw6ITbOYwRSJ9saw==
X-Gm-Gg: ASbGncsY5xa5o/XXYbGVAZ2QweBWRg0X+hoVp9n7oXKNOXNS6qK+sz/gfJYhVwbrqSC
	ysRqEcYfUXql0YZGd75keEJyT01VnLQmR3JsJh1Y+2451SO7jsMIK8dV/R8JbpVzasCHbZ2o0HA
	uPAFg8nrPp+XlEcL9jDWWcdp7WeS6gHCxfPaAOrA4E7LKyXF/WV/rFtyhhiUEAjJNd8hAVa25FL
	pnC4yrj298nLe7OroekN0UOn5ISdz5t4pDWf7yudFbekWgU8sreDJS22VzjQEtrt8zdMUPXfrR6
	5sZeX6GzvTR8N26r+3HcEa1Np4aXeMhNNIbSgER/zDhf+o+T0ABHDzkyIViMvFk8i8yWPutgeyS
	T+/IPdw==
X-Google-Smtp-Source: AGHT+IGRy1yX3/hgyibQ51xQgGHxSxovAxyZtRPcAb1wo6YzYcR8ITRaS0eVJ6jgzVzyKvovKr4gXw==
X-Received: by 2002:a62:be0d:0:b0:732:56a7:a935 with SMTP id d2e1a72fcca58-73ce5544dedmr380527b3a.12.1744836140526;
        Wed, 16 Apr 2025 13:42:20 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21e02fasm10803980b3a.81.2025.04.16.13.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 13:42:20 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 11/18] staging: gpib: hp2341: struct gpib_interface
Date: Wed, 16 Apr 2025 20:41:57 +0000
Message-ID: <20250416204204.8009-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250416204204.8009-1-matchstick@neverthere.org>
References: <20250416204204.8009-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 5ca0bd2f1a08..1a32a2cc421e 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -411,7 +411,7 @@ static void hp_82341_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp_82341_unaccel_interface = {
+static struct gpib_interface hp_82341_unaccel_interface = {
 	.name = "hp_82341_unaccel",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
@@ -439,7 +439,7 @@ static gpib_interface_t hp_82341_unaccel_interface = {
 	.return_to_local = hp_82341_return_to_local,
 };
 
-static gpib_interface_t hp_82341_interface = {
+static struct gpib_interface hp_82341_interface = {
 	.name = "hp_82341",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
-- 
2.43.0

