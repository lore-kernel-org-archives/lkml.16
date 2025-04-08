Received: from out203-205-221-242.mail.qq.com (out203-205-221-242.mail.qq.com [203.205.221.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFC0229B0E
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122920; cv=none; b=MgrO+7mA5LZTK9b5mvNzxNs0W64sS/VKKsp8sZDEyYDWXmHn85s32iYpmBHqQznrDzqoH+VbM+xPp/n4LvYEWO2hEKqqhl3M6kKplyfl2oHrD8IpXCpEXN20bJX1k9bmz/JP6xZtPjsHCawOqGcVTztPdlWjJJgCW79yvV0Af7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122920; c=relaxed/simple;
	bh=d4dw3UtEQPiO8IEP8vvc8HeEFz5IXVTxrsBo9othd40=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Q5QAkmK5QKi0bVfW3Kb6+N20EpTTU+6y1FBWP/e/AE21fy/U8VCQFYYi71KTkM7Bc9cff51jK3g/aFbcohYT9YBAA47JdIAEEiFHNgDFLBh2Eu8NruS9XrX8xqo8G3r4oAGA4tHKlPspErXcsOspkyToWKFyqc8UuFR267aGOgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=e8mYwwdd; arc=none smtp.client-ip=203.205.221.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="e8mYwwdd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744122607; bh=c3fU22hrWc+1LebSDLwlA+MOIZeQWbaEf4w0uYoHHCQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e8mYwwddW5n79rCEK+s/wGZ7QfHvET2YZwwEDPztnHvst6rvCAUHnVUpBsNSrzhuA
	 pJ7Wr/We0GzW3wUGzv61fZ3/lFimgKIUBo7ALNXaUSzaM55pcV2b6b2SqDW88JrJZk
	 IwLbBPfS7mjdp2gTj8UqPCkFUMgJrcGBMe7t1jTs=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 7852CAD5; Tue, 08 Apr 2025 22:30:05 +0800
X-QQ-mid: xmsmtpt1744122605t642mlii7
Message-ID: <tencent_7D179E301BED4B391BC12537BA47BB6D3308@qq.com>
X-QQ-XMAILINFO: NLNuKjcZ2ePXewyGwfvPkHsH6BjzCPr6Y+Wi8Va/E4Uj1tu4WXHulXHFut2YcH
	 8/qjitRtjGWiN8Vtszw/AEaG8AY0+Bwa4XA34kUWL/MQK5nZMAg6RpbBlsDtuGjXQwWCMShV9h5S
	 ZOCZAsPatsdE9ptQRA7b4KPeq5wsguw8VlZvuUpkIstXAauqjeZ469HNnA9VYbMvMFCN6gMZK2Gc
	 citacM9+M4H4zrtD6UTdpwDqt7xUCUhM+8BfeoGpPB8JqGWW66X+pah1aPnyhHPBhZr9xVQEXcPe
	 HXoR/2zQhyXz61KSMXAi9s7L5HfDSQzk8WMLnPDkT3J52nufbtLHiAOaDuSQvm1JrLc6K+RagptU
	 k73S5Wqfzkh/qkdc/FsHB/5nXO4RT1ISvdxnxaAPW7ewJRJGzytp0PGcHSlzHT0F5wypPa7lZdcc
	 VfhofrX1q3u74jravQl6xrnvKU3TRcsSoBgM4XYiYMjOQheQ/hLj16sJbGdHnD6MsXe1DzvDRFab
	 63pUDbDkF4ZX0KRZ5Ae5iMitxyCjW4/9ZhWoAUDmVJaJDvgktXEH5wnfet8MgRBgaCgCMlR0IXlE
	 eADmOI0PpztVe/A94V+xicg8asqaEAc6wje8X0ifx8YzHhIoxSb+gVlucfk5WCR1e08W5U0QzbUw
	 +y/03dSIhU6EfnPEqpzZn2cI74P1Fv3kX1kuLSB34CFglIv00UkgLl8rjbTKVgZrActiIpdhSQCg
	 yoSpvEenjLWUkoKyeDXvNzDqOru63MfuHsdHcCBRmWPHWDYTm/YM2JmztHHRL1uSzy4ApGDcgLIp
	 jgYXltmbs2iuUtEDT91MFf5Zrcg1Dcy5jXMkjMkViCrfWR517RyrRL3eekkE43IMkURnqjsvHbvS
	 qIl7Zyjhelj/0Jv/4X/bY=
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
Date: Tue,  8 Apr 2025 22:30:05 +0800
X-OQ-MSGID: <20250408143004.1485824-2-eadavis@qq.com>
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
index cf998500a965..916c9e8fea15 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -268,6 +268,12 @@ void cfg80211_conn_work(struct work_struct *work)
 		if (wdev->conn->params.bssid) {
 			memcpy(bssid_buf, wdev->conn->params.bssid, ETH_ALEN);
 			bssid = bssid_buf;
+		} else {
+			if (wdev->conn->state == CFG80211_CONN_ASSOC_FAILED && wdev->conn->bssid) {
+				wdev->conn->params.bssid = wdev->conn->bssid;
+				memcpy(bssid_buf, wdev->conn->bssid, ETH_ALEN);
+				bssid = bssid_buf;
+			}
 		}
 		treason = NL80211_TIMEOUT_UNSPECIFIED;
 		if (cfg80211_conn_do_work(wdev, &treason)) {
@@ -411,6 +417,8 @@ bool cfg80211_sme_rx_assoc_resp(struct wireless_dev *wdev, u16 status)
 		return true;
 	}
 
+	printk("bssid: %p, pbssid: %p, dis bssid: %p, %s\n",
+		wdev->conn->bssid, wdev->conn->params.bssid, wdev->disconnect_bssid, __func__);
 	wdev->conn->state = CFG80211_CONN_ASSOC_FAILED;
 	schedule_work(&rdev->conn_work);
 	return false;

