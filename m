Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9062A2853F5
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285286; cv=none; b=dMKbyOFQ2SuAarlK5VcqD7BUjnll6jr/Kx2T9scY9+VWnojXZdD6QYWZeeBKbdETs1Uh+cUjgINBsH4lITFCf1y1q6d+7eGXwBIeiyIDPVC0iFoGh3eRFFIVeg+fkLbVyU5m5TUr0XrZHEpKHb1XPJmOoXqR/NWZ25J7ph7mKqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285286; c=relaxed/simple;
	bh=gsPh10Lo83G0mW4lltW0uPRenCo3upye1tmBE7bC6JA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pPED1Dv7hE4hwMhPox+CQi5KLX9kOCYxYkMw6HOAUnZ3xbKPvGAaI8pi+T1SAWPIOv6DoMxKr4PSYGsU3pBNqNm68Np465Zwm63aaeFKK8acEjda+DPXgNt9n9MNHR0E0yxriImYuv3qUTxmbMAKvNRric9ftJjNGJ19lmh3Zuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTocnAdO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTocnAdO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADB1C4CEEA;
	Thu, 10 Apr 2025 11:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285286;
	bh=gsPh10Lo83G0mW4lltW0uPRenCo3upye1tmBE7bC6JA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uTocnAdOBpZdHRCjpIy9DsGg7NpJQLu63ymhBc829iPlAgqT9PR9MoJD9kdBXJZtX
	 R+y0KDrnvCQca4RurmBVtkrfxNzp3S5YWICZbtYzsvV7BGfEGvzch+2HPfeaP8uBbb
	 eYTnMJ5rzf3XkBr/TgYY87pFsNDj1G0lgGVk+N6ZQydYva92LW7eciwKqhTEld8+/1
	 IvJXXGYWx2GKi1GJ8Oc1DdOfqtyltAPleyq2gE0MG88xF+Ln9dVUgFmRPImYdqWYrV
	 LxLwm+kPj3AXqMXKSPRAtKWtJcoMdkFZ6RUQ39mnIANcEOLm4OcbF0NHcEgT+uC/i7
	 vCAKQS1RF7vig==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:09 +0200
Subject: [PATCH v4 06/14] nvmet-fcloop: add missing
 fcloop_callback_host_done
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-6-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
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

