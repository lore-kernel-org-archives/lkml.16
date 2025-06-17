Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81EE620C024
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750130899; cv=none; b=fqDNHvfLJND7TdiJDulS/lJgZxLYtStoRr+MVoRqwPBJUMR10rUZbRWi44EWGTMO9QhdBbpAcV5Ph1v9BixnvF8YtS0mWWrv3pHT2DmulrOGoTHokahO6ISEezcSC02ZTyiRwNaaYg/GVhS/RMg5WRDe2lyv9951iDsrHo2kA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750130899; c=relaxed/simple;
	bh=CfpuETCjUJG0sKL/tA/qVFOawEfU0VcBmDy2+jm3CTU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=Bk8pMghqjm5S/joubguaAsG+3ujcquZyEgOmnHMkLnIt8sAnuXKg4RlgME5r289lw4R3gVHedHFoLSkYGl6HiklR1Mk/oCFit/RtQEjF666zqwcoQ41rT31Cmah9oP/yilSGqfC+O2gQ9x9pgt3ZWnADivQzz5M8NAK4MTpmXOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Q2Q8ioeR; arc=none smtp.client-ip=162.62.57.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Q2Q8ioeR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750130591; bh=mWAWivyg9mVWY6ZmZ89vSbIp2BeHqPou1PVX+MZxcS4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Q2Q8ioeRhX5ixVThFcnS+kUFacbBsdxNoxGPEQhH7P6Z3VxU+8nfik5T6jbe2+Bgf
	 /LwJZRk8x1fPNcB6nw1c/PrOgoXCf683LfiYEkgawb/ZPG+eNndsYCY/dRNc3vcavH
	 RdBm+2KQoVyYn+gz87aKTJApaCEvU3QX4Snj+RY8=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 5C989E4D; Tue, 17 Jun 2025 11:23:09 +0800
X-QQ-mid: xmsmtpt1750130589t5fe72f4q
Message-ID: <tencent_E870745776CD66CE3C1D36EE977437AA4A09@qq.com>
X-QQ-XMAILINFO: MdW5rY+5JCKZ53x5vXEK5Ubnzhdh7QqMx9Lwl96i7zhtarIpToclxqYq6w+T/w
	 PVio/V1XvR98TpB/94SUQRhp5hTBOQGEHFJ6ibtcSL91QDoUETtt+v5eaMfSTx+xPmEUtsJMSqtV
	 1NtGE0K0tLkZTdyLbXKyb8CXViWnCKcFzvFv5MIFibXQGJZ/eMZYSl2G4krgB+gGz1RfaNkKXM8J
	 FSNNu2v+0LsI2BbauszcAk673KlwUqQhq21zKjHjEr8V4HCB5Q5cebUrqGKGf+a2vShqhheNfT3e
	 TMTs5wo8EneXBB4VIiOttKvAlMgVmoCHP6Kmw888DzgntZjWiCg2mjQPs1b3X9Y1Xv0o2lv6dPIC
	 RwRzt3VPar9HOE8pCu1RIYb3fGeNnNPkDlGHRErfHabqSf2kWgO79zshPw4q8H2FZy1kgI0yArnX
	 BXVYuho/0RviRhnsE1R2CbqXUfZU9XFmUZelcA1rt0/fadR5R7VzDuk1MgxpcrGUyMCd5a0G2zxK
	 4WQG7uN0pJ41zvVwS+/0Ev9MakuhN1ZBKEmVjGnIH3FCtkXdeeIVuVaDCLbZt5Wj6GTaMyqj4jBh
	 lkUKITcXYAzNmej4Mc2fBVnyNsEax8QEfxDwNUgTaU8O8cMCxerTUsDvj966g93iK+pScOcwch1Q
	 TKVDvJoS2oQJqnvzE4ePixdqM9By3HSuEEos1FtosXIrjFtcHpFcLDLiFv5jwqe+w78domfAjwDM
	 JUyoxpFkv6XdyyPo+N076PqsbcVDS0//j+stBw5muYUAYuD3JJ0QEP151M+B4sjONEEb3hyJtpNI
	 hDR0mtmlU3druy1jJ6xuxrOhII+lu7GGb8nL3r2cPZTLDNlY17Cx5fa1XmAeOCP/Fo5U9dX7uLtM
	 ngusw5jfi6PHb0i+usFpmy7bJWuSFsCv9cIPiPzI5IQ6YKzBnfu1yealL9Y+8+SPxgokeIoIidhY
	 VUJFyHvK/+PMi+4tgwiU4NMqFsrItaTR7ZccuRXqABOF0NtaWjzp75XiZGl6mOnJPWrch3P0E=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
Date: Tue, 17 Jun 2025 11:23:10 +0800
X-OQ-MSGID: <20250617032309.336824-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <68504add.a70a0220.395abc.01e7.GAE@google.com>
References: <68504add.a70a0220.395abc.01e7.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index 2d46d4af60d7..c370352b7d7d 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -7222,7 +7222,7 @@ static void ieee80211_rx_mgmt_beacon(struct ieee80211_link_data *link,
 	if (ieee80211_is_s1g_beacon(mgmt->frame_control)) {
 		struct ieee80211_ext *ext = (void *) mgmt;
 		variable = ext->u.s1g_beacon.variable +
-			   ieee80211_s1g_optional_len(ext->frame_control);
+			   (ieee80211_s1g_optional_len(ext->frame_control) - 1);
 	}
 
 	baselen = (u8 *) variable - (u8 *) mgmt;
diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index ce377f7fb912..556ce95e0b0f 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1278,7 +1278,7 @@ struct ieee80211_ext {
 			u8 sa[ETH_ALEN];
 			__le32 timestamp;
 			u8 change_seq;
-			u8 variable[0];
+			u8 variable[4];
 		} __packed s1g_beacon;
 	} u;
 } __packed __aligned(2);

