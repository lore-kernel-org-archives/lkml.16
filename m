Received: from out203-205-221-209.mail.qq.com (out203-205-221-209.mail.qq.com [203.205.221.209])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA1440C03
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 05:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.209
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744522846; cv=none; b=hOQof2BkOSRm7xHgQ8aUYd8gUHro90QhZ7fh/hpanTZtEK+jFY6xLBktQrr2ylxecMO9omBFkogzRYsPBetlSN5B9Fwo+mNeKAOd6DE49BzOGpuwOSTU5FRL0W90nbrZEORaeMCbEokZemF+hmPnwVpSVOcD3lC/V8EhzhZsmjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744522846; c=relaxed/simple;
	bh=MoHqSEX9KbE2gr4kwe8g0PDlvNTnhOr5Bnd6byr4SmU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=nbdeMTDUJzvGIXmt1PdP26zpAcJGgOG7hdcxnZ2/tySR3XUWBQ0aE4J6cwCKn+YgPgaRsb2/f71tJsMJQvQxYrKYxjVA9wG8IuzM3rMa6IcbFNkq5YXDYPe51M6u8Ys4+HlX0Dmqj0cL2Uhm3SXX6LRs5F35ViIqnpG527u7EsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=ifpDRSc7; arc=none smtp.client-ip=203.205.221.209
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="ifpDRSc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1744522531; bh=cuxBj7CFLgwD/Ypbw6yXmZ0mtlhmHQNemsUzZaAlH/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ifpDRSc77EicgcskpJPRyto9+aYDwe2kUzZmbjXtceqHPFxLNJ+tN8Pdw9jQt8S9f
	 MGMprN+I5zJJ8tM33UX2d+BvqCa6cYTE+kbY53V1lyt2HZM12gI4DydHjT8QVrNL8C
	 qnsqlO4eK601PzyCwZp4iz0Eh+xwEBZ7tQKKa2M0=
Received: from pek-lxu-l1.wrs.com ([114.244.57.157])
	by newxmesmtplogicsvrsza36-0.qq.com (NewEsmtp) with SMTP
	id 8DD2BA09; Sun, 13 Apr 2025 13:35:29 +0800
X-QQ-mid: xmsmtpt1744522529t7qv9cixs
Message-ID: <tencent_36256BBAA7BB3833A69E7E1B514B2B1BA308@qq.com>
X-QQ-XMAILINFO: NG8iSz18srmO9NXb2+71gSqq14lPm8X/7g6lOHhDk/CdPE6FZL9jBJ3mHLF5/Z
	 jKtdFe3jkjptRxKzvdyXqI9sW1nsWP69nhymIXmH1Ka+D21RB84eLvGfg79/L8vfRspZos2QaWTt
	 PxL1DLRP7CwdP5kqyZjsXM8yNK7SNt4FjvFj9+2KlTnfLoQCXCpizJfRGVGq4Xc7tBI3lD0qCpJD
	 6QZJDopRjrKTtYLM+x4WArQ4+WeGIJFRnXru87PrISnVryIKs9KQ6KD8slyFrJAQ8O1TXQMZ4H08
	 fGzXDmUHEARqZZPiV9+M4RTCZrGI56gZPTQpgm7hVNQ4QQzYCPdpuTJ+tCph+Y85Cr3u7/O7UhDo
	 Jf9VxHdG3J2F0xk23m2+a9Y8hwybqwPaD/K8U6i74pu/u21D0/uP7EL9syaW7S4BMUW+cripj0Pg
	 aeXAdcvABrwEw2fx5ElQkabXS2dTJ9z1akZlV2NYWHuXG+F/uKhb2QlwyCzdQQQW31fjB0vVT60A
	 PKRjXSNwXZifmP3Twm0AB51YKCxLAht3EryMtyQqUfTOOpXQQIo+tiG12au30k0OZhv+2QwIXyKX
	 BhFN7+JaQSlLjDRTlKP1YkF7MhS3pTWpg6ddWSsXnqqYkE84jD8A8JWVuhkdDm6qPusCNYyaimZn
	 iNUCWqsvTIkLk79BTr1ZUCoVIfMQT+Lw6oTjuCzeu1xfzbH6FDQpnshHybjNu3f4AayalDfuBe40
	 0gKm4808lFTA23VZ0v81kESj6Nss7yiDGCSlzIk5pJqeM7e4Q/p4FMUiOhbaLOC0Y5UxhbLnJUi9
	 WthmTYQkWTNxMMxCwo8a5rlf1gs2EFSlCmvLzzUE8l/SEsLTdZO69WAu37UghrbhvZi/8A+bNIwp
	 4GWKqVnrCjoJROhB7JLWMrXlWl8dJyog==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+064815c6cd721082a52a@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] divide error in mac80211_hwsim_set_tsf
Date: Sun, 13 Apr 2025 13:35:29 +0800
X-OQ-MSGID: <20250413053528.147113-2-eadavis@qq.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <67fac9a6.050a0220.379d84.0016.GAE@google.com>
References: <67fac9a6.050a0220.379d84.0016.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

#syz test

diff --git a/drivers/net/wireless/virtual/mac80211_hwsim.c b/drivers/net/wireless/virtual/mac80211_hwsim.c
index cf3e976471c6..cd9e89aebb83 100644
--- a/drivers/net/wireless/virtual/mac80211_hwsim.c
+++ b/drivers/net/wireless/virtual/mac80211_hwsim.c
@@ -1226,6 +1226,11 @@ static void mac80211_hwsim_set_tsf(struct ieee80211_hw *hw,
 {
 	struct mac80211_hwsim_data *data = hw->priv;
 	u64 now = mac80211_hwsim_get_tsf(hw, vif);
+	struct ieee80211_bss_conf *conf = link_conf_dereference_protected(vif,
+			data->link_data[0].link_id);
+
+	if (conf && !conf->enable_beacon)
+		return;
 	/* MLD not supported here */
 	u32 bcn_int = data->link_data[0].beacon_int;
 	u64 delta = abs(tsf - now);

