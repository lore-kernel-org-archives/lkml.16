Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1770B3C38
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 00:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747785719; cv=none; b=bRUvlRNBbuShC8xBu1hZMkFRep3lw1nBTdUX7tspLwayF4acMHcgU9Qv0czAGKAR1kwOTxmMkH1yM8sSqFcV+S7QUFTlnv8OiZJ7lxS2bzLIYmK3iSXrkft1JkvZNsse9DX49sd6XF2EXWJbOr53h+7TEWrYRSYeZDSId48cVXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747785719; c=relaxed/simple;
	bh=EcGufDOm9fGFbYzvClF0fN1nkMM3LTQrZV3c1hDs6Kw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lDNv2OQIQSUfi2/ov3M/aYB9/Oyoyu9juaCFUnOf3m9wPhVbhJqcTsMRjwTwZTZfbcytwQItaytGaLFurddvDJCTi8RNATQ9jMrjH0smXcROViLrQOgYDRYgSXPmKm2Jwxei3ESnecDIuRRpi1JU0LXezTimVF4kaMtCJCvU0qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyT8S8y5; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyT8S8y5"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e7b94e38892so3164912276.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 17:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747785717; x=1748390517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mo+zLzQUmgHMc8tbg5R/8OdiMOJGR326sXoQk7Y8AMI=;
        b=fyT8S8y5p+ufc0cZszAQNFhFPI6r+9zNeeSmBOZjpAuzbmNwPzvoO5HVIREZBDCDff
         25KAwwNacZMM42g0IdglBzHPSCyApyrh/olJR5N+vHWGnIEfulNzgZEHbTe82AoYXHEk
         qduqHt8M5o9POoyIZvvUNDELQqnf3buSBvHUqSCRtE0EDjfdBwByVgjy5KZKJWpL1Piq
         RCAjiUVu9ew4js4yVbEHa9MWqlXWTGm5eCe2bCk1EIf58kRpzgCCxPvdEJE3TYXeyfPM
         V/UU77G9BeKlGGZD7t0aWawk1XQIjZMVBu14p1k9y123AuBn2yL0gXxWJ09+I1Kh4mj2
         ghXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747785717; x=1748390517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mo+zLzQUmgHMc8tbg5R/8OdiMOJGR326sXoQk7Y8AMI=;
        b=eq0lkF3yj3d2M9NYvkm9epjA68dDJGBvRvo5C7sciZoGT85OyzDQXVEDB9y4zMHQvk
         10wjohaD7N2GYR/8piWK/45trF4yqDUmCLaC404iucS37wP6Me8Z1A+SGtyqFkOOpGUu
         KW3vR2p5Va/GHzfm73At0dldkEEdecpOTAedl27Q8wx5zsKkH9bt/6cGMOG8wzJjzucq
         SSckIa8ulttBtvVTrPAoNLopD8gPh0Xd4AdbLDw/InuVzOLZIIsUjV4DnA5Jj2TtJSWH
         4xYbjUL54H02drkgLN56odPoQgDyQoX7iaUgabBjgmGDfAMIeF0czaBH/J1UU8F7zlLO
         N1OQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmnJYmE9C3ja0D8UrmS2O30nHwGZZoo+q779RofoL+b3LNEv1UIoLy6qFLHDKGp8aVYV3DmTQZ9Mot8hw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/8Pjm2VxThgHQrFEjkYvzemh3P9MrZ0kKW1g2cGZEwQW/2kk/
	cQ7nfR393tVRv5BbVDebdNEWaVomyb8OSREpGMYICg2IFxMkQc5D974PXIpfW1US
X-Gm-Gg: ASbGnctZlirX5G9FVMx8UHY1F39tX88krf6d08/UEfE8cJ7uq1M66uFMSwY39Pyjf+B
	VR3+xbg5dcwJKZCn9T8sdEAvyHbvFJnvItstGZf5AGKDLLDg+hNVbZU142/S/eNH0D112ei2lHA
	9VHwfKRSx+lHhr9AVWYqpA4jYX25OjYVPpcD3ZebN+3Tl7eMlrHfBIm2E6x6L0Jx8Hqql0qmPeL
	QeTJ1EN4Wi4livXKn011dPXlHnt5gUdVN3L4U+U0ssXLW4gcmr9B3JBmU6/v/T7dCxtuJrpyJ2r
	d3dyYthlJQseLLJMoVFvkKVM6CC2xvH4yXtIpT4dQ8Ym6L97xIX1uKxb24+vGOI3PHcFf1TykND
	6KYTcECPPDJJtPA==
X-Google-Smtp-Source: AGHT+IFEdNQ61+22MRl9RE1e9fkueHA+0h6HUofwO7Q1r1JDFjo7U6QL3yK9koCDi7UeL6aNl8Ui1Q==
X-Received: by 2002:a05:6902:2b05:b0:e7b:675b:8cd4 with SMTP id 3f1490d57ef6-e7b6a40d992mr24496999276.34.1747785716856;
        Tue, 20 May 2025 17:01:56 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.250.69])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6acb1ed4sm3631439276.30.2025.05.20.17.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 17:01:56 -0700 (PDT)
From: Donny-Dev <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] drivers/staging/rtl8723bs: Fix camelCase to snake_case style in core files
Date: Wed, 21 May 2025 00:01:50 +0000
Message-ID: <20250521000150.11659-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 557bfdf09..81f795a82 100644
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

