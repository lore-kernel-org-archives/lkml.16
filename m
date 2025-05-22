Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0994C13D
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747875629; cv=none; b=qRd+jjfRHDMdOS9dB6N8BkQP+8hdbain6JXbFIYrLc93m69/tdZNh1AA3p2l8j/C99iE6wQOmkRv0GjvFr1h7D+/Jtet3wb6rgTUi2Hxx66v00pbvHAFMYh2rQnN94sB7xS/xjftYtFvJN2JtYNbraCX+ns26CTUqx6wRN2T88M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747875629; c=relaxed/simple;
	bh=WxIlv9jW4Arh7tSQEZ2nBzbxy3ddO06a/o6KaenAb7M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FwxdCK/mOc1BB7LWgb4+9aPlflWr4JIgsYZYmEiSldvIFmr4KACp3qIK/Q3lS6pFIxzFyE0G5UTtxFMLS/zC5oAlCcxWBe8V24yR47fWmfqb+gQFtb8qorJMlPixbkXLpaQ810dLaEzh5KZc63GRz9Nfj66APGJ1oM2qtsQHDII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cq3GEfjx; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cq3GEfjx"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e694601f624so5507370276.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747875626; x=1748480426; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=93V/Ukr46/zUxI5qbprXiqf9vu9M6wpGQ8h8nKlCUys=;
        b=cq3GEfjxBYg+IyUea8p0CxJjZGqfW4ZO39ZtH1pLwskrXfY/ownC6ffxqTuFnPBHwq
         NQ4fG8hL4xQbzKaRMUtb9XAUgRY2b6r0cZ/+7wuLY7Dz/Qjr35SVbVDxzoX37K6AjkPX
         dBXcydZ190MaIZ0u0RCxY2/+Px37REQi9gz7LOcGomcD63drznnAoWQ2hSCfbxx4Cf/S
         DmR1N6pmI3EUlOiiSXC+H67C8l5FJUtd0BaTsJcSWwx+81x7Dort5uFgMc13Y5JPHcg7
         drZ3r3eGrbX7OOmrX1KaIxfFsVRdDHUvNY7R0CaCTEH92HW+EupX/Txm0tv+1dkfpyeG
         wvOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747875626; x=1748480426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=93V/Ukr46/zUxI5qbprXiqf9vu9M6wpGQ8h8nKlCUys=;
        b=I6+ohJdGqOcpjQetpXu5MpWWiFiiOjdLN44AegaCCcR69Bxhju9nc3UHOA1Ua4uU+q
         7XpaCkrEahM9BbqmEMyWeSGfhX4+8DiTuuVt+RZanpNGVbgWSW//+H40UVfVp/IOlG2E
         DZlzPoF9o/IVGGAaI+eI6jR1jVrXw0qLGrjefjA1eGmWIWDhvR8k8I/5a30wO/G1VAeL
         XTAo4BBj9UjMOczGQv3jrF/h/XdR29yeF8iIQuH/iGiHF2P7D0pWxita7BuLx2UBwWY4
         G28m6DSeHSquX/97YlDnjJ4H4KCE0gsZB/zPB1L189O2Q41bDUNx1LBPuN7mCVwwLgio
         Mjew==
X-Forwarded-Encrypted: i=1; AJvYcCULqaCju3prRVwcHk3NcaeCXCcPDzDOgEi40za8w5/aKspd1/GTzZMtT4WZe0g8oDbZmIB/tBYtFrpbQ0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOc+14BlNEQ339Afs8LMvyJu2VveNvLA/JXoKtpfJlapd+uAgv
	lpf3+0JG8Hi0uBgg+PtfAxoN0ShiB1CZJZC2WeQlLJAexYYFSDj2EF6D
X-Gm-Gg: ASbGncsw2+PEWFB0vOo5E83fzy1j1w6Jhwl5j73Jog+R2mjg7vLoewZ8hLAsSSPAH0V
	QvpL4O1oeqY6y21d1fvbnH6m0lmOtyptN3PuIwjI6K70tTsQl4yIaJFkjgO+lpGETc8q+uMmc+F
	PwtToFm+hH+nZht911r9d/HXNYdLX6iL41Rp9l2K/C5V9iaqnN5Eqn0u/owYXo6uk8unt/tOsmy
	9PwoC/cJl/mqrBIc0F9z1PfJ4SEOsWf5WkawJ07dpLpu6YmWciWNQBVBgnpVG9xBtmFT5at/iSv
	Ugx58oFGB1CAKg7MLJs7Mrc3ANrj8sqB1enptMx7dtkIkNfCuDLdgt6YCqum6Rrf/8/ewQ+LAhH
	VUz2fOQaTL2JM
X-Google-Smtp-Source: AGHT+IHyhsF7WtWhEVCAXjNJHaUq4eRTzhpMDtt93t8UCBYD1QyzmhPHMkS7ZbzQ7J+cr63omA1A8A==
X-Received: by 2002:a05:6902:2385:b0:e7b:95eb:be93 with SMTP id 3f1490d57ef6-e7b95ebd2efmr23331627276.33.1747875626481;
        Wed, 21 May 2025 18:00:26 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.36.62])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b85b4448bsm3744771276.35.2025.05.21.18.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:00:26 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] [PATCH v3] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 01:00:19 +0000
Message-ID: <20250522010019.24779-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Donny-Dev <donnyturizo13@gmail.com>

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

base-commit: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
prerequisite-patch-id: 669780b7fd46182223f192ddc59e8fe8a549c490
prerequisite-patch-id: d6c04e7cdd735e1491a1e60522a1724b7e122af4
-- 
2.43.0

