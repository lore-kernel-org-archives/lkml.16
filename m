Received: from out.smtpout.orange.fr (outm-51.smtpout.orange.fr [193.252.22.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E68A14EC73
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 06:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744439864; cv=none; b=WH979UIhI0HxMoJPiF61zsMDJ3to5ZvOQlX3DMM3sxLdIZwpKDiFJgrso6YGN2nUWE9r5UAPcYR3P6p6U+O4IxTaPuZszD/UhDbbruKS0TofhAVpDdMOgALh26xqCBbmIKBWVWOLNdtylcwI9tJhM/ALJ7Slb9P5YrEHWe+iH9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744439864; c=relaxed/simple;
	bh=GWpst8nYkDoq9Pz2hqWVI6ZEKnv7GsxDoDu0ZjjsHU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VjBGlw8nTlw4VJYg7XBPP8t2YOviZJ0UyOXOp4q34ugEluwE4UTqK/p11LkhwdlapSSrrggUc9d10mqpVE+7IpVLIQ09SnrVgiaxakEyPWCLIQQBkGPBUhLqnci+u/7lhDy0bXl+ANCbGEU60igBZc0uTL9DtCeTGMkKVZL/frk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr; spf=pass smtp.mailfrom=orange.fr; dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b=nYDxPLVg; arc=none smtp.client-ip=193.252.22.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=orange.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=orange.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=orange.fr header.i=@orange.fr header.b="nYDxPLVg"
Received: from cyber-villager.csun.edu ([130.166.192.226])
	by smtp.orange.fr with ESMTPA
	id 3UUgulSZJBkGO3UUlu5T4W; Sat, 12 Apr 2025 08:37:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
	s=t20230301; t=1744439861;
	bh=TsJ6G2PB784E5CZ0z44RMlKXhavUEi1mq83Q1cDFTrw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=nYDxPLVgOng/KaFLF6zPkG5hrLdBygLxC7dB2pSJXM/I/INXZ/kQO1c9HSdt4u5/s
	 85cMkL2ro4eNOZyjiynR1LC8xVya0TiTKdiL7CAWgTt2SqOZCCYIwdELrXJ5ij7Kwf
	 Mrx1tapb5RqBI7XXVLY8kVIFV2FUTumo2GepvzcENhhv46Bq1vl5PxSlhgZpB3nmz1
	 qmlnyeOJsZDrKgdTLI1Z1mj6zBSYA5nW4f+lSli83DC27Wa0rhpIjAhMZWm2+myLtD
	 bAj6NXSeXqnJHglicHX8++2ekXfxC+cGyq7qvceQm0pWOx+6eI5Mtf7PlI7nHiE5wp
	 nUzdVRoWpNBQg==
X-ME-Helo: cyber-villager.csun.edu
X-ME-Auth: cGF1bC5yZXRvdXJuZUBvcmFuZ2UuZnI=
X-ME-Date: Sat, 12 Apr 2025 08:37:41 +0200
X-ME-IP: 130.166.192.226
From: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: =?UTF-8?q?Paul=20Retourn=C3=A9?= <paul.retourne@orange.fr>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/16] staging: gpib: hp_82335: fixes multiline comments style
Date: Fri, 11 Apr 2025 23:37:25 -0700
Message-ID: <cf973e61d37b0509605e49b963f2dae4887efd4a.1744438358.git.paul.retourne@orange.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744438358.git.paul.retourne@orange.fr>
References: <cover.1744438358.git.paul.retourne@orange.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes the style of multiline comments to comply with the linux kernel
coding style.

Signed-off-by: Paul Retourné <paul.retourne@orange.fr>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index fd23b1cb80f9..ec531c2b174f 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -4,8 +4,9 @@
  * copyright            : (C) 2002 by Frank Mori Hess                      *
  ***************************************************************************/
 
-/*should enable ATN interrupts (and update board->status on occurrence),
- *	implement recovery from bus errors (if necessary)
+/*
+ * should enable ATN interrupts (and update board->status on occurrence),
+ * implement recovery from bus errors (if necessary)
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
-- 
2.49.0

