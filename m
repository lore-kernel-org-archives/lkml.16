Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E81525D8E8
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745922566; cv=none; b=hUdqB9rEA7djYqK7sbM+OLQ6UCxeEBXJqfnNm9CcxdDXw+zS30X5aTwWRSv2/OLQbzAbBKZCKEwjh2WcX4tuoxhktA3cFZ/J+LqEYwQM4lAHPxq/jYY+AhhhfVNIciCBiv1b28zIoHG/5WY23bnOe8vXs2b+LrZ3kvQYG4LZ05s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745922566; c=relaxed/simple;
	bh=5RrDLi3PZzyNGGnZ9negfTwgCdp5O8QJQ2VcaXdGPb8=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=ptudD4UUGjUlh1w3lTWOXCutNprnJscJG58DF3rsqIebWAAPSamRR22ISUwcQTHfcQSZHbg9YsmkjhQpVhFb0ymQ6eL5NLD6xu6XlCei48a6joFofelf8hekEK+AjbbP4Bj8/YLVsYd/HaXoQPeNsdTBUcHtJDD0jqU/JgapofY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=hiuDa4pP; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="hiuDa4pP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1745922551; bh=EzkTMPalhiZ+t3ncZHFG2Y4CwLhlWITD7mdAZZ8jkuo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hiuDa4pPBKV2l3eRl10s7YpdVR1zrBjvpwwc4bNmyZaKReq43LCJuo/iftdyjVVAu
	 TDnylyty/nuFhU1MJ/F6LlOTyjGpzjXpctMIxxtddDpHxDp+1ZcEX7luTJDJHxK3ud
	 d+BFZPwB47jJ9e/qcj9kLogO7+qbNnWIWc20s9c8=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 5C587E89; Tue, 29 Apr 2025 18:23:05 +0800
X-QQ-mid: xmsmtpt1745922185tjdi1nepa
Message-ID: <tencent_7212DF0676098EEEF9EECD0C9F27D686DC06@qq.com>
X-QQ-XMAILINFO: OdDhBiKk1LgM6k2GFuIG/QaMOz6EAIEnfQGjRze4Zf/h72JRI4GSn3SpWZYKdj
	 5vthzPx7ir3Y8grqPpswKXWpvCexGKsfH079B5po7Gi9fQ9EZYZA76u0OW0uRiyBPVK4t+QRmNGo
	 dfwYzv/Ohm/+ko/327d1tg03aGEqBxt2kEYN1Qk6AeaJq6uqcpNu0q/U91OnoQu1nivvjO9MVUa3
	 CyYnFOi3UU0B4SdqqHTeZQqt6BBb6Wzdym2C7npLKINydipeKxEN0Ld4EpLWO3dVroxGtDLGJL56
	 tuYBI8MGMidYBHSu7NN3Zrej1XKAMoyDd0RuXIa1TDX11NtPKB2MNtItZ3UWP8+wBBWv64sN+ziL
	 EpxjO6fubPOfCY8nBD5KIo+RIXPSthPwa+Ba+Y3tjIPe+AMLV/1COWA2DpclfbOHfuXqqCSvu1ND
	 AiXs6wxUIxSb3G957PDqn6abK14Nk7fK1Q0LTfGmkv4l5qlwN1fxB2vRVkMgufBouCkQYjNfU/xv
	 uZ5/Zx1McqBAY7+XhFyDlh8JaWuNW8jHU3x6zInIJiPVtj9HVmQ8RFg5lxuJG71SGkiTPJfjp7uc
	 fjEtIFDZd5EgLJQtKlhO05Yee1pU2sZtA6oGQTZ1OM9AfSxTUgSH7dGXRh1s1ioCOTIua8eUDChM
	 RckFP/d42T+9sdcdBKFNgEcUqjLPaTQdRDPmQD5UmKCrMBE+QtiCC433T8XJdKR5uuisuryQZDsO
	 XTurFt4dLYGBJnhMvvAV8b2mW2twrAC8qHlQHGONXJXiGuAyBsJo+ZpHF4fkUShh2qRyrqqEVMr8
	 a21JAJahl9dC5euc9bOMqfDPaq5eUg4xYqbyFSQtCFyIqHIXWqDNKsHJC3ZlqwDkc7T8LrcfvrUb
	 jXzn4tTA7nnU4UR/OnXOcg6/09U69NrQxsgGOEjiUhCci0Fb2VnNo4HjY6SQe2ScRq6/7wvrGN86
	 v1Wx2vyLU=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
Date: Tue, 29 Apr 2025 18:23:06 +0800
X-OQ-MSGID: <20250429102305.805209-2-eadavis@qq.com>
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

diff --git a/net/mac80211/ibss.c b/net/mac80211/ibss.c
index 4246d168374f..b709864c7ceb 100644
--- a/net/mac80211/ibss.c
+++ b/net/mac80211/ibss.c
@@ -1818,6 +1818,12 @@ int ieee80211_ibss_join(struct ieee80211_sub_if_data *sdata,
 	sdata->deflink.needed_rx_chains = local->rx_chains;
 	sdata->control_port_over_nl80211 = params->control_port_over_nl80211;
 
+	struct ieee80211_local *local = sdata->local;
+	if (local && local->int_scan_req) {
+		printk("sd: %p, l: %p, nch: %d, %s\n", sdata, local, local->int_scan_req->n_channels, __func__);
+		if (!local->int_scan_req->n_channels)
+			return -EINVAL;
+	}
 	wiphy_work_queue(local->hw.wiphy, &sdata->work);
 
 	return 0;

