Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088928C853
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749552118; cv=none; b=f8PyTo3HavsFxJuU3OSmU+vnVi4rY/gXYld7gl3rkjIBnGrlAk8V6pZ7a6S99yphP18NBT6EK7xLR5Z9xtH/+N57KfYrjTnvS6FZxWZfvez2W5Ft1XNXIo9XkRV+0z6VK+OAw7cAO6wp+NNLyg+WLLDqxZ6uHRQg2wdjjk2s1g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749552118; c=relaxed/simple;
	bh=HrubCorwEI4QzVE/jzPQeSmrMn2QE2G/08itsfpnLpY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c4WUn3keviyHfPFOUH6DYl+JksDRLGhBKT7yVkeFCyuM/uKMxX7Z54OZLzTW7TLkcz955e0M2sSU7dQvLQt97Zhv1PQa4AYLSyC2xucqjGUM+qqRZ/h0pxmMP1xq5j/z8MIJ7byYONzzSJllWXcrHeBQYA9r+l6Eq88hLBiJXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eZjAL4LM; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eZjAL4LM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749552114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rEgV8+jcHG8DYIUGohYSskDCUEUrKKBIFZXspFzbGyU=;
	b=eZjAL4LMXs5XY5pP0nCn1K//1kwYiqhXDNFRKcOLNmTKxhVLJkgeAWDwMVDvQmMEgzSx8S
	/GhKEdKpKEsx0fHSwZonkrZTUIXhRuBI9LI3coOFYXEpuO7y83J53BGW+j9BLQ8yu5fWdC
	Miv76Au4XAj/ldFz52sOugUd/Ifeb/A=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Peter Rosin <peda@axentia.se>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH RESEND] mux: Convert mux_control_ops to a flex array member in mux_chip
Date: Tue, 10 Jun 2025 12:40:59 +0200
Message-ID: <20250610104106.1948-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Convert mux_control_ops to a flexible array member at the end of the
mux_chip struct and add the __counted_by() compiler attribute to
improve access bounds-checking via CONFIG_UBSAN_BOUNDS and
CONFIG_FORTIFY_SOURCE.

Use struct_size() to calculate the number of bytes to allocate for a new
mux chip and to remove the following Coccinelle/coccicheck warning:

  WARNING: Use struct_size

Use size_add() to safely add any extra bytes.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/83
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/mux/core.c         | 7 +++----
 include/linux/mux/driver.h | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mux/core.c b/drivers/mux/core.c
index 02be4ba37257..a3840fe0995f 100644
--- a/drivers/mux/core.c
+++ b/drivers/mux/core.c
@@ -98,13 +98,12 @@ struct mux_chip *mux_chip_alloc(struct device *dev,
 	if (WARN_ON(!dev || !controllers))
 		return ERR_PTR(-EINVAL);
 
-	mux_chip = kzalloc(sizeof(*mux_chip) +
-			   controllers * sizeof(*mux_chip->mux) +
-			   sizeof_priv, GFP_KERNEL);
+	mux_chip = kzalloc(size_add(struct_size(mux_chip, mux, controllers),
+				    sizeof_priv),
+			   GFP_KERNEL);
 	if (!mux_chip)
 		return ERR_PTR(-ENOMEM);
 
-	mux_chip->mux = (struct mux_control *)(mux_chip + 1);
 	mux_chip->dev.class = &mux_class;
 	mux_chip->dev.type = &mux_type;
 	mux_chip->dev.parent = dev;
diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
index 18824064f8c0..e58e59354e23 100644
--- a/include/linux/mux/driver.h
+++ b/include/linux/mux/driver.h
@@ -56,18 +56,18 @@ struct mux_control {
 /**
  * struct mux_chip -	Represents a chip holding mux controllers.
  * @controllers:	Number of mux controllers handled by the chip.
- * @mux:		Array of mux controllers that are handled.
  * @dev:		Device structure.
  * @id:			Used to identify the device internally.
  * @ops:		Mux controller operations.
+ * @mux:		Array of mux controllers that are handled.
  */
 struct mux_chip {
 	unsigned int controllers;
-	struct mux_control *mux;
 	struct device dev;
 	int id;
 
 	const struct mux_control_ops *ops;
+	struct mux_control mux[] __counted_by(controllers);
 };
 
 #define to_mux_chip(x) container_of((x), struct mux_chip, dev)
-- 
2.49.0

