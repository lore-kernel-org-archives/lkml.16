Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3E6F1A23AF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614236; cv=none; b=QUldSvmknIvwEeXGrIg0u/NFavh78oAfAVMX9RB25UvBGg0UiAc/h3rUAaCS6AXBjoF5CqQVHR/6HnBk4QxWjDNFN9MvOmRsr6HP5HE+/c01UTTI4VNlVowqZaftHrxsdk7D+tuYEOSGfFs3uVWZ2bLPk13iYJPRsnvdThwlJlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614236; c=relaxed/simple;
	bh=VaMFdFfclsC+WFCyzHYDRn44c9vE4yPnhIs+rwALdxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QeW8O9zyf7Q6khDll8khiDZB5pAtvpS+Sz1CyL5WZoWDusJyPt1funo6y5P/bNFfuNyI4Ucb5cNiJ0wkkNC9u/ID4Fj3iFBtGkA1bPxSKOgOZFHzYSBjhF6bRxQA5KOasgYMh/dJUC0NCHRhoBRtVyHqxnCJpDvylsLnIv4DEBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kR6RTR40; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kR6RTR40"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfb6e9031so62970215e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614233; x=1744219033; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+C4G4SbGxknyB0zTfgPx+p1t+bnYiQcQISoKxR/Vkc=;
        b=kR6RTR40Y9+DJcvS7PqUtmO4uphlKXV/61aZU77jej6yHlBxPYAElKE4Q0b/Q+PbDn
         axJk19avCFJEwbTZvpk0banyw+tIDpf6rGAwrHr4uUMzTRaQCYHvKyQqqPy50L5jozKl
         Xy5RGyMVYA8gr4GqxwHVoiR//JgZOdkN0tK9MRS5E6aRzbSF1p6glqHjbU4GC+shn4dE
         +BeHMQQVBiXKqNtdCx2f/awtpUl53sQNItd0pqJAKbCK0iqp7ybpI1JK7Qu9uzvpvOt1
         MpAXp7ZZvL48Qc2/mTxnm9U34jOcN3AByw1E9D9SfngqMIC+cKtj71kGaZ4Ct0NIpayh
         KETQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614233; x=1744219033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8+C4G4SbGxknyB0zTfgPx+p1t+bnYiQcQISoKxR/Vkc=;
        b=pg2fWnobpJnNDEHMuIab57oAdpbGIFIbOLPgI+GP25MeMun8TNX6PyFiytqCFa4Xft
         DLSTsHIgzO0J3spRgsRyKArBUerK41CQ8qE4PRqk9Zuuo3LiWqyqdgJ4FbQnOYlX/4Xv
         5YPNT3Id7kpcyUwK/2BM/15dU0COXAlat3tEiAVQwAEtmwU+Q9z3lSlLLOaI+aAaGY3+
         xFmh4VJ/1utTRy2UweyKIcd15QZ91tnhkCmpf8a5VfYBjYhxlmj16cUjiUVnj/eUBAhQ
         qrMLJTG/bP3tp3kz2Zbp4bbJRiOlhR/ahREOwtTZ3RtrOmvPa6xcYjHg/tarBqyzEsvU
         EB+A==
X-Forwarded-Encrypted: i=1; AJvYcCXFPnP0Akjhc1ZOgeSAMPOBruiJGEcf4GlpduSInYG82vjNtLQJ+bGdCfSzP/6eFaSEqrJTWUzCRABtYJs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtTP/PH/8TNV73J2j20c/ZE5lt9IH7uV0xopot4PUSyAKevZR5
	8p6bDzNOb6oP/t/P7kFXiO5Wd2VVMOb/8eeKEMik/yQAOo8ys3a2FKKmVB4dxn0=
X-Gm-Gg: ASbGncswjTHwv0AoZRGREvpElRpEccfyX1v5F4NCYSkmvhQB15hxaUz4v2GNcnubEWJ
	lkI+1Xa+gmpEZPExBRp01oFEtwSquNCMf3TrKqJGpRDW6ByeCgBh0IykIJ3RiYHmGndCIFekn6H
	AvEMi/cW/al32ErtxVZE/vv/uSCgODFdhkZwpnQYOx5FyNW9bX8/oToiHGdaiyje6ydgKkMJSiH
	R7YkU3EkHdfD1E9Ctka9fmKuPPOCvbF5NoE4WaKgY0HZKs5APiL4uRW4UVbuZvscMxVwSSW9NTW
	DElI4auCtrQjAkig3f5xuepOupmPiuVf0GEW1+1LTQ==
X-Google-Smtp-Source: AGHT+IGXAJCPar3HVUFKQjK06ujZSRm1R6M97IdO3GlXbC5NKiu0ELwX7yqGkBPK9kj/Fy5xyyxC6g==
X-Received: by 2002:a05:6000:18a5:b0:38f:3e1c:211d with SMTP id ffacd0b85a97d-39c120deb39mr13203589f8f.14.1743614232894;
        Wed, 02 Apr 2025 10:17:12 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:17:12 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: rtl8723bs: Modify struct sta_info attribute qos_option and ieee8021x_blocked
Date: Wed,  2 Apr 2025 20:16:44 +0300
Message-ID: <cea7ede3db3709a13f1dcd25976779cd46da713c.1743613025.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743613025.git.karanja99erick@gmail.com>
References: <cover.1743613025.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by ensuring consistency,
replacing instances of 1/0 with true/false where boolean
logic is implied, as some definitions already use true/false.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index d46a04b9a05e..199727f04516 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -386,10 +386,10 @@ void update_bmc_sta(struct adapter *padapter)
 
 		pmlmeinfo->FW_sta_info[psta->mac_id].psta = psta;
 
-		psta->qos_option = 0;
+		psta->qos_option = false;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
@@ -1967,17 +1967,17 @@ void sta_info_update(struct adapter *padapter, struct sta_info *psta)
 
 	/* update wmm cap. */
 	if (WLAN_STA_WME & flags)
-		psta->qos_option = 1;
+		psta->qos_option = true;
 	else
-		psta->qos_option = 0;
+		psta->qos_option = false;
 
 	if (pmlmepriv->qospriv.qos_option == 0)
-		psta->qos_option = 0;
+		psta->qos_option = false;
 
 	/* update 802.11n ht cap. */
 	if (WLAN_STA_HT & flags) {
 		psta->htpriv.ht_option = true;
-		psta->qos_option = 1;
+		psta->qos_option = true;
 	} else {
 		psta->htpriv.ht_option = false;
 	}
-- 
2.43.0

