Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3CD3D76
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 03:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747883748; cv=none; b=C2WNGVtxe2bgKzfCdwmwlqva2Qw+/hFHLjwZKKC93Lw/sglHjtc77Wov4uvTtPXgWxXPVjQHghP3YGOgOEPeggUDiNMXhJ01kUwmbukw+jP+0j8EmFzlbiyZPUZpimaUo4ZATFhVZ+grfatdQd/9REyGw+cb6S/EKQ5rPv2pUaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747883748; c=relaxed/simple;
	bh=SUfjdbOOyVcR4RT6XG8NltP9UmsXqUeVad+9E46ffYA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hf+HRAeGOotPGtRv6nyY+pSrdmy/sDOV+3v4rgIo1WFgoa5y0xmfFOU86cCbPdBT41dx10ukBoU0XvQ0dWvVDUpQA0cZX1+2KfAiTlDM4pCcW2kbG9cZNbSv3Dh+JezmcDAO1MONshhEu1SdF+/3Mw8OVl9oS0ekeBiSweuQm1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJ7jpyDp; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJ7jpyDp"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso6660320276.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747883745; x=1748488545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FGZNJiwtsj+St33RUlNLlL6+NdGrdiDgOvYCISmR77M=;
        b=jJ7jpyDpimW6oFJhWsPQ+zfqu3S4U3Ex/vwm0uO3LPffxp1eKuuX6R7Y85YZjJY9Kg
         6+CzKWddq0szxRmPL3z4BFEVMsD5Yoeyze+v+igQKG4pHzSkGOWA0Cp3jPiBYct2KwYu
         D4YiTnGai5CVfd3Z/YLeXzMc/SZRXUFs1Jjqf6+4qtVRFgd58uB3TKprGfkFe7EVkK/r
         rA+AhQAz9D7ADO5XxhIrIAlFIDpNizhbfmbpLuKK7ST6PNiNAc1CuoA4BcU71yZbC7yh
         LRgELZZt1PQpcmuN62ktOQ7vvoAsHc1phc4ZZYS2DvbtzUK+1B2eKobZFrGfzvPEq0U5
         loFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747883745; x=1748488545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGZNJiwtsj+St33RUlNLlL6+NdGrdiDgOvYCISmR77M=;
        b=f8mToonE9eAH7gs/BRYaERotkXY/chW87U+oGdkRyrBa7buuA+85SxGhI4sZMJdVad
         dxvcrc0q2cclMpx0TIBTpfIQFEbn4G9hC99jLoNL8YN6/F9OQRHRc9ddfxnGLHYUC58Z
         KnA9l7clo1TXEp0P0IfS8k3+IGp6DIp/sKv+axtJ/BA6YORUDu6S+NwVUvCGN/nKQVOF
         7v+QuK7x9eV2Zxu29Pxa3Az0DRzH+rsOvmTuRi+CkqXn66XudtKiClnRz3+WrY+npbV+
         d0kOtQbA3fGDbIiH3zfrzMM0tKZIKo6k/sqfiR59dmGEPveqMpkpLBAYCiHqbmLNiapZ
         Aw+g==
X-Forwarded-Encrypted: i=1; AJvYcCW2es3oS8Fy/p6OCncCUA6mHkYiRDaWXqRLdz0JcNEcRQ+KDNae3inQPIWepGyMUnYERPbZTBGxMsWpufE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdfDKQOf6eddI4uFpGjFYB6q7u/UBMFsc06bqITdlalCqsBUfd
	fh0e1mhGppV1eUU7bnbIztjPgFRjf2DfHgSuwMfg0/mWWtAEkuWMhxYj
X-Gm-Gg: ASbGncsJXGteKe9kvzUI6ogGBdU/E2hMeg68b3085CIk4IM/kw7hCD1Y4JN/l+gR+xU
	Uy04aYkAVQRNjeXnKizOijZ3alv6q8H0JKMwxsv96fCHKxrtrqUbsg/7cwuAiQchc4Z3Bbt7s5S
	+YuhQf1kmoEC2k9D/ocSRpsXeczxAHRy25Vd7vyQrLcmu8YDvo+4t0ib1xA2yHvD32NeWyDpAM6
	gg7u1h93E4tBaZGJpL7l1npHHsxBw2xDSwHZK5+bUCaVe9FksRH0slP+/Sg6ugf74ZJHMG0O5dG
	m5hs7nzMgnauuR+7/nUQiCfOQS7yfyM8MSeLoYJwuQp92I3dV5DvyaMuoHUC8htCk1L6Nkp7Nvg
	lgk8=
X-Google-Smtp-Source: AGHT+IFVVnwZhpOTSDmkV0m0hG2I0u1vD/KKvPMtol6fatoQIdDOFd8FMRcVIz3FH1QEsqygJRPqjw==
X-Received: by 2002:a05:690c:9a0a:b0:70d:ecdd:9bd3 with SMTP id 00721157ae682-70decdda059mr102568127b3.27.1747883745339;
        Wed, 21 May 2025 20:15:45 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.36.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70e0dc97522sm7227b3.56.2025.05.21.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 20:15:44 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename _Read_EEPROM to _read_eeprom
Date: Thu, 22 May 2025 03:15:38 +0000
Message-ID: <20250522031538.30635-1-donnyturizo13@gmail.com>
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
-- 
2.43.0

