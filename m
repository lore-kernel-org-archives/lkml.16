Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EB62ECD33
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057796; cv=none; b=uhR6R7f16/42yWqpcrhJh48XY9Zy1Y3g7ULg2dSQBfeA3Td14fnVslrrZyIjIzzDc57+D9ZGYcZhM+oPdqa5CPHJ1qR9vQg9kVBM30O/Yqw+YrXQTzC7oe4YB6Qgv/Cs2myM/nuMf15M3TAxIC9lpvV5g3jqvV0urFH1Q5QDrn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057796; c=relaxed/simple;
	bh=EqsjFcnoV7wkCfCblGpMw/2Zo+KMh0FeYoLwiaCPx8I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JGH+T+bd4Szu3oqSn2ZFAQPPjgZhHssQjLZIW1C19igfPfoFWcBqJQdNYHT7WSRr4LaVWAxz2yAQ/j66bS9CRmYw3UhgXOht3H+YokhCXqfxLOHsOmy4kH3nJTMJkail3Lq7tyQwBOuAKAjLjTOJg+SCmFht4YYixWBDAVFguuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=it7cKOFv reason="unknown key version"; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=F5qUsqRX; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="it7cKOFv";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="F5qUsqRX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1751058694; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=EPjNXSD+QUTAQdHPBF1PZFOR+NJM45qYXx5B36QYUrI=; b=it7cKOFvqyVyYcFSrfbRdoewyh
	UFcfT3Yw7VjN9tfj9AF3PR4wYPpBDElU6g8bputf2LJ391K4UIbDfoROuBY0lIpOIIuMa4P0nyj+4
	nHD0QkK/zpWeuoQhxyLfZn1Ci67JPK8iNNludzglGSKR6YKTw6lzZvC2J18QwDLBH4gDWBA2nC5nE
	iV0IgkocQP2fw9wFWv1lRULcRlIChY0f8lZExulJrqUxhp6Rmas3YCINJm3opyNem93mjrtTUba5Z
	52puz7JgjdiwOwoDUC2ZfloXysLZqYs8nUIBMnyxB9bw76vULZRksJ0JlSUAhv83irmg1CIuPw+0D
	8E7SWCcA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1751057794; h=from : subject
 : to : message-id : date;
 bh=EPjNXSD+QUTAQdHPBF1PZFOR+NJM45qYXx5B36QYUrI=;
 b=F5qUsqRXDyTcx6V+IZZljLVtUA+PwAlWQA4izgEfdnu8oJGGT66xy7l6umrmFa/U491gu
 4LE6GI+YY+3kBrUxf7StBOZbJ2Idtqy/AOrDOR5umZ/9KfxqabpqE51zFMcsHQipQ6BsiYZ
 N4NKkcuProtDFsg6l67JTiIzmzDIUAai7g2WNsFHL6tX3AVpqPGFct/AejmCjbKKO/5wREq
 cEgdOa666PbIpUwEPSW4FRuUUls6kHpU2CySIv2G4R5n0j5mXKuF7IM+0eKCMo17mfHyzZI
 pGbVnh2c8Pp7b9NXCupBC/O0KFdbXWXYP2/ETZQwOxUO9jFynFhPYB3vteAg==
Received: from [10.176.58.103] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7V-TRk3aB-BP; Fri, 27 Jun 2025 20:56:25 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7V-4o5NDgrjV9w-omjN; Fri, 27 Jun 2025 20:56:25 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH wireless-next 3/3] wifi: mac80211: Correctly init MLO link in
 ieee80211_8023_xmit()
Date: Fri, 27 Jun 2025 22:46:49 +0200
Message-Id: <8ddf1dd6362e0ad57a98505b0d195554ebc91b7c.1751057146.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <cover.1751057146.git.repk@triplefau.lt>
References: <cover.1751057146.git.repk@triplefau.lt>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: Nz5J7QcA5snT.TjIl-KkFGOci.EDlO-gMB_5u
Feedback-ID: 510616m:510616apGKSTK:510616s0p5iKs-_9
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

The IEEE80211_TX_CTRL_MLO_LINK info is the only part of
ieee80211_tx_control where a 0 value has a specific meaning. Thus this
should always be initialized with IEEE80211_LINK_UNSPECIFIED if there is
no MLO link information associated with the skb, even using when 802.11
hw encap offloading.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 net/mac80211/tx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index d58b80813bdd..f65fb96a498e 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4637,6 +4637,8 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 
 	info->flags |= IEEE80211_TX_CTL_HW_80211_ENCAP;
 	info->control.vif = &sdata->vif;
+	info->control.flags |= u32_encode_bits(IEEE80211_LINK_UNSPECIFIED,
+					       IEEE80211_TX_CTRL_MLO_LINK);
 
 	if (key)
 		info->control.hw_key = &key->conf;
-- 
2.40.0

