Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140623536A
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751120627; cv=none; b=MqXbEMRkm7a5nAljP7uh1L7TGEVeugSntrtI0JpOamwcQAziEiqUWTZuhJwKyVdHBWUZptxN3Y8Z3RhoHaot842cYx3BJzojxPXKq6gOKYQhwi05gD8GVrELOPjfMy3CKiG3yaKR8TrUPRG3HSqrvXs5XwZqMeZebSlzVl8nEeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751120627; c=relaxed/simple;
	bh=y8vZHnIcnnizXNKPY2Mc8qBAg1LXMI8wsARCtaw3agw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gDaEJcb9axqSxaXaQpsBtvM4iEJyLm5Rt2KQsfeb5iCrHt+Pi7rrfx+beEuC5hB6n9HGRfgrsvCD4SStSWdOrl/ofamtdDEpLPpLMC/EeRM1ALX1uuf+c56jvINWekRYZxYeUH/JBLj5e0hQbsFas4iwxWCFpgmCbJtorWzNsf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bbz094MF; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bbz094MF"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607ec30df2bso5989866a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 07:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751120624; x=1751725424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WYXNYp1TJi32LMgdotg59zB/0M2Rxxe9xf9QDl4Zu3o=;
        b=Bbz094MFf17+vXK6wZ7nLoHf/rKieLwRgadkW6JQLCR8mO98ltomsDI7NBJzwO94tb
         +lFxqTmxhOUf6lJoh7n63BO0QmCF4zbNg3dj8pdjTK6RenrTWm9anxmOihiMn0qivjcS
         pkWnNhrSNy3ix+RW7ZFhxJQbJ5C1v2M3uONaiuxH8B0Pa+9IIgfIxZakIPXJDmRT2KsG
         zH2fz1S0uyfMDafnepY46+vqjMyBhismRqflJF3ho3Min6ZUOL9g8GPL/SFfQRRtYyV8
         2DViyIzc1ue78GwWx0zqz26icjPuZYz70jVs5VXeEpCyBNJJ608Xoa27wqE5cRQE/c+g
         yvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751120624; x=1751725424;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYXNYp1TJi32LMgdotg59zB/0M2Rxxe9xf9QDl4Zu3o=;
        b=LdwZQ7UZZgRE+U9fCAqXKl7KGPopDMBEwVTooYRPNUmFk32TnbP969EJApeIqa8+V8
         npclSa6xV28BfpSphgkM/2MKdeDGfoy4lrTkDc6BbLVes4EonT8cqq11nwRAIXJpe0wO
         tPoyhZb67MbmqdvDnPUeh5kRvFB0u+aZFJlDzTvbfrY0FChJxbKkV32ygNfAcIMDr6Ss
         CUUPuA/ddUcrJMCZfSdhOPcz9Do5ai3E+CxWr0E4ITSCn5WP5i0UMbJKEZZGKSptzoWa
         CIww/II1ub5nW5KLk5DRftvNjjzEcKSd9EjUFzjdboOUYIkQ1R6yYpy3L+o68aaS67At
         CHrg==
X-Forwarded-Encrypted: i=1; AJvYcCVHWEpc32e0qxr+ykoW05ER9u6rHKdcsQ1Rz+xTsWBwbQKt41sXQUcy9xooisZIt4tb7/sK4aW/FFgUtNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2/qNyqloiAfDxAJhEQhiREiM0FaD8C88G91RlKjuSIxftiH/P
	sAfdDvzhzuUZthbLH8DvWwfQ/g8DycpJegOM2eZQUxDzm6/uTI12L85fXeEiYQ==
X-Gm-Gg: ASbGnct9lTGIrKIao/lYBiaKKSj41tF3QQrAXCdU+ltMinB8rWLmZRO0vMKJQZ2TKtM
	0ZfTXB4EU9Clt+bQ2hxQf+RsHBQZ8t7RFJmtm03O0OJ7IU5+A+2iP9/Idq8gMB/e+BKiFXUQhfJ
	4OSRO1+hCYBsWJMqaUdVP98X2ZejtaX98KtwPZBiN1TlRfuL3/+/mgMVcHZh21rN/5u42kPYpRo
	anYjlZvs+2tqabtZWRCILikuV0V7LIGFjIsimao1iNQD//f4rLsEonqqKfNKP/wSMW4/ezpFuWM
	qwZG1OfmRZz5EXlGMWaxN0Pxus1XaJbnjyZJIkIbg6JxaxIgmHh7afjTuatYNbrQHKSC4Jw1fBG
	c7MLxPeNP00vS9Vqb+ov23IOely1m0+Trzsdeq7nfu32VkEs=
