Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DE3292926
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524602; cv=none; b=GaIGV7r8tCmSI8JAVlpsGnAs/RtcOg+FIS666sbtxg9V3KuS7BEW/so73XFB5xtf7ra0A4SQa65LAHlB88O1fuvG8XhRk8tHsYaN7U9nUyXnaEqKAHb7v/ueTihBBxCLM53fhKTf2eY50VgCB5KY+F8LfyqErzflBdIIwZPjmTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524602; c=relaxed/simple;
	bh=c4CUo+/JylgmaihWgYUtHXSPoEaVeXvdhre1BrOseBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OIKSCmER0RKoWUt3HocZOhVtXIcYclYvyhUfVc9+w0VeD8R1rLx/6QjdYq65VK1wIbWasntlNLnqIVhKqAwiJiIzcKb43xlqQe6pTmtqZiIh7uMgB+Y7Hy4IT5hGXmXr91ZbtyfE3oXQ+L4dSkJ855CRAMvyQ0LZPU0Ljc59Llk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XEruWkRn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XEruWkRn"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9944165e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745524599; x=1746129399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNsyCS6OEhFOZzOuI2mbWi5oCCOoIo6/OBcXxx1IRf0=;
        b=XEruWkRnmf7Sg0zg7zV3pLEWMizUtka/YyTmxRlYmoHiHBSDimoJT548DK0wc0YO65
         BR4DWFMl6VPvs6tWlXKrJG8EUhot59WqDL7s1a9Lf2q3yHPGsVf2245ZfhYqgrdhzxrq
         TzlKHSJDENOwdXAqoUeaJQpaYaUhuvBg7Gm2l0JA0lBGleukN4Z/JxyrQGN3uvg39O3T
         xopU8vL47Xs8uR49IpFSDS0WvDaDA1YmTiAp+39yEhPsTne2amGILgWuqrPvtS+TaxNZ
         jY4hj/XUDi20tQr4y12b/O1XblhDItQGHqCCJlWw8Og0L1CSwwRd48RgRstNiODaGywN
         f3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524599; x=1746129399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNsyCS6OEhFOZzOuI2mbWi5oCCOoIo6/OBcXxx1IRf0=;
        b=QccDdT8v54vJDKHeKCRmVTYogVAMmZcLxcwQoq28VCe6803HVYwb5Qv8Jt3NvwLY1w
         /c/swApDH+WtXjdtrKq3k8o9Hgn01k4TPo5aoS0TnteuIWIXwEZnH8ieGY2M2WnL4mG3
         /0xwVoyHbNkRYcBxpJCoP17lGs5KZIfRkoyMVfOdSOE4xsNxfQMS48NCDUbsn50J5KgL
         Me4Xs3gYA5StNk2a2xN3KSc/wxivXBokKynJAUh0iUEOVVQq4wFJhB3tdxzCjQA5JL9H
         VFZwPJMhtkIFj3TtHbnVQfx7Xksm7nKiMZco8Y79whS0YjeCa06jAEMpOG4BmQ7f0rbH
         U+Yg==
X-Forwarded-Encrypted: i=1; AJvYcCUCVFcke0Ap0ykk6jXcmtRknihZMd4E2bdY05sTCBZfl3LLTuEnhqH1Po8dAwmUeRQEQOF3oGpVGSKaj48=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSOBzF9/MyHWPNOGBNmwRuOrbZXSHxMHDH82HPYt2+TdPxPyy6
	QhsIPXnL20Okpv+2bLbTocURF3EtBZGXHsmKUDocYAZ84MpUKuLW
X-Gm-Gg: ASbGnct+qYAGdAUHsl0lSYweoziTim0A1nF0zfKN9g0fhxYdR9650JLrFxs37mIcJlw
	l43FQ+n/nE32jTCpOcHCkBZfDCBjafO+M7K9ank1vFUVZbUnvVgOWUmxWN2jJ7lVwVczMg9jyYr
	phaRi7/DFN/K+bsEa4NgbUJSIPug41Go+Cng5erEuWVnYnOT57uYCK2hJTqSyKAGzddYmyq+/78
	DZfQGYLO6r4WElVtyQK4WU50NQUIRI1Q3iE00Bhm1U9CT1dasPyWt290y8vdh59IG1jeC2F6oHf
	EFnRQ5wwU4VPZBWg6er09cv/aSSr5JT2Ir8B6Q==
X-Google-Smtp-Source: AGHT+IHFi0zUQkJRZ2PdmOlKL/x6paZBuwZj4y+qAl3g29wVN+gHx6m2fnhq9wVmqRu3TlUGrX43iw==
X-Received: by 2002:a05:600c:3496:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4409bd18487mr40086235e9.14.1745524599090;
        Thu, 24 Apr 2025 12:56:39 -0700 (PDT)
Received: from pc.. ([196.96.160.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm32385865e9.31.2025.04.24.12.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:56:38 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: Replace manual mutex handling with scoped_guard()
Date: Thu, 24 Apr 2025 22:56:25 +0300
Message-ID: <aad62e2a06ae0a24c07a83649fd6025718849f78.1745523325.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745523325.git.karanja99erick@gmail.com>
References: <cover.1745523325.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace explicit calls to `mutex_lock()` and `mutex_unlock()` with
a `scoped_guard` block to manage locking automatically.
This refactoring improves code safety and clarity by ensuring the mutex
is always released, even if an early return is later added.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 946511793c08..d018d8e0bf4d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1404,17 +1404,15 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 	if (hal_btcoex_IsBtControlLps(padapter))
 		return;
 
-	mutex_lock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		pwrpriv->dtim = dtim;
 
-	pwrpriv->dtim = dtim;
+		if (pwrpriv->fw_current_in_ps_mode && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
+			u8 ps_mode = pwrpriv->pwr_mode;
 
-	if (pwrpriv->fw_current_in_ps_mode && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
-		u8 ps_mode = pwrpriv->pwr_mode;
-
-		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+			rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+		}
 	}
-
-	mutex_unlock(&pwrpriv->lock);
 }
 
 static void rtw_dm_ra_mask_hdl(struct adapter *padapter, struct sta_info *psta)
-- 
2.43.0

