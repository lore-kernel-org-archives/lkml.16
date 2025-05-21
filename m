Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5BC23BCF3
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 23:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747869817; cv=none; b=CriLqCC4/WIeLB/ARUpQUiwdKvu917IKa+ROwRATCzIiJRnrJZsIgC2bAAvUxTrOBl+YEDLK6hxqAYauybraMoaXNmhU8X9+SHgmFZGfk+I+in9pF5Vlc2Uun64VwP7SZsOBCUg7U94Xm0dU5DecYgr+pOQreWBYywdhr3AzNAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747869817; c=relaxed/simple;
	bh=wxsg4EgbCx1fj+v3Py/w/yDWFyRYJGFCBuhrEr96qI4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tOAlcu67v3Gfw+sB9yilyhRz/1SQCNzQ3dIv9Njbr46C4w7sB2hWPUA5o05+ONHdLYFbasbfnQ1BVYAJl80Dh6u/BDvbVW96/P0Zq6ehHaqh2LCfB1HHxwXbn3phPlas6BLhu7MBMU4tUqfOThBKwJYP22n0RQInVelBw4LNt9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjkcMTEQ; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjkcMTEQ"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70caa34282fso40609197b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747869815; x=1748474615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi8GyyRpSYLm6pCKM13JgN3h71bL9ajNP8NCgZ9JC9Q=;
        b=OjkcMTEQ6GY5SuIpcBQ8Lp4n6Q31xoZN5+4qF2NGq1L8Xtn+ALO19wZYdRB+Ktz5kT
         IF/6+OY3BlobtCBp2m0WeXGoybnjN9CuXHuHUFErDWapz4eUjzmXmbZGeoeFvGWhDQN4
         BF4K1eaP3Tyfbqcol6OesjiRTySWdTyfjzFOLDPYLY1riOb/SXzi3hJ5HEOIcpo1dxAa
         gghFM9eK8UqmjYmQmztLyj1DzIm0rqcV4ck9WnphsQoBe5whvgdj1v54Hn1aN49SsLdB
         y271vZi7Wrt+iiaazhie1ec24poVDcM5vVGxzDe5grN6QmLDJReoQCDjrQnUxeYc+fzx
         6OMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747869815; x=1748474615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wi8GyyRpSYLm6pCKM13JgN3h71bL9ajNP8NCgZ9JC9Q=;
        b=n6RrJ2DA0ZNlJk4aISVCoIbj7k1REZUuR1im/XUw6CLPFZysNhWINZLruHr7qD7hWq
         7azu1NCW4bDbedx7gEi0b+zRoSuYEzv0k3S5HD9iG4ZXjh0aDeBmKBwCjLOM8LQLJcDS
         5VC35l7ZrD1kCSfWxwH+vM2XmVzhZhkFgN/9hB9L3bCWimK5Jy1z6JUbS7vjMZt8ya98
         Bry/60knEK7SHosh7cwTSwhhXt5zahKQFB+3Qg/JoBhassldPOzY8S5w7n/ISDSeTbF5
         /dZxUTiNmQeqHJujogasj8shbLyJgGC9eRlqjPVZK1hoA2/sdsiqD7DAH+iVgjoKWN1k
         nW/A==
X-Forwarded-Encrypted: i=1; AJvYcCUzvbtRSIsV6HBQyhfZOmy30Oz/tgKjvCjQ3P1/wZA40a1GcwMRdGzChzUiI9AXJF/5f48OpwJp5VUwDVI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxIOskxof2AWyTP2BrtyRR6WpiEMWxtSlhm85uWKC9YtfUhHt5
	Yepqy/tJwg0JxJOkYCMoL6jhlWk456E+4vxAjk4fkUXWBOkwsdBRp0cxkeVIfnrk
X-Gm-Gg: ASbGncugX4ynlvTkRyO53HCyND9RSQE8+G9cEwWrDjzX3m6WX8WWQNtd12ylcdwu1OK
	y+IsG8wDpn+MxNI1SSxHhsBOaLFePaczMTK7I6EPBpRfYEw/51wnXXbUXyyMCQC5Lew354nSvD0
	keebJyAbh/0Ml30CQrlNP5iKWzcL0luvxWT1BR5p7G3XNZFN3V1VbUhJQh3H34ent0eJdKzwgBP
	HYcsDK541DxJRSwiJzDigG0h7K+TvgydIZsTMvYd9yVfAxOpOnPUHnivZOk7kbUoFULxy4N6u76
	0lzOPx/5VVnCSLMlp+GCvQVXjI4tCI/DUz+dd0jgK4r+qANJj0yOGzj+P/ESJvEB3ejLOZFNQDE
	LHNU=
X-Google-Smtp-Source: AGHT+IHwwHYfGGH2qEaXo2SgMm5hAhmNhNv5yGqf8z077S5mu/ogAZovjmGgdBpzwSVjhrdvyKxyKw==
X-Received: by 2002:a05:690c:4a06:b0:70e:61b:afe0 with SMTP id 00721157ae682-70e061bd1e4mr10870357b3.6.1747869814728;
        Wed, 21 May 2025 16:23:34 -0700 (PDT)
Received: from maquina-virtual-para-linux.. ([191.156.39.247])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-70ca8509360sm28424517b3.71.2025.05.21.16.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 16:23:34 -0700 (PDT)
From: Donny Turizo <donnyturizo13@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Donny Turizo <donnyturizo13@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Fix typo in variable name 'ips_deffer_ms'
Date: Wed, 21 May 2025 23:23:26 +0000
Message-ID: <20250521232326.20438-1-donnyturizo13@gmail.com>
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

Changes in v2:
- Rebased on gregkh/staging-testing
- Fixed build error reported by kernel test robot

Signed-off-by: Donny Turizo <donnyturizo13@gmail.com>
---
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

base-commit: a481f0ebf213e0ccb85f70c07bfcd733d2dc6783
-- 
2.43.0

