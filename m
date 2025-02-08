Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F71A314C
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 08:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739002603; cv=none; b=hrI00yGpQgQR1JQr93EbhqFG7RYHklmU6xyDqSGvGRB2WOKXudGb6QhJH2kvkm13B8bd3a5RaXmHi/td3vVypIuXySySXe8eqWbeUwKu6XcKiBrUsdpT7vdRbHiJzp9JfbDjlPsLxPP+eERaTwFNnn5DZ6yu6xNVBDq1xs0S5h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739002603; c=relaxed/simple;
	bh=6SyAjLBH1UP/Lg4IawurSIwuUj6Az2WGwaEx0NGxizE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gEQAsBpVGr1fTIYskFrbbXbdpKTYCQq2YphrTGNpBzvNNc0eE2KHs3sBZON9BUcybcUjTlxYtOp2+Awj5W9+eBdI8nF1ZvWEBpfPgrJWEQm0G357+IIjuiDeGVQ8VXWAhsyaU9ahEJgaivS+PA7RA17RNoQ6fni0z6QezHTLl5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wp/U9/yY; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wp/U9/yY"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3eb9de518e2so1521758b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 00:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739002599; x=1739607399; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rTLiEPTqOtFdHsQfnTiaTuKmKAVDOacAUIwSfTExLc=;
        b=Wp/U9/yYHgFFXLlJPorVoS0MFqKg2VKNoezfE3Dl4H+s5HhsX8iUGx9sSNlM+Ms+F+
         vikeYprmuwSo9DxCF5UTB7v68Wr+TZ6w4TpmFsUtgwe1ZzcwQy84OLhvR1PRx82IoED2
         6LNiTQyrvY6LHYa8OhgVnCXTE7HtGYfifbZqe7UoI0XqopKl9kG3iGwJVBdXQF+d64c6
         ZTiBjSCC20AfEFSmyW7gzw9ivpSUCcXrIZnKEpVVOqV1nLL5Sh5dOsguufYwrb3aD4Sq
         /0hggYDWZu0U244iG8+YYWqf/pdPD/iF8/TwfyQSdKsBuLHsXhJ1P06tT/II12vz7jPP
         XxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739002599; x=1739607399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rTLiEPTqOtFdHsQfnTiaTuKmKAVDOacAUIwSfTExLc=;
        b=IvWweGqO4tesEMcjR8pGFFxlXhwjzlfc6IGcQJBzFMIOfTcpTdk+GvzodBMm1aI/mq
         msmntsxcT4BP+S8gGAqkaImB5I5J9ExgVQenpgFTu0yRGpPIaSDInCh9YufdI89AqFCY
         kFT8wvWO983WkOrRlkELCdI+9EGqNDJfl/RV4/9yvco+cAZIioyDTLsLNbHbDKrxzaSL
         FrbJ81UAZ6p3yl7/MnlF4kIgK+qX/iXA9X0RaUpbaGe8UoL2BMjQaQxjhnPBmpeEDgCd
         gXD6odhoXDOXkJB1+aR8fMn0c5HyVoThOq6un78JIGlraxo+DM9jaGOppW/ovUCHKk4n
         5aOA==
X-Forwarded-Encrypted: i=1; AJvYcCXr6clC6gMrzJnD42nysFKe46OqaYegSfUi/jTMCi1Sl0HQmITtwoHVQdUoO8oBrhS5tIKIDTOSycuAefI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcQb/EdTUbR/zq60EpZ7RNnpsaPiCJfN31/nS9oJLK9MSRFu2
	LM83GIotYlVXIQYmNnwwOCiIi1qh2FdhRlzOoSVn35YKGi4OIZDsZwFV/6Oe
X-Gm-Gg: ASbGnctbyUU66HEe7dQu+zVfOqotqlIHDfVzb6ZWY0K2bVqDdMh7wyffYac8u9KY5sx
	JuNaV1a0+0Rf9KgRL6SdJ49syqAuYA5+R5ypSfWKjHAA5+MfpyjwxeB4D9V2kCx3OHHGJHFWK2X
	QPwkUILHgfVPVIsXce0h+Cu6IsYWDUbgFUOBsuS1OvZVIs1X7FIeV1zqG3+Fr72AWSEgWBPgaV2
	RmmlhE9XUcjPEXBRZK3RmmPF2i1XrMPUd8YEE06luBV91ZFUY8B7v5G+bFC7d3Nb7RcbDWXlg6+
	AdqVFYJZio+HhDQ71YJBqcWXGd+RPOYUgpT3yGN/HDoXFI5eyMUlSejHa7OhRygoJQZBSxxJ9YH
	n
X-Google-Smtp-Source: AGHT+IE2WGlva6FTkAjphQq4bYqpI2OIjtaeysunDsrNWQKaw2VxgxJTFyepe9N0rP/jtNDMpO5LRA==
X-Received: by 2002:a05:6808:13cb:b0:3f1:d489:3d95 with SMTP id 5614622812f47-3f3922634b5mr3818812b6e.17.1739002599612;
        Sat, 08 Feb 2025 00:16:39 -0800 (PST)
