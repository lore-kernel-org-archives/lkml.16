Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7D01CCEE2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126175; cv=none; b=iYdEIKwv6gL56pNi4UOLz3hk9U3fVg23/Q7G93NMbZ8m7AvFU8ns2vIgTKgIEniFGwGn555Bbj1n7K5wC0lhSe9YOE9RhVM0yHAaAK65to86GMw0bRLjh0RVpGjvD8nvmYoEfdEseCmhzkChahkA2p2j2NL436PMc/jkPIEZ6LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126175; c=relaxed/simple;
	bh=lL5xvBPnp71ji+5WknENKAr4x5TL8jAfZndzTEyuBIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lkGtg4sNWzAwmRB9vi2MlENvOEDr1wuqCxUnEPj3vmIZUW84rTxjPGJSkbagiJTzNkb0D33cvA4MRmovg/eJIT28u2W6bpY7ERPnAfC4eTDbghpCkjoeFBY/7hKfAk5tg88UQr5Ii1P6RNzEC9QoY3rDHYlupy5QabfrvYyQdMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SiSabXla; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SiSabXla"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C33C4CEE9;
	Tue,  8 Apr 2025 15:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126175;
	bh=lL5xvBPnp71ji+5WknENKAr4x5TL8jAfZndzTEyuBIA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SiSabXlaOkIywKuDWoKj4WIzb6MSLyktUbxB/lS7Au3ht3fdiWfrHbA+cvCmfbB5G
	 /a96f6yJtUqz6um2491bCzn7+J+yRB85v+0LcUxZFDMo8V0+QUdY1kZcmyQ1Q+4zlI
	 I0e+51xQOGj7MVUigoBz7UoocI+GBnPcwujzI2b7aZq7Wv4oLkoYpF3whjvpaaC/YZ
	 dNC7k2REF408lAaunuMJs6o30H/upQQKOJ70cvKujA4SirFw/qrb/1f7Flq61rVyo5
	 1QpXLXPS3EDT6epMdoZQYHi0Hgo0gsrE+rhtqOM2IQ94RX2lhLK/Q/TCiKpQ/EUwfD
	 ywT6tvNOPF44g==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:10 +0200
Subject: [PATCH 8/8] nvmet-fc: put ref when assoc->del_work is already
 scheduled
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-8-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

Do not leak the tgtport reference when the work is already scheduled.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 61e9eea3bee430bfdef541bfe0d1f2538a49d9eb..7b50130f10f6578e6e49fe8ea661de34dfbb3683 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1073,7 +1073,8 @@ static void
 nvmet_fc_schedule_delete_assoc(struct nvmet_fc_tgt_assoc *assoc)
 {
 	nvmet_fc_tgtport_get(assoc->tgtport);
-	queue_work(nvmet_wq, &assoc->del_work);
+	if (!queue_work(nvmet_wq, &assoc->del_work))
+		nvmet_fc_tgtport_put(assoc->tgtport);
 }
 
 static bool

-- 
2.49.0

