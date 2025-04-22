Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 848F1262FE5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 21:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745357139; cv=none; b=EdIiR0ZKW7ZgODiP0+XmmCq36Y8c2TnhTJdZi+TU/yYwfq/FJB3N/RucTakCYTOXj600ADWXfKZJXQVeKmulhHKkqixh4gz4haudW5gl53gmsoMNFB+DFnbot1vMxRutyojlHyShZVjmnH6SoT43bqlAKyRjFbQXF+cERfFWZ0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745357139; c=relaxed/simple;
	bh=Y/C/xhkbLzQ9rIJeiEicc0P0p8FiP6d4YyTqIyKHbYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GFRJcq7eeKjRjMM6f895mDdpLCZeXAXMKEJhEy7zt9zL4ZimY6+nsI795T3AgKFe4K77FGkk3NFKuP9ZOyg7jf7e7omIu4Dft2O/5bYvXJVwqxaU6DtmTolUFRTDCv7pJxkuwygRIqfP6lsoOYw+60fcBT/hOPnbYc3xQ+Tqc+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9ewX3Iy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9ewX3Iy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2240b4de12bso84732915ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 14:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745357138; x=1745961938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c2xkzyMG/T4Nc06X3h717slcVyxx+nHbaCSWe2w2AOU=;
        b=M9ewX3IyYwCC5Hw/P/Qii6AzRGCqdnWHOahnh6sbA9/4u7Hl31AM+gDHUO+9ADkvLG
         6gJnqeM8vL1gJncm+Ho3n1LdL8qWEFOgHdGF4jylW4TKTR6/iNByWZsWBaK+0cEQbM/o
         esVHitXjg6NxF2PIGmYe2JmViRtlRI3ZzIgQQBoJte0jma5KQG8nWjUZ9tM1YBtsLBaa
         H1CAkaS1hwZ/CDv+jXwVfDFiINMD9xs1sNgOE9DuzTDEdBK6f0q92Fwq1LwsjfPOOu99
         +S9eECKY8DnPe1nxGre4uOEmmUwDeQxVk19dWVOC7ptL7r/3uKw8WCbEHfb9dz/eoYpj
         dtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745357138; x=1745961938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c2xkzyMG/T4Nc06X3h717slcVyxx+nHbaCSWe2w2AOU=;
        b=kfajszVEghNBTvZnFa4xBJ9sQxipPjUTn1inZ4ZMggxQUql9zC/uNObdM3/KsX4Cqr
         qEY1o/AhNy4me+H5m5ilEUZnB6aotp8DZN6xe4Vy4BVREP4ASGHXOieKGkgwvck357w7
         HX/z0UzdX3zACw22latGqvIWhJnJ5GBYjKccAWxbNvpsDo73veuIgCWAaj545dQPvHl+
         aSwA0bhOyWl/61OeVl+7lL3H2YryjV+XK7JAt5BGbC8brU/rawiC8X8rZQkLjH1dk3+H
         Y6qV6zCObdsC6GCp8RC6Q3U4zHPs8oSKi5ITNZe8s4biAOtikKy4W5mFGoqOdA1Eh5F/
         YWRQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2Muos3t75xJPTT37BDQXD3GQVI3ZYm36wzg8AJ+nL+tV/O3r9zya6FNsa1NnwgcJwlHV31o2mXG+VzI0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZBqMSp/wWOB1CJ4ySNG4+0TJ1uJUJ8RXc93qNaNx6ROVOtkm8
	2RzaCP7wfsb5/H43MsJhp1YD83XbumILpP0XJCKEioGlnkK5jN+JCn38etLnxoI=
