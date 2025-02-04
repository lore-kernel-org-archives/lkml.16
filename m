Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB42204680
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 06:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738652309; cv=none; b=rBkwQcNLCuY2FBdOKR9WGrv8zZgw1wYDGaLZO4Q3FUfwnHhGAbWf0v2Hq25zThTeEQ1aEGz22RFBdqqeMjQ08UALWEMvldx6rRWoHOAPPadJenVea3vW0ozIBwLSKS0ZbtE43EOPTfQiz/Q3yQVx1CxUgbChPdcSsw9fIRvrnW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738652309; c=relaxed/simple;
	bh=/KIqPx3OcibD6mX6v3Lzyi4ET0I49KQ/VdMRMO9wh/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gAlIDBrrmtzNudx+bFGFndqr0u3jmFkQ+q7UcRdFgUTF3M/x3mLK6aPeIjDZxqgVwNjzRFep/S112AhDwSh5/j/QP79DbMYc6heCrCPgHt40axyPh/12TjHWRuF5OOEYfetkRflD8A8gymLoc8dOouCCch01LOHKHTtBBumjksU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5X/zdYs; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5X/zdYs"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3eb7e725aa0so2057753b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 22:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738652307; x=1739257107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7lh9L/j2V92hTgmHwcgJ4LgGzf6Mnu2fil9QHhtdmks=;
        b=Q5X/zdYs9EQGyieYj1LWu9lXJjspd1mCeHZnsV0+scZCAgE1BPyb9ECPjXmsUBMCjy
         tJ4vckIa0ImBuvqxYKMQQ0VDtURhOs1d5G4igUNRukTH/06/1hl2RrZYAAlTKyJEKe66
         BZcGElnmZu1GBdpdBgg8SLHwxWwwTDY8cz25yp6yXP01fTaTCqiv7NKid7sBbe2hMOFx
         WdFkgDJxO9ZHjgb7bFJEyFIpKrYqglg+pW3fBj2YZswhMbXsAHQ7bqvBi9+kWQ1RyRMc
         tO2iWGoiDQisjtVC3WXGx8y37dEODyG9p4ddJg0I8OFueaBkMbhGDsWZv+gCXn/Xo7+h
         pTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738652307; x=1739257107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7lh9L/j2V92hTgmHwcgJ4LgGzf6Mnu2fil9QHhtdmks=;
        b=NU/JE2EWi2WAiOII/uXslEVarC+Xh0aqGziNjzVx0ooV2pTz3/O5V96L29sJSSle88
         htAYWCjf90uj9DJ4cN1T0whHWU6vmvWykw6hRSQmeZBtx8nVr0uEPFUwI23O8bp+f6x+
         CxhcxFjJSyfT+bBQdmfxttoTPwhEVakoJOSw0jfJxp7OAMpbxhIGTF849z+1eyUWCvb5
         G/5ar+fcqNXlj5uKgHDGKL4RaJ++nocxBvZSOFfMrPwFNc8WTVdzBjK/6753A1R8H/ud
         LIt2afTH3XmMnkU1y9wywrhSrKhoRv8a7d/+Yd6cC+qVUneSpzsdtN1xnseEs1WfCv0n
         Ec3A==
X-Forwarded-Encrypted: i=1; AJvYcCXTG8qk2Lvq8e3w83VpPRkF3aIjcqYWoHXtfHpk4WHqCaHJS6NoEKZIF662RPZ5m8vXyzmy3RmjBakySGs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy6iewv07qlAMsByO7k9+5MO+WJ6NxUylGfC+XCONv0vqmbJWP
	PvlpGL8GWsY/rcWqFaqJkHCNv1/+cK0PAr4RzKJwar+p5fCHf8vCP89/9ljlGXI=
X-Gm-Gg: ASbGnctUlHHRptQ90cVZmVze/PICoK9K7/6aZkJwI/T+cTMt8gxs7X215Uc2dVQ2u/Y
	bzuAyjjWFREOTRE5mopjG/c4bAD3VaElP5nIDdLRTuWM1QqQmZIP1i3BZfmPdHindM9YeXUHvfr
	pQLAFTzf/vxlfiL/TbdGJkhn0RDvtvdZODLAGXgFo+zFAntjzaEAMCGzB5IXFipXKstFoxSylNl
	XKW6A+4uojq0fS27BMh7v/oJK17ES93fnmPpERVWV6gjm8quNCX64gp2X1xD4RSVMsCFPc050lm
	jE+/l3fiAv2pObl+ls8EmpwlIgM1nr9q1naUko5ObKm8vYwqyx0m3HGTsuWp5Y6fEHzxc3rmMir
	t
X-Google-Smtp-Source: AGHT+IF55WgJ4bcciobrlt7SG02tK+/1rry6sDdSiq6H3Gi4wyzFQenCiUX1GRIT6gmiklZr8WGykQ==
X-Received: by 2002:a05:6808:2106:b0:3ea:5880:fe1d with SMTP id 5614622812f47-3f323b4a05amr15783914b6e.35.1738652307193;
        Mon, 03 Feb 2025 22:58:27 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f333660e78sm2934557b6e.35.2025.02.03.22.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 22:58:26 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 4/4] staging: rtl8723bs: Format comments
Date: Mon,  3 Feb 2025 22:57:22 -0800
Message-ID: <1ed23303429f4c7170f92122a3794bc9052f07c3.1738651582.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1738651582.git.onlyian4981@gmail.com>
References: <cover.1738651582.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make comments adhere to the coding style.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index dfe036cd4ef7..2e9963c857aa 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -1031,9 +1031,9 @@ void HTOnAssocRsp(struct adapter *padapter)
 
 	/* handle A-MPDU parameter field */
 	/*
-		AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
-		AMPDU_para [4:2]:Min MPDU Start Spacing
-	*/
+	 *	AMPDU_para [1:0]:Max AMPDU Len => 0:8k , 1:16k, 2:32k, 3:64k
+	 *	AMPDU_para [4:2]:Min MPDU Start Spacing
+	 */
 	max_AMPDU_len = pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x03;
 
 	min_MPDU_spacing = (pmlmeinfo->HT_caps.u.HT_cap_element.AMPDU_para & 0x1c) >> 2;
@@ -1706,14 +1706,6 @@ void adaptive_early_32k(struct mlme_ext_priv *pmlmeext, u8 *pframe, uint len)
 		pmlmeext->bcn_delay_cnt[delay_ms]++;
 		/* pmlmeext->bcn_delay_ratio[delay_ms] = (pmlmeext->bcn_delay_cnt[delay_ms] * 100) /pmlmeext->bcn_cnt; */
 
-/*
-
-	for (i = 0; i<9; i++)
-	{
-			pmlmeext->bcn_delay_cnt[i] , i, pmlmeext->bcn_delay_ratio[i]);
-	}
-*/
-
 	/* dump for  adaptive_early_32k */
 	if (pmlmeext->bcn_cnt > 100 && (pmlmeext->adaptive_tsf_done == true)) {
 		u8 ratio_20_delay, ratio_80_delay;
-- 
2.45.3

