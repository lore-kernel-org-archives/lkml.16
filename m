Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462FF1A9B24
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 17:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744565526; cv=none; b=FLgEvlMsqMlC57qnslUsNZjt4cRc/BAUgbCbozdtMFNogGSoG8zBxTLUt3/eq+tkn5eDiH+0h63SNJkdMIPSFXrAWj9FWe/D30ez8OXRcqITqD78Y/S/37vZLX4RoxG9MBZEzjrL8ThLDt+C0kofDJ1wA6Fdj/oyJGTPpt5YiUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744565526; c=relaxed/simple;
	bh=WFweUFzPJxHQEalKoThE+EdeNESgFyFyh99S/DZ4HG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WdnslvujjM38e1wFP+wIrLLvBS4ntqvJTpRu8L7Q6DcFVrbBTozhxCKUJf0SI3Ci3LBz0EtawtJmQ+3W47SljXwCbGRNa1p7ZveZP+1vn01wFpsGWtDU/WoEaZVHEpAjWqtrnaLjKp1X1Hamv/+7mDYsIFoWj9XFJsGwkxCtmTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QZGbANdE; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QZGbANdE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744565519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xMkIid6gHyNzydzTpQIq/sI+CyiABJLPBLSUcxMe7Wc=;
	b=QZGbANdEQ25WsCx7Zl8N4+SXimLvNM4zFfBtEzGswd51FVcsa19WNsjBevyysQsa6XQA0s
	3RuDghrrqjkqFFxAdmnfAgn+LvdcPDYVtnxNadh+Aba/MGOkWB6hP9gYEaVdDCB7/Q4qGr
	lr65PstiSUOSL6yqApPYaDe0EX81TeI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Sun, 13 Apr 2025 19:29:50 +0200
Message-ID: <20250413172948.207258-4-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Both destination buffers are already zero-initialized, making strscpy()
sufficient for safely copying 'obj_type'. The additional NUL-padding
performed by strscpy_pad() is unnecessary.

If the destination buffer has a fixed length, strscpy() automatically
determines its size using sizeof() when the argument is omitted. This
makes the explicit size arguments unnecessary.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/bus/fsl-mc/dprc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/dprc.c b/drivers/bus/fsl-mc/dprc.c
index dd1b5c0fb7e2..38d40c09b719 100644
--- a/drivers/bus/fsl-mc/dprc.c
+++ b/drivers/bus/fsl-mc/dprc.c
@@ -489,7 +489,7 @@ int dprc_set_obj_irq(struct fsl_mc_io *mc_io,
 	cmd_params->irq_addr = cpu_to_le64(irq_cfg->paddr);
 	cmd_params->irq_num = cpu_to_le32(irq_cfg->irq_num);
 	cmd_params->obj_id = cpu_to_le32(obj_id);
-	strscpy_pad(cmd_params->obj_type, obj_type, 16);
+	strscpy(cmd_params->obj_type, obj_type);
 
 	/* send command to mc*/
 	return mc_send_command(mc_io, &cmd);
@@ -561,7 +561,7 @@ int dprc_get_obj_region(struct fsl_mc_io *mc_io,
 	cmd_params = (struct dprc_cmd_get_obj_region *)cmd.params;
 	cmd_params->obj_id = cpu_to_le32(obj_id);
 	cmd_params->region_index = region_index;
-	strscpy_pad(cmd_params->obj_type, obj_type, 16);
+	strscpy(cmd_params->obj_type, obj_type);
 
 	/* send command to mc*/
 	err = mc_send_command(mc_io, &cmd);
-- 
2.49.0

