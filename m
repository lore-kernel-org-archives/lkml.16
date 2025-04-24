Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658A0293B45
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 19:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524609; cv=none; b=duz8FHrsyeQyxty3bGOJzdvWiV2t53BSHS8CkmqGxz+umrrzQ0J9bw4tzHd4qPYITp+mlL9r/Gs/UbMRYKilt6emaOeHL0DKXnV+ya664CRJAN2D9qysvXk19xtZ972B5OX0/tqx2Mxm3fZ9PDe1M/pbGUPOCrpKb8PqudrVWrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524609; c=relaxed/simple;
	bh=h2xLWijHqsJh9aCM5jzbFrl2+AYQJ6rdD8ZscR+zgn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TWB5/2cFOhgAp4EtlLP3+g8JazJ7eFunQS4oHUTWWgqPUwVIO81ZoPwYC090pA8f15U0Ye71TR6GNrrRrd914wbF6/etuxMBM77JMC5c0BivMFHofgKbGLdZEXYdTGaz8dIbCxo9GLYU+T4GsCe+ekzRR2y+jQQqoCIkd5tqtpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnvOQ5+j; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnvOQ5+j"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43d0618746bso11278395e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745524606; x=1746129406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3iqalMRN1Too28MdqO5MJFFqCooDYv/cQAN3f6XGglg=;
        b=mnvOQ5+jCn/vwMZxzalkwExWtTLEIFjjYGJ4B+1mbiTAiC3EC3hYIgK0Xo9pk3/juD
         qxszY4f6IuzJz2elQPoytAG3jEmJKo5tJBFjHu+It8KbcF4ZS4BdVzzbPtMU/Z3aupSs
         C8cvr0GQ8bFmXSJSCw9EZemAR3yvoSb53hCqjTMQAA2ahsz4KsbSx8ds6EQWe/jnjLFv
         ZPnGpHQOkMPng4NSMzfPxGB3Cdw/xQExYCg/8zTdfH02sBThPzSzaGRrBBohIswkzB4Q
         BSBWvjvtd7Lx+6+Aia14cXZn71+SCc8rMeJ3h+Ix/jRKKUWGj/TG8WIyO0amYOv802sV
         x0NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524606; x=1746129406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3iqalMRN1Too28MdqO5MJFFqCooDYv/cQAN3f6XGglg=;
        b=AgFzxFmNpQYRRZNaN5Ezg/gF2CUxIpzILPZptIw4DlpQJ1jhA7Y45btmVB2OK8RCyQ
         +Ifpn8aKyyiewigKnmyzrZ5LPSATHzdC1pHQoc/dStd4QFnpBwJ3RO/H02jSXEhaomUB
         pzpsiSJdqhk6EZuzvcer+WM6rwr/M4Wiwf5mnZ4liGCG2hYEtXi1mZ7oIFK/OTrMg8g+
         uhxd3EGkPgDeu0ObCUyVAqnTX1dtMVgExIYGKtggoonUwIO71guNs/Bz5Eg46AqJLwIx
         tCR0Iaaktrx/stEbeXU2iC8JulUvpzXzBDV0aZGCvcLtsbQilAc28ypYLT4ew2jaj6Ye
         HosA==
X-Forwarded-Encrypted: i=1; AJvYcCUDXCXISVAybzHAukXPEcsUbLAjKjE8z81q1Il8qyjbmGuYB3FBNhSaKoLlCgYnRCv08wOS7emi38GMdkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6VI159dvaIOAF0GorlJaY4FIsv/fSh7+uw6rvs59BsRBNFj5N
	gg+RBRuhEXLVphLVsDZFcqDRpEjChCBP7CQ9Q1N5ClpH8fj4drlP
X-Gm-Gg: ASbGncu7ap9GqLFMaXqNJ31ul8Kbh4QPieQc9jW+N7YskI+5CbVH+dAFMHP+CZsjp8u
	o1WDAFWmGYs4v+f13nTtqleP/V7HBwc9I1TPk4cqxm4N5J+ycEk52VTKWnmi5wLZ4CGIfNqvidC
	djTl6KF0Gl9Ke4MQVStQoBuOFtPNcnwpop78Rvgmu27pRNx6K4NG74F7l4BUyMnCLH4JiwtKu6e
	0QMY75NCnhJC1Al8M0blIp5Lx8LzegZ9x34aiCoX+Axf5zdGWckiLCJUkEMWMCFHZveUcmC6Efp
	uDTKKFZFSxHXsMO65qNhBH3UpORemjikYSegOw==
