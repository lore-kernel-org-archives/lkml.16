Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7859418DB18
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747885814; cv=none; b=LqdV1yzQwBD4GrOLKEe+dvVjZ/7yL3rA0rZEagh/aoyBu8D9O/HV5TMwQCrfKk29D4/YfRVfXFGAcfbNLWazLwc4s96CqVIiYE1X5uLSWXacqfl2FQwEHARmsEHiBUMmK8LNEvbJRicsu1jM18LtKvTFa6DRzc3fo/YNCIwgoxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747885814; c=relaxed/simple;
	bh=EhCHW5q0cCFKGYwmnE5zrblG2aU/eCsuzx+ii1jY4aA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ehPdtJjhP9CTJFc5QvdhiIVwc5T0g/HD1jpZRBUttaYKJ6lpVXg7OKWZHno4yr+003CptYt8sYBE8k3wtoHF0fpx7Dwr8oL46WzLt1RaqLK3DtyZcNepQVgfO9/Jf9bWPw7cfTHKQbG7Ymz6fsz4J7tCS55uyQtNcJ/gSAsw/6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UNRu+7h9; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UNRu+7h9"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-70df67e1b17so13454437b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747885811; x=1748490611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=arxJV0GpiWBI5/UzljfX3wVd+ClYz7zCQj750146rLk=;
        b=UNRu+7h9CRBT1XlL+EYkx7HXWmgy293vnZrTkc28Y/pSBHKjJWv8DnQH13isfiYpTE
         l6j7Ed11O7HTeBAzHxYoTWNc6t4XuE+geZ83BYEvGbyUi8O8RDXfe86tSVFRbdWRmfwV
         XaZk24oeyYmRtsIa7LuCzaiHgcoYbF0GQtg3GhfcwkmXIexmony223mVs1B1NVzMJk0Q
         7KEGkdR+nTAYa4GMH+Kia2v9l+S8hbALueQty93c3ThjcCHBw6xGcFkCFVTBXn6+rLCJ
         ctfsg7c2b5weutuFs1bmuY5WFjAWPK7Q0PG5/OVmL3jysFb/CJgdsnB4xCTivIJ6qP5W
         e76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747885811; x=1748490611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arxJV0GpiWBI5/UzljfX3wVd+ClYz7zCQj750146rLk=;
        b=u250ZGwntMKS+WrNydKyz+rsfVZk/kFYwY6buhJFRiYYCtcW/GCnLmflGcgDmL68zA
         u+TVKRl7RcX5xha0iFBZXi1fWC5rPO1ioDDnBwDmT5/0ElvveTzM4GLrmoxVaWmIfT5g
         2K8gkf1pfj4xH1IbQ/LlbHQLNGpa4/tzQ9QGZp9G1ZT8VJy5bsv233hxdoABGhNGhi+U
         UPbHw2LJSKCfPwhtktCz2ntFDHRdZrH+66loCiBXJ1sOhSTrdsXD991X99yPCJKTq3WF
         /Zjlcy4LaWH7gf0a0XqbPxnpBkWlGGAUQ6ckWjVIqpUruZy3g81n7PdDkJdUj/dxnwv6
         Ym3g==
X-Forwarded-Encrypted: i=1; AJvYcCXsu5BYK9bSYhAEfWOkRQbaWksgHCJ+uNBLxiwmqupO24cDxFX10Q3UEDcMmSslgbb4N6Lqa3oynXTMiaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMIOZVNvOF/JxNhBJOdfcf72jKZy9fS8b55qaazWFrBp4LPaMj
	vRXEleVLkt+usSOvtYCurcrU1gzfVMPZ/tp+o1P+MYVRAeKjiNjTi8A1tzQlCzme
X-Gm-Gg: ASbGncsBlKSRL9FJD2VbGgLb42u/lm8UWGBRHuiHBsgRwBobONBLIDV1SwZjhthFih6
	aSeIgIEjKf1emMBwTIM8nLRKqNwfp7FDo1hPrxOqqo6ysMnq1TE1lmmaxN/+SZunXpscpml9iI/
	ukCyy/AHUyJh+obKGnrJRgbPkM/jeMhQBu1LGVJqPBk7M/BoQJ1EU8W3vxvfMcGFaZ5VWTFaF3z
	EpdwFz1MtChv9kK8GKaBe77VsCkZLA7Qmw5z2NuoPB/YJmHLOuphm4LpUWI/EvAYBtjzL2yuolA
	hb+MaYdLvDHQk4Cw+CMvQwx+upfx+y/iJG5W0UMTqm+Rxx1Lf5risDQSzKezXDRVmT26nsnTP82
	42y8=
X-Google-Smtp-Source: AGHT+IHoo/G7hIzty2H/6gOon8Xz+U/wkelfdv6DK4y23vQrHuGLtdPz4NySnwPueu2pM+YzjFbhYw==
X-Received: by 2002:a05:690c:3390:b0:70c:9364:2c61 with SMTP id 00721157ae682-70ca79bf741mr308111097b3.9.1747885811328;
        Wed, 21 May 2025 20:50:11 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.43.125])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca8362faasm28876127b3.62.2025.05.21.20.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:50:10 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 03:50:03 +0000
Message-ID: <20250522035003.32314-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a checkpath warning by renaming the function
_Read_EEPROM to follow the kernel coding style (snake_case).

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 49bcefb5e8d2..a0b85beffe5d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -15,7 +15,7 @@ static struct _cmd_callback rtw_cmd_callback[] = {
 	{GEN_CMD_CODE(_Write_BBREG), NULL},
 	{GEN_CMD_CODE(_Read_RFREG), &rtw_getbbrfreg_cmdrsp_callback},
 	{GEN_CMD_CODE(_Write_RFREG), NULL}, /*5*/
-	{GEN_CMD_CODE(_Read_EEPROM), NULL},
+	{GEN_CMD_CODE(_read_eeprom), NULL},
 	{GEN_CMD_CODE(_Write_EEPROM), NULL},
 	{GEN_CMD_CODE(_Read_EFUSE), NULL},
 	{GEN_CMD_CODE(_Write_EFUSE), NULL},
diff --git a/drivers/staging/rtl8723bs/include/rtw_cmd.h b/drivers/staging/rtl8723bs/include/rtw_cmd.h
index cb44119ce9a9..e4e7e350d0fc 100644
--- a/drivers/staging/rtl8723bs/include/rtw_cmd.h
+++ b/drivers/staging/rtl8723bs/include/rtw_cmd.h
@@ -636,7 +636,7 @@ enum {
 	GEN_CMD_CODE(_Write_BBREG),
 	GEN_CMD_CODE(_Read_RFREG),
 	GEN_CMD_CODE(_Write_RFREG), /*5*/
-	GEN_CMD_CODE(_Read_EEPROM),
+	GEN_CMD_CODE(_read_eeprom),
 	GEN_CMD_CODE(_Write_EEPROM),
 	GEN_CMD_CODE(_Read_EFUSE),
 	GEN_CMD_CODE(_Write_EFUSE),
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 2080408743ef..63373d665d4f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -684,7 +684,7 @@ enum {
 	GEN_EVT_CODE(_Read_MACREG) = 0, /*0*/
 	GEN_EVT_CODE(_Read_BBREG),
 	GEN_EVT_CODE(_Read_RFREG),
-	GEN_EVT_CODE(_Read_EEPROM),
+	GEN_EVT_CODE(_read_eeprom),
 	GEN_EVT_CODE(_Read_EFUSE),
 	GEN_EVT_CODE(_Read_CAM),			/*5*/
 	GEN_EVT_CODE(_Get_BasicRate),
-- 
2.43.0

