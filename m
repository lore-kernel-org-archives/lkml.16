Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B640B27E052
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751404277; cv=none; b=fTx1672RjWeDms6KEW7Qmf0mDV3lhMGoh5MEG/rLCUHrBQFN3rreQRSXNY7xDI+ChQJweTnqLXSN/y7OxS9/Ldc6sw3XZkwpc/wN9p6oYbbFlqjuFGOtc4PDU7KUn9BPdxCHB0xDjLIvthiLsFwrlsFucidpu9IIvez1MKmzi/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751404277; c=relaxed/simple;
	bh=IhMLU0hgR5nMU1ETvuAbc6c2LFDAfdlY/2/Nu7/Quwg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NDrM52KxvDft3Lsdk+N7Oeo4YMuNVEBVv6qvgZoASEPGj5kMUGvq40qTxBHet8BH8mWBUi3D+9R/Di91ul5klJbUlnf7ZLTkd7s5+lolSo/S86+tMJKvtygZqP/GIv6GR/ZBmf42sDAQuabt/i/CqrGaeyWEirTNFfSzxNOgJKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aWq5zON4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aWq5zON4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-23636167afeso35769055ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751404275; x=1752009075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TFmhFMtJA0DDpLQmiOT+foafkxJNSmKvREFePJiDmoE=;
        b=aWq5zON4mmSgUyMPbwtVXMGEus/kRJPeACbUS0BinjbRnh3Ej9ZyY+xG7BwciIhaTk
         09+cvLKvVzpe59hTOJpn8yv2V/+zcQjfQrqF/8LG7EfuqoAKWNkhJzB8pESVDNLpKXkL
         YGFi1g2q1AtXH1N5xF1hXYNwUUOxHC/kps2Wg0mPw3aXwo9y6eTspKdQQSpIVD8inD+W
         xqaFF/DxoOGEuLOUQi21zDNaRPsm6nw/3RxxhPNbM5bFDiL/0al+4TxrwkOz56y5Sygw
         liGmEkKdbLTkGgPjWe5ZOJqvU0qtsPVB/bwHI8K43u5EM3bx+9P9z9ht7YgFoRDbatUY
         vxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751404275; x=1752009075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TFmhFMtJA0DDpLQmiOT+foafkxJNSmKvREFePJiDmoE=;
        b=CDAXehi0aEnQ5259Dv98Wuoq4oZpdvhrr50syi+B8AsQ8dM8fauPa2v2fqsato5q2M
         60WLrqdZwegsefjcAxyKEyQfFJB9ZgbakcKgCw0xywbhlk1nl3diNuOhMMvU6APvQ9mc
         7bZTIqdoYqV3AWHzxXvKOVkg/QCnfk1lC68bMsG4NdZpVJ2HjMGCepfj/U4VtgBwBRqB
         AxcnQ2vXyJC2NLnyDhqrTjpNRHpV4tpTzRrKDvFduDS+J2kaXRrNG6e8ZjoW1Fk7T2vF
         V0IoX7XFHkCR5MxX5TndVlaPkSewgAN23YNuk+arbdlc5rTv0kY6rTeeFsVb30jn6Oke
         mTOw==
X-Forwarded-Encrypted: i=1; AJvYcCWpIOPxPBRHuWa9f+nB2KOF53l51RXnQcOIZMhApwnRhbjE/ZoOLmpaGSSX/4f7QrYsrGFYFyXsAsnMkVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyltbuf5trAc9ySd+2UCozqHvaeu9waCAcxK3+NkjNy2j8n4Hj
	Ov0F4Ic65OIpOXtEbUCg0Ef7v5O8e/HfchobKJoxExTR6N7Wr0JEQM00UAawfw==
X-Gm-Gg: ASbGncvKBZa664N9zr2b1UL4sumyWiB7Sfk+zpPhnVY4suZI44+EBTeVlaDIwRFA7pw
	TKkV7jX40HtARZi6kYalVxSd9/5NQOEfgZecngBGBAN0DB0+4osBlGTPHhyvX5bJMZcpVT8wKOn
	yZNuyYrJfh6g9vQU76PkEZ0TFxnnyOK20nDvcgaUsushBkhcAFm2Hp0WeVzzsRdkEBCDQB8JGGY
	jO4QyeMHTqMKaowOxtoxysOh3B8z+yXzwRKt/TPOjfopJNUMxXYPvjhCqvehCveiTb4iTY+8nRG
	ynvMkvJu/3mJms8qPqt6m/d42sySy465ERgufayDA0jW2xGnRpG1+WVJaXQeYO4=
X-Google-Smtp-Source: AGHT+IHmVutxPWATA7uTd7j0oELIwzsuAjL0y+HAOKcr/WINJK5DWuRWpZqd+XMgkXzN0FParSSTYw==
X-Received: by 2002:a17:903:3bc5:b0:234:c8ec:51b5 with SMTP id d9443c01a7336-23c6e5e4607mr2825775ad.53.1751404274924;
        Tue, 01 Jul 2025 14:11:14 -0700 (PDT)
Received: from p920.. ([2001:569:799a:1600:7bdc:b579:12a3:62f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bd67sm114249185ad.136.2025.07.01.14.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:11:14 -0700 (PDT)
From: Moon Hee Lee <moonhee.lee.ca@gmail.com>
To: syzbot+ededba317ddeca8b3f08@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	linux-kernel@vger.kernel.org
Cc: moonhee.lee.ca@gmail.com
Subject: [PATCH] wifi: mac80211: reject opmode notification for unsupported channel widths
Date: Tue,  1 Jul 2025 14:11:06 -0700
Message-ID: <20250701211105.280128-2-moonhee.lee.ca@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.git main

---
 net/mac80211/cfg.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index d9d88f2f2831..f2e96eb07e8f 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -1959,6 +1959,21 @@ static int sta_link_apply_parameters(struct ieee80211_local *local,
 	ieee80211_sta_init_nss(link_sta);
 
 	if (params->opmode_notif_used) {
+		enum nl80211_chan_width width = link->conf->chanreq.oper.width;
+
+		switch (width) {
+		case NL80211_CHAN_WIDTH_20_NOHT:
+		case NL80211_CHAN_WIDTH_20:
+		case NL80211_CHAN_WIDTH_40:
+		case NL80211_CHAN_WIDTH_80:
+		case NL80211_CHAN_WIDTH_160:
+		case NL80211_CHAN_WIDTH_80P80:
+		case NL80211_CHAN_WIDTH_320:
+			break;
+		default:
+			return -EINVAL;
+		}
+
 		/* returned value is only needed for rc update, but the
 		 * rc isn't initialized here yet, so ignore it
 		 */
-- 
2.43.0

