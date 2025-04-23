Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567B217A2EF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414527; cv=none; b=cXVNAM1CjsggEWC6uxH6l7WndBtmtsgDq3CpI2UyZI6TUgFsrwzc90Fa4FnxgPWbLRvd2dJDnpLkwt11j+fmgPaA+mBmVtjMT1lTZKIja8Rvru75//Y5FaLLC8FgyEgfjdHCGjNYK308mNcO+X7KqUzkK7sohOFDrmkTH3RcLMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414527; c=relaxed/simple;
	bh=EWB/sYzoB8CsG9hgCZR+RFlRMAyDx5p/cXloDsy+UNE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JEHTFueO6O7G4PcRY/I22w19TlysHfUrVeJ5fb23TJ7FzRkLidvMHsnNRZWlojDW5DZWo0VseFDKPxWR7ddrSyT4N0odDyUy92ZhIEbtyk+zZ8jsS1YF0LODlMoqqr2UqmHHc+IsBbuNOjEP8Mg/Hn7txeVUP2LmZkpMjq3RqSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CNmoq/3K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CNmoq/3K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751D5C4CEEB;
	Wed, 23 Apr 2025 13:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414525;
	bh=EWB/sYzoB8CsG9hgCZR+RFlRMAyDx5p/cXloDsy+UNE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CNmoq/3KVehOvmZ18VWVuTRv1tXJahNs8dsSUKRF/BOdxPT9wWUVmZWhpkld1QLde
	 0B/qwpZEbYbxjoFGcHm61oWS4XU4AwsChS6nfDMDiKiuhwZlwZdbYnRrFiJOkzgiiy
	 D3wKVV9+jR/IAJQMZhw9r8GtoabmqWgjtaFh9lM/86C+u5GrEMsLLT246t8CzXAovu
	 G3rcNghzfALArZDKFESy+PU80wAlZ9pMoaNNG8lUob2PPjHfPeAhC3RzSDf1TelfiL
	 2J+bgtjdFjhx4NAaJrGIZ6xrRIN50Xl2436mQicHvnJ+NN+4kdRqzHVi8z7uymd0ZP
	 yqMI1Znr9ozBQ==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 23 Apr 2025 15:21:48 +0200
Subject: [PATCH v5 05/14] nvmet-fcloop: update refs on tfcp_req
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-nvmet-fcloop-v5-5-3d7f968728a5@kernel.org>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
In-Reply-To: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
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

