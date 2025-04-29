Received: from out203-205-221-155.mail.qq.com (out203-205-221-155.mail.qq.com [203.205.221.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58452F56
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745916333; cv=none; b=kYbsFpUXVRQJagwUUa9mW6TIII2bftKoB+139XzV62GxOWEZUYPyAxAUzLoFfNOIx+xXMZDuJLJbaI3nMRHPWWOcyGcW/f21okTdqsBleLdvwv24wsqQENxdVRcFmtfxY25hCzHcxjry3gSOJveV/tQgnB/K3hVJlAHDSI5Olpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745916333; c=relaxed/simple;
	bh=oRAa5mnOrowLtFslmNlY4yDQXQYBw9BfKvTiAtzpUMA=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Kje7FrYOU/oOjt9uyeu9FxzCSzDlKT0m1+7m0t4jdfXsIYL0yq1i2RNpq/Kr7r6aPq9mCaFnKcTKrheeSeePMIjGTKE2XKw8X4kPhbEZOpOsKLbomvo+I3knIy1a788sYC9TBWDFqQet1W22h7f9WZUPIQp4CEBUiyW2Eajl1aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=T6O9qygh; arc=none smtp.client-ip=203.205.221.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="T6O9qygh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745916026; bh=Ch1JB0gV+OI9f2n8oy7YDjOdh6rDxEJQw7f3tYeima8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T6O9qyghZ4nVPjnXEFRMuQwj4TlV4xaUZtlcc1sllpBMJxr24K9Qk1JN8TJVBT+Qg
	 rnKDCGa/7n1nuNtrMC531zCJCNb3lugqIwPVQmjtQ1b2cFGZDCAJleSIEOHbXdfLI4
	 uY+Oyq8lTsMGMhi+ZjnI0iFX0wwTetN1yVgQUDEU=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id A18B24ED; Tue, 29 Apr 2025 16:40:24 +0800
X-QQ-mid: xmsmtpt1745916024tjmj3adz1
Message-ID: <tencent_40C361A96683BE84519777576D06D0737D05@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XnKo04IUVr9r7gMcPx0djPqHxvIXMN4YKG9c5p3tSWLKA+PzxSdL
	 JVqyklJG5uXEuTLD9MV6BW8D/mByCDh37UuE9aNtgk7gDp6B5r3GQfG4dxpGjwdBZRQoyAbtZhJw
	 /kQUrEfquHXN//N92C+CxdFmFVtiDwrDgWz/wIjWdRxTGi20OhVMMeik2S54l03XDrPsbFnoJrzL
	 x3q779k1yvuzH0knS6++Furk4Zzi/FDBlFuUuyIP5WuPLXc1h39UxordzZOTMWsKFEfWLwjYEm7j
	 z5SRVBVmskgINQTeYEcKFJtBt2v/il6OCIp1ghWZo4qKGCGuAzoI0/J82gH/DYqx0PMt5J5smtaQ
	 G9pKl+uSfkiPjt0B3p5ajJDM9g4V9eUmfXGIh0FIrFaL417cxO1pe9kvFODCkjD/ncgn+oWEBPG9
	 h7ebweU3zJJz2iXu4oKEwbF1lFIrYHU8+tVgPgMqY6oEtQq8iY1D+pEJ7+gTdouUYvp2HdGBtLjX
	 Hm39/xk5XTPWpdIpJXt5Ex2mQkfuyQonv9/DaolS053lZyxjoa8wPgxCS45xBMMzIRQcpIBPDZAN
	 9lIIS58CfOAsy5kOU7hGDRggtuEW7bqeUVxmm8Z3bJKDXaBBUZZ2Rb1cloQW8E+ciF5BxLmp5qBU
	 dFrznUpPn5Hx3KfkjoX66nYDDjmgJN2EHlHY3hiSKbN7eyoJPIfA4phy5H31alj1IeABLE5eYA/D
	 lvvJLLZiUbkSGfFeUil21YoBtcvYhduFmM9VPOLTHNxBGpMMgza1HGsG3imjAFnHZMgDmUgOjjhO
	 AP1vKAiWGyJ/pzogo0JBgbMPWCD68lo1wQMe3OVpsCRrLb5Z+7KjJixnqrh7xrC1mQvs9i1P6Wb0
	 2wfMQFbWpvN3pMb0oKtRY1+MDyFH9dLcN6TKq84K/gN/gbca56OT/TWTU8mfRxfG86qvLEMQDXDr
	 micXgfMQM=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
Date: Tue, 29 Apr 2025 16:40:25 +0800
X-OQ-MSGID: <20250429084024.715217-2-eadavis@qq.com>
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

diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 741e6c7edcb7..6842c3011a99 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -1353,6 +1353,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
 	hw->wiphy->interface_modes |= BIT(NL80211_IFTYPE_MONITOR);
 	hw->wiphy->software_iftypes |= BIT(NL80211_IFTYPE_MONITOR);
 
+	if (!channels)
+		return -EINVAL;
 
 	local->int_scan_req = kzalloc(sizeof(*local->int_scan_req) +
 				      sizeof(void *) * channels, GFP_KERNEL);

