Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F73B1FC3
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 00:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747874028; cv=none; b=H3YKVIbGKA8veooUzdwF4Aoq8+b///LYhU/nUGhL2qwc1rg7SnTHmFMeZ7crv5I1zVlBUVXjxzcgDjsmpZxzgmsGBdc3hqeIc0hc2j0OvwZddjzxIIbmnAw/v3GkKIiFXHN1ig2yfRc9q6yJYWDmjF0wQsa3pmRDrAxddh/8k3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747874028; c=relaxed/simple;
	bh=9WDWmbciPiw9ZwZ7jfIf604Dt4ZghrOpB00gmHmOrKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BimwxTxvuc30+ykHesp64+dVS+K6fRN/L4QT3Jmp+Wn1QAlWQFIH2fC3E5+O0A4e+OT/nXNUn7py8GcnBz01Q3KnvCSBxXsTHvnZ/7jMs4ni6qQdivVsbsBxGa6Nxx7ofL/4lZTHQwOXjjbIRObqWM0ewywWJFMr45WFCQnppF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e6DjtKFn; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e6DjtKFn"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-7053f85f059so64055867b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 17:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747874024; x=1748478824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5be0pJqrV4kUYpz3rwnukSBU4EkOBXt7QJ8172KXPF8=;
        b=e6DjtKFnmlzQrVYS3k6AKsHEcrzKzhMcM3Y4AcD7ypQJJMF9KNZRBGeRUFd/B5dHp3
         f40xX2a0JY6Kdf7N0nMgI5bURRh7i4243EXMPtckj5uqu6AR/jJdsQfixCpW6UDwRvJ7
         2b7vw/5xtdLlu+7Wf2FdYyT8pYo32c7y/9oJK5thCf64nX6a1pkYhUZM+ToY9sNn1v93
         jML3Oys03koVbi1D48F2RrfeofyZHdxWrK68wFNtlIFxS7Fxjd7iVwt6+AvesbGxa15k
         KaJ+3pi1IrWHEeef0rHuAJ6w2/glM/Ba0QgOaQ0xZ/QvAABupQyKW87X/AHuMQZAoFSV
         LKKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747874024; x=1748478824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5be0pJqrV4kUYpz3rwnukSBU4EkOBXt7QJ8172KXPF8=;
        b=TLTDncC0iBotw52aJy1xYhWTnp+zvk5Dp+CYFSYFPMFbIxDdeiZqTmVHu30VlGARca
         Yb7OTKsZYExLCZR+XxVdTvyNgzf2rCQgXyO/kqdmqyURApUGs8TtrpxjFaiKeoWHOerd
         UbDwhHl2DdzjVbBZFkqUzJ7g3b5RHDCFnq2QlwVzEM7L3l6I57QH2+JQBLLrXtbhpneK
         GDAzkCxDlAWWI/EdPwrqyTQ4kMHz1YK2uI3S/csT/F2flSxuNlNdKZPkAJ8TOPhRQSx9
         2PvpQ30VqFWubhB2oGYYAdNQ5Xl5J01/eYH6JRHvC+6TcZQ8HMgkYaOwv7W2cjh47vL+
         qbUw==
X-Forwarded-Encrypted: i=1; AJvYcCUE0g3+gShvbtyc8JRwqBnRnpOBp12ZxSi0Ogw4SyI6cH4Ztnxp3OA5labBD4U+R9Klwe+a5wAsXyjzHBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw62he1Gk6zoE+XRM7ERpkpkGt6z6rURcqMlgtICIz/J3tPojET
	6W02wyV2GfL33Pvv3cxU1hDjmPjbAuvNaF4ky86OJ3wT+q4KQixg2Q6G
X-Gm-Gg: ASbGnct5ij7QUdWLVfiTSIjA5PmK/ff0eWampwvJMntKLkHctxOZI9vV64AzvKm37NL
	nSOdbTXtUxpAVBdV7ciq6rXDS55e/qvBqbvYbsVbbLEn2CHpFJjqog3yCTql16APOgkmLL4MYSA
	9tZCngYqTC/6ZMyOduPwObVptFq0fkfuaXXBSiy5f7FrvwI+BdOOqfwx2lIT8GbS7kChhko8xZT
	fOf7UpGwpc5I6yGYdBp62B6ZM+j9KeGdg9H4XSDXoGBEaHXLDO6p71eFzRko3QJhsusKsnVIKrT
	IDvA/ywHOL/SnfJFkMm414MKjJYmWoiF9XrMzDN1KN4vAOZHUfLYPjwxY6HxIVQt1qf7AQ4CFjq
	UzGo=
X-Google-Smtp-Source: AGHT+IHmIwPJz79bewQ8fxEC6DnTidzwcQaEUNvh7Tm4o1r0JJ452iy88nNmcAIWXOnWrcMs1t/QVA==
X-Received: by 2002:a05:690c:b82:b0:70d:ed5d:b4c7 with SMTP id 00721157ae682-70ded5db75emr88829467b3.12.1747874024507;
        Wed, 21 May 2025 17:33:44 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.47.168])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca8324059sm28667417b3.49.2025.05.21.17.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 17:33:44 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] Subject: [PATCH v2] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 00:33:37 +0000
Message-ID: <20250522003337.23613-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Donny-Dev <donnyturizo13@gmail.com>

Fixes a checkpath warning by renaming the function _Read_EEPROM
to follow the kernel coding style (snake_case).

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

base-commit: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
prerequisite-patch-id: 669780b7fd46182223f192ddc59e8fe8a549c490
prerequisite-patch-id: d6c04e7cdd735e1491a1e60522a1724b7e122af4
-- 
2.43.0

