Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387DD278E42
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745928334; cv=none; b=t1QAiXnbhFGDjzOo5r84VEewP7Ei8NHZnusNIU1fkTKmE2vyYBk1JRA7gkvGnyHWZWa4aa5pADFgbIHVo/wLw08n1qjThG+dTuMOGCyWBi13ZMho2ICExI142NemZO8MYfYIaukRcE2C63hsd+B9uUAm+0YQGnjBiQk8NwKjl3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745928334; c=relaxed/simple;
	bh=xbWVDzZ5g6HJz80cAUiarlvB7BVUjAPPal8xwQHunyU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNFtPLov3OY/y2NDtPQHh8gI4Lsz/L1tcMmnfTrD+2+r229R0+EAq9cOSe1BfPch6V+GrEsR3nhtf/cgD9nJjnwW71+cl/0cvuM8q8w1MeqQH+hrq5SoCe1yc0FkiEPXo+cuRYMiM/hVNPrapeVQWSXnQxVMOMS1l2u9EbDTD2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6heo58f; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6heo58f"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6ed4ab410so926843466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 05:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745928330; x=1746533130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dqA12izQ8aE3OjQDIJUv3v7OdfJvtiazusPsgaxGXXc=;
        b=l6heo58fd/qmhzXAQFeDOnGYANav9YRnm49IWGiUaoYfg1FmeGWzxlz60p2LoRGgFh
         GsiPgfZwvMPzT+v9crNyrjtA5wplF0MFXh+w10zLIt+TzYjwSw3nBR8AHQFXzijsJkmv
         KphKbaBBHlSukfjmy2wgKTimDq/jQnONl0HNHRqUlLFipfYPIuHPDpKiUYD5FQqMNRdi
         83L7v/ife5ocxT0t54oWAZN750F0exP1vNO4VQmeAvgYlR/7pfCugTr72VUEDPcJn22O
         mmuSNrlZGKeL8im3i+p6Jhe6+B8FcIwO/knxQLXNTSsb3Nahx+Q9QrtalreoLJ2Q96CG
         UH/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745928330; x=1746533130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dqA12izQ8aE3OjQDIJUv3v7OdfJvtiazusPsgaxGXXc=;
        b=XmT1Qsc62kkEhwid5Mi4AAfwOBu0AE/FIfKgXBQ+3jxi4aNqXXLonmHoDAep9pHwF5
         8CkU7Xh3Szg2Qhg+65mTbtk9t7Kb5udnJs6GN+Y2UH5v0PV1DmsDvO8ApVWPOybv0d5L
         EuIAhBIDn9H3QitLSMz5MFa984hNX76VPHJptoCSPzb9tIn3IDJuX+g5fi1tUJJQlrcb
         2BxVixIsceGEyyo2zr3nsuOJDuDW50BR6OLPWIGiybhugEUB9mAU6ffqtyGFNr/MCljF
         w/UlMom+jxPnU8iJOmCLzGgCYavj/KI0qmjKjCLF33pTLZwTsOGERtM01t6dLmjJFf6K
         u4EA==
X-Forwarded-Encrypted: i=1; AJvYcCXXym9jE7BEBJKAhnqaD/bEBLR98VN75WlCmDYsn7K0QqYxGxrfFguGe6ew8jlFL8imPbOUc1W6I+oO+D4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDZL+3itM3j7/IHK8Pm5/jztcnUObyBwxJ+jtJscwpf7sjruEV
	EJL9tNUh5d+VhUmOIENwfQ/qCyN17MNjD0CuvF0OEpGzGF8SADBU
X-Gm-Gg: ASbGnctO0lsCcnIUA5wT701DqcPmFpM3/eJFWVvTHMf4WpyqCinNdAQdzQWKZ08SJGg
	Ld2Kpx4c0prUtjg0ZN4Qd51FmWmODLFJxzTQpZN7w+wlD9687zy8lbXBh669zEQekGfJ5ThIF2H
	9PZFnf6dAbPTRiZXvBj8X0/d5HFASZJaiQ8UEPPmck7ddJqBGY20c3GhkJ5Jx6V0DSbG95lQstO
	pk7O/YNfJhRE8Gz7la1h3UY43ANY6VLlMWgtCUlpka9iAPUPMvoMTG4c7ohsdb4IkSvnbGLKsr1
	Mx8Bpup43cnRmK1mzC+ibpNCsjYrO3rBqDOWxw==
X-Google-Smtp-Source: AGHT+IG+lJCeSHiaebW3KLC7J6BWu/mwu+oXqsKLKScZjzlaQtIaqlzH+NBX52bgpHd8qHbLKbRD9w==
X-Received: by 2002:a17:907:97c7:b0:ace:4ed4:d428 with SMTP id a640c23a62f3a-ace84b3b270mr1297967766b.57.1745928329721;
        Tue, 29 Apr 2025 05:05:29 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edafb3fsm782072866b.172.2025.04.29.05.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 05:05:29 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Replace manual mutex handling with scoped_guard()
Date: Tue, 29 Apr 2025 15:05:13 +0300
Message-ID: <20250429120513.168674-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This refactor replaces manual mutex lock/unlock with scoped_guard()
in places where early exits use goto. Using scoped_guard()
avoids error-prone unlock paths and simplifies control flow.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 52 +++++++++-----------
 1 file changed, 22 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 74a8fcf18e84..f3bfd175cf8b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -599,25 +599,21 @@ void cpwm_int_hdl(struct adapter *padapter, struct reportpwrstate_parm *preportp
 
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
-
-exit:
-	mutex_unlock(&pwrpriv->lock);
-
 }
 
 static void cpwm_event_callback(struct work_struct *work)
@@ -642,11 +638,10 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
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
@@ -657,17 +652,14 @@ static void rpwmtimeout_workitem_callback(struct work_struct *work)
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
-- 
2.43.0

