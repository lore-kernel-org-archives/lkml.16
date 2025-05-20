Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDED25E455
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 22:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747779978; cv=none; b=A0jDcxzu0tcKRFz8vfKYhEJrs44UwIP6g1x2crvLlXX8tDRqCRmyeSnJNoy8lWkg7pPnmoE8QvmqAl+7O9QpUXcACVS7i36uotVeR1J/ndbf9maTS7QcoJMsbsqbEBjQXhMLJeLC+o8465rgGviT9YhVAFVXJrT5qBfLs3DueE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747779978; c=relaxed/simple;
	bh=ke5omyNrzI0l7qV4J5/XFmXomN82GzQHXhmtA+xiAM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AungTzuwDyQqjOziMVzlW/Ts3YioFx4/P+gbb8LmXPYJD7TaGzSnP/wEXGUhDeEia+NyBnMF1EnaEp8R73qyLqBrTmZLFM0P6T7ntVF72dNNE5b4HZC5SztCNdPaHEheKkHxqFz1EXx/4WkqtnLPvJJg/VpjuzuaRopVNOy78zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQwGSFv6; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQwGSFv6"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-52dbcd398f9so3200234e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 15:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747779976; x=1748384776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJwLtbLfmU52rPA4RNCTMawSM4Wz8LVYGwdT9a96QYE=;
        b=gQwGSFv6dzmXTKayhwNX92pyZ0EbFZhW6t8bQBZsPpx5HZr3nb1eQtL2//Gb3aDYQj
         VO+1mZ32bDzYF3/Ka4ZQptobEgpNTF8OdOw8je/y0T/Xrbm9QhR4a0lpbTS64TCzwyAw
         lpKOySnL7tnX6bg3erBPsQ/tWmKOT0tM+kH5Wo7Nc+TeYIW98RXcSCTL6b7BQburHBW6
         Sv3jBwoYV4P665LdilDL+DkMSb7Do/VX8c+xyOWSVqJDCAjNN9Jsx6SMnyFRQnvKtiHI
         flLEsCPNKBG53OHNr0TupSYF8a4evx5DdkzRFOeqCXd1sLlMIp4ij/qrXXFKevyjhut2
         Shbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747779976; x=1748384776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJwLtbLfmU52rPA4RNCTMawSM4Wz8LVYGwdT9a96QYE=;
        b=dluimtEj5L3e6kwbo1BV6nUwPwTMx+bg8Pu0m0lInmFxKgukiWL/s8VHL6YjMdprWP
         PZtfZLM8oITX/3O1aC/9bsRuvF21kiTUk4eXKoB+dsWdDPIwYljrCDkz654L2bBHCnWo
         gfULsLTykUEccss5YoEqfiXubUDbXeV2w8Se57JPpdButQe+WhUqGEqdmvz68BBH/RIn
         /NxXu2gVj0P5Wo3is7cEsT8QfKHprOti/OMuciSZimCL0DA6URkELyQHAlxHNyxGQgz7
         VVYKYlillRPsQa90kmX78iCcYgvanllHiTMU9Zo7xB39QsWq+Y2TN8YnRCINXKSaMscA
         C9gQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeehiLqc2XQ3u9JdMq4TlxpvJwBkJvnslvpWS13/ctQn3ZAjxmqSrEfQ4UaPK7nfXaZ5njF90omQpWkCk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTx2beTZIkSWFVXWxiRfx5RGHKLLRseioZRgk13bCMavoFaxlz
	56J7PBD54qHDwjiuq2380DiGgq2N6NNAuJKFgSf5OICTl7stB2lNGijw
X-Gm-Gg: ASbGnctaHWl3MqcXcGsjAmGxaerd34zI/p9zODvv5IHZZUtzlnlOddANJ+ITgWF8qeS
	HNpGnBySEXsolim+3wuQIYw+rlrBCQIVOfm22BYi5UJ1AyNm8ODEVFD1kqCbaWPMqIjTj3cLcrS
	5VVJa3yrDj6Zy051rVpaTE3ThvjgXxeM9391pQvMVNaS6PSHYIHhBgR+uybXW/QupIXqMXJTpYZ
	a0YfOrVF07iHankq8kHrkQvhQahplLbo3dqIg1Jm3ug5Qg7tvqQv0Sarmb+9kQQBv0/x18YMkpO
	9B4GfiwL3IEIuAImOWbq7POZezC3qXNkHmuCvHSXLGjZ6MuC/ahDn0+dHkDZgsBZJboh2wUyWcC
	+ztUf
X-Google-Smtp-Source: AGHT+IHUtPC7uvSaaRwByMuWYFjZqKO3I9Swn/80Gd9jn3ae6yi6KuFnKttVHj8MuhwmrT4t+PyY8A==
X-Received: by 2002:a05:6122:31a1:b0:526:23d2:6ecd with SMTP id 71dfb90a1353d-52dbb602cbamr16911774e0c.6.1747779975692;
        Tue, 20 May 2025 15:26:15 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.251.100])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52dbab4e96bsm9231343e0c.29.2025.05.20.15.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 15:26:15 -0700 (PDT)
From: Donny-Dev <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Tue, 20 May 2025 22:26:10 +0000
Message-ID: <20250520222610.8776-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes a checkpatch
warning by renaming the function
_Read_EEPROM to follow the
kernel coding style (snake_case).

Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c         | 2 +-
 drivers/staging/rtl8723bs/include/rtw_cmd.h      | 2 +-
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d..557bfdf09 100644
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
index cb44119ce..e4e7e350d 100644
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
index 208040874..63373d665 100644
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

