Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3812698AC
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 12:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620594; cv=none; b=VtNs69ZhOl2J87GlB6M5tQI0gD7UnjiBDvBkpB+fKtUYtUVWPaApVX9jl+4hvh11yZHRunN159YcMO3GiyCn3F+G5u7987zy8BLd+DWfshF/8uOuh12OIiR/Y9EAJQzY23vkGiIt/AKmkhsI78lywihE37F10DBgkgIKGAB+or0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620594; c=relaxed/simple;
	bh=h35lcOoeDI+WPo72mPb2StqZOw//yaagpxzR2QHffls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BTrnPsFOb3xVKf7vIA3dWDE9OvgS5EYDdNyIaqtESHG0LMe2L0h/hHne8fjN5+WtqGFv8EPlxcvVJjzqmDb+wvDcaB63Z5RPEh+dYzz42+2gA4N8FOjdhYxi5L9LiJ7YoXk629x19iapWPGH72D6Tk55LxdGKyXkB1FnQNZ2wws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWTmu8ZQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWTmu8ZQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3A0C4CEF3;
	Wed,  7 May 2025 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746620594;
	bh=h35lcOoeDI+WPo72mPb2StqZOw//yaagpxzR2QHffls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XWTmu8ZQ6OMGcQwTdqwRBFSveziCpKdbNI3BbU2xfY4O62Uob7TmG/ak7rbzK0DFd
	 VeQj5G3mEJIzRe2juLQfdNf15Rfm4xcRvU/pnfftrQGcHtwRJ3KMc16j503ojaFsEV
	 iu0FM1revTzJAhEEME3ImpLCGLtSYdY4o2n9I7oKq8uS8TBcJNzXaJPujQ3j0qvX5g
	 SQJyyrD1ASZqQjHgseg/A1C+Gx0KyYMXItD2LMea0RDNyzXhD4L3DI97nPDdxqiy2y
	 6rxMxialmuRLCT1cwrlDVkfaMTXbu4jxr9QbHOkGIFiSBOlEJv4EZZIod+g9GW8xnj
	 ttxspVBqqshfA==
From: Daniel Wagner <wagi@kernel.org>
Date: Wed, 07 May 2025 14:23:00 +0200
Subject: [PATCH v6 04/14] nvmet-fcloop: refactor fcloop_delete_local_port
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nvmet-fcloop-v6-4-ca02e16fb018@kernel.org>
References: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
In-Reply-To: <20250507-nvmet-fcloop-v6-0-ca02e16fb018@kernel.org>
To: James Smart <james.smart@broadcom.com>, Christoph Hellwig <hch@lst.de>, 
 Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Hannes Reinecke <hare@suse.de>, Keith Busch <kbusch@kernel.org>, 
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Daniel Wagner <wagi@kernel.org>
X-Mailer: b4 0.14.2

Use the newly introduced fcloop_lport_lookup instead
of the open coded version.

Reviewed-by: Hannes Reinecke <hare@suse.de>
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

