Received: from out203-205-221-205.mail.qq.com (out203-205-221-205.mail.qq.com [203.205.221.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC7A1F5F6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 01:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744162287; cv=none; b=V4yo2g8RP2wG0GFw0tgk23sokflASoxQUORJ8R6gs4KaCrlG4zLx482+lIj0yVDEDF8/5HCd00T/IArapBHiLzVZVk8qymQlkhXtOfotcJX58v52x0iWmQl51gOAhS65aXe4sj1D7y7V7JV0kB7K6HMdOk684/TIoBbJLZNIuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744162287; c=relaxed/simple;
	bh=MNqubeCDKTLai57rROoLQl6MXjA/yucUP5NQ3iaWGi0=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=jUd7KdYQxvPNy81Z8J0f4UaN9ij4O9IL78s7Jqvgf5NWFuhB9ZvJJrzDPIKyXs32mZBC44joztU4xW5AhcHvw+gD7Jv+3HCyCIs6kFWRYz/Rf999ZQEieo3+M57b51Qmf7KTXQD82MRHF3h/Tq1vUx/UQVNY/FWn8VO6h7fXo34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=TMiAeJ3W; arc=none smtp.client-ip=203.205.221.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="TMiAeJ3W"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744161980; bh=8xG24UL2oD6sowBVKyUcqL6lu1Pxha72RIbpwlU2QqM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=TMiAeJ3W2CX+M4/QNKK79X5mWhS43FPBE/V97NuclFnwEUF/dXnUayK4xdaEVkGgS
	 6Ooekgctwmd68SSPmM6nB2sRRUuKFUlk3/VAlot1yPTRBCaHed14EEqbaDhYZgrNqC
	 o+ks5nZxo+BgPozrLxiX1qut8XLKN6PVmPZrl1uU=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 6923B6D0; Wed, 09 Apr 2025 09:26:18 +0800
X-QQ-mid: xmsmtpt1744161978t0ur988bm
Message-ID: <tencent_611BCC4B4F1B7A2556BA47BBBB33119E7108@qq.com>
X-QQ-XMAILINFO: Nr4sKL92GIu+Mkb5twI0gKZ0Z5FTYhN+Ckdb4FiItO9LswPDoHyYRap7yjYuHX
	 RRGou+llDxhf4EMPaugP/x8NJYyI78R1D+opjKzW4QiUERpZaIfI+Vi1z05Do71tT/yDrb/YTgPY
	 G/MJxdYHhWaTLBBt6FzkNxuZ61Ipq+D6y44MxQaXVrv7OI3Nk8CZUcT4yazRKZqspA+5n11gsKqv
	 FIxmJr5dUFINPP6qmBuX6NvHYQSDa3IotUEOo1d5mnx6Esmnd2+sPI/LKdGcI7iazVls2PYHN6ws
	 oQ4cMvgcU2M1U70Vc6nL2PqjUeQKwhYC16q1iwE+if9Q1ake+MufeUoQ0mFQOBV+uHPe6laLP9Mr
	 nqCHHK2dvISU2Efa4XhlJgOFCAyeojmRNXJJYChUZh6gqJGodt+FoCtBQbzR/CYJVq0oW6ASUAn+
	 JJL/Z/72b89+n6FAuyFSPosfkb3gOC2yj7p9haF1o/aXZ59j9sNiBsHNUC04dFM5EhvY4Rw3TYjs
	 XyOIDZaDzq85sWZyWXUg8Tqdop14MdERAd1iO8IfYuJRE7Cqllfv3cCGR1iJLCQ/z+xbeK6DCacQ
	 7A5QT2aPHam4k+8AF4VCLCXvb5TgTShk/tAcGXuJaMA4DUmYlMG0LxE0duWgA1jQkEoIkug8AXTG
	 c91YR1JTF6ndr4xWvUdQeL8WigzGBG3XFXC8puJsAQuHCCKkXlVkiqAHKxwkNTwZZfMdk7/SNkWB
	 jif+QQkdDUsKKy3b9pwMXQakakzH/0Pf42OYY5FAzE8BxLfIxQ/02e5vYlPrurmKG4A3lRAFNxX/
	 IHI49kuNjqHOypHcRYZAPkFMV4Je3pvoFcC6BC4J5PC8z2ZhsQ0yiK6v5lDAf5bAg2mu2ZKhl7BJ
	 EPxLSy7pLG0ZThSi6qbM1YB/1+ZTtsNeC/uEdej0hPj+4s2Nj+bwAMYrIe0OctlVcv9rAFPTxKvG
	 e0cHLYvFu0hZyoEXFzqg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
Date: Wed,  9 Apr 2025 09:26:18 +0800
X-OQ-MSGID: <20250409012617.1586212-2-eadavis@qq.com>
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
index cf998500a965..b983faa5bbf1 100644
--- a/net/wireless/sme.c
+++ b/net/wireless/sme.c
@@ -269,6 +269,16 @@ void cfg80211_conn_work(struct work_struct *work)
 			memcpy(bssid_buf, wdev->conn->params.bssid, ETH_ALEN);
 			bssid = bssid_buf;
 		}
+
+		if (wdev->conn->state == CFG80211_CONN_ASSOC_FAILED) {
+			printk("bssid: %p, pbssid: %p, dis bssid: %p, connected: %d, %s\n",
+				wdev->conn->bssid, wdev->conn->params.bssid,
+				wdev->disconnect_bssid, wdev->connected, __func__);
+			BUG_ON(!wdev->conn->bssid ||
+			       !wdev->conn->params.bssid ||
+			       !wdev->disconnect_bssid);
+		}
+
 		treason = NL80211_TIMEOUT_UNSPECIFIED;
 		if (cfg80211_conn_do_work(wdev, &treason)) {
 			struct cfg80211_connect_resp_params cr;
@@ -411,6 +421,8 @@ bool cfg80211_sme_rx_assoc_resp(struct wireless_dev *wdev, u16 status)
 		return true;
 	}
 
+	printk("bssid: %p, pbssid: %p, dis bssid: %p, %s\n",
+		wdev->conn->bssid, wdev->conn->params.bssid, wdev->disconnect_bssid, __func__);
 	wdev->conn->state = CFG80211_CONN_ASSOC_FAILED;
 	schedule_work(&rdev->conn_work);
 	return false;

