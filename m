Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 660592550B2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949008; cv=none; b=rPPytqw2OKCzQ+wDSAGi3Gv2eicjigAYD9l1oQB1pbamydT8rHim5cp2Oi93BJJf68EOCRAWnhsZLXJnRcXBPS67njCo8YGnZOLg5AFYsXKpSWDt5Nw+yZWq+RqOZvW+fLOM2V6Dx5GtMt3/B3FtjrVSF65NbXhAiHTYq3MHxqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949008; c=relaxed/simple;
	bh=u/YfAggJEERo7Uz9zXkV9Ag3LuPVgrTKSytxUhbUbqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sLin1E0/khYqUcP6wuUtJXFXdyXETMYEFqS/cjm0n1NPi8e5NzgGCn3qBfQM1cmMP9rNAVooLZjh/PEmGfqzqBrgBuFem+YTA9EOH2oyWBt/buAQgtLw4EaLkBMTb+8HauPxPzhIb7bKde8ERiCBp7ooxVT6GF0Q+W75IQU+At4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WyaSydwg; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WyaSydwg"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e7b3410e122so7989667276.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747949006; x=1748553806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=x0YM76fGKsBFeNgwF8PM/nEDQa4nOuCQrna9WKHV3v8=;
        b=WyaSydwgmS87xB6XC+nDevcEwGV76jHhuVODSpMf4KVb2Jab4ZRhoaYiN3ITFcUUCA
         EjWN0qmoMQqLgwWA1bA8oif3r6cayo3HTEY44INkSD/Vt4r4TzWY6hO3ntsOnfjLEI2S
         iOfQZjbJq9RqszLdRwQQbJOZFl2h7C0xZ22UNyIsJs8wzj0so/L4wAI91GFAHK4i5qxh
         nJRUfJLJDeC7+x8Em/4knCPPYwHmkj4OkfTG0XrevYpIyjws0rrH2X+QO7aH0fN3J5tb
         LjfVa4uN7nLPvZXxb54oiR1L5I+u9Oshao+CtPKix+6H0FEYbKqddus2H+qZPW9k8OLY
         Ec8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949006; x=1748553806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x0YM76fGKsBFeNgwF8PM/nEDQa4nOuCQrna9WKHV3v8=;
        b=pcA7oeRbTkfKsUk8TryRG6BEcXeJg4y5zDB+PS+oBxsw4qVDSNh+7ZhWP3Auso8DXo
         kotgwW2rDRGyQpj3VMKbuDsHIdXxaCGr7H3j61rKRZGEDpWgdMgfIJJ39GauZkpc69KO
         fhuFmXTp5FH3+XL7F9aYC3N+8HufWNKd81+W5NQCWVJIzAkWHgYpjmh7ZMyTdsikU664
         MN3PJaJiraV3XtYOIBvEggd9W+m5yChO0WWSmckibyAi2pzw4wS9U9Za7ps6HW7j6aBd
         Nc52SyLCssJNyRWzhrz5b+S4KA/hbULcH2jmtjZtUMlnTyKFDp1rNSRH9IZDHKZddnsq
         JN1A==
X-Forwarded-Encrypted: i=1; AJvYcCUWgKyQuEq0fuZtZLRQDOlyY3zq8O8Me8GmcnyFDrzGmydhoaAi8BncSaG5pP0LQxuNLWlfzfCslAYYdRE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW4BhOXYIpUXmAQ0yx9HyWDAgiKLZhljtvJxTN8fxHq1QnJSWI
	KkSpjXoHK1jDxmv+2JVCcn+e65qrtmO0ZplAuFLQY++vuhtadOL8ZKHE
X-Gm-Gg: ASbGncsATu+FChspDZWaNxE2n6iaC2zJTh2FcU4SkMgIlMsKdpwvkPGxKDUCWkYbzjB
	y0ZW0Q3CwMsaB6ymHeTZvMNWQuy5suPMYWBmIrhA5mCwsB/ceYD2NboV0ptu69x2sIzfKEfw6te
	pbzcvef+YII3LPuMTwaNXNfcelKmTojtTnOwyUmDFwZ9A/QF+e2wOJpK+531814ZLT5FrVM8S1i
	TOZzZbdowR4MNPkTvP7LG6HhyxiqLvWBHetpX64KiwzuOr4O1WCqUy4MicG85IeV1NVyJfqRYWV
	YPEglY5nO+5lSBmDEVx6WkDM/95NcMdt3GzxlFcSeIVbaHcZohn+tsS0TiET8PZQw25N4t+MCLi
	DyQ==
X-Google-Smtp-Source: AGHT+IG9rLGd60v51kDh0OFQiYQ2qXyMvEQs9AW6Xr6gHTbZtgq1cf3Vi07+fgkoKC8kJ7q2Uq8xfQ==
X-Received: by 2002:a05:6902:20c7:b0:e7d:7a89:f3db with SMTP id 3f1490d57ef6-e7d7a8a061amr2902806276.49.1747949006280;
        Thu, 22 May 2025 14:23:26 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.37.22])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e7b6ac6a63dsm4754203276.11.2025.05.22.14.23.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 14:23:25 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
Date: Thu, 22 May 2025 21:16:26 +0000
Message-ID: <20250522211626.4931-1-donnyturizo13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes a typo in the variable name 'ips_deffer_ms', which was
misspelled as 'deffer' instead of 'defer'. This patch renames
it to 'ips_defer_ms' to correct the spelling and improve code clarity.

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>

---
Changes in v2:
Rebased on gregkh/staging-testing
Fixed build error reported by kernel test robot

Changes in v3:
The previous version of this patch incorrectly included changelog
 notes (such as "Changes in v2") before the --- line in the commit
 message. According to kernel patch submission rules, everything
 after the --- line is ignored by git when applying the patch and
 is meant only for reviewers (e.g., notes or changelogs). In this
 updated version, the changelog has been properly placed below the
 --- line to follow the correct kernel patch submission practices.


 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 44f7c19308a5..27ba364ea33e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -1006,18 +1006,18 @@ inline void rtw_set_ips_deny(struct adapter *padapter, u32 ms)
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

