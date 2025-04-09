Received: from out162-62-57-137.mail.qq.com (out162-62-57-137.mail.qq.com [162.62.57.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293F029A0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 00:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744159166; cv=none; b=uH/VN4o2Us2noNowhv8SWpScJb+NKAKneINVxjqlvCFvz1Zp6DU2hLCizpiVo3neoCpZ4GgIJwuy1aIm00G3fSXQh3o6l1KuuDmnKvJIuUKFsuKdl0ZYgzFi4YP8tehCzgR4wh+xNFTf7V5dibZ6NFY4xjsCemnJ76Zecqfaarg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744159166; c=relaxed/simple;
	bh=KJJ2+BclyA1P0jcQ7Rp7xmvRg3kZF87jx31tbHFt25I=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=gBwWyZOGcJjwiLn406udtolJ/jjC84fk/Kp2aFLRf41Yvhcvt6KnXOdet6jloBv4TgU1M6whhZGqyWmKQ5Sbk41gO1yL0HoJ5/SyX0mHgIKIHIm6F3FBWiGycLcqFxiLg06VUXdMeiO120J7DW0aboQyQZQhCyXK1Wm2hQBzmOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Bn0OjXDp; arc=none smtp.client-ip=162.62.57.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Bn0OjXDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744158851; bh=Ux0+oseP/W8lvBBKWIpjFYkJ/vko54iv1hk0K9mn+Lw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Bn0OjXDpWEtjMkeCIE6i8lqgHP+E3tMRdG8MbAOj95k4WT/BZVVaSehIMNWUGIqBE
	 BdqzH7nvzoyovqJhLb7rhnZlT84AAcQYEJd4M4qREuBOGxsE32HEBPURugXgh+WvH0
	 ipI7GJSlETNxrrcNeFvwsH3qPmyAws9DPpJ3+M+c=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszc16-0.qq.com (NewEsmtp) with SMTP
	id 8899A8B2; Wed, 09 Apr 2025 08:34:09 +0800
X-QQ-mid: xmsmtpt1744158849tw56wszor
Message-ID: <tencent_8AC8BB0933599E021BCA4B351B8B252FBA08@qq.com>
X-QQ-XMAILINFO: OKkKo7I1HxIeWXRNp3bvDNwTHt449vNv/iJri8Rx6FjdyRGpEnm04LgJKJB/9+
	 o7C+kB19UnyECiDjHI2RAYC+F9lW806E3FExIxc23nxmI0IXbJYXFKzNB6u6539pMbY9lm2txXJ+
	 NksTI2P1YkMZjKOsZuyVIPxKQKhqmCXHdbGSVO7Xt4kK6hAD6rLjgw7eyZc+Fo9OJjNUeOkkTkqs
	 7ZXVTUDAuet/Agl0fblyilsBAkPcRGgvdpLzPeavhRtF9r7JyBvVbok0y8M8/ESea49azC6r2qkx
	 77sYLGEXb0z67VtyrAwC0v6dBeuZ+deLRysyFz85Ial1L9JafubDegn3kUGxHFhFzlCEe9+Px7RY
	 MOr8Kstl+b7PelcSMLqytYSGG8vQYBL7zm+Lk+DcasfGAaoxF6WMDIsGe4sqG4KmYjcpUnZu+tZA
	 nnOCiX5LJlYami4tMFh6M7OWjSChiQoiGduENLBCvo1LjGY3mR9SlRFttKwlR4IWw8KRfLNv4ucp
	 bfqtFaG/pAIzUpUcWJnA+FAuhcofnqx62QYk2asukdBaxnfhv46H6Ywqu2wwC/XHH/Cy9FXHiwaU
	 ID7FR2XMXmEwwe0QxV5dflRczJ187yBPYMkFF0Df9pS8G6V1GZrBlFqUQcdNTKgiaZ+vTTiI2yis
	 PMf386Y6gawha/Fu3ueO6qH4F3ouDMv17vwtX46QoNQL4KagU5EiJa2y+nwAdGOWEmy7DvvjhaCa
	 YKj0XtHb+RWU2L9offoWnjy2fd3tq+1d2LzASwmg/8tnyu8ph5NOZSsFPhhkkHib4nPglKXMzdI2
	 oPCSFuJvibnD6i3ASCgOZGRtL0DsjoyaFEc5eYvGHlJtQO/0ehBS+PZKSVCt1Lw+0WF3PKU2ljNP
	 xIehc3kpZ2sZ/itjvkhRaaAm0gaQFC4g==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
Date: Wed,  9 Apr 2025 08:34:10 +0800
X-OQ-MSGID: <20250409003409.1536428-2-eadavis@qq.com>
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

