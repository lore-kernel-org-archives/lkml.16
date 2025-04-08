Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CFA22DFFA
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126163; cv=none; b=LsZV5aoLvHewJ1keWb2MH9i5eVC8KHLAt50UqLkBvxoCfN5iqY+T8x3AKhTGI/5zbMwkG91j4sFkIubZP+1ql28aIn4cUnBRFwKp0O1idyoMJ+6Hj3gAO/rm/MZwUXWyMcQ0zl1T0ttD2yTvfPH1uFCBq2IMFq+AEBxl+P+GEMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126163; c=relaxed/simple;
	bh=2Kg2F1UvaxPLtadqebSyN12HG3Ln8iAYi38zz3aODQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t5uAdS4JAclRes5JNAWK2zXH2Mvp+rq785JL8r0PB359tHKwpXGfMwoGSN4uSYyhbikxy89u4Z5NFT8FODfjp3MP7Uvl7Sc/WdVg9vx0dJ2ileQ44JOSXicjrUXKKQ3bzKEd48M6qmAw/78m9RqzikITzmdEsSDsN9Bh3gh8H9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SKruh0wx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SKruh0wx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEB5C4CEE5;
	Tue,  8 Apr 2025 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126163;
	bh=2Kg2F1UvaxPLtadqebSyN12HG3Ln8iAYi38zz3aODQY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SKruh0wxaqHJpjAZk7Dj0zSDGUj1xJsvCR1rsKT42HC0WjdPDUQyr7tOHvUmiSKXX
	 +X4l/6IhRPkGmEi/D/gMQbGpg18xFI+9Ucz3mn2spGlwq6nx3n1akvkF4p6Oh5GGxF
	 MruRP74WLvdSIK5+ll+DnE41ru4B1NvCXamF/xeY2lkDkXqaZF3/bPVZSny7IBW/BJ
	 2OUbg9UHh/eicEsNQRWzp4S7OkMi2bwHxGlusvg3c59I9IhAXLuqRrBZCH4LbMsAMe
	 wkvomPG+1fbNdZKwgGGZkS4VBNCibx7C6FkQ8v/jAXap+Y2+dTMYd8zn8XsAz1i8g2
	 opMz1FHuLUJpA==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:06 +0200
Subject: [PATCH 4/8] nvmet-fc: inline nvmet_fc_delete_assoc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-4-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

No need for this tiny helper with only one user, just inline it.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/nvme/target/fc.c b/drivers/nvme/target/fc.c
index 7318b736d41417bd974f58f1ef66bce8640db422..6487c46ebba8d12e573d19fe8c39d526492c506a 100644
--- a/drivers/nvme/target/fc.c
+++ b/drivers/nvme/target/fc.c
@@ -1075,13 +1075,6 @@ nvmet_fc_alloc_hostport(struct nvmet_fc_tgtport *tgtport, void *hosthandle)
 	return newhost;
 }
 
-static void
-nvmet_fc_delete_assoc(struct nvmet_fc_tgt_assoc *assoc)
-{
-	nvmet_fc_delete_target_assoc(assoc);
-	nvmet_fc_tgt_a_put(assoc);
-}
-
 static void
 nvmet_fc_delete_assoc_work(struct work_struct *work)
 {
@@ -1089,7 +1082,8 @@ nvmet_fc_delete_assoc_work(struct work_struct *work)
 		container_of(work, struct nvmet_fc_tgt_assoc, del_work);
 	struct nvmet_fc_tgtport *tgtport = assoc->tgtport;
 
-	nvmet_fc_delete_assoc(assoc);
+	nvmet_fc_delete_target_assoc(assoc);
+	nvmet_fc_tgt_a_put(assoc);
 	nvmet_fc_tgtport_put(tgtport);
 }
 

-- 
2.49.0

