Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2B219E97C
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743614230; cv=none; b=UiZoUmWEqWTP+1HYywjwxWd1LUNDBx4vyX8xOw9eEZZNNfCVBPQ9efqCISus53Bqv9dApoe3tCo57cL+J7xz4cUc/w5cgfwnpK6rT3q2s2r+jZdV6syk3MDen1S1fCdIApC9+lV2tNCuxOp+/OvxD33qJkqrVsGz/WMelq8fbPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743614230; c=relaxed/simple;
	bh=ASy7x/f6SxcKvqgHHFXn+615GFU+RPiRQERe5vqUfYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QRUgeOmv71GBNjvE4mme9ftLu3agD43l/l+9s7s+Fw2dFeztC0LCh3OyuJMEW5+H2Y7OXkUe1fy09kO8qQE4T9dD/TZFsHHoN9JYWdOaKSo40SfXfZxI8hyLoSVv5ihyPKLlN9mDwP1V8uknGQNaT/SrHZzX427+ExLO/H2u1og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lAR2iFWd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lAR2iFWd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso70150095e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743614227; x=1744219027; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MM3/jrbM+7MikuWA46DfR7ZYWcwqvfqg2BzsEh+PZgw=;
        b=lAR2iFWd52utCp1jCrQWFGtMPjmOOobOoFi746ZOrkOLOorkUznnzjj3tFqI9iskJl
         D3tRZH08i6TkzluX4iQ+Gmh/eqTLj5zd1nr+I/PGnwITUl7UZBwP2tH4XmAkeIJQmnlT
         7XoqXrlho5lKfPxLF3AD0QV383NK/nTVuUz1VW7v68IuEJtEIvfFsqOfgFmX3fjLJ8GY
         17u6pDVEW4d1sgDT+vPie82BAN2sJfyKetfmki92Zfg4/NGaqP8qNzqjpaLQ4Vugy6Vc
         rPPeTdw+AWym1rxAmKt//u9aqfKDAtYhN9Kk5f5SaPKBz8iX38k6tFCxVtcaFjuL1FLT
         7mGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743614227; x=1744219027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MM3/jrbM+7MikuWA46DfR7ZYWcwqvfqg2BzsEh+PZgw=;
        b=fZtRQnAcdGZhuiRT6bhpUvdPCNOCAOVrVSc7kaJDh2RgRZiQRneSEdA6XIi8PhOKYJ
         xWWln95HMAZ4VAoUAWfqBfsVuwxKg8F5IZGubXwmeaNZ+X7sFro8kKAFDVn+rGR070it
         jTdGnq/D4bGsNa9Q0bgOYF6mkSHufjahjLIuVmeXI22m6G8/jQqxMRGkxyKR9pNKZLyr
         hDiY4XvLbz9yYpCigipJntED3pb7xKIPbnQvtVSERxRHRDNrSK5ZmPO60zkovrwXP0oR
         zW/1ulhd9R5rSdeYBHYcVIVukasdwnthC5rjGVsUvfeinq08FZsTNPCgD+xE/EVsMjFe
         +ZBw==
X-Forwarded-Encrypted: i=1; AJvYcCVVNR6/dcfdgWsXYgyhcTWMEvnqW1BapHBuBTo8weijfGtoiK4DZiGMR2mAWzCGh5nAhE+Fex5ktH3tFNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF1oth7Y9CgRUBChRIslJZRLSiP31y1+5BbC9m7VzoWRV43xlf
	b1ZcmyvhPcfE4RM5yT+mlcPa7602fsADf7j9GRxVVIKqRJGHntho
X-Gm-Gg: ASbGnct4ihfhdwQmXOvj4K49M836PsK9hZhoLt40VRl8QJ/onM5GEzSmpHGZgO33lUg
	MJNfe689r1uGUweYSA6dj4dyNRfdxOTMfNWXkSQB7z3Oyw3IVjc1QC2wvXKQTjG6L4bG/ZnAuBz
	JskQqoGko6+/Hl0igz1fiCjDN2e8YaMqOUsOAhWj6d8KQazG+SB4KKchlbqOn21xKQU3ZGlg7tQ
	uR0E27SA4gUXd1ToNdLKUkytt7YGaiCzI/okk895/SHAGW3I0UYcGJS5sX8HPAsVIzXPz7jtq0y
	jbcXRl8laC8LWOdSGFMrmH3FfiZPpMxPaIsxGjIeSA==
X-Google-Smtp-Source: AGHT+IFCOAuvL+YP/0LNaOQ59lyeIa5mHPjsHVljIMRh18gMNrw55D9gMOfYJQa3vj2VbFQrAk0H5w==
X-Received: by 2002:a05:6000:4282:b0:391:3406:b4e1 with SMTP id ffacd0b85a97d-39c120db7b4mr14776803f8f.15.1743614227333;
        Wed, 02 Apr 2025 10:17:07 -0700 (PDT)
Received: from pc.. ([197.232.62.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fcd489sm26713525e9.11.2025.04.02.10.17.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 10:17:05 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] staging: rtl8723bs: Modify struct sta_info attribute qos_option
Date: Wed,  2 Apr 2025 20:16:43 +0300
Message-ID: <c303000c4edded3c66593e62230d661cf49f7e71.1743613025.git.karanja99erick@gmail.com>
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
replacing instances of 1/0 with true/false where boolean logic
is implied, as some definitions already use true/false.
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

