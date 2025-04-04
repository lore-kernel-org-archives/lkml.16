Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0DC18CC10
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753144; cv=none; b=sa2BuXzOtvZinpPm7iBs1l9d3mTGb5AilB4RpbOorOckeUJlTEeXJLUhKjCy3JbkBY7IA9vFxNo1gpm8BFZ1psei2bnBcPBwKISZ4yXZhM2Y7iXj0Xt7prb+24U4U4bEjhPXSwS6UYoKd0BVdwgbbIRlZ/BY7vBr6TFTtG1tEhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753144; c=relaxed/simple;
	bh=PUvqvlPxRPSyXrxu0K2XV4no9uI8EXIW+zUgHjQNf14=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iT0tbxJvHYAckge+4nK2cCsIcrOBxi/gcc/lUz+a5o7f3jYuMaYtwOoM9DFhwcFdcswgLV/avU8BwgmnW9KEeneTfETWIA1TqB+ofDtaLHdDg+YMreGUS/wD3dYyYx6tY7ACEPckZ896iiESSdABREyco4gLY+k2pjS0hgbXozE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jBOlaUkD; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jBOlaUkD"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ac297cbe017so532990966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 00:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743753140; x=1744357940; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYCEbsmpkeS3Q60maCjHVoB56blZ91ijmtQzE0zRKHI=;
        b=jBOlaUkD4b2xugg2B+4LdfaTkQiXeTqe6u+0qqb58JiG5ZAk1qTJmqqNv52V5gJuZY
         hMeZo6s7vaoyplnw7fcTHNiQ3T+EIdlxSJ4zMdFohzZnolzi9H0lPlqAgmcjnIlTDTKA
         PvdKmWrmoEyRRLGROZwgXCBP7V2wrRHSP7z974IFadaWwzjv+ouw6aBkFfoSdBmUpzLw
         rxToVqWQy8e2MurfcFPyUYVSmpfXhLfktQyfiTg/kgLKNEU4SzrBNptCqFuhN5b7UZwp
         wIFBREV7N0HsmPZQtPPAqaL+Mfpl5oTzBNG+mp37xyNEDXm1teMkAqRT0b48HofUOy9W
         m3VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753140; x=1744357940;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYCEbsmpkeS3Q60maCjHVoB56blZ91ijmtQzE0zRKHI=;
        b=WtP+XSwFUX+dyWNtt9Q8ba6o213lRG1rFzcn0kU5WNkpSaPpfZTFXsAMuVB9uHnDd9
         benM/wka4nyOO6wbSDtvcK8iSAWuzPzf/BeiSfSaNRP0rWvZIdVVvI3BdFJdJy7WH1lH
         0em6BwByPr518m+QC+BMf9seUw9HsSC48TpZr4TdthUbOJ54qr8zLoVDNHTK2FvjwSwx
         TLdn0qCHNfanHgatqM2CtSNyB3PcfagRDIZZGL7jvvru3g0OmQNbE97UmgVgev5BXJn9
         lILe/210OQYDk6y8ZjcCDU4M52U2j+Br2UKT74E4mUx4/81ypjgiJN5gWy+Rt6VZcAVr
         upkQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0TAxoDRytI/CA1k8me3/IGeLkXqV1cNKkiDHezxsLMD37PhdTfOXYMIdM2IqmRqDqUvcYEct1S+H/tlQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaMNDbAYGk0wFGNJktrMwi4yBeeY2ns0cU2mEngX6KviuHf7Us
	qseolgtzIcz3gUeuZsc3TA97i90dUwuhVCHURwPho37jg+HXjmp/
X-Gm-Gg: ASbGncudS/FvS6rRmrW+rB1SYsIm8NveQLNT1EZZ3DIihGlcSz7kuxzGpFg6mUkRsxk
	klzwLKZ+MI+HHEBwld38dfjynOfBdvvJihqCPLFanGqtIc3mZ/fQr1nO551n1YIAswvqATOaB+u
	VFcA9gI48zxOjRiOEMAfOyDeialm6uCpFDFTsD7nK4MMnjQWpBU4MDx7g0wIL9B2U6LNk/nASRS
	nIsBuEflOQu9f0qRcSf2fFJ8HHwVpvk4w2cRpBM2dXbGpD9W08Bg1bnI6XQCJXp6wN5yZ/hJXLw
	WvEUj9HrE6ir+eNX1xyYCZB1UDER3ZhOC6V+XPwc0WMw7dZP
X-Google-Smtp-Source: AGHT+IF7X9qGSvYgcfZKBIkNjGsZ8LP0gsSa+mmiw4Sgg2By0sPj+T5TnGntgva+aPuD0xBUHc57Zg==
X-Received: by 2002:a17:907:96a7:b0:ac6:f5b5:36e0 with SMTP id a640c23a62f3a-ac7b7128261mr570432966b.19.1743753140054;
        Fri, 04 Apr 2025 00:52:20 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c0186250sm205997666b.155.2025.04.04.00.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 00:52:19 -0700 (PDT)
Date: Fri, 4 Apr 2025 08:51:59 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev, julia.lawall@inria.fr,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org
Subject: [v4] staging: rtl8723bs: modify struct field to use standard bool
 type
Message-ID: <Z++PnxFQFe+IexUi@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct sta_info field ieee8021x_blocked uses the uint values
0 and 1 to represent false and true values respectively.

Convert cases to use the bool type instead to ensure consistency
with other parts of the containing code where true or false have
been used.

This change causes the struct field to change size from a 32bit to
an 8bit. However, the change is safe to make because the sta_info
struct is not read from the hardware.

reported by Coccinelle:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
Changes in v4:
	- Added information about changing size of struct field in commit
	message and why it is safe to do so as suggested by Julia Lawall
Changes in v3:
	- Added more patch recipients
Changes in v2:
	- Improved commit message based on suggestion from Julia Lawall
	- Clarity was provided to Greg kroah-Hartman by Dan Carpenter on why
	it is safe to make the change to the struct field.

 drivers/staging/rtl8723bs/core/rtw_ap.c      | 2 +-
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index ed6942e289a5..82f54f769ed1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -389,7 +389,7 @@ void update_bmc_sta(struct adapter *padapter)
 		psta->qos_option = 0;
 		psta->htpriv.ht_option = false;
 
-		psta->ieee8021x_blocked = 0;
+		psta->ieee8021x_blocked = false;
 
 		memset((void *)&psta->sta_stats, 0, sizeof(struct stainfo_stats));
 
diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index b3535fed3de7..63343998266a 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -86,7 +86,7 @@ struct sta_info {
 	uint qos_option;
 	u8 hwaddr[ETH_ALEN];
 
-	uint	ieee8021x_blocked;	/* 0: allowed, 1:blocked */
+	bool ieee8021x_blocked;
 	uint	dot118021XPrivacy; /* aes, tkip... */
 	union Keytype	dot11tkiptxmickey;
 	union Keytype	dot11tkiprxmickey;
-- 
2.34.1

