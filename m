Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3F17E473
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414541; cv=none; b=PUN6EIWUuczJagJELpADxqxOabwrSMiGm0gWUfkOPd8AGCQS064iC2KsiTgQqANk62nDF8sqd2NK8YYfyFig5npex27CXxRfRXPRRt5AUS2gsXfxxK5iXNfI859SPDixIyD+Ezth9D0shybrht/WEMK88XWilyZ2TDcfBkbxkps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414541; c=relaxed/simple;
	bh=TzcGZfdwmdfAFPVttrRv4/p72KsoezPGz0D2QH9DrFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=otIMDp8IyiFuTYbnjSsWFm3t/YYF9uTOkLM11YXApRfduGZ2OYdlsHWKrM9seojoPtY24FBzMHz7/LAhTLkopFFtLPE650Xf3XgqSmwHoENcONn5wTWS8/w3GszDr7rn+RfO6PKWuNzQ3of9NEpPx7eNzNY/x0iaTtz9/ifo+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NkzzeHvS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkzzeHvS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6528C4CEEB;
	Wed, 23 Apr 2025 13:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414540;
	bh=TzcGZfdwmdfAFPVttrRv4/p72KsoezPGz0D2QH9DrFQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NkzzeHvSffX8EV4RRVX60fGVqrkaMNDBoeokXbDeo3hht+Q7VS9796luhryr6x0qL
	 o1PZj6iEghGK0uvRx8xPcE92K5o4rwyTQSFgC+nw3kWoUKpcrm+/73AxpjxTiVl/3e
	 U/DcecGxhiYCtZNlmZHGqk8ZeOqGN2ngmbmNBYQqbtwjenoBBAZchKRK/A3KQOHyZp
	 NpzWwBoMhnXMytqKkyxb7eAMCooNE3QN7Qdxrn64zzhyz4lucl0ebRISKamIMGslhd
	 X4d9HKvBFE848Up8STUI8+eUrCR/AYsbfhik5A0lthiv5I+f3cusyOyc70V8lDjQfS
	 Ke46iCbRa1LRA==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 23 Apr 2025 15:21:53 +0200
Subject: [PATCH v5 10/14] nvmet-fcloop: don't wait for lport cleanup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-nvmet-fcloop-v5-10-3d7f968728a5@kernel.org>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
In-Reply-To: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

The lifetime of the fcloop_lsreq is not tight to the lifetime of the
host or target port, thus there is no need anymore to synchronize the
cleanup path anymore.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index 47ce51183a66b4b37fc850cced2ddf70be2cdb42..ca11230bffedb0f2313a99e24e54e892daf0d644 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -207,7 +207,6 @@ static LIST_HEAD(fcloop_nports);
 struct fcloop_lport {
 	struct nvme_fc_local_port *localport;
 	struct list_head lport_list;
-	struct completion unreg_done;
 	refcount_t ref;
 };
 
@@ -1083,9 +1082,6 @@ fcloop_localport_delete(struct nvme_fc_local_port *localport)
 	struct fcloop_lport_priv *lport_priv = localport->private;
 	struct fcloop_lport *lport = lport_priv->lport;
 
-	/* release any threads waiting for the unreg to complete */
-	complete(&lport->unreg_done);
-
 	fcloop_lport_put(lport);
 }
 
@@ -1238,18 +1234,9 @@ fcloop_create_local_port(struct device *dev, struct device_attribute *attr,
 }
 
 static int
-__wait_localport_unreg(struct fcloop_lport *lport)
+__localport_unreg(struct fcloop_lport *lport)
 {
-	int ret;
-
-	init_completion(&lport->unreg_done);
-
-	ret = nvme_fc_unregister_localport(lport->localport);
-
-	if (!ret)
-		wait_for_completion(&lport->unreg_done);
-
-	return ret;
+	return nvme_fc_unregister_localport(lport->localport);
 }
 
 static struct fcloop_nport *
@@ -1332,7 +1319,7 @@ fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 	if (!lport)
 		return -ENOENT;
 
-	ret = __wait_localport_unreg(lport);
+	ret = __localport_unreg(lport);
 	fcloop_lport_put(lport);
 
 	return ret ? ret : count;
@@ -1776,7 +1763,7 @@ static void __exit fcloop_exit(void)
 
 		spin_unlock_irqrestore(&fcloop_lock, flags);
 
-		ret = __wait_localport_unreg(lport);
+		ret = __localport_unreg(lport);
 		if (ret)
 			pr_warn("%s: Failed deleting local port\n", __func__);
 

-- 
2.49.0

