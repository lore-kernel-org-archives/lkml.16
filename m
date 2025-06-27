Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DE42DF3EA
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057797; cv=none; b=jTh1Mu/87N+sAtRqVonXOjy0kYSNiBSWKjA4P3+5gSDXI+qyU1YDT1ZxETMQ+DcfaUZCYXfm6/HE4MrABbFwnyxoId/1W05LIidExis8KMvLNR5heUx/xWaXDoOoRELAwxZJ1Kht9FCu6RnUYPikjU0079JYxtOPxwqVXnt81qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057797; c=relaxed/simple;
	bh=PB5y9/HTjxCPGTDbN0DPdqlQpv1FQay+Az8XF+7AqUk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oFbsxWzoXRJGzkJqvH2bGH+pNjkoU/CD5jw0kN+fU5VRwgN/vNyXtdbl/jj7UcvJN3m//OGl8AcjAxKnrNIYd4mrzlPgx1bfEXWStumaQhMaC+OXwRuWDRA0lHKoxUpJ3zieWgJIvu+thAZpIHB4EosIhbdmVMLkC5mOQCD/rJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=BdsahQrw reason="unknown key version"; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=O3DknTZ+; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="BdsahQrw";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="O3DknTZ+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1751058694; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=KI3j6h+4PHiZ7IiGHZy/tubXugs/QE1IKxzd+gUImrA=; b=BdsahQrwQTKrzmzbnC9JYzPyKM
	vwx2bq+fahNhMbrkBz70ihlztzlkGHjYiNCC4svm+a1sSk4UECfOmUX3hYUvC/OZW51jlueAAkuKU
	0MNkHqgzl95MJiyjrHJgac9oIeasHeaN0y/Dss6/JcMscO4VxRK9sm0DhUq3R2t9Aooay3lHL/wPA
	vCqnszth6BQdpKPIU+sl02yRf61USXqvzyL4goKqep7JNL6FBeMAv/UmCbt9BA9EQMZrM/Fbnf+pg
	4QWh2xC0vvTLfX+E1ncbJ95SAVJwa6KhCcSpxqcCH4Jxf1LfB4lsIm7qVBz6mpNhZWyQ2rEIWbRqx
	z0aOy9iA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1751057794; h=from : subject
 : to : message-id : date;
 bh=KI3j6h+4PHiZ7IiGHZy/tubXugs/QE1IKxzd+gUImrA=;
 b=O3DknTZ+/DHcrJLcwQP0DXuWMoBnvAkiwOCt8ex7lj4weAod6X8i1hMyeKA5XBmGp+PY2
 sWv5KFDytJ7g2xbf6DFG32NzNnywKKmsFK3XxsyKQO6EagMzHlf2EvSUt0237l7+ia75dUf
 uK0mo+9FLNyY5G4sMaZXcYk5bI6xuV5ZVPqqI+b5bMOR1wGe/lsGQoMsF0LCF/7G4xu9uIO
 wuHlOdhir7FjHLD3KBV4rs1QrKYoemrvn1WLy94OMSZZHY51NhiQCdXrsiyuDNHq1GRJWYn
 csFy8zxY5j4pIIcXcdntEEnyEH/o+TLdT4C0JyOnzoJyPfLyU+HCIfBT89bA==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7U-TRk3Us-CZ; Fri, 27 Jun 2025 20:56:24 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7U-4o5NDgrn9kc-kei5; Fri, 27 Jun 2025 20:56:24 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH wireless-next 1/3] wifi: mac80211: Do not set link_id for
 received management frame
Date: Fri, 27 Jun 2025 22:46:47 +0200
Message-Id: <8701dbe48fae509bc8cb6d8ce5e6f96f75ad57af.1751057146.git.repk@triplefau.lt>
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
X-Smtpcorp-Track: x5Dj2-aHDx0x.RisXXF_SgsDx.b0WCbwmdTEG
Feedback-ID: 510616m:510616apGKSTK:510616sqE7JnFGBJ
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

A non-MLD sta could want to send offchannel management frame (e.g. to
do a offchannel scan). Because ieee80211_rx_for_interface() fills the
link_id information with the link the sta is currently using; hostapd
would send back management frame responses through wrong link causing
the sta to miss them.

To fix that, do not fill link_id indication for management frames,
relying on hostapd instead to infer the proper link from the received
frame frequency.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 net/mac80211/rx.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index e73431549ce7..deebdce6d9c7 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5112,9 +5112,14 @@ static bool ieee80211_rx_for_interface(struct ieee80211_rx_data *rx,
 	 * have the link information if needed.
 	 */
 	link_sta = link_sta_info_get_bss(rx->sdata, hdr->addr2);
+
 	if (link_sta) {
 		sta = link_sta->sta;
-		link_id = link_sta->link_id;
+		/* Do no use sta link id information on management frames to allow for
+		 * offchannel scan, roaming, etc.
+		 */
+		if (!ieee80211_is_mgmt(hdr->frame_control))
+			link_id = link_sta->link_id;
 	} else {
 		struct ieee80211_rx_status *status = IEEE80211_SKB_RXCB(skb);
 
-- 
2.40.0

