Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 200BE2BF013
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750126849; cv=none; b=CGIO9IxumvzsgP/IQK6vXlnUZl14evBVOR5B+uLQY/qt0XUYAJFEbN/XJmRH3i+dVstkZtg/Zo3i1nrRw7+MjTBIpQpHFXCdA8GV0zHw/geKr6COvF13UogSul2UG/FxYaf2MqRjHg/luNA766VXqRFQZ49Edur2y7XR0heZJfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750126849; c=relaxed/simple;
	bh=9jQzHRrssgeDfVZEaoiVK/vVqa39zxKJKAQ81/aiVmI=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=iCpNdVHoekTu4JEpXg5go3CqZfa/HSvjnturMiMSBt1wluK5paQEtdxIjJcCWXHro04mZijX4lzHeI1Yb/uwTX2jHDcxM0I2iIRZmFTmviaJwCbmPPMHViZFEeklh2JWHMEnLaFL9Df2ZoOqPYKSlnJQlynfeRWRCVmcf3rBH7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=inTySQV0; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="inTySQV0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1750126540; bh=xMV3W48Qr/7dfRJ56+hIAaqP8dAX0S2x2l8d2m2TKng=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=inTySQV0n7mOHOGZ5izwwjG70t39VocOBCEmkpxMNI0wcvqanELt8z/2inaYQ7xZ6
	 /6831OPFbUILlAevHgp04v++WJOxKU9u4wwxvlTF93ZzBxI8tSqE/GmSoQbNSUlOz3
	 w1+JzUisaKJo3TDYw9p39s6AIyFpTLiZkNPwAo9U=
Received: from pek-lxu-l1.corp.ad.wrs.com ([111.198.228.63])
	by newxmesmtplogicsvrszc13-0.qq.com (NewEsmtp) with SMTP
	id 3E6B7E05; Tue, 17 Jun 2025 10:15:38 +0800
X-QQ-mid: xmsmtpt1750126538tqsiy4goi
Message-ID: <tencent_B943771D66763DE13764960E36124B6C7509@qq.com>
X-QQ-XMAILINFO: OIJV+wUmQOUA25iMT23i+qWKC0EI3CtU9KDBF+nX3b2MhMs+Br2cyxJDwOSktP
	 AYZizTWwwaA2TRCwtNPYLkyKh1JqC7ZR2xkKMzFOK6p7ubJLuQih9v8z6chVuZ9RygOfRMasuh5A
	 gfs60hGqOMBVWAyW3dBubkJGlJBN+HQpdbaav6ECWjlaGA6kqiAopNje1gCi3YwBXtqqZ82pSNOT
	 0xzyF3R4qACjUFBd3THce2pBKnp58u7oNV+9tSAyp9AzXrWF1fdFMDyMT02H6QEeG1ZSqClrAGNL
	 diIS5tS7s8sKaBK3jyGnPFAFFK4GgeZ0mojbDAB34QplrrePG81wI06pSqrM+YR5q/Xsv3DPBxAH
	 fJi4JfDrsyWwLEqX4e1UFIqoiSxMC4b+eC/JVoNEqraEI9sVVigFuq/CLnZYOab8QpkxDToYHU0Y
	 6HVinG+VhuRb4txOPos7CRRxaqGSNKPybxj17fNQ9kVMApdStriak+dIxlggEjuzuSETN8AgX/UY
	 4ltMDPxrssFDGCD6FyqE91YQlD80eZugdX98niwiWcsbiT/Zkxwe9mVy0GcfP0RAFX3ykYmxGhTH
	 XbER0pkmus/sq/sH9VGHNNPMmgxWVA8YKCUBlo/7Ol9YzQacAudDFcO1kEUPOuH3CBOFESmJpOQQ
	 K0qSib1JJTUXeUWSW366X4LI83+zHoVmMS+swPjcQ4Qbd2i6UBE/beRSeHtY+WPF3ZG/Uuc7jSLN
	 U7ymatnI1Oz6tvL7yQAVuoc/k9hVKl1rolMz3TJ8S8dhMX/lkGCp/5QiPigLayxTIn9ZxvY9VaZr
	 +k3aL1AQ4e/FFndugfxk2Tffn9QmbVLgYmoum1eMYQ0zaUS5ws3MKL5ckqoL8sXIdGtZiYZDGfmO
	 HUJl7O/VQDQN9njK0QLEXAwFZ7eSzQqHiDKFP2mAO3hTEP2tpXa+ECeoxAtIdQJ094CLdOJvYWIs
	 B9GTcAD68g/48nMl50xValkYG7FvG8n/R66ngk39IQQoLeQukMIg==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+6554b492c7008bcd3385@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_rx_mgmt_beacon
Date: Tue, 17 Jun 2025 10:15:39 +0800
X-OQ-MSGID: <20250617021538.276942-2-eadavis@qq.com>
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