X-Google-Smtp-Source: AGHT+IExC2q4mO+fw159QN/Yjr1iCoX4oGeYYkxFXi5fVEEy/XwZMeNXuIoCI4cNamXLAMNHvmb9pQ==
X-Received: by 2002:a05:600c:1912:b0:43c:eea9:f45d with SMTP id 5b1f17b1804b1-440a310e4cemr7584505e9.18.1745524605429;
        Thu, 24 Apr 2025 12:56:45 -0700 (PDT)
Received: from pc.. ([196.96.160.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm32385865e9.31.2025.04.24.12.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:56:45 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] staging: rtl8723bs: Switch mutexes to scoped_guard
Date: Thu, 24 Apr 2025 22:56:26 +0300
Message-ID: <b9ad5048b70a5555c0921278349f07e77729a1d7.1745523325.git.karanja99erick@gmail.com>
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

Replace manual mutex_lock/mutex_unlock and goto-based cleanup
with a scoped_guard block. This ensures the mutex is always
released safely, even on early returns,
and removes the need for error-prone goto labels

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 281 +++++++++----------
 1 file changed, 126 insertions(+), 155 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 74a8fcf18e84..a38db840ab47 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -40,9 +40,8 @@ void ips_enter(struct adapter *padapter)
 
 	hal_btcoex_IpsNotify(padapter, pwrpriv->ips_mode_req);
 
-	mutex_lock(&pwrpriv->lock);
-	_ips_enter(padapter);
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock)
+		_ips_enter(padapter);
 }
 
 int _ips_leave(struct adapter *padapter)
@@ -72,9 +71,8 @@ int ips_leave(struct adapter *padapter)
 	struct pwrctrl_priv *pwrpriv = adapter_to_pwrctl(padapter);
 	int ret;
 
-	mutex_lock(&pwrpriv->lock);
-	ret = _ips_leave(padapter);
-	mutex_unlock(&pwrpriv->lock);
+	scope_guard(mutex, &pwrpriv->lock)
+		ret = _ips_leave(padapter);
 
 	if (ret == _SUCCESS)
 		hal_btcoex_IpsNotify(padapter, IPS_NONE);
@@ -144,9 +142,8 @@ void rtw_ps_processor(struct adapter *padapter)
 	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
 	u32 ps_deny = 0;
 
-	mutex_lock(&adapter_to_pwrctl(padapter)->lock);
-	ps_deny = rtw_ps_deny_get(padapter);
-	mutex_unlock(&adapter_to_pwrctl(padapter)->lock);
+	scoped_guard(mutex, &adapter_to_pwrctl(padapter)->lock)
+		ps_deny = rtw_ps_deny_get(padapter);
 	if (ps_deny != 0)
 		goto exit;
 
@@ -348,53 +345,51 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode, u8 smart_ps, u8 bcn_a
 			return;
 
 
