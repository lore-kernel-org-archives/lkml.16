Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC96829CE6
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747790047; cv=none; b=MwrvVBc8b/tP/hlqHCr6kX1q9+Rgu+OQJSrojZjpZb/mT6pOLvJU43gMhPLjlVypyec+av7I2MXC4q6cc0HPD7YipI711fOtJIKAfLS9y5XNlV8bQ/3f64o+hfPTu4VXMEmo3o12LfcygmujvmA1ylUlhmbofGzGSG+yVxK791M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747790047; c=relaxed/simple;
	bh=qMJ4csJg98ZhrS7WlZUwdUP2evzFFz6V0gihixsQJ0w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZsxvWOnJ+7wiuauQ/1Y0no0fbnz3z+FAbmt0RHmdiw/nGUJgmBb9OPxXa6IiumKpFvzTGJbZgBEeAFZYMiX9uzLUp7Roy23l4lDZwVGSPhHVsX9pDAVNTjHUvsVMig/vY01BCie6SkYtpCPrDmX0c1eyCqhMoRZKFazwk2aXJds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mAayhrk/; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mAayhrk/"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e733a6ff491so5824916276.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747790044; x=1748394844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LmjcNigsQVjEpA2aug+Qo0lMaEy+M1lUuYFlaoypoM4=;
        b=mAayhrk/4zGdM4sYwTCa1k5ZG+hj94SUGjtQPxGNv8wWA8PlGzJx9f3F78BVne2wLH
         2ZWWAA9wYGG4bdgpddIahkp+8wO3EPQb3znkhLunBEwIe/E55FVrxX/zolwFxxb9kbL1
         W5e8Zt+Kk4gY9W8hmdWjtMI9OBL9MvivIEWcAup2pImvIDqV8NDtbMKaH5ggOfshnjxn
         OTxJMF7ARbTpJQub21gKZaNBioMSibVOOwbPT9gdZCdZC/yyaW42xiUjafxtxmJvuWz0
         ttTd23SgbZbEGapEuUkWXIlZawNwSdO+j+bcITAkdx1Y0XOAgH7HYK6MisnDSvjz5EqD
         4z7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747790044; x=1748394844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmjcNigsQVjEpA2aug+Qo0lMaEy+M1lUuYFlaoypoM4=;
        b=Zs8cmzNoJ+qUByZYi9oApRwjLrMTjcN8hsumay70EpJoHBzG5TLocFTCdgHDyNvqne
         ZreMaf69uuQ9OOQ4SvREGthAaywp7ywvf34Kz/cltgeAkvSiONZWk89in6ksN/5iGZa7
         X+YyF/0FQAC3Wl2HWH+6mlM4yjQ6H4hl38WxlvRC9y9fuv8HvPEpQIEvCWsFa3ARtQJD
         fGVkjboddzAR7eaL2e2BU3QUaE69ARnmZeAXdOISW/nf6kZcQjS9AtsxIR4C6nRAmlWc
         XhAc5x+EQa/1+4i0Y2kG+pajgBy7aW6ahZahboeD1xgEsvgPkxWiG9YAeU5sRXLj2jMC
         P1JQ==
X-Forwarded-Encrypted: i=1; AJvYcCV53cguh+2y3AvIx5Yb01PLPNWel6zrqlawLv0DMcOlqVPspyc0bv3SXrYEOfOicdpMiSldshmOT/43tEs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx5qDJJdB+vuIc6OEcL1ECqVp4fzih6JYNjHGjsSM+U4DbXYKF
	f4tJtKCwYl9h39Wq35rJKcmk+XtT7DmcDd82ywOBvP6XYS54Qf0xTZjb
X-Gm-Gg: ASbGncvN0M3iUyZ4dZt2T6Zuk2oVebI38PZkhb+3zD2qM2+eKR7Dtgv728S2za7NxLz
	bhq/Nk5STDT8FKy9btUDJNje8qBhQ2K1JaazgauOGWpopSAMJVCKzFS5umdaKnu5RGNvZFwBzdR
	cZEyTVSlTRnWikvR+q+UhfVlFjBDQwnaWtu/1yRilBEHLavkwYPFwa+pZSdyZN5Lhddy5Wn5c7u
	I1jLOTZxw9wBUEKtQZXCwVuPWTXzjsxg5/8MLglBouU4dQOXTWX5e3NyVlFNqw3aQNMozz6R2px
	lG0dxhJq6kd5qh4XVHrBNPGuwLuDbxY2LMPtGvM+YIwjmo2zUSqmHgqJdawyJPPXbkM4/5uu4C9
	8ZXMB
X-Google-Smtp-Source: AGHT+IHIlGV3LSOYT7VSOxIMNzfi5TeysXDt8zuB/Mhjo+FxH8UcsBWqFSIsousT5EsdwluKCoyYVw==
X-Received: by 2002:a05:690c:6e10:b0:708:ca91:d583 with SMTP id 00721157ae682-70cab0b8e9amr254374177b3.25.1747790044448;
        Tue, 20 May 2025 18:14:04 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.251.100])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca852d92asm24633917b3.110.2025.05.20.18.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 18:14:03 -0700 (PDT)
From: Donny-Dev <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny-Dev <donnyturizo13@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
Date: Wed, 21 May 2025 01:13:57 +0000
Message-ID: <20250521011358.12910-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The variable 'ips_deffer_ms' had
 a spelling mistake ('deffer'
 instead of 'defer').
This patch rename it to
'ips_defer_ms' to correct the
typo and improve code clarity.

Signed-off-by: Donny-Dev <donnyturizo13@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index c60e179bb..90e50bb9c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1010,18 +1010,18 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
 /*
 * rtw_pwr_wakeup - Wake the NIC up from: 1)IPS. 2)USB autosuspend
 * @adapter: pointer to struct adapter structure
-* @ips_deffer_ms: the ms will prevent from falling into IPS after wakeup
+* @ips_defer_ms: the ms will prevent from falling into IPS after wakeup
 * Return _SUCCESS or _FAIL
 */
 
-int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
+int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_defer_ms, const char *caller)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(padapter);
 	struct pwrctrl_priv *pwrpriv = dvobj_to_pwrctl(dvobj);
 	struct mlme_priv *pmlmepriv;
 	int ret = _SUCCESS;
 	unsigned long start = jiffies;
-	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_deffer_ms);
+	unsigned long deny_time = jiffies + msecs_to_jiffies(ips_defer_ms);
 
 	/* for LPS */
 	LeaveAllPowerSaveMode(padapter);
-- 
2.43.0

