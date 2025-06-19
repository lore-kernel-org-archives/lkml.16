Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202BE200127
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750345097; cv=none; b=eaJj1EByJRtqIUgGrL5dsT22M+I1X1Qtz/EgMafILh/zGxIZGgMsfIogCmBcM0cNPGBTOR2p855wKtspV4aJd7Zs6M2e8Z/Myyn9nsfyy1MIC/YIp90m0JMUH3lV9G6cyXlwVmIF2gNG1MSYm6hT4qkKEkqL82mmfWyw+jsaALY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750345097; c=relaxed/simple;
	bh=GbdOj3vJ/q4X+/2t6OHFHhPM4HGzw4Vsiy/W4r3FnA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HnZwWcl9dnwsO+bh2BRx40y4rGD/h3XB4BwYhwCNwA8omY1qN1FWE04auCo+5/JKoh097rN2487ywPRhrmH6YfO7FJ983rQEKUuJ/gdF3lnOAPqUjWlcc3pQhu37lXmhxIgppgY9Pqr9fiwbSnvg300PSyfnQiRMIV2DJCMWVrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=X6TZWCD9; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="X6TZWCD9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750345091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Q9TvMyMwPK6rkSNheoWI19m/ZeeUWO8Bp2DZADsG/EE=;
	b=X6TZWCD90sSZM9Q89BopqjTuweQk/EkFH2qeGCVx6gRJwqh9UVXxs/umJAspInvfvCmv6q
	iErrlFtK44z+JMMHQquSNTwlLYLWYGPAKR17sf/qIRahNysM9ew4OJk1exqvHWfQHWUA9A
	r9uETuFTx4VXT79dDByc+7XOziT+1GU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] alpha: Replace strcpy() with strscpy() in setup_arch()
Date: Thu, 19 Jun 2025 16:58:04 +0200
Message-ID: <20250619145806.174567-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

Since the destination buffer 'command_line' has a fixed length,
strscpy() automatically determines its size using sizeof() when the size
argument is omitted. This makes the explicit size argument for the
existing strscpy() call unnecessary - remove it.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/alpha/kernel/setup.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index bebdffafaee8..8b51e6ca83d6 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -468,8 +468,8 @@ setup_arch(char **cmdline_p)
 	/* 
 	 * Locate the command line.
 	 */
-	strscpy(command_line, COMMAND_LINE, sizeof(command_line));
-	strcpy(boot_command_line, command_line);
+	strscpy(command_line, COMMAND_LINE);
+	strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
 	*cmdline_p = command_line;
 
 	/* 
@@ -511,7 +511,7 @@ setup_arch(char **cmdline_p)
 	}
 
 	/* Replace the command line, now that we've killed it with strsep.  */
-	strcpy(command_line, boot_command_line);
+	strscpy(command_line, boot_command_line);
 
 	/* If we want SRM console printk echoing early, do it now. */
 	if (alpha_using_srm && srmcons_output) {
-- 
2.49.0

