Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FBE1FECCA;
	Mon,  3 Feb 2025 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573525; cv=none; b=rxjIWvJwVH8OvJYTApbh39Q+oWBGB79cfCbECwrEUJsrAojOWeszh6L3tdhlatmn7MjNKquI/jS4ZcIya8UjAjda8WKULeAm/UjnSH5JBLomQrYoOet00ARFPetTNWxzUKtSmz4PW6XbAKDbAuTBQ9XND64D5aV1Lfm8E1OfDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573525; c=relaxed/simple;
	bh=b9REhQdfZN7ermQyFmhBpR4szMBhcomhygovm/zRZzk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iIk8emxApeRaoyHaOZxwysRMXQDgSDw97BI1RZIVswp1ATg1WKrff+oRTdB8t8BfmJ7LjpzUtkOD3RkfZ2V3E4bcNM+g9Im//wPtzLU6n4/6dzb9OHGlyXI6Cmr0BdxPEhgE3Lc36QSTx39RqBEdndI0g01UvP2P6+zCraBD9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ahqWUTH1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=iLkT9eF5; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ahqWUTH1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="iLkT9eF5"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738573521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaCxvI0b2Du7t844lWGxhhHOksYb2s9PM20EB1Ag6YY=;
	b=ahqWUTH1Sc8yeVAgvNolQlD1lh5COZPQXex+lsdiNCCZYRKR0eR0RrgWcPP1i88usBmIID
	G1nTxkJco2H2rEV5I+aAUQBk/PNnSFKx9T77umK3k5sukG/GDr0yyrIC5dAP79W1OPNPrb
	uBOpUwxFmddQr98FlYo13DnndyU93IrqlagcUqf9wczjefaV/8SLg3KOAMScLGy6viaN0T
	bpgimSBsaZf4F8FRh7CSQaKeNrTcbZIVmZWJPCcGOWNaLxHIjCuJ/G4Uqgjd67lxwvsIQK
	4afg+qqMacB+SLKQClFUpNP4LEF3Ak4/NnpGe0jTuT4RkTG1H8t7p5STQ3hkJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738573521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EaCxvI0b2Du7t844lWGxhhHOksYb2s9PM20EB1Ag6YY=;
	b=iLkT9eF5N07qKx2fnA5B+0n8MMjRdQODVIGY+wQe9CAlBfrfTfSV8t7Hk/hSlcwTZjy8j4
	eWdu4JTfpLB4PjBw==
Date: Mon, 03 Feb 2025 10:05:06 +0100
Subject: [PATCH 05/16] elf, uapi: Add type ElfXX_Versym
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250203-parse_vdso-nolibc-v1-5-9cb6268d77be@linutronix.de>
References: <20250203-parse_vdso-nolibc-v1-0-9cb6268d77be@linutronix.de>
In-Reply-To: <20250203-parse_vdso-nolibc-v1-0-9cb6268d77be@linutronix.de>
To: Kees Cook <kees@kernel.org>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738573516; l=1084;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b9REhQdfZN7ermQyFmhBpR4szMBhcomhygovm/zRZzk=;
 b=V3fBkX6D/VOzq/MH28Rw6LWLDJwi3SlZrsvSPOMj0VsnXePwATYfkMvVDWwnZ+jD3rCmfrHTm
 FiV8OABOHWaDwvwDA5QdqMNyJEuqlJN43gl/R2FtOIEV5WxmSyC/WVG
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The types are used by tools/testing/selftests/vDSO/parse_vdso.c.
To be able to build the vDSO selftests without a libc dependency,
add the types to the kernels own UAPI headers.

As documented by elf(5).

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/uapi/linux/elf.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/elf.h b/include/uapi/linux/elf.h
index d040f12ff1c0ae3dde5c371c81d6089118fbe8ed..8846fe03ca5b836c96aad1be6d8fb9daf3d4b1d9 100644
--- a/include/uapi/linux/elf.h
+++ b/include/uapi/linux/elf.h
@@ -11,6 +11,7 @@ typedef __u16	Elf32_Half;
 typedef __u32	Elf32_Off;
 typedef __s32	Elf32_Sword;
 typedef __u32	Elf32_Word;
+typedef __u16	Elf32_Versym;
 
 /* 64-bit ELF base types. */
 typedef __u64	Elf64_Addr;
@@ -21,6 +22,7 @@ typedef __s32	Elf64_Sword;
 typedef __u32	Elf64_Word;
 typedef __u64	Elf64_Xword;
 typedef __s64	Elf64_Sxword;
+typedef __u16	Elf64_Versym;
 
 /* These constants are for the segment types stored in the image headers */
 #define PT_NULL    0

-- 
2.48.1

