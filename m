Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89EB31FDA8C
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745923339; cv=none; b=R85ELViOPvwlXOs36JQGTXxwbrJeLfPKCRJFj3xW9xwsqZfWlZTkTKoB1e5ztEv61mIakcPPf0BInjIgUObZ7cLAmW/Yd5dlCH28NiLQJsYKUlz2HmkHvbeB1Plp8dKj84jQIafbgblIPWk9Ga8NuYoepwne+RjBFNLSP3hH/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745923339; c=relaxed/simple;
	bh=WFweUFzPJxHQEalKoThE+EdeNESgFyFyh99S/DZ4HG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZmYVNGIUCQzujrqCuaXfV/W1kqzn5iaxREXl7XnZnV97uUqyWaM3HgllCI/99p+9Rzb4JkCjHWUUnS184tC9WK2akgdn/QpBRhZGCe6uto+UhrGIZ4j0FZ0L3YH9BlEdCI4F7wjt2OySseW2pJijZpx/b3n7C8wRz5jemDu38K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Ls01d7e2; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Ls01d7e2"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745923329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xMkIid6gHyNzydzTpQIq/sI+CyiABJLPBLSUcxMe7Wc=;
	b=Ls01d7e2J35C1GTAxra8JFRllV0MOlJuMkHd6aRBwzU1GVX+i30qym1DIMTXNMYoHJRU1n
	IQXqWAyV/8pZGBYsY/oTG0pS5bApiu2WBMMOgTlBp2JHTt1r9AkbTzlULUd5A2VokJAW2+
	lpz7uG0yshRRNZZl70P0Rbyv0NQ4QFo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Tue, 29 Apr 2025 12:41:48 +0200
Message-ID: <20250429104149.66334-1-thorsten.blum@linux.dev>
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

