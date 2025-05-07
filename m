Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B9D25F7AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620598; cv=none; b=KcgE3MmSxI7u4vXwM97L8rHxIRlZA0zoXSjb1hZo5ac7YdOiY3WJSvlfraOSxNSNaJYyNiEsrinzqhzGiAShQ90LAEfYOEEnsxiMw/LkMfUVUEmSOuJp4p2BUF5rgRU7PsV+pfpi+Uyv+h0pfWeqPr5MqbhoZdEgGxFUlSQVqNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620598; c=relaxed/simple;
	bh=EWB/sYzoB8CsG9hgCZR+RFlRMAyDx5p/cXloDsy+UNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EOA9IM5JERH6Qq3KbsR/HUAarWU1hmjOJhGdjXRAae2YXMDU+1gb3cp31r+lpVTih/A9wjORY57zQiCPz4cZ+fIsytHx1WLdmA36Cg7lY+tU0q60TYeQ25Tp/lBd/+aK4BdJPh+3CnfTChRFVg6B3FDbcC9W1WhSNEsGlnjdNCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4pf1TPG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4pf1TPG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F838C4CEEE;
	Wed,  7 May 2025 12:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620596;
	bh=EWB/sYzoB8CsG9hgCZR+RFlRMAyDx5p/cXloDsy+UNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E4pf1TPGVmBdUIky47hVFkGl8bu7ltq4xtdCI8G/lqa9Ha1+WbUT4u28zHHZtm9Er
	 7f82C0jD5WlOu6VNr+NGvd3RWKTr+yjMRrwlsFgbfkyvRovPtsg7O/sc4hjFdX6r4D
	 C7+W+TeLZ13/0OEN06QAWDPw/cN4Ml/J08Xs9bvJg9mk7/A77t51GuFPodV13Xq6id
	 f2uUSjnJTMYlqo+fWm7DqZK+kLOnPq1R7jeNzD7GVmXKAl0JH9+RgPEbEUC81061RZ
	 1zBgl5xC8308xy/bWvvVQGLbuYeU+tn9UxVWeiY8zCdn68gGDhARGxrrk+ADRPVib3
	 Yu5iPvJHAJAxQ==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:23:01 +0200
Subject: [PATCH v6 05/14] nvmet-fcloop: update refs on tfcp_req
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-5-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

Track the lifetime of the in-flight tfcp_req to ensure
the object is not freed too early.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Hannes Reinecke <hare@suse.de>
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 1a8ae33c1699be3b7a2a7170dff77e324c127ebb..b54467b285181d6909c6592eb166cf4fe6fbe54c 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -566,7 +566,8 @@ fcloop_call_host_done(struct nvmefc_fcp_req *fcpreq,
 	}
 
 	/* release original io reference on tgt struct */
-	fcloop_tfcp_req_put(tfcp_req);
+	if (tfcp_req)
+		fcloop_tfcp_req_put(tfcp_req);
 }
 
 static bool drop_fabric_opcode;
@@ -671,6 +672,7 @@ fcloop_fcp_abort_recv_work(struct work_struct *work)
 		break;
 	default:
 		spin_unlock_irqrestore(&tfcp_req->reqlock, flags);
+		fcloop_tfcp_req_put(tfcp_req);
 		WARN_ON(1);
 		return;
 	}
@@ -958,8 +960,10 @@ fcloop_fcp_abort(struct nvme_fc_local_port *localport,
 
 	spin_lock(&inireq->inilock);
 	tfcp_req = inireq->tfcp_req;
-	if (tfcp_req)
-		fcloop_tfcp_req_get(tfcp_req);
+	if (tfcp_req) {
+		if (!fcloop_tfcp_req_get(tfcp_req))
+			tfcp_req = NULL;
+	}
 	spin_unlock(&inireq->inilock);
 
 	if (!tfcp_req)

-- 
2.49.0

