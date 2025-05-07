Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B8026C3A4
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620600; cv=none; b=JmBTQrOXAEPZmOps+aEV7MaoqZht7yc4R1KTOm1h0mjnPLvxwn9mKuZJV+e2FRdW3MQ3TXXyhgcOKkH4AEr4akjI3ULmdbABPbbCZnBjpd4siUhXoW38ar2ghmKQIsKhxPmR2R/5WVNOkIo3az0Bk4N4G0ZQ61DAhG/rVwQ2J3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620600; c=relaxed/simple;
	bh=gsPh10Lo83G0mW4lltW0uPRenCo3upye1tmBE7bC6JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nnzxp4El6Ayb2w3eHE7KxV3i3JShGH2uZP3wb7CBe2RHMtDVNHdkyk33Msj8/EFDaCSn2A0HMzb2gb/OfWNR8DcKmbay/W3y/5FPo+fKuru0oAa+Wqb+sLwl2WWMfvZYEH0RKejkuo2hFUXffD93I+b6reBXbIVZLX6lBrBDXlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cg6shGCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cg6shGCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC96C4CEF4;
	Wed,  7 May 2025 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620599;
	bh=gsPh10Lo83G0mW4lltW0uPRenCo3upye1tmBE7bC6JA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cg6shGChOnEbATiWv1dIkMBs8t3m6LV4GH/AFLINNjv6GMxS/cAyhr3JiCmcAXSzk
	 unYRSsSx3JMu/Q6l//+aO+gsCUayL0HhnQC7nReODX2pCN6r7uUPWGlzDNb60LlfTh
	 tSObZX3i6GUOJLgqPeTjjsLrkWZfPrkdXq+fCfiqI0iGAliYebeCS7OJ8ukmPeVGF7
	 ZtmVGr72vHwIxPtUABflffter1X/wKmyBriAi/4GUJYZsUtKt4halFTE7AHuhBlghl
	 UYkc2pJ1KlcC3Kl8nvHslusFlZ84biYC5eS9YGHHDL7c+itRkMhWkJcavpOf6MKaLT
	 rOQdu420cFj+A==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:23:02 +0200
Subject: [PATCH v6 06/14] nvmet-fcloop: add missing
 fcloop_callback_host_done
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-6-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

Add the missing fcloop_call_host_done calls so that the caller
frees resources when something goes wrong.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index b54467b285181d6909c6592eb166cf4fe6fbe54c..0c0117e03adc81c643e90a7e7832ff087a4c2fd7 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -966,9 +966,10 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
 	}
 	spin_unlock(&inireq->inilock);
 
-	if (!tfcp_req)
+	if (!tfcp_req) {
 		/* abort has already been called */
-		return;
+		goto out_host_done;
+	}
 
 	/* break initiator/target relationship for io */
 	spin_lock_irqsave(&tfcp_req->reqlock, flags);
@@ -983,7 +984,7 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
 	default:
 		spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
 		WARN_ON(1);
-		return;
+		goto out_host_done;
 	}
 	spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
 
@@ -997,6 +998,11 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
 		 */
 		fcloop_tfcp_req_put(tfcp_req);
 	}
+
+	return;
+
+out_host_done:
+	fcloop_call_host_done(fcpreq, tfcp_req, -ECANCELED);
 }
 
 static void

-- 
2.49.0

