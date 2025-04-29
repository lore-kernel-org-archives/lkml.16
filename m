Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B0F2DA84F;
	Tue, 29 Apr 2025 23:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970831; cv=none; b=VOy/vT0Qrgr9dau5MQONF86zU4MwGKUpoep55mFgJTyZGH6xOYuYhmaJnQPBQG36HSfjiN+aKjq2xnUjZwid8idWS32vmFNsyTT0RBhoFrhZoV1w/3WXqZgMm2UVHe1Gwvb3QXB3RMN78lj9v3r+x01tL+eAiV4sueBnzxgp8vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970831; c=relaxed/simple;
	bh=NBFcAh9aTbjvvj3BdxNHYl0QUYZIi55TvNyf4MG5qhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lKhe7bbl1eL8RrVoV0snL2ON4quzpWglD8fRaDJ4t2Gk0ezynplI8zoyqSZ05YZWeL0ACSz84RJz6HlFA6hdPx7+KszOFqJ8pZr9gjbMV+xOwIOubsL+8rz/wW+xmupiFLpN88ZSXFkTCkRIiqEpmN3tSz2tSIxAszKaWToUXbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bmJb7tk3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bmJb7tk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBDB7C4CEEB;
	Tue, 29 Apr 2025 23:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970831;
	bh=NBFcAh9aTbjvvj3BdxNHYl0QUYZIi55TvNyf4MG5qhA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bmJb7tk3w8f8S1zKtC5EL+SwXrZKuXUM1bq9Q3yyMN/p28VobX+tye8Je0yxLWJYr
	 lf6weexLfr7LXE1i8eNpR0dNY9ExU2z1A2dWDxRBvZrYj/eC1ZuG9ujmF5Tismr+lw
	 8PN+kljLFz1tWViKBfDA6tIHegccjtvZeZK3+sB6jkw46fFjPcQDfLsUjrJ4pC01Hc
	 ZQQKoSWUHmBdB5DPFjGNz1CsYKBrEWR28nNXw1m6T8GNGO7Tg3t/yutF6LZERhMXNF
	 rCryRprPOsOBgaf48p+JfN3gxJko5FpAYXhD6ExmChV1UHLQcQT12gs5wj+2AGhfhq
	 LW7NUe8JeRDsw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	claudiu.manoil@nxp.com,
	xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	imx@lists.linux.dev,
	netdev@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 5/7] net: enetc: refactor bulk flipping of RX buffers to separate function
Date: Tue, 29 Apr 2025 19:53:36 -0400
Message-Id: <20250429235339.538269-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235339.538269-1-sashal@kernel.org>
References: <20250429235339.538269-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.180
Content-Transfer-Encoding: 8bit

From: Vladimir Oltean <vladimir.oltean@nxp.com>

[ Upstream commit 1d587faa5be7e9785b682cc5f58ba8f4100c13ea ]

This small snippet of code ensures that we do something with the array
of RX software buffer descriptor elements after passing the skb to the
stack. In this case, we see if the other half of the page is reusable,
and if so, we "turn around" the buffers, making them directly usable by
enetc_refill_rx_ring() without going to enetc_new_page().

We will need to perform this kind of buffer flipping from a new code
path, i.e. from XDP_PASS. Currently, enetc_build_skb() does it there
buffer by buffer, but in a subsequent change we will stop using
enetc_build_skb() for XDP_PASS.

Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
Reviewed-by: Wei Fang <wei.fang@nxp.com>
Link: https://patch.msgid.link/20250417120005.3288549-3-vladimir.oltean@nxp.com
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/freescale/enetc/enetc.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
index 612872c8c8e3c..1068a5ea17b7a 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -1264,6 +1264,16 @@ static void enetc_xdp_drop(struct enetc_bdr *rx_ring, int rx_ring_first,
 	}
 }
 
+static void enetc_bulk_flip_buff(struct enetc_bdr *rx_ring, int rx_ring_first,
+				 int rx_ring_last)
+{
+	while (rx_ring_first != rx_ring_last) {
+		enetc_flip_rx_buff(rx_ring,
+				   &rx_ring->rx_swbd[rx_ring_first]);
+		enetc_bdr_idx_inc(rx_ring, &rx_ring_first);
+	}
+}
+
 static int enetc_clean_rx_ring_xdp(struct enetc_bdr *rx_ring,
 				   struct napi_struct *napi, int work_limit,
 				   struct bpf_prog *prog)
@@ -1379,11 +1389,7 @@ static int enetc_clean_rx_ring_xdp(struct enetc_bdr *rx_ring,
 				enetc_xdp_drop(rx_ring, orig_i, i);
 				rx_ring->stats.xdp_redirect_failures++;
 			} else {
-				while (orig_i != i) {
-					enetc_flip_rx_buff(rx_ring,
-							   &rx_ring->rx_swbd[orig_i]);
-					enetc_bdr_idx_inc(rx_ring, &orig_i);
-				}
+				enetc_bulk_flip_buff(rx_ring, orig_i, i);
 				xdp_redirect_frm_cnt++;
 				rx_ring->stats.xdp_redirect++;
 			}
-- 
2.39.5

