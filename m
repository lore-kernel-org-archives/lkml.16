Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C20623814A
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598087; cv=none; b=QBp8A4gaxcaZv6MHsQf+bI+JFs3t3UMSDIXFxjzwVAKr9s5IrknC3qZb5l9FWG6LcTF1lsWSpateXWTX6SQjYW8YvOa1YGg5ZUeukXi6aGrbmtd38VDW6VY3ymYAwK4aN1l7rp+m3o+s5JMeofltKJwnr6Ha7PDBuEmBDZC/ce4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598087; c=relaxed/simple;
	bh=nMKV+kr2cpsUbh2qAhXcIt216L96PZ43/QpfJ/+7WUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s/IgLe5FN5+1F9wxi/npNJGLOx4h3rHj/vAIDRJjMkB+Zpl+Iw/HLm16/xLU8OTxAE52dzV7LklfTJR0kIhpV6KXXxSZO3LTvm083zEshFWQn0OJnnMIC5u+vP2IYrCUkCcu+KGIys9I8bsCglkTC22GFL09E6SpJPPvACNZKTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X75JvmLe; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X75JvmLe"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43948f77f1aso47744275e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743598084; x=1744202884; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wet2FeYdwiKMwNMUdVcyeTpKdpWV/zoxt59GzOkUOvI=;
        b=X75JvmLevfQls3MK7FX30rEDDBHUg25WDnLw7Vp9PzT0wX5hDXpiPtG4xfU1YJN2om
         q/W21mJv0Ezf59KfNeBLLx92aQPJovShHVsy6VaodXpFv14iRDf1j1ytGHOfdUxw8xNr
         qddsDVlPZILtO6z1SfULmFPsc37gBzfvU8UJrnR2T+qCnMxcPmOwzuTvfc8GBqVi/4/u
         7P0KOjWhjYH400OWL8CctGv81jqFSPswVSDyBTYXbxNJI+AY3Ui3vpDT9EE8y0efaxPB
         4wi2im7cOxxJSqLRQd9qkjwIdoalF61f+n65U8XKnnyYN9XBLImYRMnYNKkknRhsTh/V
         Fqmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598084; x=1744202884;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wet2FeYdwiKMwNMUdVcyeTpKdpWV/zoxt59GzOkUOvI=;
        b=J/FYFRyjjbu2bWXbEPSyt71NM1IAJdJw9uh1cw6SJR6hGWhln+P7pBJZXzfQz1BKAy
         ZLHxMtMMDnHMbwx4PH47D3ltyh8qqL6Y9HrtLbDoX631x8uQrkNbWUsreNfrnoB7qkTT
         gBxTFrus943lP3qBomHLrf7ASnkeOdBZ/hl5lzc7KLJgvkBBhA4iWzrf+VXm2n4J4LH7
         kdgYJJQZtSnKA16OQffc6vSMqjYI6qaLRjaBAgr00T0JMzbsedAvAn63y1MMKw0/814M
         Ka7LY1j2KlDe1rKU3AfDyjPkbrQnjO6v94xLPBPsYUKppkDJash4R24oxNLb5lW320e0
         NgUg==
X-Forwarded-Encrypted: i=1; AJvYcCX4pUM7fTKs73HmZurXCfzoVFJXYWQd49uZ56iIcZccD2Okh5hEHtuvjtk0CKd0IePzSHSF0lFYV3Stf58=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqWjYi9brzS6jQMXBUWoCaZPOCq0EOuDg11AoL/aEVvtfqKbuh
	cuE2fWkPMkJH4auE1QDLUO0u2OKr+9v6ok+haOa5ajgWNbV6poabNBu4rZARw1w=
X-Gm-Gg: ASbGncs9XPoUtBzLu6tkwOQ49fDvdQYu9e6jsCuVWw58v+EQX71wzrdqtC0fUcUcHxE
	SX/lAuh275TCddKIvgRehRzwV3HH+nfvtekYzozS4EYHDEFgqBP9uktn5VM6DvZZ8kKrzUYbcco
	iod4OaSjgm34bSMrlKPcfI7S65NHt+V3AXqw/hIShxOMR6JPKLrBrwZq9dFwK/8eKG7lAEic0Zt
	JsxgIKPWWUCRglSCyDEIdMYusYWEWOYFz8TufqI8mLknmnz4gClo63tA4Tvj8yQ9neDcgrj2X3X
	yik/8t6G/PIMXcvnIUzcqZjNgjsm6BlT1Ts2mNQ1WwAIHspMZqhz
X-Google-Smtp-Source: AGHT+IHlWBrnUKthpg0J7fPqgoIaRxSRyaQtDJqUlOyupRqtjyvSz7tzgOJJVgRLPScsMZIJ7FswCg==
X-Received: by 2002:a05:600c:444d:b0:43c:f85d:1245 with SMTP id 5b1f17b1804b1-43db6249f80mr142390905e9.17.1743598084244;
        Wed, 02 Apr 2025 05:48:04 -0700 (PDT)
Received: from pc.. ([197.155.71.138])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb61b6cd2sm19675985e9.39.2025.04.02.05.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 05:48:03 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: rtl8723bs: Use true/false instead of 1/0
Date: Wed,  2 Apr 2025 15:47:42 +0300
Message-ID: <eca5a63d92f5bbbecb642d324a5e0641f697d0bf.1743596287.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743596287.git.karanja99erick@gmail.com>
References: <cover.1743596287.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Standardize boolean representation by replacing 1/0
with true/false in cases where boolean logic is implied.
This improves code clarity and aligns with the kernel’s bool type usage.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 952ce6dd5af9..8f2c9c3e853c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1173,7 +1173,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 	/*  check if there is WMM IE & support WWM-PS */
 	pstat->flags &= ~WLAN_STA_WME;
-	pstat->qos_option = 0;
+	pstat->qos_option = false;
 	pstat->qos_info = 0;
 	pstat->has_legacy_ac = true;
 	pstat->uapsd_vo = 0;
@@ -1189,7 +1189,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 					pstat->flags |= WLAN_STA_WME;
 
-					pstat->qos_option = 1;
+					pstat->qos_option = true;
 					pstat->qos_info = *(p+8);
 
 					pstat->max_sp_len = (pstat->qos_info>>5)&0x3;
-- 
2.43.0

