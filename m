Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C5326980B
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419869; cv=none; b=s+6DEju2VCYw4kh723WyB1Ns7zc7ugkk4ynl1Ip41DfKIvtJH5cM3VKesKKXlg9fK8eOeR6Pay5vAWWBoONtu8RBEMV+0RbF/nmr++ee5etAAh3evDi13Y2K3SSdKfId69n9AmXZ0gKwTFwFlek2qzNIZj7Nxq8MDhkLS5lDO2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419869; c=relaxed/simple;
	bh=7QUgyPQ/T3YEWQ1/2Hr5qFcOiLCYY40HXCZ+In2rM/E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=l501Wrx5TjG9gNGEkMf9axjpzyUeYZh8MkpaSQEqQunFCffj3xbAWKAB1uWwVQjBGasFRuszIjWCCsO7Nbo8hU6WsN2Av9T6lI4wv5k81tnu/OQrYZ30MDq3sl4380neF9wMtEvQjMvvQ0PVZvm1RtM0ixF3MEONNIBzTb3pd/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G2+4A5Z9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G2+4A5Z9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-450cb2ddd46so832885e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 01:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748419866; x=1749024666; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IFycvXrQUkiOkbhte5Aosw13hGKT4ZnQNkWJE4xdYxY=;
        b=G2+4A5Z9oJpo9pzmKLIPI0tQdP/74hpa1KMgJ3nqG57sn+FxSeS/S/YVDlB5rOE6VA
         Aw5gXJWFK+sadwjkSgPRsJwPxXH8tDyL9ykFTqpCA3ngSBMqjjB/P1eDI3hN6UP4wsKP
         oBjSV0J4XBdKvF4TXfplRX8qPQ56a76JDq6z/U+5XtkWq3De+lVh9w4ULo2VhztQEz7G
         JOQJdVNZ68CJjWVTrimCg6oj96Tt8CiJshkaTYWGrBtp2HHE4YoufdVThTVFkCtENzvC
         Pv+syOXnxz1+BiiVF4UTbP/kZLzYXttimjPijf7WidxR1+tZXlkDEBSg/Pj/WfWyjlJ9
         Bf+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419866; x=1749024666;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IFycvXrQUkiOkbhte5Aosw13hGKT4ZnQNkWJE4xdYxY=;
        b=lop9eNTJVgxRrxqcGZ82xTi07V4q6Zfh0ZFquzGQVJkFD4jvYdx1Te1V0rP8JnQ7dC
         RsCJZtf1L0CLyviu89t8bB7mwW9DL6UIaJ7R1wHvEPsbOV2xQlyX8WkRH18AzSAAP1KQ
         f7j47c4eUpblsH7o/9mYvUbies6plvNq/CgPQGZWRtDWrPKMbaR0YUcnWQooTIb4yxFY
         yaLTH1pH+tchuEtKYsPdd97BtlHVRtBONa1+D9XgORhKZG1T2QRdKtt+fnJmxnfwBw9Z
         1rk5q0dhJHUk+0HCDsnGHIWruC7dpqIXkXqyruEYlEnHEASscV7mVGgTKmLh7ger7dV0
         yw0A==
X-Forwarded-Encrypted: i=1; AJvYcCVrOq/2raOcfBltTQaEIdkPAxqhBSOydXdH2AvuduMIjf9HB9Yx4oGZXDo38jX9rZdhIVNbBUC7CXc6GWI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSGwx3jmOgK9ngY/kF9qvwizZox4uhpAKeikLb5P+XBWSGsLVN
	owm5krDKHCfsgokYoPzUNoCOQDN0pU+64gpCxc71X7smvhj7c/f/VlkxBHgrzwG7pNg=
X-Gm-Gg: ASbGncs8ChUJb2vCfrgN6d+LJcpxMSKLiDGhpcV/mR1fqAMEs4WvzY+YgL88PdOD/+9
	ZYm8Wdv4lsz2EWK0SX+uiZVYrYAst9GMV8X33N87uCbKwV8kO2bqL3l+576WKsU+2PW3mbHSHcP
	j+zBavwDzBXgRMHZgV7qRmd/vKjiX94J0SBibihLzxOZXPt2sHATh9kap8qsoRmf66u2PYPbn/d
	mJuo8vs+9Hmp0537JMQgoO2y1VhMZsvQB3lZZeKcW9uVW3gRUcG6CePREwoh8pwtOKGs/fisnUc
	SpLdohdOkwkHjBaHAGfwXwfrHnjOJT2FKG2PFeLiVKF90tyCmCmXNpKu
X-Google-Smtp-Source: AGHT+IHX4I0n+ZPz2LAonQ+C7wF0g3TSvB1a1pGhyeywpD5kz73HeVr28IbZeV7RGlLkbc8tETsEvQ==
X-Received: by 2002:a05:600c:511f:b0:43d:5ec:b2f4 with SMTP id 5b1f17b1804b1-44c919e13d2mr163530375e9.10.1748419865922;
        Wed, 28 May 2025 01:11:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450787cc3c5sm9406215e9.31.2025.05.28.01.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:11:05 -0700 (PDT)
Date: Wed, 28 May 2025 11:11:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zong-Zhe Yang <kevin_yang@realtek.com>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2 next] wifi: rtw89: mcc: prevent shift wrapping in
 rtw89_core_mlsr_switch()
Message-ID: <aDbFFkX09K7FrL9h@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The "link_id" value comes from the user via debugfs.  If it's larger
than BITS_PER_LONG then that would result in shift wrapping and
potentially an out of bounds access later.  In fact, we can limit it
to IEEE80211_MLD_MAX_NUM_LINKS (15).

Fortunately, only root can write to debugfs files so the security
impact is minimal.

Fixes: 9dd85e739ce0 ("wifi: rtw89: debug: add mlo_mode dbgfs")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Use IEEE80211_MLD_MAX_NUM_LINKS as a limit instead of BITS_PER_LONG.
It's stricter and also more informative.

 drivers/net/wireless/realtek/rtw89/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw89/core.c b/drivers/net/wireless/realtek/rtw89/core.c
index 49447668cbf3..3604a8e15df0 100644
--- a/drivers/net/wireless/realtek/rtw89/core.c
+++ b/drivers/net/wireless/realtek/rtw89/core.c
@@ -5239,7 +5239,8 @@ int rtw89_core_mlsr_switch(struct rtw89_dev *rtwdev, struct rtw89_vif *rtwvif,
 	if (unlikely(!ieee80211_vif_is_mld(vif)))
 		return -EOPNOTSUPP;
 
-	if (unlikely(!(usable_links & BIT(link_id)))) {
+	if (unlikely(link_id >= IEEE80211_MLD_MAX_NUM_LINKS ||
+		     !(usable_links & BIT(link_id)))) {
 		rtw89_warn(rtwdev, "%s: link id %u is not usable\n", __func__,
 			   link_id);
 		return -ENOLINK;
-- 
2.47.2

