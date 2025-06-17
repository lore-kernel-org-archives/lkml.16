Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E47BE4A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750123244; cv=none; b=h/PPjJr4+jmxJShwykyG0E3nVb39a1CeRqjfN9s47StS4omnVMZsNO04LvG74mRiUjbGWPJNxJtU4h9PwXBiZv8ncJ3zJI53OYUOzxOmstLc1OnMVArg7+akgqme6WbCVS4PVBxxFeLoNkG4C2AqkyhRD9U3q9Q3y484/r9G/gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750123244; c=relaxed/simple;
	bh=ISppZOBZmOoBXSZrSQ4ZrLMBQWK/RmHidvfzBzoO/bg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=uVZmpbVqNtaNRrriiz3NyBH8UDeAvEQwrtDGOMdaJDAXGLW5xtOYqiyWClMd0Q6Op8B8PK54lS4g3juRngk3PNFf+1gvg9gifqMkSl9zPrN58rpArBXg8uxm6ubnh3SI7lKbNdmhyBzNch1t4DTZGuyMME5CIgA871EKpQsKs1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=gb13RLGT; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="gb13RLGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750123230; bh=iY0bpYzY/UPVyhMhofVNx3l+tr2kpYXCWotOHPYocnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gb13RLGTvuP7Em7+7gwdKMf9XybJgiGZKNq+dl/UDfVZEs0VnePH0jjFjl74cZJc+
	 sicn8KUvW+XZS9zX5tHGKMh7RLCjLlRz29QXl6BBR6BplN+YYffz0JQF1bfEzb0VeE
	 Ads/6Igcq8OLAsFSNCsaEi9JV0TmwQzoNbKHBo4s=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 30E35EBD; Tue, 17 Jun 2025 09:12:14 +0800
X-QQ-mid: xmsmtpt1750122734t0ori7lc1
Message-ID: <tencent_E537B64A4A759576C7662A3C9D3784977009@qq.com>
X-QQ-XMAILINFO: MmPNY57tR1XnKo04IUVr9r5LloQuof3TbtpcMlto1HomD+pkynpp0jK/x1+b4n
	 hrZOjyCMbd+2pcEO3YS2epPOMSyxZIDnKCvb9rFVEdl33BKdypWzDEiCojZT7+/dUtmnhBcWyCVE
	 qWSZvOvKRhheE3H0phHDEb+IhQwcSchO/h3YcBF7dmr3Sfj22KDI9zpYyNOEsbjiIbv0w/DKERK+
	 IzU7NCM798UOg2Pv1lBjLjqRPUod6yhe3cdYqEbxvnUxmcyMJgmw1gZsqe8/1rl/QC7ZEzllV1vr
	 H5pnDbDneXLaGizb+4q3uAf5PAsTaLbSM66JjkqXF1lKivAqE/dcUjCKaaIYzLBXcRTeFm68FJGy
	 WXmMRNiJQpi61VXpRjOVJe5XGjC7hiu59OiZJJAVdjfK+M4kH9ucbGhZJsn25dI4bBM4933Uza83
	 dt9cTnhEht71bdaiEAM5TvI61wGYp8uGOOsnsoF0DgwoxqWr3Jd5N/Cu5kK9F68lZqi1N4ZKhycz
	 y5oJ24wJF0gOWGmo5Wvkvfm54oqq3bGbQNbY6vvQoz5XihgRwXWTRX7JzbDzEAldNUGwnzUECdRy
	 oWASBHB1qLf6B2DMWM/dLy4ybGYwB+zoes2/azPeGo0nsCFuVwpLCEjXYBE6nJO1ddWf4eN1+APU
	 Fs/lhjbgMkjJrBjeWe3lt7V6UB4b/Xhvte/0e+5gQ1df5bamfmLTtmgOGRNJQv+r8Pmcc93gky8v
	 ein8EPV3ZUYdCCX0E5yhkhP9bd8g6EYMD0rgM9aS404RBYEAS4jrV836HVdH56408h+wVhZFZ0uG
	 pFwSHeOKM0manlTqjOW47eSftvAfN/nC7kXKYEEYBncFvIMUaYYyyEeHbEIlqpSWBFlGJkHpTUrm
	 R40n51tXBd7uGH3aev+7CTveZ3R5gua0kNxxfunos1p937XY6zIe+Z2yKFCbifBazoGzHxQ+E1
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
Date: Tue, 17 Jun 2025 09:12:15 +0800
X-OQ-MSGID: <20250617011214.220675-2-eadavis@qq.com>
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
+			   ieee80211_s1g_optional_len(ext->frame_control) - 1;
 	}
 
 	baselen = (u8 *) variable - (u8 *) mgmt;

