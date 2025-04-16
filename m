Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7962472B9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 12:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744805184; cv=none; b=pSW4YcW+aVqqcx/rKTQaci5TYxxAkorwqUbgc5vvT6hdG9p52edfBLN9/9zrcEQZil4J/Gyu5sbXXElsZSomj6r06n1glHJmzBRdKbiGFeOyRSPJWirLFES0CJT+ugI+0+1PDsT6L8V9w2JZpfI7ybZr3iGoBTT5byMALuFh+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744805184; c=relaxed/simple;
	bh=ot/+PyeGwuyyUs+gU8Wc/UIvFw7kPfIN4dAGn9oleWc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p6bi7z75zJ4qN1uOoV6DleJUk/lTZZGL6JlghpSOZZkLFaaCjdUmvNRyFgQTlossqr+8RtJUPsBR21St/MOd9voL+PvJB3kpch/G26RFZ50DkIni7VVscOprYW3hebp/XMWDSHKuBF6F03ttYZLY3xmWdGbyfP41Lsppf04dC2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CGzl7AHe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=hM7oCfPb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CGzl7AHe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="hM7oCfPb"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744805180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BsdrjnU+KlfPiSRZqC16cDEfipEEX3WwwiF3Xi9A28U=;
	b=CGzl7AHezGeHhjJIYFMYX+/0B/EYAFAi+rTR5cQlCMVoqSZXXrpAG+Dn7cEUQNtDlJ/IfR
	t6DbAT9KVn/D51DgVhixK118+hXiobZV2NgzFK8nRYjX0FrKb15/SW4kPZ9+8lZv3dBUIq
	+oy26OnyWE71rkKZzD2H+A0DRQF4sbgUxnSIhDLZeSYFf/2Cdr1gNA+rl0E7x+NEQXRAlA
	T1l43HkYFXhzrX9Wri2wgoTJhquBgbt+zFLSJ74yTyVAx4goih8qUbOA/I5pvLEOltTi6l
	nTEzyj2oqINr2Dp3+Upj2AX+zwb05qFUxXbohU8x5h6aOUANfWQ+Gz5bMxk+aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744805180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BsdrjnU+KlfPiSRZqC16cDEfipEEX3WwwiF3Xi9A28U=;
	b=hM7oCfPbB29hIzGfxXxAYfhtiXT/CNEHlSoKZnysh5nPrnTcQLpd1Eiys0rJCD/VBoWiJy
	kU+GBeUQjOT4C8Bw==
Date: Wed, 16 Apr 2025 14:06:16 +0200
Subject: [PATCH 01/10] tools/nolibc: prepare for headers in subdirectories
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250416-nolibc-split-sys-v1-1-a069a3f1d145@linutronix.de>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744805177; l=963;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ot/+PyeGwuyyUs+gU8Wc/UIvFw7kPfIN4dAGn9oleWc=;
 b=lpwIFxmA7PQHnMoVrfFbuJzfQflZ334iqi9RmwVx8P2PdLkQHRSzBdcYWelVYB/iUlp0uQ6bR
 SAsOphBmvHtC/L/EaSLdmGAJkB2L5Th6+UMYFF70rB6yaqUxle1UvK4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

To support headers in subdirectories (like sys/), their subdirectory needs
to be preserved during installation into the sysroot.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index f9702877ac21ab5ad30df1740e40e67f477f3824..f562cb53be10efc4e0758b8836cf3ace5b3c151f 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -72,7 +72,7 @@ help:
 headers:
 	$(Q)mkdir -p $(OUTPUT)sysroot
 	$(Q)mkdir -p $(OUTPUT)sysroot/include
-	$(Q)cp $(all_files) $(OUTPUT)sysroot/include/
+	$(Q)cp --parents $(all_files) $(OUTPUT)sysroot/include/
 	$(Q)if [ "$(ARCH)" = "x86" ]; then      \
 		sed -e                          \
 		  's,^#ifndef _NOLIBC_ARCH_X86_64_H,#if !defined(_NOLIBC_ARCH_X86_64_H) \&\& defined(__x86_64__),' \

-- 
2.49.0

