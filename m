Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9063A284B47
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 11:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285281; cv=none; b=RUxXuvLspv+Zcu18s3nxWjDEXJPUNBzhM8+y+somjHix3agEFEH7ga+xBZaIoewvjG/ANk6nvvtWsj80GfqLkayy0bImB91RMrH3IGWHfkT6+FN1GpApuWUKSY2eQkTqX2fpEjxD9Q59Zq0Z8ZPDw7IWHAHU1/QSYtLetWlj8bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285281; c=relaxed/simple;
	bh=F6amLIDQUFRoq7o9H5ZznvD/2tad4/3TkumHpgROHvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CaboLLYFbG6ITdzAnGwAnGQDTSGbvEsZTO4W1/274GDc1bu2gGr/fpnj+tQwxIWeti0zGsViSafUiNMwl2QbqJKwZhHeo0hc1jwKRTzlrERjwC1cgpWxv13o14Lic1EFt5L5fEq9yG0XDvCXi+WJTc19q4PxVzcD9uio5ICU1ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3GnRhVH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3GnRhVH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE7B0C4CEEE;
	Thu, 10 Apr 2025 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744285281;
	bh=F6amLIDQUFRoq7o9H5ZznvD/2tad4/3TkumHpgROHvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=b3GnRhVHYh8qPegXoQx+EUNzTsbNdojx6k+vSBid2yX7Ct82EOddOc3Hv/NYbc1Ee
	 S/7pzWJieRWVzaUbW52uQ5Z/cX3JojW070pPccBLe6PVYauxmCIEjHdgb00eZF0CtN
	 t9resfh9eVAfj8FIlRbGyvXHPqBQ4R6KdyzjIxKD4AXQB9ht1WooYRvcMwSF1CKyYU
	 t+Ha0/+J5IcDYvuii8mLSaT0TW7069aJN63WwqzjFHfR35TyUGoVoHruRnXFlpstix
	 aEJXtCVR7JeE0f59PdBZ8Vtabe0rnw3Sk6PM7VB9ueILyIWzrgfPULCrF1xygyc0hq
	 25WnzfEPJDB3w==
From: Daniel Wagner <wagi@kernel.org>
Date: Thu, 10 Apr 2025 13:41:07 +0200
Subject: [PATCH v4 04/14] nvmet-fcloop: refactor fcloop_delete_local_port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-nvmet-fcloop-v4-4-7e5c42b7b2cb@kernel.org>
References: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
In-Reply-To: <20250410-nvmet-fcloop-v4-0-7e5c42b7b2cb@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

Use the newly introduced fcloop_lport_lookup instead
of the open coded version.

Signed-off-by: Daniel Wagner <wagi@kernel.org>
---
 drivers/nvme/target/fcloop.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/nvme/target/fcloop.c b/drivers/nvme/target/fcloop.c
index a8134127ad8087190d674251a88545da3f8800d7..1a8ae33c1699be3b7a2a7170dff77e324c127ebb 100644
--- a/drivers/nvme/target/fcloop.c
+++ b/drivers/nvme/target/fcloop.c
@@ -1256,32 +1256,32 @@ __fcloop_lport_lookup(u64 node_name, u64 port_name)
 	return NULL;
 }
 
+static struct fcloop_lport *
+fcloop_lport_lookup(u64 node_name, u64 port_name)
+{
+	struct fcloop_lport *lport;
+	unsigned long flags;
+
+	spin_lock_irqsave(&fcloop_lock, flags);
+	lport = __fcloop_lport_lookup(node_name, port_name);
+	spin_unlock_irqrestore(&fcloop_lock, flags);
+
+	return lport;
+}
+
 static ssize_t
 fcloop_delete_local_port(struct device *dev, struct device_attribute *attr,
 		const char *buf, size_t count)
 {
-	struct fcloop_lport *tlport, *lport = NULL;
+	struct fcloop_lport *lport;
 	u64 nodename, portname;
-	unsigned long flags;
 	int ret;
 
 	ret = fcloop_parse_nm_options(dev, &nodename, &portname, buf);
 	if (ret)
 		return ret;
 
-	spin_lock_irqsave(&fcloop_lock, flags);
-
-	list_for_each_entry(tlport, &fcloop_lports, lport_list) {
-		if (tlport->localport->node_name == nodename &&
-		    tlport->localport->port_name == portname) {
-			if (!fcloop_lport_get(tlport))
-				break;
-			lport = tlport;
-			break;
-		}
-	}
-	spin_unlock_irqrestore(&fcloop_lock, flags);
-
+	lport = fcloop_lport_lookup(nodename, portname);
 	if (!lport)
 		return -ENOENT;
 

-- 
2.49.0

