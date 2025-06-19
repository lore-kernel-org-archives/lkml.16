Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DD923496F
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750341879; cv=none; b=kpc1COZ7SfIPaQ5zzAwyo3KXcrfXC10u+II28Vc/bpjIcz//YuuHJLptSU8DpfQvX8YQKVCMt9aEjwwCWR03dlX2uWGYi/veL8VR53AxH1V3Tsmx7/H/i+kipC4OjiLRlox+iApqbRshb5QXGNK7qSAZwHHdy+HBMaYA36yyimQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750341879; c=relaxed/simple;
	bh=+rdIgEVNrWFIkf9HNSIg2ntiDpW9UosbE5KXTGO0PRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bSg7jU5BdQmsTjfhFfNLehWG0VhFh7zLtdx8JfbCi+MH+s+4PHtkeoRTe1UkoTBiPcCxnxKO+nXoRhQUB4yLn5SdMXVm0cCETMMD2E0LDs5u5zv8/2ak0eiOZ77un8LaVFAWd8bXORXPpH0CBw1GQ0VYKsrEIyD6u1XmuY70OTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=f+cbBos4; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="f+cbBos4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750341874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lmCfaSQK1Rimk4amOPl/Ytxo+wEtdDtTzNP2ynYc7w4=;
	b=f+cbBos4kBFy7FTNWY04UGELvqkSmU4jn0Bop9rt4cFnJpd5nZeSkfjB06O76tU7Ce+C7r
	tvMG3Pd43x0f71e6RQvdEdby8l6sZfoFFG6C1r+33rnb+parRtS8yt7tUxLovC4XRdT1Ru
	wtWj5Bnz4n45tzbhsjYoqvrxYRNfxNs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Peter Rosin <peda@axentia.se>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] mux: Realign struct mux_chip to save 8 bytes
Date: Thu, 19 Jun 2025 16:03:56 +0200
Message-ID: <20250619140359.167685-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Reduce mux_chip's struct size by 8 bytes by realigning its members.

pahole output before:

  /* size: 752, cachelines: 12, members: 5 */
  /* sum members: 744, holes: 2, sum holes: 8 */
  /* member types with bit paddings: 1, total: 1 bit */
  /* paddings: 1, sum paddings: 3 */
  /* last cacheline: 48 bytes */

and after:

  /* size: 744, cachelines: 12, members: 5 */
  /* member types with bit paddings: 1, total: 1 bit */
  /* paddings: 1, sum paddings: 3 */
  /* last cacheline: 40 bytes */

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 include/linux/mux/driver.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/include/linux/mux/driver.h b/include/linux/mux/driver.h
index e58e59354e23..8e912399cf3b 100644
--- a/include/linux/mux/driver.h
+++ b/include/linux/mux/driver.h
@@ -56,16 +56,15 @@ struct mux_control {
 /**
  * struct mux_chip -	Represents a chip holding mux controllers.
  * @controllers:	Number of mux controllers handled by the chip.
- * @dev:		Device structure.
  * @id:			Used to identify the device internally.
+ * @dev:		Device structure.
  * @ops:		Mux controller operations.
  * @mux:		Array of mux controllers that are handled.
  */
 struct mux_chip {
 	unsigned int controllers;
-	struct device dev;
 	int id;
-
+	struct device dev;
 	const struct mux_control_ops *ops;
 	struct mux_control mux[] __counted_by(controllers);
 };
-- 
2.48.1

