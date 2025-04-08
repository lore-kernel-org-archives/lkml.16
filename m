Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8A22D4E5
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126158; cv=none; b=dJEd+KKUpkSi+NhwCGSORtayoTo/9XcKpeM2r2bILDMBCvTzcyPDLa93CFeg3NkV61HT/MR1SAD32AZMH2VFbhYLuQXGdVN5yR5EoVDlw193KjkzpAauED5GhRIWCW9ZeV4g1B5ODLJiwO9OqrfxnrJrzmma5OzUL0DfgiA1Ijg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126158; c=relaxed/simple;
	bh=A1SZibPm0tk02AGXjML854OFU77oW9j7YzgfK99CFZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hXBKW3MooaD04fSLMn+TIEb+vOuVikRQuw3Vkcw1dPlkrc+oqIiI3uVsuKEWJUWnKJryWKYY0PGyA21h2Ad71gnBt0qIS0mFh7vDy9MM6LayOlOFOBEooVSLI3UyVgzFo4YOfQhaLc40eXYZ80fcrxjA4eUCs3VvDtYDNBPSLu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fBPrAPv1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fBPrAPv1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9955CC4CEEC;
	Tue,  8 Apr 2025 15:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126158;
	bh=A1SZibPm0tk02AGXjML854OFU77oW9j7YzgfK99CFZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fBPrAPv17s6sUpEHo+jNZC7UbZJj7R00IwqIfKt8e10Hqg7oVahoL7rO4wvxoB0pP
	 ZKmb+SOrzYzJZdBHW4SYRq6qoSLFAfpAQ7X84rcKcMRXuUYgezMo7RqQv8vzX3fP7C
	 IQSgITc6mubWS944yHzQn/T5sdC3zoBVsLcrHHyJyLVnQwRKZy3V1/D16hrcWjl6L9
	 EEy6PPtE0bodQ6F6m7nOtCqyeaS3hnBH/TCh5aXHqb1rKlwcKJ66yDoXnJ7OFaqMKr
	 Jr42vWo1jVWHuJ63LawMo83/xMqaOqt0vs+1ZgsagDOgekNmh1e+AEmTqC/v4xzbdN
	 IDXk0vYdcC4Tg==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:04 +0200
Subject: [PATCH 2/8] nvmet-fcloop: replace kref with refcount
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-2-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The kref wrapper is not really adding any value ontop of refcount. Thus
replace the kref API with the refcount API.

Reviewed-by: Hannes Reinecke <hare@suse.de>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 36 ++++++++++++------------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index da195d61a9664cba21880a4b99ba0ee94a58f81a..67e24c7d59306fec4aa88cacc536c876c465af35 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -239,7 +239,7 @@ struct fcloop_nport {
 	struct fcloop_tport *tport;
 	struct fcloop_lport *lport;
 	struct list_head nport_list;
-	struct kref ref;
+	refcount_t ref;
 	u64 node_name;
 	u64 port_name;
 	u32 port_role;
@@ -274,7 +274,7 @@ struct fcloop_fcpreq {
 	u32				inistate;
 	bool				active;
 	bool				aborted;
-	struct kref			ref;
+	refcount_t			ref;
 	struct work_struct		fcp_rcv_work;
 	struct work_struct		abort_rcv_work;
 	struct work_struct		tio_done_work;
@@ -534,24 +534,18 @@ fcloop_tgt_discovery_evt(struct nvmet_fc_target_port *tgtport)
 }
 
 static void
-fcloop_tfcp_req_free(struct kref *ref)
+fcloop_tfcp_req_put(struct fcloop_fcpreq *tfcp_req)
 {
-	struct fcloop_fcpreq *tfcp_req =
-		container_of(ref, struct fcloop_fcpreq, ref);
+	if (!refcount_dec_and_test(&tfcp_req->ref))
+		return;
 
 	kfree(tfcp_req);
 }
 
-static void
-fcloop_tfcp_req_put(struct fcloop_fcpreq *tfcp_req)
-{
-	kref_put(&tfcp_req->ref, fcloop_tfcp_req_free);
-}
-
 static int
 fcloop_tfcp_req_get(struct fcloop_fcpreq *tfcp_req)
 {
-	return kref_get_unless_zero(&tfcp_req->ref);
+	return refcount_inc_not_zero(&tfcp_req->ref);
 }
 
 static void
@@ -748,7 +742,7 @@ fcloop_fcp_req(struct nvme_fc_local_port *localport,
 	INIT_WORK(&tfcp_req->fcp_rcv_work, fcloop_fcp_recv_work);
 	INIT_WORK(&tfcp_req->abort_rcv_work, fcloop_fcp_abort_recv_work);
 	INIT_WORK(&tfcp_req->tio_done_work, fcloop_tgt_fcprqst_done_work);
-	kref_init(&tfcp_req->ref);
+	refcount_set(&tfcp_req->ref, 1);
 
 	queue_work(nvmet_wq, &tfcp_req->fcp_rcv_work);
 
@@ -1001,24 +995,18 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
 }
 
 static void
-fcloop_nport_free(struct kref *ref)
+fcloop_nport_put(struct fcloop_nport *nport)
 {
-	struct fcloop_nport *nport =
-		container_of(ref, struct fcloop_nport, ref);
+	if (!refcount_dec_and_test(&nport->ref))
+		return;
 
 	kfree(nport);
 }
 
-static void
-fcloop_nport_put(struct fcloop_nport *nport)
-{
-	kref_put(&nport->ref, fcloop_nport_free);
-}
-
 static int
 fcloop_nport_get(struct fcloop_nport *nport)
 {
-	return kref_get_unless_zero(&nport->ref);
+	return refcount_inc_not_zero(&nport->ref);
 }
 
 static void
@@ -1249,7 +1237,7 @@ fcloop_alloc_nport(const char *buf, size_t count, bool remoteport)
 		newnport->port_role = opts->roles;
 	if (opts->mask & NVMF_OPT_FCADDR)
 		newnport->port_id = opts->fcaddr;
-	kref_init(&newnport->ref);
+	refcount_set(&newnport->ref, 1);
 
 	spin_lock_irqsave(&fcloop_lock, flags);
 

-- 
2.49.0