X-Gm-Gg: ASbGncv44MJ1LqWZDP57QeB6DDbmYD9L29/XnP0YDtECxkFp0QxHhf8C1umvqSZ0ULn
	Yf97Oy169no2WnHjRB4LRjgBjOdRt3CGy5bl8JWsKxYvtErMTrWeIp1AfX+1+rH3wFbkcRZkhED
	Ge/X+IkuFUubf1J6VFJI9P7w9QV1gtOKbh7UeuEfvkV7LzymwMV75S9nTWbYqYB3ncp+tghi5C/
	bnHrrDOBGQmvIgBkZXjZcDKuc9yykxgnEcqBknCmASlKtDVLhQbbW5N1517LaHreBQPXHGv3NPb
	9zVJxqXL5A8H1jDeYZbYog11ZevQiCikLMBeNA==
X-Google-Smtp-Source: AGHT+IGITDdmHBEsMW6HJ5ldB4QFVVmfPzM2dBETcoNqBLkno8pe5V2JmNTWujeQ7uMADfwfWpxmsQ==
X-Received: by 2002:a17:903:1a04:b0:224:c46:d166 with SMTP id d9443c01a7336-22c53604563mr288284045ad.40.1745357137754;
        Tue, 22 Apr 2025 14:25:37 -0700 (PDT)
Received: from archlinux.attlocal.net ([2600:1700:5a60:6f70::2f])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22c50bdae5dsm90389605ad.35.2025.04.22.14.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 14:25:37 -0700 (PDT)
From: JJ Strnad <strnad.jj@gmail.com>
To: 
Cc: strnad.jj@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Thomas Gleixner <tglx@linutronix.de>,
	Manuel Quintero F <sakunix@yahoo.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove multiple blank lines
Date: Tue, 22 Apr 2025 14:23:16 -0700
Message-ID: <20250422212332.23170-1-strnad.jj@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Please don't use multiple blank lines

Signed-off-by: JJ Strnad <strnad.jj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 946511793c08..437934dd255e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -695,7 +695,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 	/* for ies is fix buf size */
 	t_len = sizeof(struct wlan_bssid_ex);
 
-
 	/* for hidden ap to set fw_state here */
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE|WIFI_ADHOC_STATE) != true) {
 		switch (ndis_network_mode) {
@@ -738,7 +737,6 @@ u8 rtw_joinbss_cmd(struct adapter  *padapter, struct wlan_network *pnetwork)
 
 	psecnetwork->ie_length = rtw_restruct_sec_ie(padapter, &pnetwork->network.ies[0], &psecnetwork->ies[0], pnetwork->network.ie_length);
 
-
 	pqospriv->qos_option = 0;
 
 	if (pregistrypriv->wmm_enable) {
@@ -1032,7 +1030,6 @@ u8 rtw_reset_securitypriv_cmd(struct adapter *padapter)
 
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
 
-
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 exit:
@@ -1099,7 +1096,6 @@ u8 rtw_dynamic_chk_wk_cmd(struct adapter *padapter)
 	pdrvextra_cmd_parm->pbuf = NULL;
 	init_h2fwcmd_w_parm_no_rsp(ph2c, pdrvextra_cmd_parm, GEN_CMD_CODE(_Set_Drv_Extra));
 
-
 	/* rtw_enqueue_cmd(pcmdpriv, ph2c); */
 	res = rtw_enqueue_cmd(pcmdpriv, ph2c);
 exit:
@@ -1256,7 +1252,6 @@ static void dynamic_chk_wk_hdl(struct adapter *padapter)
 	/*  */
 	hal_btcoex_Handler(padapter);
 
-
 	/* always call rtw_ps_processor() at last one. */
 	rtw_ps_processor(padapter);
 }
@@ -1367,7 +1362,6 @@ u8 rtw_dm_in_lps_wk_cmd(struct adapter *padapter)
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 	u8 res = _SUCCESS;
 
-
 	ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
 	if (!ph2c) {
 		res = _FAIL;
@@ -1850,7 +1844,6 @@ void rtw_createbss_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-
 	if (check_fwstate(pmlmepriv, WIFI_AP_STATE)) {
 		psta = rtw_get_stainfo(&padapter->stapriv, pnetwork->mac_address);
 		if (!psta) {
-- 
2.49.0

