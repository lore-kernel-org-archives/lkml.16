Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930B51F03E0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743599923; cv=none; b=NtfS03hEVcBryV3abPqzgCABXnJTyLfoBGZEA0pZYL+cVIVueOCB4GpYYZHgKaq6jq2Kboh1DXouv1I9NxnDQkqs6en+/+lUXunJEjbUX5LD7hQWvlWW+I5xvR4zOhCaHaKygTPw+2k+JcZ4Uzq6OFc5TlgEJeaQ/3w0o+w+CwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743599923; c=relaxed/simple;
	bh=hTce2fu63vILU+Nv0bLr6fat6cpDQYvpiVdtQKz7zr4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bI2S4qb6VYq+HrShbRWOH9rdjez6lLKPorJn7uMtct2JimrhH/E0U9em9vVFFrxxZH89+csFIirrDsBQH3e8s+TWxYo21RqitT0DW6biycheK2zgGgFDe09KZqeNuSbzpd22AKg1/e38WqnppUUz6edRBl6kda38UJzQgVDn+qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OFMrmh7M; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OFMrmh7M"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so10808731a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743599920; x=1744204720; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H8OOW19gYi9GtyeQ4qqZw+eawnXRnqo/rA8a2T8vrZE=;
        b=OFMrmh7MnB7lY7NsohuVZt2nX3i2p2JZEsSsTBYXBwquTBFXwwOri3khNug4mbOm5d
         D2XWc4ojNuYZ4G9ge3VhXFePnTL2iYOD1qBIqBGyJ5Pdee4K1eiv+NG1GjL5gr2d5wwq
         QLShAWS6nLwseLCHILfcS8XA3A0fH2GqzeAWlg3j/JQEi5VL/obXinh7+OQb6vZ5LIal
         nEEwqR70A57P5ENP6E2UyYX52+C6WJeD/kmen6gcQWUNWSyYo5wQTCnMdUOkOwJHhGeC
         PycdO1u1Ip3Ufib8HJrtmxq+214L3wbs2NfdGS+KdeXZi+d3I5doR4EEKJsAlSjri9PE
         PXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743599920; x=1744204720;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H8OOW19gYi9GtyeQ4qqZw+eawnXRnqo/rA8a2T8vrZE=;
        b=kqtVco0k+cMF9w9YN1as5JkzO82XWdeImUjwh36eFeIkadTgo8PvA2rQch8BEwAq0S
         ehLnN2Lc3sIvcw6nwjdTMupadAirM93eOsxopK49umuXgh8/Sgqdv389efE75K21ZTcz
         pjePc3hmbCbJu8gmsQn1DnSl0NXOlB36w1HGRX0nyvXPmFCgEiw+vHf3/6WS85FhS1d8
         KQqWqyVFuNXq+kOSWjwxWQeKmc6hh9+wmlxUS4KmW/wYrcJhcU+ngnGnG2ewK9N2ypgI
         cPguPDXdIPgPBWkiIQkZshBETwxIbmyWRq5eqk8ZLWcaeYMuDo1LmEWF3LQcf7zKSXb/
         /Drw==
X-Forwarded-Encrypted: i=1; AJvYcCXMhJS1Rxcoq83zFGgWWZImOwF0b4Gku2iiTDIC6nRyUKO36NL5bCYnCy87R3PM0VfeyMAwSRESST5a6ew=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynmn8ysyCE+zEmZd1B7RU4QxiGXHgpeJVwfn3PPN8IQtm0RR2t
	W5tyouU8SCPcUjCuoYJJpY2Vo+0uCsKL7fzYG4x6kQoQa4s/Jo3dlYP0p8dk
X-Gm-Gg: ASbGncvfzdlZ7ObTEb/amhMFkJRxpSKuGmxqMcBVeH474/o/o9e24oRYipupH+1Peth
	pkE9j9vjynSCijZMZj40HMJrVuyT1neOIT7uZHf0WJRjPlByUbIW4mx1N8FbaQSdTXHTEqHhWXV
	gM5DCjLK1xRKw7HylohLshCBPctPP8fjggXSnQ3aBRKfi4REbUbu1tyv8k3jwEUpCxUKY5sB51D
	bj8t3DEyqLeNWJ/THtx1eVMCVIXxvDR/3Sc5HT1qqw+joDMqKk6cTviwOf00fcMx4s5K5cNPwIV
	8N+EWTmQ6k3K9bP+50ZdHdCbT02oRV7uHSlqf3AhlHiLmeOf8g==
X-Google-Smtp-Source: AGHT+IHFUmrmlc4HA2ylOlLMlHTULjl3M+S7hQguh6s8FyPgenDwQjUTgAyjksCyMnV0khwDxKRsUA==
X-Received: by 2002:a05:6402:42c8:b0:5e6:17d7:9a32 with SMTP id 4fb4d7f45d1cf-5edfd13ca73mr15448608a12.18.1743599919214;
        Wed, 02 Apr 2025 06:18:39 -0700 (PDT)
Received: from HP-650 ([105.112.228.227])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edcaac38f4sm7793053a12.10.2025.04.02.06.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 06:18:38 -0700 (PDT)
Date: Wed, 2 Apr 2025 14:18:24 +0100
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Julia Lawall <julia.lawall@inria.fr>
Cc: outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: modify struct field to use standard bool
 type
Message-ID: <Z+05IEjV3pczMLNQ@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The struct field uses the uint values 0 and 1 to represent false and
true values respectively.

Convert cases to use the bool type instead to conform to Linux
coding styles and ensure consistency.

reported by Coccinelle:

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
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

