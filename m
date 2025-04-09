Received: from out203-205-221-173.mail.qq.com (out203-205-221-173.mail.qq.com [203.205.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D8FAD23
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 05:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744177219; cv=none; b=WzvQIWiRjtfzHWXKmOrdE0WcnT7+8qbA6PciSZ7/qGRWS9tVOS6Z41yrQkWLVF6RXWL3mH8Xm/QK1FXqIIfYhhiLfUbgJd2z3RGWjEL3pqaf0owIjGYGodQs1UIGLF2MYgiWokt+erYhae8Tk237EuYdHHUchUlWiL/48m9MTcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744177219; c=relaxed/simple;
	bh=p2GFHM2SMwaLrS/LX43HuyNtduhmC1N3l6ZuO7SkAJk=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=H3Q+VZMim5NzLYR/dkTOEtbF34bzHa0L1aJ1hPx60quOoKoCIeTn8wjXvxbOFJq1ZAw6xwqBnkHWsdhGdtINLCkRy991pYLqn+vGmta9SfQ/t5dv67VAEd9aWZ7jkG6hPi7+h6iuKr5STeUu92R3pyOIa2v6rSvFsPDm/BoQHcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=BD2+mYsE; arc=none smtp.client-ip=203.205.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="BD2+mYsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744177206; bh=BfL6JcWIeyrbV5o3kWQ/ZfYXA19kUu6xJqzkEOaxgUI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BD2+mYsENwhdVVlXcRCVjGyhBsaiRgX2xj3LbxIeFKFBA/ttF3dumMh/NPqNRiJRi
	 ApwwB/FfWtcDZpX6PmfKcT3moW8LpMCGRv3K6l5ZsFHl90aB6eqnZ0HJCiFVKUvHWW
	 eHUBma5DpVm4B0OV53OTFTN3cHlEkuTvzF4HMxLY=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrszb16-1.qq.com (NewEsmtp) with SMTP
	id A0516AB7; Wed, 09 Apr 2025 13:40:05 +0800
X-QQ-mid: xmsmtpt1744177205tmhgbarl9
Message-ID: <tencent_89E9E2EC86CF4C78866CA42CAD6E6095B00A@qq.com>
X-QQ-XMAILINFO: MzViUhZOUTdXMYQWWhi6yrOIqQdhqgLB/gOXfcBbIrHFVfiMyYNpGFbtOdxIrc
	 LOpqdA6G8txgEqhxzNzMpO/xbj2YsdgCP2htMntU3/u048Md6/5nj8kPlQSzDP/3s67Ri6P7+FFy
	 1DMhaHxCDcnkLD6obahafBG+wU+xiUwCRclDajDMni8ISil4wz+pZbO04K81OF9PkQaLPlCSfMn0
	 9l34lU3MAns6NK3UKpEEXOJBEHG4zlFEc65l7qxz8Ewvj7z9AF9rFsx6wttLXapXcmGe/jllTtbu
	 U+Go12QL86Ge67BIQ27FtCNycXnj6N2Tfa+PCARUBvC7oPknBCotY7whmMsSpizk7uJuStfxqupG
	 CT3Kczlus7fULfM/Kn33QXfUy1fnSEyXFffeke1MzpAyvUzonQleOz1GO77fiQdauxzoyNiC9yzW
	 fUNwHQ7nlQ0nZG6n8RboYx7MCQ2siAcx28bPo82lPCWNiv9CYmc6VG4Z7/r6LcfiiUoBtyjo6k40
	 52l2O30m5DFtpIHL57ApkDG+MaJvghAr+On2kQIW2+pJDEEDZgwB2EyzptDY0l1wFSnLd0nQZmwP
	 GHIEasDshfw/TagLW2yD0u7dzjLlCQiy8eNDxtogKBM6ttP2qqkp9N1+ggckC8sXZSFZsqa3M97/
	 x2DS/QcuXa1OsmfG6Ge751A+Vp7BredyvrHPw/sS8vipxVQKi0ckxSH/yoyOdYqyrm8axVyBvDIo
	 gbKEiiPf61SrPLfQSAAlYh3/AwxjXcIT1lrAPOCnam7ZvoMQGUgABfcDVv1+HLvErJBVDM3vAmEr
	 Q533yH8OnNChH9HlQnrCFldZLPvUnQKpuYWXpCar/PGX3VrhEUmaSjz3ic1nKpuZlXXqi767HIUC
	 aezYtXHL7WWiIFv7FjZAsMGa+pMsNEZ/vd3rFWD5vZ
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+00778a9a557a2a5e1a33@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] general protection fault in cfg80211_mlme_deauth
Date: Wed,  9 Apr 2025 13:40:05 +0800
X-OQ-MSGID: <20250409054004.1820638-2-eadavis@qq.com>
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

