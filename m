Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20602D26BB;
	Tue, 29 Apr 2025 23:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745970784; cv=none; b=W32K+VGfUBskY9EVc4u3CwrGoOSzhCAJYcrFxJzsbDLzqf/+LExTk2vCDSqncGfdmN2pc/L1sp8TmHG6WUUH13rNvsuI1d9XD6HelfO1QgrzOlVuTS13uPhNKgljJpEilzzFWXZdyzNKnWbwUfTjmd5NJ2XStpQZwioLfihgJtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745970784; c=relaxed/simple;
	bh=QUwnuC1y3iAmHWMyDULgb7TEwYmnyQqFYMmtkz9VAPM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TxrdL4lGekY34jg3XgYXsXd3K1qzfO2Misp/ar9vUKIpDthyuz6GozjjMK057oH+NwoYfZwdVqcpUxmv4vyLyc67zjzEHZdTtJnKIXkh1YvECY5EEll3UEv1Tu4kBMf7fEcxdH52FWC7cd604eYLsMLysBtFXiZ/MJQLIYkeFw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BtHhjC0D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BtHhjC0D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2067FC4CEE3;
	Tue, 29 Apr 2025 23:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745970784;
	bh=QUwnuC1y3iAmHWMyDULgb7TEwYmnyQqFYMmtkz9VAPM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BtHhjC0DyNduYutd5Zn9zdAxpGbmQgvfkpFOoYR3ctOBzzHK7DlFyOTN3v2U9kBQX
	 rwh089MSpZG6nkWAeZK2qgqqmqdBt6KWa5Ejt3YMXkKUEBr0tUn6wSeiBW/qnmr7dR
	 CboC1wzIWY3MJzUnP/o4YooG/0wp1yABX1pLPgE3ntukbFZ/Q40Gcnc8TY4uc4r8m/
	 /XmtQV/QhMBLtF3h3js3tFwmNh7yKAkc00M9S5sV04QPfK3UhvNC03xKn2OomitUif
	 OAOzUtjN2GemNW4qQXeuOBxUaeRmyZ/tHL16bRT9j8WOIob+c7P81RKqoRh1tQPoqA
	 LU2YUHPufam0w==
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
Subject: [PATCH AUTOSEL 6.6 16/21] net: enetc: refactor bulk flipping of RX buffers to separate function
Date: Tue, 29 Apr 2025 19:52:28 -0400
Message-Id: <20250429235233.537828-16-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250429235233.537828-1-sashal@kernel.org>
References: <20250429235233.537828-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.88
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
index 8feb7d4226bb5..0c09d82dbf00d 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc.c
@@ -1572,6 +1572,16 @@ static void enetc_xdp_drop(struct enetc_bdr *rx_ring, int rx_ring_first,
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
@@ -1687,11 +1697,7 @@ static int enetc_clean_rx_ring_xdp(struct enetc_bdr *rx_ring,
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

