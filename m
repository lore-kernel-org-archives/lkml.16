Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D810ADDAB
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 02:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747880252; cv=none; b=GObUU55GNphiO/9Q6i/EKUe0e1WoGwn1utarsV8QY30BRfH5RTCRsTepgbUOalSdXB9w/fyiKtsaPBordIYEI4mXbR3SIaxgYBJa8l/fZMqs3l3ngq2jUeTCSTLXWG5xUIraZXW69oavj8B7xB7+Bz+A4PQXQ3oxV17RdgHkIDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747880252; c=relaxed/simple;
	bh=QGo1LBga1vpUEKc+8qjsPWTMysADMWrG32qHjuDbXb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LBbIiz/NhO1QnM2y9ojdJOirIZUf/6mF7+M4tHFx/xr6DXuioLTqO4K1Q7HmzylQD6WBfVCr0leSUwzRifPTOTx+SX8rbHU0TrJ54xpCNM6fs+wpGmI69v/x1ZtCbb5fl58t6Xoo59DTobBwnaMrRqK3vlqtu22Lco8AElEzuuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FrFIXvN8; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FrFIXvN8"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7b8673ff36so4985563276.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747880250; x=1748485050; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WDr3eISUVPW2GSYKg/ARqYypW2g9PgYCPGEerPGGiic=;
        b=FrFIXvN8zj6L3un0cy6DBXC9MxCA3MnhONJvCTejw7T78FUbnTsMtdNrhVLeO6KMyT
         QJG/ey1+2VEUxDJeXLXRvcfdMu2aO9MJzpKxuf49F1WfjShDEmy1y9nhP/htnirKpo+Y
         whTucL+sgjNSYQ8YW7jr2PWDrmAeeaGpadMO2MhVqgq8bylqkU6wxAGWpcRk4EZN0Cv0
         dhUH1PfenF0tgNgvXmwbytFqH08GFrvn50uFFC+QN9ANMCxVqnQ+V+Yh4I+gCXHE2/5z
         FLz3HeQDH7gwK3eTsnpNHCCLIt+H/Hph1AA80sOTxQtq2FVQPwTqIlL0LJ+qzgE+VYl/
         NFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747880250; x=1748485050;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WDr3eISUVPW2GSYKg/ARqYypW2g9PgYCPGEerPGGiic=;
        b=ju+ySIdsUz8BzLMs5sm8xV3rhOGeDpdhZhGm/6fepQK9q5etiqzV6OacvYl1/lvDyd
         mcX3C9TTRPpr7HCRAoEpscdJxsGioKmkomecFjGhnGxKySrintCR2tqgNAt/7nncKCnh
         pxe0y1BqKnw0r64m64vgNOZVvK+Tc9mvJxL+jo+iU7HsYtfStbIGEsoTBvBwqqiHAldU
         uY1WeQfM2qWyk4UHfZb+5tJxCodDjK4XdLEyXRzDQrYg9VEDPpEX0bpogLC1Xppt2OhF
         FzLlO5qr6yYm4x+tgNpk3IvvjvQuBStbRGmIOMHQTWoNlHFNk6ROJUsaDnQXAsWbFOd5
         LYKg==
X-Forwarded-Encrypted: i=1; AJvYcCWrweo3vtTJOc8++bH+a/D8PIk26xsaaPR/0HeIHVEcOXmWApaPc9vK8UjPrrKwYiGb2svpp3KM41syI7U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyGZJZcqT55t0umchhwk9ypAVbSnWqNBjHHUfcjT6n0Obu5kHC
	HcVVeH9XkP70pfxzwGeY9LE+o5yMQV/7yGw7KSgBy08gp9Wd0ZDUNSTi
X-Gm-Gg: ASbGncs2s+Ic8EGn8afkIz0POQ/fRixM6bRXnFnHnwtDhR9OaUu+u2NeYfuJJg78d2m
	OlLnCw7Xs2is764OxuVS8L8TKyj2yaCrVwna0b2jvD8a1c9RljE8UaOkntE7MKUns7gdGHD2giI
	Kvg/eLGWYmNKOaIAcWBr/8F5vj6zeXdFvB9Te7X0NqXpij09gVLvP6KPTOFt8GIpT0vsMMPEOXo
	yGpUR1bxxeUcBWPnb/OcU0o+a0coF7S41Pzv3lVRnD1B3cGqNCwYGZ/44GIEBOgN4tRsOWr80sO
	YRbWiZ72KBgmCNJGwi5fWgMZjhFaqg4Z60BhYwk/dN3ueIVQv03N0ARxpJN5MwGuSkpCFldoMiD
	CNIY=
X-Google-Smtp-Source: AGHT+IFMHQ9v2R61v5zZ2TO7ToSlglABVgGGVkYA8Vyhw+Z6nBks3GAw2e0C0fTNlgVAx5EORt3hSA==
X-Received: by 2002:a05:6902:6c12:b0:e7d:585d:6aac with SMTP id 3f1490d57ef6-e7d585d6f25mr8408781276.39.1747880249710;
        Wed, 21 May 2025 19:17:29 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.33.198])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6adaa721sm4365837276.44.2025.05.21.19.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 19:17:29 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case style in core files
Date: Thu, 22 May 2025 02:17:22 +0000
Message-ID: <20250522021722.28178-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Donny-Dev <donnyturizo13@gmail.com>

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 437934dd255e..49bcefb5e8d2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -9,8 +9,8 @@
 #include <linux/jiffies.h>
 
 static struct _cmd_callback rtw_cmd_callback[] = {
-	{GEN_CMD_CODE(_Read_MACREG), NULL}, /*0*/
-	{GEN_CMD_CODE(_Write_MACREG), NULL},
+	{GEN_CMD_CODE(_read_macreg), NULL}, /*0*/
+	{GEN_CMD_CODE(_write_macreg), NULL},
 	{GEN_CMD_CODE(_Read_BBREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
-- 
2.43.0

