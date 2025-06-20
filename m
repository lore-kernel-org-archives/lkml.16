Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49725F98D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750417241; cv=none; b=Id2vhfUDACSNU3hDoYi7BhtfIQbQFivDZmvkGvASqwi0P4z0Z0CdpRhzAyShI6w/FJRq+ORdV7zeSlaK+CjZptyxWx6sbJ97rhqpslIbBKS8yWJ8yzqWV0e2ncIDt9obwKNqcZ2S3ZBURzOPfisCCssOBEtfCB0vq+IKhnE2cm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750417241; c=relaxed/simple;
	bh=RshHYQP3UhLxvR6Y8W3NzGAr4Z3RjHL1KVRDd0k1sEE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=T6/lzeTIZnu+0JJ2aBT7Z6a39w3mdLzG69jPPewTBGxvULyEbRP34FH2NBDXSPfGt6n6c2qejh3tzR7KbXqI6itIA4WNcEQgbdy8uuPIjUF9d2glxfZ4dStKDUVBFMW419ggZxpKjl1MqGMQwCriQxnFKr1tP+iWOmwHGHXoWhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PEZIp++s; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cLlZ3v5T; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PEZIp++s";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cLlZ3v5T"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750417231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fFb3pYpNQxCg0EtxJKenzMB4lCz442YXIfizTSqGQfI=;
	b=PEZIp++sBCgwmvdqvccdu4fnQpmpmzacEmxHgT+R3wZDu+XA92GyCEiSsFRbW9PMnwQ/I7
	f+FNN0AKVj2JI5VM0X40GxfOfbAE8GmzYzf4F6iQv2yEpFaj5rkMuVFNbuBPcFEyq20188
	JlaiHJMN0vkbJ+hWC3KkbHqbjLpQsdo7reikPcUn+7Zf0DKad2rgpfEZLvPnyCXvE3nYPd
	qAZQxMqCLlGL4HJsc+Di4ueX48nqz/BnLQoHdZF4G5Ec0LM3FQ4RFwgDzL/Z79oUVZxFbY
	Rz9K5qHcPBDu5NI8t3KJIVU0Ne4r5Ew1kAc7JObzGFPmSgYMkVlL2fksJY/EuA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750417231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fFb3pYpNQxCg0EtxJKenzMB4lCz442YXIfizTSqGQfI=;
	b=cLlZ3v5TOHTk8im6BV0KmcEsdkF9Y/7f6pnYhmQjrE+Y3eu6rX//Hm+5LKL69KGRMfRh47
	x34mgptY4T4zOOBw==
Subject: [PATCH v2 0/2] tools/build: Fix s390(x) cross-compilation with
 clang
Date: Fri, 20 Jun 2025 13:00:26 +0200
Message-Id: <20250620-tools-cross-s390-v2-0-ecda886e00e5@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEo/VWgC/32NTQ6CMBBGr0Jm7Rg6rfFnxT0MC6SDTEJa06kEQ
 7i7lQO4fC/53reCchJWuFUrJJ5FJYYCdKigH7vwZBRfGKimU+3IYY5xUuxTVEW11xrPlruOvKO
 LtVBmr8SDLHvy3hYeRXNMn/1hNj/7JzYbNOgt9+7hrB8MNZOEd04xyHL0DO22bV9qlorctAAAA
 A==
X-Change-ID: 20250424-tools-cross-s390-73eaa2d42833
To: Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Quentin Monnet <qmo@kernel.org>, 
 Jean-Philippe Brucker <jean-philippe@linaro.org>, Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750417228; l=997;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=RshHYQP3UhLxvR6Y8W3NzGAr4Z3RjHL1KVRDd0k1sEE=;
 b=qv5qag0kzqZJvE7FEGLFNSzluXD4Zfh14i3uaPxSZBKbiXfP4T0yozj+2aewX+s8/r8Bd1AOa
 TWnvdtbC4vwAjWxpCSZjXQYaDav3adn0m6YJAtPODosPTRH13HS1fcU
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The heuristic to derive a clang target triple from a GCC one does not work
for s390. GCC uses "s390-linux" while clang expects "s390x-linux" or
"powerz-linux".

There doesn't seem to be a formal maintainer for this file.
Maybe the clang/llvm maintainers can pick it up.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Rebase onto mainline master
- Drop custom nolibc workaround
- Link to v1: https://lore.kernel.org/r/20250424-tools-cross-s390-v1-1-d3ec4b43df12@linutronix.de

---
Thomas Weißschuh (2):
      tools/build: Fix s390(x) cross-compilation with clang
      tools/nolibc: drop s390 clang target override

 tools/include/nolibc/Makefile  | 3 ---
 tools/scripts/Makefile.include | 4 +++-
 2 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 75f5f23f8787c5e184fcb2fbcd02d8e9317dc5e7
change-id: 20250424-tools-cross-s390-73eaa2d42833

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

