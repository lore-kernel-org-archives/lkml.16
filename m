Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E4E2EBDE5
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057797; cv=none; b=Lukix3nHcaHxnPEYT9X3if5gys9FTAJ5WyeLGflEXF4en2+AvzZBTgWYrAV1k+UofjtvUPjoVB5GPOCdujDi7hYQVcpF83TcilNXlusjecivkIJTVCg2VsAX19Bfd2DuYal2oX0nLjucCp2weTvDseqSpYqWBs1gVVxUMZdS2sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057797; c=relaxed/simple;
	bh=HUmZknJWh+4IbGoKHMlrRE2bwWFAclzczTpLLSJQjFI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I/AcQQHUQpES0/UdtANbOOiylMOeXSCIyqI+Ba/COoRzOPckweWqkf4KKuA1P/76U2UofgoQ7DW/Qk8CS7K5RXfSGMP2ZUaOm/bW3WwFgeIWkKN93TqVxrOCK7ln3P05kJbde0JxF3rMyjg9X53M7UVJN6DcS4WrqqipZPGDT5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=IToUDjUU reason="unknown key version"; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=OijLCpEA; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="IToUDjUU";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="OijLCpEA"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1751058694; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=7qQapT4Ems7IYz4MpjuzCT6uqTNZKqM/89+kD4lotE8=; b=IToUDjUU7ZjHmY5WOHUK4CW6uO
	zdCefdpN0eOAToux9HVm0MotPJjKMufIne7k9r3oDkj/nRaQeOgZD7Y9ctfaSzn/tvL25PixRsT/N
	fXMSf3mw9e8lw31e3gBIaeA+kRh2LB76MkwEzLyrekpaAIgF6y+YJSnG1zt5HOJ6BELyeexWhRmJh
	njiDB20YsHTJhbllKeeEEjujHay3M3NCi1cUj11JyYOSn4Suefix9pa58HRD39XYD8Z168xGtb21G
	oZAshfIiX6QynQt3X6Kh6VmDKlfDWJLawGTRbvn7G/k35HFAQAJsmo6sAODJw9falzOIBgzIXjEVL
	3LxkBgFg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1751057794; h=from : subject
 : to : message-id : date;
 bh=7qQapT4Ems7IYz4MpjuzCT6uqTNZKqM/89+kD4lotE8=;
 b=OijLCpEAaKzgFnZ7f9LRZrPV0oCioin/g6AegtyB0eQhEgASpWz6+74m8La18HmBY7SL0
 8r3OENzBFlPUBJ0WzaiUNZEX/1q//ItLKdXMRxBQwTN0rYWNp1+MAXOyFiLmwjfTc8q2iuz
 QRP4pNac/4i1C63BqEOnzJqEnvtTUzOAwFf/mzQ9vreYEEvb01kzcsX26i+2dj3Sj//CzTv
 Y0giv6BheWuJcMhTOzLkcEdf2Qwww8PzkWepULuEylqAfP7o5HyhqxScRt4Hky1uItPZ9s0
 66DHXMTZU0Iwnu9B0f7mFXP4bY16tjQeLG1JkDv2prfeqw1M1w56bSvpur0A==
Received: from [10.172.233.58] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7V-TRk3Xd-0A; Fri, 27 Jun 2025 20:56:25 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7U-FnQW0hPw4yg-n6Sv; Fri, 27 Jun 2025 20:56:24 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH wireless-next 2/3] wifi: mac80211: Check link id at station
 removal
Date: Fri, 27 Jun 2025 22:46:48 +0200
Message-Id: <d02c46bd94d9899811da57ea36b23668042721ba.1751057146.git.repk@triplefau.lt>
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
X-Smtpcorp-Track: kdwHBLEzAKDR.oVzWQ41JtPw5.IDoZGQWYyxC
Feedback-ID: 510616m:510616apGKSTK:510616so1T645gTN
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

hostapd can remove a non-MLD sta connected to one link of one MLD AP
several times. If the sta roamed to another link of the same MLD AP
between two of those removals the wrong sta_info could be removed.

To fix that remove sta only if it is currently using the link specified
in NL80211_CMD_DEL_STATION if they are any.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 net/mac80211/cfg.c      | 3 ++-
 net/mac80211/sta_info.c | 7 ++++++-
 net/mac80211/sta_info.h | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index d9d88f2f2831..3dfe8e0759bb 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -2195,7 +2195,8 @@ static int ieee80211_del_station(struct wiphy *wiphy, struct net_device *dev,
 	sdata = IEEE80211_DEV_TO_SUB_IF(dev);
 
 	if (params->mac)
-		return sta_info_destroy_addr_bss(sdata, params->mac);
+		return sta_info_destroy_addr_bss(sdata, params->mac,
+						 params->link_id);
 
 	sta_info_flush(sdata, params->link_id);
 	return 0;
diff --git a/net/mac80211/sta_info.c b/net/mac80211/sta_info.c
index 61583173629e..7e58ae507a14 100644
--- a/net/mac80211/sta_info.c
+++ b/net/mac80211/sta_info.c
@@ -1530,13 +1530,18 @@ int sta_info_destroy_addr(struct ieee80211_sub_if_data *sdata, const u8 *addr)
 }
 
 int sta_info_destroy_addr_bss(struct ieee80211_sub_if_data *sdata,
-			      const u8 *addr)
+			      const u8 *addr, int link_id)
 {
 	struct sta_info *sta;
 
 	lockdep_assert_wiphy(sdata->local->hw.wiphy);
 
 	sta = sta_info_get_bss(sdata, addr);
+
+	if (sta && link_id >= 0 && sta->sta.valid_links &&
+	    !(sta->sta.valid_links & BIT(link_id)))
+		return -EINVAL;
+
 	return __sta_info_destroy(sta);
 }
 
diff --git a/net/mac80211/sta_info.h b/net/mac80211/sta_info.h
index 7a95d8d34fca..653eda1c2466 100644
--- a/net/mac80211/sta_info.h
+++ b/net/mac80211/sta_info.h
@@ -878,7 +878,7 @@ int __must_check __sta_info_destroy(struct sta_info *sta);
 int sta_info_destroy_addr(struct ieee80211_sub_if_data *sdata,
 			  const u8 *addr);
 int sta_info_destroy_addr_bss(struct ieee80211_sub_if_data *sdata,
-			      const u8 *addr);
+			      const u8 *addr, int link_id);
 
 void sta_info_recalc_tim(struct sta_info *sta);
 
-- 
2.40.0

