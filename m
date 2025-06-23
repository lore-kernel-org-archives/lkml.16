Received: from siberian.tulip.relay.mailchannels.net (siberian.tulip.relay.mailchannels.net [23.83.218.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47BF51684A4
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.83.218.246
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750705616; cv=fail; b=HvhJtdIhg5FtaIaSLQFzrxZ6jK6iJk9ZERNA7ZonFeuiTOslB9280jJetCi3NvXrxfxCE+/y61g+mEYjFNsKxhrZzw4MYaTmfknUjK6zsayjtkUdIRW6dSVu1guReNSQlokU9tiiR2HfFM+Mt+14cAeetr6YsIZ+ktQ5a9z7NCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750705616; c=relaxed/simple;
	bh=NqL+/tPydRN1T77ryDmxqIgIo9J0G9vNfGyONvs1JH0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HNQMg4YzxACqadREw6L+e83PfVGd/GCymCg1PmbgHsCYmbRjTiG+1U37vuSXiRd3atp1PhkuPlvQbDuFSlaKaNlDj9Kx61HZvUx/uRYM7VDd/HJvUK1OREdij9Fh6+/cacJE5s7LCJUcstvoZHwSM6nHUNYw94BSewtr8C5suaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net; spf=pass smtp.mailfrom=stgolabs.net; dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b=ZBz5PwGr; arc=fail smtp.client-ip=23.83.218.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=stgolabs.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stgolabs.net header.i=@stgolabs.net header.b="ZBz5PwGr"
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 2298518481C;
	Mon, 23 Jun 2025 18:59:42 +0000 (UTC)
Received: from pdx1-sub0-mail-a316.dreamhost.com (trex-green-5.trex.outbound.svc.cluster.local [100.127.221.92])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id A2E06183477;
	Mon, 23 Jun 2025 18:59:41 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1750705181; a=rsa-sha256;
	cv=none;
	b=igQk+sXvXEfZRbXO1GiaG9ikIY6T9SSzzLUY371IJTma3E94nVeJ4nPNAAQKMZfvqoOrzr
	ndyjvPDftrK0jRASEVDtBEcDbh5AB+9Nq2plgbbtbuhYLwDubRuR8Zr3blmCdWTkTfzuRt
	YalOPNC4fgEb9JXkbZ+WUDB65RcNVVXZKh2QPTx8+oHEIoTHz75Bu6ttCbbaRpj9aoAdcJ
	3SCMtlsVYNM19sJCGKeYzu/pi2QmbBolBClMaOsP+SU+8YtiByBxhyi4ZrHy5YDa5/6ocM
	Pve+U4qkwWDNiZ/WdQTbArcEONaiAf/zy4a9McNzeF/3CnIcYQ/PA9vMt85TdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1750705181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=iTH9wFB+JBQU6K1w6gktcARkoNkO27ZyKXW1O6cBS8E=;
	b=Rp0Q4FsYBT427MW5ZH2unCjByT1QYaPtbQWKwRXEcqigEP8ExHEYJK8rWWmUjemrXp+rNf
	oIfaRdQb7HmUyiHs/1GY8jqCL+fm9dWqWK1TKTR/bRwp3XZ7OUT3cnLCnX66Oi5hkIR9zT
	wwol7sRdW8HBuVxBqSMrSNFwQFq5Q/XSPx+66amF0+DvB52oxPJk0RUUaaHTi6r4WeYUhX
	mjXAIAj5L1n9nJCRGD1l76dHbu3eqnwoLFTdAc4OH+OY1aImWeOAitQQBYhiPoZmuMy0nh
	1cOwILStbQ+IE4qDd2bpF/PQf/0NDuBWHMNYnfQLDC5wxLyxGpb/4t3ZE8HhGw==
ARC-Authentication-Results: i=1;
	rspamd-679c59f89-c9qk5;
	auth=pass smtp.auth=dreamhost smtp.mailfrom=dave@stgolabs.net
X-Sender-Id: dreamhost|x-authsender|dave@stgolabs.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|dave@stgolabs.net
X-MailChannels-Auth-Id: dreamhost
X-Abaft-Thoughtful: 4736bec122005e1a_1750705181964_3687824332
X-MC-Loop-Signature: 1750705181964:3039902206
X-MC-Ingress-Time: 1750705181964
Received: from pdx1-sub0-mail-a316.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.221.92 (trex/7.0.3);
	Mon, 23 Jun 2025 18:59:41 +0000
Received: from offworld.lan (syn-076-167-199-067.res.spectrum.com [76.167.199.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dave@stgolabs.net)
	by pdx1-sub0-mail-a316.dreamhost.com (Postfix) with ESMTPSA id 4bQy7J6twXz8Q;
	Mon, 23 Jun 2025 11:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stgolabs.net;
	s=dreamhost; t=1750705181;
	bh=vjCLe0lDun0WCvPOxIVngwkUbkxkTJhCtkS4Pw7qan0=;
	h=From:To:Cc:Subject:Date:Content-Transfer-Encoding;
	b=ZBz5PwGro/e3FMWoYszE2Lu6gU9Mc3aLCGFcZpHKPyWnjfqzPeEzp4eHzVTl75Ee+
	 WZ4W0iqVrU8cX0j+e3r21olSnlijJDGDlj2IJ44D6DvofN7kJFHjjkuu+Yusnw1c2M
	 LWKeVNDn2YwhwJsXvqVXTz+jb9sHOH5eUOy6WAc76/mNcXCpMVmG2931O2VWs2citu
	 z3tBa3p7fQOYWmwge4CyNOdEpnc6+QjvIEP2nQA/T/NTfC9WQqcdVhnGw2SxW/FzLf
	 Xx4yK1Pli3iz6pItYpkE3Ygtsxiac4xU+G+4trkcs5Ar1nhKTdWfrTPNEDRjmEzeUk
	 /mRqagIGdak9g==
From: Davidlohr Bueso <dave@stgolabs.net>
To: akpm@linux-foundation.org
Cc: mhocko@kernel.org,
	hannes@cmpxchg.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	yosryahmed@google.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	dave@stgolabs.net
Subject: [PATCH 1/4] mm/vmscan: respect psi_memstall region in node reclaim
Date: Mon, 23 Jun 2025 11:58:48 -0700
Message-Id: <20250623185851.830632-2-dave@stgolabs.net>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623185851.830632-1-dave@stgolabs.net>
References: <20250623185851.830632-1-dave@stgolabs.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

... rather benign but keep proper ending order.

Signed-off-by: Davidlohr Bueso <dave@stgolabs.net>
---
 mm/vmscan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index a93a1ba9009e..c13c01eb0b42 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -7653,8 +7653,8 @@ static int __node_reclaim(struct pglist_data *pgdat, gfp_t gfp_mask, unsigned in
 	set_task_reclaim_state(p, NULL);
 	memalloc_noreclaim_restore(noreclaim_flag);
 	fs_reclaim_release(sc.gfp_mask);
-	psi_memstall_leave(&pflags);
 	delayacct_freepages_end();
+	psi_memstall_leave(&pflags);
 
 	trace_mm_vmscan_node_reclaim_end(sc.nr_reclaimed);
 
-- 
2.39.5