X-Google-Smtp-Source: AGHT+IFw9GhOGm58j/puukv7HldvclAFNdGzNOlslcFMYDa19bZwOEMSMxrh0dUNYYMNPJUL29yHaA==
X-Received: by 2002:a17:907:9693:b0:ae0:d201:a333 with SMTP id a640c23a62f3a-ae3500dfae5mr696619366b.30.1751120623982;
        Sat, 28 Jun 2025 07:23:43 -0700 (PDT)
Received: from localhost.localdomain (ip5f5ab8df.dynamic.kabel-deutschland.de. [95.90.184.223])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353659fe9sm325333166b.53.2025.06.28.07.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:23:43 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove empty functions
Date: Sat, 28 Jun 2025 16:23:30 +0200
Message-ID: <20250628142330.58045-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions rtw_hal_dm_deinit(), odm_CmnInfoInit_Debug(), and
odm_BasicDbgMessage() are empty, hence we can remove them to get rid of
some dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     |  4 ----
 drivers/staging/rtl8723bs/hal/odm.c          | 10 ----------
 drivers/staging/rtl8723bs/include/hal_intf.h |  1 -
 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  3 ---
 4 files changed, 18 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 0db8f623b805..6fb1e81dde42 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -38,10 +38,6 @@ void rtw_hal_dm_init(struct adapter *padapter)
 	rtl8723b_init_dm_priv(padapter);
 }
 
-void rtw_hal_dm_deinit(struct adapter *padapter)
-{
-}
-
 static void rtw_hal_init_opmode(struct adapter *padapter)
 {
 	enum ndis_802_11_network_infrastructure networkType = Ndis802_11InfrastructureMax;
diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 8d6131f0ad47..ba85efb30db2 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -315,14 +315,6 @@ static void odm_CommonInfoSelfUpdate(struct dm_odm_t *pDM_Odm)
 		pDM_Odm->bOneEntryOnly = false;
 }
 
-static void odm_CmnInfoInit_Debug(struct dm_odm_t *pDM_Odm)
-{
-}
-
-static void odm_BasicDbgMessage(struct dm_odm_t *pDM_Odm)
-{
-}
-
 /* 3 ============================================================ */
 /* 3 RATR MASK */
 /* 3 ============================================================ */
@@ -735,7 +727,6 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 {
 
 	odm_CommonInfoSelfInit(pDM_Odm);
-	odm_CmnInfoInit_Debug(pDM_Odm);
 	odm_DIGInit(pDM_Odm);
 	odm_NHMCounterStatisticsInit(pDM_Odm);
 	odm_AdaptivityInit(pDM_Odm);
@@ -761,7 +752,6 @@ void ODM_DMInit(struct dm_odm_t *pDM_Odm)
 void ODM_DMWatchdog(struct dm_odm_t *pDM_Odm)
 {
 	odm_CommonInfoSelfUpdate(pDM_Odm);
-	odm_BasicDbgMessage(pDM_Odm);
 	odm_FalseAlarmCounterStatistics(pDM_Odm);
 	odm_NHMCounterStatistics(pDM_Odm);
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 85de862823c2..5dddafe035c2 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -200,7 +200,6 @@ void rtw_hal_def_value_init(struct adapter *padapter);
 void rtw_hal_free_data(struct adapter *padapter);
 
 void rtw_hal_dm_init(struct adapter *padapter);
-void rtw_hal_dm_deinit(struct adapter *padapter);
 
 uint rtw_hal_init(struct adapter *padapter);
 uint rtw_hal_deinit(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 3cbfc305ede3..d757209dec0c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -709,9 +709,6 @@ void rtw_cancel_all_timer(struct adapter *padapter)
 	rtw_clear_scan_deny(padapter);
 
 	timer_delete_sync(&padapter->recvpriv.signal_stat_timer);
-
-	/* cancel dm timer */
-	rtw_hal_dm_deinit(padapter);
 }
 
 u8 rtw_free_drv_sw(struct adapter *padapter)
-- 
2.49.0

