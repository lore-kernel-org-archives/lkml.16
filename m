Received: from out162-62-58-216.mail.qq.com (out162-62-58-216.mail.qq.com [162.62.58.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A282B2D7
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 13:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.58.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746624958; cv=none; b=Z02SJQ7SM7wiKL1bky8GZIzFP9Tnjb3u+KeXxddv/UzYrEoTuljz4B//2tpxnJyi4+rsy/Vbku8GZPlofss7/s2+G9d1+UiEERzgPPiU9yV9n8fibak+oYfT7aCpFlFeUtXh0O27a9zUR6z1BDumzC2q1AaqSwzPJlqnbBfh2WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746624958; c=relaxed/simple;
	bh=5Jciuq5twNayGvhNEegwlXnF765QTUXXRKMPnMk6YaY=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=J8Y62Nm9XG63xi0bPr9ttH6OpvcSlLl5aIt0ZsELCylAbiGd0zHaVy5PgcGED4KZ93JH8yr0uQSBXAh+JhmwcCNf/ItYFE1EVTi4NjTAOKjRBa3eftYCSYo/bvXY9IpnUeVju20Un3dsRVgaUIRj4l2Mz9i2r7OTMLshFvz/2wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=XNdvC1Ez; arc=none smtp.client-ip=162.62.58.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="XNdvC1Ez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1746624948; bh=SeYSq3VFv0lFDJsZXUY05jjblB4Kn0Y5fV5O3f9HOrs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XNdvC1Ez7deZNd/hGcvIf/eQdmjRo5VdRiXw47oqjl6lP+tuDTJKYUkqLiMYowVBb
	 3BuPpIitSolOUqyP6XXpScjubfZc9OM3equH/ve52+7kkU58ujQ5y5BzTPGqf0oD6A
	 nhpwWV3ANJm+FYJ3UWPpui6CClLYUcUfJKrR7Nlk=
Received: from pek-lxu-l1.wrs.com ([114.244.56.254])
	by newxmesmtplogicsvrsza29-0.qq.com (NewEsmtp) with SMTP
	id 5D31746A; Wed, 07 May 2025 21:23:19 +0800
X-QQ-mid: xmsmtpt1746624199tq0noae7k
Message-ID: <tencent_E9E91EEE86CD84787A6EF82C196CD494640A@qq.com>
X-QQ-XMAILINFO: Nq7sfrZZD4Jf4JH/oozqZPk/ShJJ65KfG+IE1RA9VTrQ1BD08ZOLNCC92ZNeuV
	 RuxWl+D/Xcq2xycEJTgl2guzfv8suPaYUVA4Hly0sid8vbYtSMZyAc/ECZMtEyQ9AO+70G2zNJ8J
	 HVuoWF6urDLBOXTfqBdWmqKsJ+j/liNZA0QibypDYE5q/IvOlH2CrQ9ju9CyR4xs1wHaCXQMdztj
	 tVkStSG8V6tRgwPGwPM6NZLU+azmYqz+F+mMH/o/sOUIpJ3Cimdq20U7l3suChG/NcJYI7z7CLiL
	 52qP2jtr7CywHoeLkJpUEj5EklkLUEdEoL70+7lF4NkLPmzHwq48vU0G5apQvbgXczcY0AHDqNG9
	 ZkBD2HLa2dRwfQIl31CpmXMUi09Gel1515EEYswpQAjEGYdBw9V0NcOFLJ1MlYRtrUXNk17Hg22i
	 Ol36EAWOoPRYvzVBJTzDAktFIImZEOm+8cRO8ugKdDXwlZYEv84xu1vHa2DHzDWmyhV3k/Glug+6
	 rUEHGLxTbtkvDWQ4BgSbI3tb5bVAbSVwwGrn9NuQBGs6Vx5hkP60fKVn3uBdCBhgWutL7eBVsO2U
	 uTwdxzZ8OmVf7Uka+vaPQXO6v6xVONyW9Wrv9o6WlrEIx0qD0MNOe41TTSxOzSXQRnz0JyGPOF6P
	 C9nTpGq1XRyqjm5PofGaRa1AWNqOSTn296/iJmEgNu2cc4Efrc4XQ7iR/eFeHf/oSIskhOFPD/m1
	 X/yo5RQhbPgotuRmwVl6oNjYSwDI3h+YmrFBLkD6NIko3yLjxhK7st72zDzrl4YOd4iSZDYWmG7D
	 BOpxGXtcImGJSDgSm2t7WK63axKgJ8p+mgubPKTgEs0OaD1Y6kgkinToue+v4PCvQKrm3fUFyRhV
	 7rQm95eMpep4Y9fE43qzmuLS1MCFRWsfeOywp61Y3hIWKf6wGN9kygLEyEi7WVqSvxro1sZH4Z90
	 AN+e+psn4=
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
From: Edward Adam Davis <eadavis@qq.com>
To: syzbot+4bcdddd48bb6f0be0da1@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [wireless?] UBSAN: array-index-out-of-bounds in ieee80211_request_ibss_scan
Date: Wed,  7 May 2025 21:23:19 +0800
X-OQ-MSGID: <20250507132318.3346552-2-eadavis@qq.com>
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

diff --git a/net/mac80211/scan.c b/net/mac80211/scan.c
index cb7079071885..88ee1ce44e8e 100644
--- a/net/mac80211/scan.c
+++ b/net/mac80211/scan.c
@@ -369,6 +369,9 @@ static bool ieee80211_prep_hw_scan(struct ieee80211_sub_if_data *sdata)
 		return false;
 
 	if (ieee80211_hw_check(&local->hw, SINGLE_SCAN_ON_ALL_BANDS)) {
+		if (WARN_ON_ONCE(req->n_channels == 0))
+			return -EINVAL;
+
 		local->hw_scan_req->req.n_channels = req->n_channels;
 
 		for (i = 0; i < req->n_channels; i++) {
@@ -760,6 +763,9 @@ static int __ieee80211_start_scan(struct ieee80211_sub_if_data *sdata,
 		/* None of the channels are actually set
 		 * up but let UBSAN know the boundaries.
 		 */
+		if (WARN_ON_ONCE(req->n_channels == 0))
+			return -EINVAL;
+
 		local->hw_scan_req->req.n_channels = req->n_channels;
 
 		ies = (u8 *)local->hw_scan_req +

