Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE589225419
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 15:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126156; cv=none; b=uVBpXeAjQIXNjRLT0fBqJzF5RgP/4eA2ITuIRJRMD/TeqBx1zrJowLg+0k4xUFTtf9TwRF3pKYkMtyYB2ewOdP9QV7xMc7N8AH1c1LdTJDsxAqWVUCRclfM6q5ae9xzMqS/ulN3lUrj6q9U0Didd/xvOrqGSDWP+R1m/MTUeWCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126156; c=relaxed/simple;
	bh=ceT3G4N2zSseN3NqLnEA5gWCVWS4Ndi292BWL+Gup0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b6MBKy7cY24g6FnaUbIVKBfwSXyiTDaR7ZuJgGnnNtZgBAUjX/spmsvPt0/paRdAl8UF5AkMVraTmiIMEqfAXGQ4vCCFFbYta6xS8o2BA7GqeyqvdD0gX22lmJ8OwX1kEWbE41rxpCl6q2HqW0exPTQm3A9nxpinQsDwyvZ2Bog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=czlxT9kR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="czlxT9kR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D702BC4CEE5;
	Tue,  8 Apr 2025 15:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744126155;
	bh=ceT3G4N2zSseN3NqLnEA5gWCVWS4Ndi292BWL+Gup0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=czlxT9kRhBLmtKGT/QixXHY0itWmeybUxG5ZqaqSBmYjH1weGRUNa84JgtPtlpm33
	 DNWnlbt6gUs8BK/lwxoRmRWJ/U5KiYFXJnXl7O8k5T4qCZxDj/T2Lmyv8Z8ecpwBdR
	 Ozl3Xm1Bc9WXcn3apefwESxbxTO50ud+v9RfLnOh1PlB3FF5yeIvWf4q8GC3wLo1We
	 z2bOeQwv6gDZoORGAjL053llN3+iLmbbdDwvDEyJT5icbRRJcWwi/OamuMPLghjQGW
	 u17RzhBw8YXLQ/vregQtW9wLrYVs4O1Nfflhb19DvOTfSoa+CAP6cvYcPxE3b8nTra
	 jFpVP32wP6UFw==
From: Daniel Wagner <wagi@kernel.org>
Date: Tue, 08 Apr 2025 17:29:03 +0200
Subject: [PATCH 1/8] nvmet-fcloop: swap list_add_tail arguments
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-nvmet-fcloop-part-one-v1-1-382ec97ab7eb@kernel.org>
References: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
In-Reply-To: <20250408-nvmet-fcloop-part-one-v1-0-382ec97ab7eb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>, 
 Jens Axboe <axboe@kernel.dk>, Hannes Reinecke <hare@suse.de>
Cc: James Smart <jsmart2021@gmail.com>, linux-nvme@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The newly element to be added to the list is the first argument of
list_add_tail. This fix is missing dcfad4ab4d67 ("nvmet-fcloop: swap
the list_add_tail arguments").

Fixes: 437c0b824dbd ("nvme-fcloop: add target to host LS request support")
Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index e1abb27927ff74c9c55ddefd9581aab18bf3b00f..da195d61a9664cba21880a4b99ba0ee94a58f81a 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -478,7 +478,7 @@ fcloop_t2h_xmt_ls_rsp(struct nvme_fc_local_port *localport,
 	if (targetport) {
 		tport = targetport->private;
 		spin_lock(&tport->lock);
-		list_add_tail(&tport->ls_list, &tls_req->ls_list);
+		list_add_tail(&tls_req->ls_list, &tport->ls_list);
 		spin_unlock(&tport->lock);
 		queue_work(nvmet_wq, &tport->ls_work);
 	}

-- 
2.49.0

