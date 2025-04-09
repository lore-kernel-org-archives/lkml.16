Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3911D6DBC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 09:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744190762; cv=none; b=a04W5UlET8YQJPKsfyLGY5CjU3sXNDrlERPJWt/y44kxHn+ecTJ8kYHDP9Skkv0aI3Kx06k+AUUG5qbRDkvsP1HwCjsEESf6k94+w0zhpsgw2QWUCy8mfgcjTYAJlDP0ZH3YYIkuCsESbas5TdHUrgD4t3HdAUOHOp4+D879MT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744190762; c=relaxed/simple;
	bh=5C3KFfpI2O18fhzqUymS8oo6Dz0Be0VyIM8bX3M5FJs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=FFQkMIjzj/YD7XGA20R214Vci1ssduIOKzdzqA6zM7GCTDC34aHIhtnuMglgVfWZM7Cny3o86rtYjDFRaw97IIJzrBLCxL9ThYvHOjjFYRXQ5aH5KPiFl/zjNp9SLIuMo4Rr4R21bAcLYwMyLH/p76sXJCHAhIgC6CGJK8E5+ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=dvNj2xq6; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="dvNj2xq6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744190448; bh=IyXzpMljFwbVc8yVsFLowQkOycriDOazz3w1HXnYK6k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=dvNj2xq6T44K1q8VaR28CDmaZih5YRtmbtXu8K0PnAbtAHAovYL9bV74eXWCiaXoW
	 r43FhZU8Z9GYJmZqDMU/Mzyi2ESs/RGAxgL+03Qei71WOixg+Gc74sVNtlUG0WDrtB
	 9S10a/YqoLP1rgYoHYLcHsvyXxgiSXkHEKgjbS/A=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 52F2428E; Wed, 09 Apr 2025 17:20:47 +0800
X-QQ-mid: xmsmtpt1744190447t434o2d3o
Message-ID: <tencent_618DFA25908DA8126BDD965DF1991ACFE007@qq.com>
X-QQ-XMAILINFO: MQ+wLuVvI2LQ7oBZzapUPIixASPfB7l64/jdHjf8A0Lw5r2k/edc0Y7cY9hmPr
	 qLAnxlESx/LHSsHgp9u/zGQYm3QU4yQQasY/t+65vfT0Jesk+7CkCgaYJGky8r1s8bOQKt03SCSs
	 eAdPKYDjqzmq+/Eds0SKSC0ydz+rJOLbIVoXK3UtoiNfNegMVsqKMnWQrvF6Oz437aV+5mLl/Fqo
	 uPCgV5ohJLy/JCG0pRF5m0o2h3OxgNhbpaN4lCEEkoA6P/Hf7s6tZBPOGuEYw8Dko94OTZK0HgBI
	 dj6HrdVsJkvwTZ1bVt5WzjZvzKTWiimWSgTbdwvaYRURFhfqXPNlgviMiwKxDL/P3QAkB49xy3WO
	 VX0pH9REBld3yVo9ZOldFmkESTFzpLW1ajD8uWNAp4D1k7/vdBzSAIyABAPo8/lanAXGSBV4df5U
	 qQ2UlbVtJ+AgtmxIkpEf5u6rwcGYAtC+LpW17P7BnYfYCsgcFz4di/mu56XcEKpAoai2kUmJ14Qd
	 FS0TsjLW47dmTq8z8cgpBXwL2HzYIttnmLa5VaimKUqV8/7AvWR9dRbPIFzWm1AgnuiMxT7y0nlt
	 Caf4X/XP3yYe2RQIc1nsuzceXSYojIrx93uBwSXNoju5lQaXucb8mgpj4RiP5rFye9yKZhtVG87+
	 gs+F+V1DSHTA170Wv2OlnhJAh3LCpf7DgGpd7SA0BKiZQjp8XdycRLa4t1RR0ByoP6+fRHAsXAwr
	 ExlZaLNztlI8aRoZfDp7qjP/EVJfE4J/L+7i+T/ZmDqFo/MeEq1Rpo4E0kiMO/QvIS4817nLbYFv
	 ZkdqhkiixyoWyuElJYqp6/896JyFqAbIMU156qEcjv+TgByWiGkeRtRoNMR4KD4S/FLnn6Aw6c4i
	 0KUr11cKkyazZFAuXGFgWAa/+LGBiyImzdtzX3H/fNHw83pO0zztY=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
Date: Wed,  9 Apr 2025 17:20:47 +0800
X-OQ-MSGID: <20250409092046.2027303-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67f50e3e.050a0220.396535.0561.GAE@google.com>
References: <67f50e3e.050a0220.396535.0561.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test: upstream 0af2f6be1b42

diff --git a/net/wireless/sme.c b/net/wireless/sme.c
index cf998500a965..39bc68b3428a 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -226,6 +226,9 @@ static int cfg80211_conn_do_work(struct wireless_dev *wdev,
 		*treason = NL80211_TIMEOUT_ASSOC;
 		fallthrough;
 	case CFG80211_CONN_ASSOC_FAILED:
+		BUG_ON(!wdev->conn->bssid);
+		BUG_ON(!wdev->conn->params.bssid);
+		BUG_ON(!wdev->disconnect_bssid);
 		cfg80211_mlme_deauth(rdev, wdev->netdev, params->bssid,
 				     NULL, 0,
 				     WLAN_REASON_DEAUTH_LEAVING, false);

