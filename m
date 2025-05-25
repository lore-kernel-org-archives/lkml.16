Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECAB1EA7EB
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.77.101.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748185930; cv=none; b=HdOTrItAY5tcXKqkQ/H+kZ7zEm5X995dMlhvQJF4L5n1BUuOlquHrwfoB/fgODH2SOQDF21Np9w+fvSiqnVaoOoPW9wsOV1SPthoBl8BhaSrH9V1ocKDofcRGzOHja1KU3KH+eC7iFnsMETJbgU+DZDmkXHBCDb8YyMBQMIdgjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748185930; c=relaxed/simple;
	bh=Y8x/ns0vNBbtproy+Ajbgg8YW5b/gh7DUjgEMGDQLEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErTlozdCTvYW9xb4uesYVji+b0zoQRk8yTz8CbsxTmGdEaPMfD/YJiRvdfia8QoHq6nv5TYlWHl7GibPmpFKV4EanFViE9qUsfeD6hQHPoVLq1Y2oa7O1tUC8NLYpI5SZXq5yW/hy27j502o9t3e0mInNCZX8h1lEhj7wQLo4P8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl; spf=pass smtp.mailfrom=wp.pl; dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b=TjvKoOi6; arc=none smtp.client-ip=212.77.101.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wp.pl header.i=@wp.pl header.b="TjvKoOi6"
Received: (wp-smtpd smtp.wp.pl 17448 invoked from network); 25 May 2025 16:45:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1748184324; bh=NNKevgor4yLaPnCDsqGOmTvb1Z4nfy6aCjVBQGo+NaI=;
          h=From:To:Cc:Subject;
          b=TjvKoOi6zbteFWKEljmja07sgbjJ+EwnuMb4wzy9MdYhl+98f8vzqZxDjfOHz96aD
           6axIfIkI4EgiX3pJtz/YGXVKm+cnpvjm2peMFxz/tPPWUyiv10CrYhVNXPB7urCX4X
           Zs8sQR3ik2CQ5ZDloi0woxbiWSketqneGR8/jtjjLf5P0Mk1JwOdBWB8KMwLvGuocn
           hrTWYFfLvhJQdIqsKUWHAL4doWjkaBcDPh/hOszAm2sZWR6PjBiDmHrDWu50TW8gov
           8TWn967pasw15o5+gPSnKwpaRPYqlU7x7dl84SEw6Nd/zt6tG07x3QRVbyOd/UfTcl
           cj2/PsVHYmcxw==
Received: from 89-64-9-114.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.9.114])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <pchelkin@ispras.ru>; 25 May 2025 16:45:24 +0200
Date: Sun, 25 May 2025 16:45:24 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Fedor Pchelkin <pchelkin@ispras.ru>,
	Johannes Berg <johannes@sipsolutions.net>
Cc: Alexei Safin <a.safin@rosa.ru>, lvc-project@linuxtesting.org,
	netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>
Subject: [PATCH v2] wifi: iwlegacy: Check rate_idx range after addition
Message-ID: <20250525144524.GA172583@wp.pl>
References: <20250424185244.3562-1-a.safin@rosa.ru>
 <20250427063900.GA48509@wp.pl>
 <d57qkj2tj4bgfobgzbhcb4bceh327o35mgamy2yyfuvolg4ymo@7p7hbpyg5bxi>
 <20250517074040.GA96365@wp.pl>
 <hrpy3omokg5zvrqnchx4jvp26bvfgdrashkmrjonsyz5b64aaz@6d5kn7z7x73q>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <hrpy3omokg5zvrqnchx4jvp26bvfgdrashkmrjonsyz5b64aaz@6d5kn7z7x73q>
X-WP-MailID: f8fbcc1f44e5be2d49dd08e85c2d5fe5
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000000 [0aMh]                               

Limit rate_idx to IL_LAST_OFDM_RATE for 5GHz band for thinkable case
the index is incorrect.

Reported-by: Fedor Pchelkin <pchelkin@ispras.ru>
Reported-by: Alexei Safin <a.safin@rosa.ru>
Signed-off-by: Stanislaw Gruszka <stf_xl@wp.pl>
---
v1 -> v2: 
 - just add check one possible case the index could be incorrect,
   instead of doing broader changes.

 drivers/net/wireless/intel/iwlegacy/4965-mac.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/intel/iwlegacy/4965-mac.c b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
index dc8c408902e6..4d2148147b94 100644
--- a/drivers/net/wireless/intel/iwlegacy/4965-mac.c
+++ b/drivers/net/wireless/intel/iwlegacy/4965-mac.c
@@ -1575,8 +1575,11 @@ il4965_tx_cmd_build_rate(struct il_priv *il,
 	    || rate_idx > RATE_COUNT_LEGACY)
 		rate_idx = rate_lowest_index(&il->bands[info->band], sta);
 	/* For 5 GHZ band, remap mac80211 rate indices into driver indices */
-	if (info->band == NL80211_BAND_5GHZ)
+	if (info->band == NL80211_BAND_5GHZ) {
 		rate_idx += IL_FIRST_OFDM_RATE;
+		if (rate_idx > IL_LAST_OFDM_RATE)
+			rate_idx = IL_LAST_OFDM_RATE;
+	}
 	/* Get PLCP rate for tx_cmd->rate_n_flags */
 	rate_plcp = il_rates[rate_idx].plcp;
 	/* Zero out flags for this packet */
-- 
2.25.4

