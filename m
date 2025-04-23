Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A48C71917F9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745414523; cv=none; b=iTRigDBcYfQe2DhnBhJ17jPYiNFC4Pb/09dItVU1JoxBXyhF8E47i6r7Sw3rHYGysSsg2P1HtNLJyPq0gv5yCgQLudC7MO1ansbwObHU3BP0cz64gcgmJt2BsoNXPSlxWJoqairRRSgvbYdTfar+XdvwjhFfcXocLEHtZX+xrbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745414523; c=relaxed/simple;
	bh=F6amLIDQUFRoq7o9H5ZznvD/2tad4/3TkumHpgROHvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E4m4GRbiw4Q/mwDL3wX76Yb66XgNWpaqBjXy5Q5T5AiTkvbZR379X0fJFVxLDfWMvtZvbwFYF81yeVPhAZjbqPcp1igUXbjULdix8z7/EAEP4d8mBJRXAjV2Bh8zr5OLH3DStoVhYUNCVZYEEhyO1luaON37rXBXrZnG49Pc6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jxl+XHLD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jxl+XHLD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2569C4CEE2;
	Wed, 23 Apr 2025 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745414523;
	bh=F6amLIDQUFRoq7o9H5ZznvD/2tad4/3TkumHpgROHvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jxl+XHLDQ66pbJ+g+UMnV96m/+Rvo5fhksSjCXD8FJApxPtlp6WbYxsQbPRU1wrXN
	 AiddRLVMRgDHFuanAV4zqlfcdK0h5A/PeWnD/Jtptbp4UZsopdCrKYaBVn+8GSvt0o
	 X8lY3SwWJY91Mpx3B2TfzBXuL9peGfK+qR78h4KgCrr7k43SrpS6EtA+DIo59aB4F2
	 3vpJP8jry19E91MDHc/NB1/xK90W94tdy4oi3emUIxlP5PiQp8CYMpJId6yswryuYn
	 zJKqKtrwv0chkFSjUELbg2ihfIV64uA2jM5Sk5rBEIohgk/zjcni6yNtIYB2SdoIWH
	 L/mr85eTGYgXw==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 23 Apr 2025 15:21:47 +0200
Subject: [PATCH v5 04/14] nvmet-fcloop: refactor fcloop_delete_local_port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-nvmet-fcloop-v5-4-3d7f968728a5@kernel.org>
References: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
In-Reply-To: <20250423-nvmet-fcloop-v5-0-3d7f968728a5@kernel.org>
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

