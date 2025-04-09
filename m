Received: from out162-62-58-211.mail.qq.com (out162-62-58-211.mail.qq.com [162.62.58.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6F814A60F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744161048; cv=none; b=ebEesqoO6RbnvJXPgXwd+L4VOdfYTkf3vWDVOEXU8kmNxNpdCiK5nVxfDGGNN17UiOnjcdsA2501b02ZzQRlaUkxUSFIHSkPZEQmHNOVFjZeh2+01Cm1RzzSS+8d0Ozradj+0SUTeEqWIKQgBALFditDfZs84temKwiMPwI3hsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744161048; c=relaxed/simple;
	bh=Peae4cKDCeFA35wsaEGkRm2lFqFlb6fh0v6T6XLdZ6s=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Wrpqe+8JPL4l9LbYQiQ9EpruPReJTDHiBE3kDfQOUeL1QKxKUPb3ZiT1MqwHRcu3z1aMBmecRi2VCVkdHrIAuOnAPu1xyNmzd3k3ylqNQ3b9bQc6baviYAqmR5srYhb2RWdL6pwpJbgz3juoa5v8/3FtM6Eote0uu/2yjPt4zMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=BWk20oqY; arc=none smtp.client-ip=162.62.58.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="BWk20oqY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744160731; bh=Fd7JUlIvYVHB5xZw8AsdmJ8y7LxsMqBwLI/ymT/UlTo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BWk20oqYJrj1YBE5Yz5PpL1+3XzGXoqMf3u1P8jrnOUqyCV3jq+6cZTeGNv6XrLo9
	 3txCTWBJ0Rh9HXC2mhw86sE7u5ioxculGc1EBCT00joBzXTxEqcbJjsjCVL9oAdtBr
	 ILYgZ+1XBcBGmrfF8i57p0BhWyrUgW9hhSiCuZns=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb21-0.qq.com (NewEsmtp) with SMTP
	id 15E3F420; Wed, 09 Apr 2025 09:05:30 +0800
X-QQ-mid: xmsmtpt1744160730tusole2jv
Message-ID: <tencent_C66C4B6E75BF769166183CC9377297A83609@qq.com>
X-QQ-XMAILINFO: NJ/+omVLhVgav7TKN5GLOum0fFxgP/aLxkArQgpW2y/17S7mmy87D6RwlQWF7x
	 FzWm+3RcLQod6M+e9StJ2iey4RTdwIRZ8kMdsYWXXKIHO2bUhTqe3dUM40XJdKWGqhvVu5se3Jvk
	 WJhc2nbfYWoXq+krE8r8CtoxcBFfD2+aw0zZY062wCqum8mLvNKnY4GMzuZHmH3kwjR5xTQnlTcU
	 j6TvrO2tfeaVwKmZB2ymr6ut42+RzEXq3jyomU/I38k8xJ4qAW1SXKxNTQK/rymvUd8MmbIAnaZK
	 O87SChV0bns6sH95tZ/rsYBapJ7LszotKjedUtajXMJnQGD09+awF/LjTEnf9BCuxkg0iOV0zMfr
	 4M8YSIUELETAl5WiJosz4QqgMPJ3tdiDq3ciFNfqnSFtP1uURXfD5aw1x8LnY5ucaD/6zhAMz/Tj
	 GGp72tvOoBTza2uRRmsqIHooT0eQXBp8koYe23PiKdkenfRtJ2CfuDHT4xvIwUYWevnw2dTkwTtd
	 Echksv9vSuKPJVxJ3T/B9Wjo60VG+oKOMYixO5QSuNorwYCMg2Y+IWpCfob3RrGCUTh6LoSv7RWj
	 2ewyhQi6CyvFR7XIASvb3WFAc8Yd14Tbj1wn1ocQ7YYw4m9g1s9yCesV30WlgX2cGCZlj+PJWbu/
	 Yvb5sLP01+gL71NQUUOMHbpjrpOrGr/yAf+hNIwf4U/E/3HmwzC/6xmQK6lPkUAQHRdT2SAZb0UY
	 Eixj/UurIkA2JA2v7TmH0V7KyxatMxmji78iOGFGUiYjS82A9Cn4AHCFl/EBeaQWGPXoU6/JplII
	 fC+i1JzrqvsDhnF31OOn7njZLvEAA+PrOHltM5cWi84LmDBDiJ29AOJgcfTJGOtzl+sOI6XnxkSY
	 PPd//QH8miqFiODj09eB1Te1YI11sL1qGSnHj7jEcKe5S/yJZkNrfU4tSzvrS/aXdT/0fmNdgFXJ
	 1NpDwrArsSzAoz/rl+aYtCAkfGFEEe
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
Date: Wed,  9 Apr 2025 09:05:30 +0800
X-OQ-MSGID: <20250409010530.1567371-2-eadavis@qq.com>
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

#syz test

diff --git a/net/wireless/sme.c b/net/wireless/sme.c
index cf998500a965..f78071015d93 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -269,6 +269,12 @@ void cfg80211_conn_work(struct work_struct *work)
 			memcpy(bssid_buf, wdev->conn->params.bssid, ETH_ALEN);
 			bssid = bssid_buf;
 		}
+
+		if (wdev->conn->state == CFG80211_CONN_ASSOC_FAILED)
+			printk("bssid: %p, pbssid: %p, dis bssid: %p, connected: %d, %s\n",
+				wdev->conn->bssid, wdev->conn->params.bssid,
+				wdev->disconnect_bssid, wdev->connected, __func__);
+
 		treason = NL80211_TIMEOUT_UNSPECIFIED;
 		if (cfg80211_conn_do_work(wdev, &treason)) {
 			struct cfg80211_connect_resp_params cr;
@@ -411,6 +417,8 @@ bool cfg80211_sme_rx_assoc_resp(struct wireless_dev *wdev, u16 status)
 		return true;
 	}
 
+	printk("bssid: %p, pbssid: %p, dis bssid: %p, %s\n",
+		wdev->conn->bssid, wdev->conn->params.bssid, wdev->disconnect_bssid, __func__);
 	wdev->conn->state = CFG80211_CONN_ASSOC_FAILED;
 	schedule_work(&rdev->conn_work);
 	return false;
diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index cf3e976471c6..ee9609d70d72 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -6479,7 +6479,7 @@ static int mac80211_hwsim_netlink_notify(struct notifier_block *nb,
 	remove_user_radios(notify->portid);
 
 	if (notify->portid == hwsim_net_get_wmediumd(notify->net)) {
-		printk(KERN_INFO "mac80211_hwsim: wmediumd released netlink"
+		printk_ratelimited(KERN_INFO "mac80211_hwsim: wmediumd released netlink"
 		       " socket, switching to perfect channel medium\n");
 		hwsim_register_wmediumd(notify->net, 0);
 	}

