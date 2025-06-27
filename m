Received: from e2i340.smtp2go.com (e2i340.smtp2go.com [103.2.141.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D741F37D3
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 20:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.141.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057797; cv=none; b=P+9xNRlb5AapZBJ/b8F2uFCDuNdHz6cM9EnxUev/Iu0m9zdi6FguVxhIRzmKp+M9RjEkmr48HLCaPTTXgA9Ckb577gEsJacEzHcYkklmCsODcz3mqhqt6Q77LONS2ZiQLR8uuIgXm7X7GtcYjuPL3lTKlfzLcQHJz/99iNRcLTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057797; c=relaxed/simple;
	bh=bD8cKSDZiZkprHqsi2qiN6AuHVqQo0WDu1prDQBjhQw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n3nAP7Pk7L/e9d9+QKe4wOR5Sjukd8q8kyd5L5MehAWwNhI0fExydgIqDmk4LTwSaoLnQ8rwEMVkxr9SWvZBUhtmOgRx/hZexBxxqBPC3APzzpK80hs5EXLhE/ki+qZLya0pttd4UJKfkfhcSOlST2Ca6nkKviO2qJspcGsVpjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=jUietesn reason="unknown key version"; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=kf3q6Xli; arc=none smtp.client-ip=103.2.141.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="jUietesn";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="kf3q6Xli"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1751058694; h=Feedback-ID:
	X-Smtpcorp-Track:Message-Id:Date:Subject:To:From:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=xBK5bN5wTTBfmYhTDoMi/DBtiYeX8oamm6c7VYxGRq0=; b=jUietesn0Aand4Da/MI/txh2NW
	b5/pYnFolFCOUcqrwi1Xj9gYU4TAM5dhGCEoWOsPaCm1WRGrPFUoH4mGVuiO3C8ms6tYng4l+NAVD
	p0JgnZDkxVlq/FP0yXua8FU1K+Z6J2yOCT/7A9Fwmu1BkOq9423PbxfnUK2qcCieE9qANNmy74vNl
	PmhJ+4pCWpt7rU23AlXXldvI4YypnJrtRCE/ilKrfxOx0CExuvcnfVVvy01CE5lFtJmz1wkTAk9NW
	d1vP/s4nyQGkPAvU4GofhOAO6PD3JNUw0h3faJlmn2UQ6nPeY1twtMMDSRQqNPn+S/tOe0G4ZrE8z
	/xFIeHpg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1751057794; h=from : subject
 : to : message-id : date;
 bh=xBK5bN5wTTBfmYhTDoMi/DBtiYeX8oamm6c7VYxGRq0=;
 b=kf3q6XliliwCBahY9L1qZeMXJJx2ImFVejEpLE/C3XT0BrAqXh+zeuxau/uBdZyAfa+lQ
 BeUjl9OYZflSymi9TxpAYbVxQSbab1wp9FRbqXJkLaaStY0tDWji1AG7gT7b+HfEn51TUda
 9zuaIRpaeksTXzBDmdVewFCnOfalm8aU0JpDauFBeaxC+r3UClZ6hXPogoSlmpPpt0i032b
 d6dx829qRVkpG4Qerbto/NBDxzQmlJDobLKq0Fx4cRG71IrHRWdBKL5rq8IJoDjSNo9BZkr
 75dYNutmvp5NRtLs6qbJaS0pryMUHi3r/f2by1iEL9lNQIntiVQE53Eytqow==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7T-TRk3TU-WA; Fri, 27 Jun 2025 20:56:23 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.98.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1uVG7T-4o5NDgrn9kK-n5xn; Fri, 27 Jun 2025 20:56:23 +0000
From: Remi Pommarel <repk@triplefau.lt>
To: linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
 Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH wireless-next 0/3] Allow non-MLD sta to roam between MLD AP
 links
Date: Fri, 27 Jun 2025 22:46:46 +0200
Message-Id: <cover.1751057146.git.repk@triplefau.lt>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Smtpcorp-Track: BvDkXKPErC3P.ID84ABicHh1v.tddr5Ap7KNk
Feedback-ID: 510616m:510616apGKSTK:510616sVRmeXDyK1
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

This serie aims to allow non-MLD sta to roam between same MLD AP links
as if they were two BSSs belonging to the same ESS.

The first issue is that when a non-MLD STA is connected to one MLD AP
link all received management frames are reported to userland with the
current associated link id even if STA sent those frames on one of the
other links (e.g. offchannel probe request). Because hostapd relies on
this link id information to select the proper link for answering those
management frames, probe responses to offchannel requests are sent
through the wrong link and the sta misses them.

To fix that, the first patch of this serie does not report management
frames with a link id (link id == -1) and let hostapd do the freq to
link conversion to respond. This relies on the fact that hostapd knows
how to do this freq to link conversion which is needed anyway for the
first pre-association scan. We can also do this conversion in mac80211
instead if it is deem preferrable.

The second issue comes from the fact that hostapd queries a sta removal
for the previous association even after the sta has successfully roamed
to the new link, causing the current sta to be removed. To avoid that
the second patch checks the sta removal link id parameter. If a link id
is supplied and the sta is not currently using this link, this removal
is ignored. An additionnal hostapd patch is needed so that a link id
parameter is added with NL80211_CMD_DEL_STATION requests, and will be
sent to hostapd mailing if it appears that this serie makes sense.

The third patch fixes the link id information initialization when tx
frame with 802.11 HW offloading, this will be needed later to get sta
roaming working with ath12k. An additionnal ath12k fix will also be
provided in order to get non-MLD sta roaming working with this driver.

This serie along with the mentionned hostapd patch allowes a non-MLD
STA to successfully roam between several MLD AP links with hwsim.

Remi Pommarel (3):
  wifi: mac80211: Do not set link_id for received management frame
  wifi: mac80211: Check link id at station removal
  wifi: mac80211: Correctly init MLO link in ieee80211_8023_xmit()

 net/mac80211/cfg.c      | 3 ++-
 net/mac80211/rx.c       | 7 ++++++-
 net/mac80211/sta_info.c | 7 ++++++-
 net/mac80211/sta_info.h | 2 +-
 net/mac80211/tx.c       | 2 ++
 5 files changed, 17 insertions(+), 4 deletions(-)

-- 
2.40.0