-	mutex_lock(&pwrpriv->lock);
-
+	scoped_guard(mutex, &pwrpriv->lock) {
 	/* if (pwrpriv->pwr_mode == PS_MODE_ACTIVE) */
-	if (ps_mode == PS_MODE_ACTIVE) {
-		if (!(hal_btcoex_IsBtControlLps(padapter))
+		if (ps_mode == PS_MODE_ACTIVE) {
+			if (!(hal_btcoex_IsBtControlLps(padapter))
 				|| (hal_btcoex_IsBtControlLps(padapter)
 					&& !(hal_btcoex_IsLpsOn(padapter)))) {
-			pwrpriv->pwr_mode = ps_mode;
-			rtw_set_rpwm(padapter, PS_STATE_S4);
-
-			rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
-			pwrpriv->fw_current_in_ps_mode = false;
-
-			hal_btcoex_LpsNotify(padapter, ps_mode);
-		}
-	} else {
-		if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
-		    ((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
-			) {
-			u8 pslv;
-
-			hal_btcoex_LpsNotify(padapter, ps_mode);
-
-			pwrpriv->fw_current_in_ps_mode = true;
-			pwrpriv->pwr_mode = ps_mode;
-			pwrpriv->smart_ps = smart_ps;
-			pwrpriv->bcn_ant_mode = bcn_ant_mode;
-			rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
-
-			pslv = PS_STATE_S2;
-			if (pwrpriv->alives == 0)
-				pslv = PS_STATE_S0;
+				pwrpriv->pwr_mode = ps_mode;
+				rtw_set_rpwm(padapter, PS_STATE_S4);
 
-			if (!(hal_btcoex_IsBtDisabled(padapter)) &&
-			    (hal_btcoex_IsBtControlLps(padapter))) {
-				u8 val8;
+				rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+				pwrpriv->fw_current_in_ps_mode = false;
 
-				val8 = hal_btcoex_LpsVal(padapter);
-				if (val8 & BIT(4))
-					pslv = PS_STATE_S2;
+				hal_btcoex_LpsNotify(padapter, ps_mode);
 			}
+		} else {
+			if ((PS_RDY_CHECK(padapter) && check_fwstate(&padapter->mlmepriv, WIFI_ASOC_STATE)) ||
+			((hal_btcoex_IsBtControlLps(padapter)) && (hal_btcoex_IsLpsOn(padapter)))
+				) {
+				u8 pslv;
+
+				hal_btcoex_LpsNotify(padapter, ps_mode);
+
+				pwrpriv->fw_current_in_ps_mode = true;
+				pwrpriv->pwr_mode = ps_mode;
+				pwrpriv->smart_ps = smart_ps;
+				pwrpriv->bcn_ant_mode = bcn_ant_mode;
+				rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+
+				pslv = PS_STATE_S2;
+				if (pwrpriv->alives == 0)
+					pslv = PS_STATE_S0;
+
+				if (!(hal_btcoex_IsBtDisabled(padapter)) &&
+				(hal_btcoex_IsBtControlLps(padapter))) {
+					u8 val8;
+
+					val8 = hal_btcoex_LpsVal(padapter);
+					if (val8 & BIT(4))
+						pslv = PS_STATE_S2;
+				}
 
-			rtw_set_rpwm(padapter, pslv);
+				rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
-
-	mutex_unlock(&pwrpriv->lock);
 }
 
 /*
@@ -509,11 +504,8 @@ void LeaveAllPowerSaveModeDirect(struct adapter *Adapter)
 		if (pwrpriv->pwr_mode == PS_MODE_ACTIVE)
 			return;
 
-		mutex_lock(&pwrpriv->lock);
-
-		rtw_set_rpwm(Adapter, PS_STATE_S4);
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock)
+			rtw_set_rpwm(Adapter, PS_STATE_S4);
 
 		rtw_lps_ctrl_wk_cmd(pri_padapter, LPS_CTRL_LEAVE, 0);
 	} else {
@@ -567,14 +559,12 @@ void LPS_Leave_check(struct adapter *padapter)
 	cond_resched();
 
 	while (1) {
-		mutex_lock(&pwrpriv->lock);
-
-		if (padapter->bSurpriseRemoved ||
-		    !(padapter->hw_init_completed) ||
-		    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
-			bReady = true;
-
-		mutex_unlock(&pwrpriv->lock);
+		scoped_guard(mutex, &pwrpriv->lock) {
+			if (padapter->bSurpriseRemoved ||
+			    !(padapter->hw_init_completed) ||
+			    (pwrpriv->pwr_mode == PS_MODE_ACTIVE))
+				bReady = true;
+		}
 
 		if (bReady)
 			break;
@@ -599,25 +589,22 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
-
-	if (pwrpriv->rpwm < PS_STATE_S2)
-		goto exit;
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if (pwrpriv->rpwm < PS_STATE_S2)
+			return;
 
-	pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
-	pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
+		pwrpriv->cpwm = PS_STATE(preportpwrstate->state);
+		pwrpriv->cpwm_tog = preportpwrstate->state & PS_TOGGLE;
 
-	if (pwrpriv->cpwm >= PS_STATE_S2) {
-		if (pwrpriv->alives & CMD_ALIVE)
-			complete(&padapter->cmdpriv.cmd_queue_comp);
+		if (pwrpriv->cpwm >= PS_STATE_S2) {
+			if (pwrpriv->alives & CMD_ALIVE)
+				complete(&padapter->cmdpriv.cmd_queue_comp);
 
-		if (pwrpriv->alives & XMIT_ALIVE)
-			complete(&padapter->xmitpriv.xmit_comp);
+			if (pwrpriv->alives & XMIT_ALIVE)
+				complete(&padapter->xmitpriv.xmit_comp);
+		}
 	}
 
-exit:
-	mutex_unlock(&pwrpriv->lock);
-
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -642,11 +629,10 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 	dvobj = pwrctl_to_dvobj(pwrpriv);
 	padapter = dvobj->if1;
 
-	mutex_lock(&pwrpriv->lock);
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
+	}
 
 	if (rtw_read8(padapter, 0x100) != 0xEA) {
 		struct reportpwrstate_parm report;
@@ -657,17 +643,14 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&pwrpriv->lock);
-
-	if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
-		goto exit;
-
-	pwrpriv->brpwmtimeout = true;
-	rtw_set_rpwm(padapter, pwrpriv->rpwm);
-	pwrpriv->brpwmtimeout = false;
+	scoped_guard(mutex, &pwrpriv->lock) {
+		if ((pwrpriv->rpwm == pwrpriv->cpwm) || (pwrpriv->cpwm >= PS_STATE_S2))
+			return;
 
-exit:
-	mutex_unlock(&pwrpriv->lock);
+		pwrpriv->brpwmtimeout = true;
+		rtw_set_rpwm(padapter, pwrpriv->rpwm);
+		pwrpriv->brpwmtimeout = false;
+	}
 }
 
 /*
@@ -719,21 +702,19 @@ s32 rtw_register_task_alive(struct adapter *padapter, u32 task)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, task);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, task);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -767,18 +748,16 @@ void rtw_unregister_task_alive(struct adapter *padapter, u32 task)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
-
-	unregister_task_alive(pwrctrl, task);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		unregister_task_alive(pwrctrl, task);
 
-	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm > pslv)
-			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
-				rtw_set_rpwm(padapter, pslv);
+		if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm > pslv)
+				if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
+					rtw_set_rpwm(padapter, pslv);
 
+		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -804,21 +783,19 @@ s32 rtw_register_tx_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, XMIT_ALIVE);
+	scope_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, XMIT_ALIVE);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -849,21 +826,19 @@ s32 rtw_register_cmd_alive(struct adapter *padapter)
 	pwrctrl = adapter_to_pwrctl(padapter);
 	pslv = PS_STATE_S2;
 
-	mutex_lock(&pwrctrl->lock);
-
-	register_task_alive(pwrctrl, CMD_ALIVE);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		register_task_alive(pwrctrl, CMD_ALIVE);
 
-	if (pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm < pslv) {
-			if (pwrctrl->cpwm < PS_STATE_S2)
-				res = _FAIL;
-			if (pwrctrl->rpwm < pslv)
-				rtw_set_rpwm(padapter, pslv);
+		if (pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm < pslv) {
+				if (pwrctrl->cpwm < PS_STATE_S2)
+					res = _FAIL;
+				if (pwrctrl->rpwm < pslv)
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
 
-	mutex_unlock(&pwrctrl->lock);
-
 	if (res == _FAIL)
 		if (pwrctrl->cpwm >= PS_STATE_S2)
 			res = _SUCCESS;
@@ -894,17 +869,15 @@ void rtw_unregister_tx_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
-
-	unregister_task_alive(pwrctrl, XMIT_ALIVE);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		unregister_task_alive(pwrctrl, XMIT_ALIVE);
 
-	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm > pslv)
-			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
-				rtw_set_rpwm(padapter, pslv);
+		if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm > pslv)
+				if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
+					rtw_set_rpwm(padapter, pslv);
+		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 /*
@@ -930,18 +903,16 @@ void rtw_unregister_cmd_alive(struct adapter *padapter)
 			pslv = PS_STATE_S2;
 	}
 
-	mutex_lock(&pwrctrl->lock);
-
-	unregister_task_alive(pwrctrl, CMD_ALIVE);
+	scoped_guard(mutex, &pwrctrl->lock) {
+		unregister_task_alive(pwrctrl, CMD_ALIVE);
 
-	if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
-		if (pwrctrl->cpwm > pslv) {
-			if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
-				rtw_set_rpwm(padapter, pslv);
+		if ((pwrctrl->pwr_mode != PS_MODE_ACTIVE) && pwrctrl->fw_current_in_ps_mode) {
+			if (pwrctrl->cpwm > pslv) {
+				if ((pslv >= PS_STATE_S2) || (pwrctrl->alives == 0))
+					rtw_set_rpwm(padapter, pslv);
+			}
 		}
 	}
-
-	mutex_unlock(&pwrctrl->lock);
 }
 
 void rtw_init_pwrctrl_priv(struct adapter *padapter)
@@ -1131,9 +1102,9 @@ void rtw_ps_deny(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
-	pwrpriv->ps_deny |= BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
+	scope_guard(mutex, &pwrpriv->lock) {
+		pwrpriv->ps_deny |= BIT(reason);
+	}
 }
 
 /*
@@ -1146,9 +1117,9 @@ void rtw_ps_deny_cancel(struct adapter *padapter, enum ps_deny_reason reason)
 
 	pwrpriv = adapter_to_pwrctl(padapter);
 
-	mutex_lock(&pwrpriv->lock);
-	pwrpriv->ps_deny &= ~BIT(reason);
-	mutex_unlock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		pwrpriv->ps_deny &= ~BIT(reason);
+	}
 }
 
 /*
-- 
2.43.0

