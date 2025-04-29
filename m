Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795CE20D4E2
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745894646; cv=none; b=bYHPY4dHmNaNvZ+3JArma/DWo7Cml3P1kcK+g6gxJfx9K82Yw4/Z61YduGqC1EyZeQx0I7YGm6hqRFt5P32mj/jWengP7wFYf5n/XWC1xx1F2E1ehpjf1u7G0RbS+gp23uuikfEwGGizRljHn0MrqEhd29oQsFuZDt0dLFFRLPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745894646; c=relaxed/simple;
	bh=BqdmFPdTNS+QhNCS4yUAj4WTsfTvN4dtuYhkNj2tGcU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=EpkugvNuAqOOrqCTQ4nA9WPgkaF4+gSqyj3M3toaWL/r3t1HI/r5uSbjcwaYh/GNtWJ+wNBsi2bQdSz0x7l/xEXeKmCoRJ3zlfB+zm0mSCXKge2oNWgLD8G0p1YmyWpL99VBn84vpcVvg8AFsYd2J/o2kLH+rHn/gc5IiFufb6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=PBGjlmC+; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="PBGjlmC+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745894332; bh=6zZewhOeylyZFTJYKg+1W+tfekMRe45GgGT2mfqqG0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PBGjlmC+J7zqHrwsNGbmqw846qLN11Flt+bZ1g1oKgrZmf7Kiu3tiCrzdtNkL1v+l
	 9Kz4zFxruBMHf4zFwLVMDyxulpoSKpxX71Id7pzm7TPrPNQzee94ID8ibdw33BZ1+y
	 8+VCt3hZ8IGj5dijC7Fv6n/pXhMSCftRDcPgOBAE=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 9B230E09; Tue, 29 Apr 2025 10:38:50 +0800
X-QQ-mid: xmsmtpt1745894330to8fph3n5
Message-ID: <tencent_594577BB67C03CF3364296D2374E4ACA7509@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIexGxz7G8mOCvB1jswsYv+q+DTVmukLil+6aSa0E3FuyV/OYfd7l
	 eHyvd8iLPbHHdoGXjnrFrXFodT9ZrzSnOxc+s6b6dpTlfui6pOo/a9Dq9uTzWTnFL0jMk4C6yZ73
	 Sph1ZEVtxfsg9oRJJUOzNKo1kZrg2oX4jSRVHrgzvqFJ3xNZ6XJPWTMl5pv2mwduCkYMrH6ubC87
	 Hrdvvg6e8JptTaLtY66UYBgwem9KNUgMWxQ8veQ6W9OGsu1IQpB7ekOo1IbO1zhPJWBY1e0qqa+e
	 UCMyeAZCp4CUU+9/4kIQtCbYRIo0iV63V13yUiZTv/DIA1PEQHH2Qm2yfR7z4xiMV+yrl6EgAGRi
	 RC2P+Enfdvgi7GBMEcEFlFh7dMVtHusQGGLFFORCZziq7BdUh19eDNlx196bXoA46ndPcHK1GLuQ
	 +HAsfdTDZ7oS2lBoCMOP4spURbMYalE4pc48T02+s4ghGavNlJePEbEfmRl4YWlNcXpNNYdLCfas
	 jXr1Ou6mIXCwzIYGx9Xis4KuG+nxbe3oTNO2Guvnm4/oFP2TDuDLWZIIPuSM7wDIasePcGnnIq23
	 hekgGRLAqIfvoMixUNf8y8S66j8+i67Gq28qSL0jsue4yVbPzSLib08XdmQr053MDnMHR66kp1ry
	 Do2Qv8VK6o2qeJKi8HolHp+0gOHIX9NrAUJpgLrJqDHrn169nn8aQzTuj6447u2pG0WQWVEzcrus
	 u1LbXYae/L7ZtnqNDDQjEvLyJLHyce/Adl5mN3VWpoOlMyBUvPqJ3K5Yeelirbwy/Q9MhXpF/nZP
	 jLlIy8s/+D6t01vmTxses5eRBmqaWiZ3+IAf53FUKpZPdlgOf6JMHiGLv7TdwbBit+nBnhEH/z3N
	 iWMtdWjt6jTVlgRBRYR3KlXDOn634dmcuI3jY96p66+FWyhqV5Ov4Ugbw7YXPp+w==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
Date: Tue, 29 Apr 2025 10:38:51 +0800
X-OQ-MSGID: <20250429023850.389321-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <680fd171.050a0220.2b69d1.045e.GAE@google.com>
References: <680fd171.050a0220.2b69d1.045e.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index cb7079071885..e73cd9eb164e 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -1194,7 +1194,9 @@ int ieee80211_request_ibss_scan(struct ieee80211_sub_if_data *sdata,
 			    band == NL80211_BAND_6GHZ)
 				continue;
 
-			max_n = local->hw.wiphy->bands[band]->n_channels;
+			max_n = min_t(int,
+				local->hw.wiphy->bands[band]->n_channels,
+				local->int_scan_req->n_channels);
 			for (i = 0; i < max_n; i++) {
 				struct ieee80211_channel *tmp_ch =
 				    &local->hw.wiphy->bands[band]->channels[i];

