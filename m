Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B12148827
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414519; cv=none; b=paap9pC2yG4J4rcgJV4zdolHABHXXesPpg8R2Nu2UluSTt/f123oJt+tip/hr3T/bAS8PU/SPfPRrfWJlGdhQ+wX75LZeCSFavaLIsxlI/DlDzA4D+/DXYMpJGEC0fyMqRAIFtnLMmTHUSvucygKrIpnAMhFe2P9sTopPhEt6RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414519; c=relaxed/simple;
	bh=Tey/jPpQIblgm+n0ERiQKMTVIjHrNonHGj1c23bE1TI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KK8c7GR/hOmCLFyAVEIuDFr21MCVVLSZb8T1+VXsefMn2GqNgDDF1JGtitKeFvMU66T5OR+hqR8iO2vEtq2sXJCXbCISd0qcbKnbDbxPPD5JdzY0Dkq1qOPVayCLAIHLusMTo2Hsr/M2v7Sga4CQ1xCFnYkvIF4gvkKJi9pjeNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uLpuNQbN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uLpuNQbN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D07AC4CEE2;
	Wed, 23 Apr 2025 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414517;
	bh=Tey/jPpQIblgm+n0ERiQKMTVIjHrNonHGj1c23bE1TI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uLpuNQbNhpNFPrDqVYIJf7ZITW/2plxwZ71K2XSin348fPNDJYAYNZoZ572kRrlrG
	 u4O9JqHO0Wie633RCDKS5eYB7B+EejdcowQpOTIb51KDqa8EbuhZxrrlGp1HdLJe1z
	 MtbrOGIMiZXiMRiIi23pSCkC1oQIcCVE1PLHXf8MIealK40LAkdiCzESl37e95tWg4
	 Fy/T/l8ePCsKy0Mn3ToKiaCH4040wOrZwtmO7r7S7cfpIelK4H68aCZzgAnmkQ32SX
	 EzLwzJtIB4Z27FN1gL7+RE+KCazacq2ACUca+Iv3Bbl2hhfI1nHZSfVjopq5cjmwEZ
	 TSw1xUE1mVKwA==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 23 Apr 2025 15:21:45 +0200
Subject: [PATCH v5 02/14] nvmet-fcloop: remove nport from list on last user
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-nvmet-fcloop-v5-2-3d7f968728a5@kernel.org>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
In-Reply-To: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The nport object has an association with the rport and lport object,
that means we can only remove an nport object from the global nport_list
after the last user of an rport or lport is gone.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 2b23e43ef4403fa4d70c66263f7750165d2ddc72..2cce7649af276528360395b6d58f03183c11da20 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -1019,9 +1019,15 @@ fcloop_lport_get(struct fcloop_lport *lport)
 static void
 fcloop_nport_put(struct fcloop_nport *nport)
 {
+	unsigned long flags;
+
 	if (!refcount_dec_and_test(&nport->ref))
 		return;
 
+	spin_lock_irqsave(&fcloop_lock, flags);
+	list_del(&nport->nport_list);
+	spin_unlock_irqrestore(&fcloop_lock, flags);
+
 	kfree(nport);
 }
 
@@ -1414,8 +1420,6 @@ __unlink_remote_port(struct fcloop_nport *nport)
 		nport->tport->remoteport = NULL;
 	nport->rport = NULL;
 
-	list_del(&nport->nport_list);
-
 	return rport;
 }
 

-- 
2.49.0

