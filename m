Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A478C253F32;
	Thu,  3 Apr 2025 19:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743706941; cv=none; b=ZjJawCP0RFtaNftlRvPPXqo4OJoNsbrp2TbScDpGkR4lrq/A7OVTjNXPc28muZzmAiGe7bJvRee6aDDer3a1bggeeAqsCxn0Cf53DkIW6yx45JVAElRhcbithVU2LVXSFekbq68ewIpKQQt1mmGsPJOeOIrNIH2e9mJz/Npu+P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743706941; c=relaxed/simple;
	bh=cGbki3ZhuRmPdsNUUjsHP8UWMK4ZVjl1yl5Jv6/Z+jc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NNF+rDluFAOLc4XPhJEN+9DAMGbeluKRllIIwOYhRJx0jR6GjyO6DpzbEIUJ5YqZFQ1Bv3q5FMSf7OBLxUrwaH9rmxE/1ugF0YKY1BlpACGFwhGjdyAPfeip8+kdAeOPuIWlmhcUiatL0F0cofPVr5xKkLR0/l/1QxPOmL7Ldj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NQwZFktO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NQwZFktO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD96C4CEE3;
	Thu,  3 Apr 2025 19:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743706941;
	bh=cGbki3ZhuRmPdsNUUjsHP8UWMK4ZVjl1yl5Jv6/Z+jc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NQwZFktOMnZHvbNYPIC3Sl1Xh6fn2Zp2bUD65/mxIAdCkGP71zi024maCWl4yMblF
	 //eQIHmmHqROZR1y1UD0WfxrgB5qj0mh7+Zr5laoBsHNLkqltBUDk1Nyn/fi5g1+cS
	 snNr90guYWoOF+jsOR0eW+eYrUqqiEPdW258zZdGIH7gU/Ckfk4xwMzPYrws42ba52
	 QAucwnOxZo5bkJ8z9/YjtC0OUafMSq32XsNhB0uDzglT4EkgXL/bJwLj+otqIlzv2e
	 bO0td93PYE/gC609pm5HqHL3JOJ93k8CaAIVT4/iGx8h4phh5f01lNVyJlH3uwPJaC
	 08hIufR3smSpw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: P Praneesh <quic_ppranees@quicinc.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
	Sasha Levin <sashal@kernel.org>,
	jjohnson@kernel.org,
	ath12k@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 05/54] wifi: ath12k: Fix invalid entry fetch in ath12k_dp_mon_srng_process
Date: Thu,  3 Apr 2025 15:01:20 -0400
Message-Id: <20250403190209.2675485-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250403190209.2675485-1-sashal@kernel.org>
References: <20250403190209.2675485-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14
Content-Transfer-Encoding: 8bit

From: P Praneesh <quic_ppranees@quicinc.com>

[ Upstream commit 63fdc4509bcf483e79548de6bc08bf3c8e504bb3 ]

Currently, ath12k_dp_mon_srng_process uses ath12k_hal_srng_src_get_next_entry
to fetch the next entry from the destination ring. This is incorrect because
ath12k_hal_srng_src_get_next_entry is intended for source rings, not destination
rings. This leads to invalid entry fetches, causing potential data corruption or
crashes due to accessing incorrect memory locations. This happens because the
source ring and destination ring have different handling mechanisms and using
the wrong function results in incorrect pointer arithmetic and ring management.

To fix this issue, replace the call to ath12k_hal_srng_src_get_next_entry with
ath12k_hal_srng_dst_get_next_entry in ath12k_dp_mon_srng_process. This ensures
that the correct function is used for fetching entries from the destination
ring, preventing invalid memory accesses.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Link: https://patch.msgid.link/20241223060132.3506372-7-quic_ppranees@quicinc.com
Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 5a21961cfd465..252d8e8a2080e 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2519,7 +2519,7 @@ int ath12k_dp_mon_rx_process_stats(struct ath12k *ar, int mac_id,
 		dest_idx = 0;
 move_next:
 		ath12k_dp_mon_buf_replenish(ab, buf_ring, 1);
-		ath12k_hal_srng_src_get_next_entry(ab, srng);
+		ath12k_hal_srng_dst_get_next_entry(ab, srng);
 		num_buffs_reaped++;
 	}
 
-- 
2.39.5