Received: from DESKTOP-GL3U3CJ (162-207-94-177.lightspeed.irvnca.sbcglobal.net. [162.207.94.177])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f389ed1ca2sm1200833b6e.11.2025.02.08.00.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 00:16:39 -0800 (PST)
From: Ian To <onlyian4981@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ian To <onlyian4981@gmail.com>
Subject: [PATCH 3/3] staging: rtl8723bs: remove extra blank lines
Date: Sat,  8 Feb 2025 00:15:56 -0800
Message-ID: <e55d54286f8eef91418a117f96cd0cf9dc84ce8a.1739001527.git.onlyian4981@gmail.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <cover.1739001527.git.onlyian4981@gmail.com>
References: <cover.1739001527.git.onlyian4981@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2687; i=onlyian4981@gmail.com;
 h=from:subject:message-id; bh=6SyAjLBH1UP/Lg4IawurSIwuUj6Az2WGwaEx0NGxizE=;
 b=owEBbQKS/ZANAwAIAepTOeN7sYcPAcsmYgBnpxK4Tg+ke+DkqXQY+DGfEz01D0W09bzg1VHiQ
 ZDmAoPWZUqJAjMEAAEIAB0WIQRWEQChjkHIk0vVfn3qUznje7GHDwUCZ6cSuAAKCRDqUznje7GH
 D2zcEAC684ltAhCp4oUzvtzqxJHgy7S3OOgPNGwpx/zsIQ3kk6rG9j8Mi86X8zEZeqSxlZWMTI8
 2k/nO0THwryNsq5kEC1CAHkLj3kSuHxsepWS30inhPF5YYgYctSQ7y/X33YMaNILUGHnMbw/K69
 4oOZnusckXTvgiQDzrbqp83B6qenVQ9iNlXsGNkLmz7EyTUIsufsX2DTXY8k1ZqhPe7cGic4rO1
 MIQGCZZXO4KzGWfY94bacrNUJTYUl5onqx9hgnXPBH5xHT2R4b1hiJ1IrHoPwpBPw0OFxngQ+oI
 a0o9f8TqNdQa4+7TixSuCW8x0tLYsIw5GOYgjVbVvXcwkiMckPMWngnYkP8NkI1dCzDukAA7Ks5
 vCXzv+xLmiSueLWrf1mBqv27+uGVCZkTDJVyVhz6XYDsn1Dxi+0XhwGr0NgRfM2rVkn48bzX52g
 EGeCraBrCW4QnwBkQYs4XH2IKt+ubXx1Ebbb3sKqEA4JTWM//dHUaoLFsd1foHiulVhnFo2do/u
 tsSwwpE6VkDOx1N6QaH98BBtTXtZOulD+ylprrzla+L1KkkXEYc1zImm1u9kmAc0tZDQhE6GTu6
 rFlaVH7lPBOYHrWhqAAy6EZxY+ch+YM2d7Ad/620IvNuzg2d2qAhSCiXUlo1mOMODxOKIgEn666 dDY//L3cPhuKiaA==
X-Developer-Key: i=onlyian4981@gmail.com; a=openpgp; fpr=561100A18E41C8934BD57E7DEA5339E37BB1870F
Content-Transfer-Encoding: 8bit

Repeated blank lines were present and removed. Reported by checkpatch.

Signed-off-by: Ian To <onlyian4981@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 394f164b3bf4..4b3e7f40bb93 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -123,7 +123,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 
 		/* calculate icv and compare the icv */
 		*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
-
 	}
 }
 
@@ -219,10 +218,8 @@ void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst)
 	secmicclear(pmicdata);
 }
 
-
 void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_code, u8 pri)
 {
-
 	struct mic_data	micdata;
 	u8 priority[4] = {0x0, 0x0, 0x0, 0x0};
 
@@ -245,7 +242,6 @@ void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_cod
 	}
 	rtw_secmicappend(&micdata, &priority[0], 4);
 
-
 	rtw_secmicappend(&micdata, data, data_len);
 
 	rtw_secgetmic(&micdata, mic_code);
@@ -305,7 +301,6 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
 	 0x82C3, 0x29B0, 0x5A77, 0x1E11, 0x7BCB, 0xA8FC, 0x6DD6, 0x2C3A,
 	},
 
-
 	{  /* second half of table is unsigned char-reversed version of first! */
 	 0xA5C6, 0x84F8, 0x99EE, 0x8DF6, 0x0DFF, 0xBDD6, 0xB1DE, 0x5491,
 	 0x5060, 0x0302, 0xA9CE, 0x7D56, 0x19E7, 0x62B5, 0xE64D, 0x9AEC,
@@ -480,7 +475,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _TKIP_) {
-
 		{
 			if (is_multicast_ether_addr(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
@@ -525,7 +519,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 	return res;
 }
 
-
 /* The hlen isn't include the IV */
 u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 {																	/*  exclude ICV */
@@ -627,11 +620,8 @@ u32 rtw_tkip_decrypt(struct adapter *padapter, u8 *precvframe)
 	return res;
 }
 
-
 /* 3			=====AES related ===== */
 
-
-
 #define MAX_MSG_SIZE	2048
 
 /*****************************/
@@ -664,7 +654,6 @@ static void construct_ctr_preload(u8 *ctr_preload,
 
 static void aes128k128d(u8 *key, u8 *data, u8 *ciphertext);
 
-
 /****************************************/
 /* aes128k128d()                        */
 /* Performs a 128 bit AES encrypt with  */
-- 
2.45.3

