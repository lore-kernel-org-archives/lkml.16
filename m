Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD392989A0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747310788; cv=none; b=auBqjADogW2KlPqFChEI8bVadAGJkDQPowM7tfsQK2y9xfhxIkyzpO7d6iFLrohfNAfKMFNqSc9oKrlOv/zPJXy7Ky9XQUh5NT4PW8nJ15ykT4XU4wWrKUF+N1FmVJ9+KfzRV/nSQRNxXSeKe8LP6WOobRM4jr4ShR7RhbunaWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747310788; c=relaxed/simple;
	bh=UCbsGHgeAVdQRwSUcWCgwKGnxF0ODFn4ZhmD0uVukdk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EEoTDugMXEq5ZpvFmbOAE4DLEtUeWogqTvRb47fony7ye1oDJCSIn8S6zJhe0dfkXvDCRcmp50ggB67jpbMjoWlJF2Wsnp050GQFpUU3hsLX+6vNe5aKv2uUQWFJODewl+gjhRFuuXqxsDX7iy8XfKfs1sqH3yzAjGaYwdYXgts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RSKJhPcp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RSKJhPcp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E35C4CEE7;
	Thu, 15 May 2025 12:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747310787;
	bh=UCbsGHgeAVdQRwSUcWCgwKGnxF0ODFn4ZhmD0uVukdk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSKJhPcpa0fwuCP03pcH3en5doWhK7bZVjjz2I5oy+ZKljVlJOfiBQRPcMPR6pqz9
	 NeMXPBop4iKv9aT/ZE4fT/3flrpaW4RSJ4hKP3L1BoA3OzjxdMRYzoowb11DyQuhle
	 HKysW9Z3aw3eD3fxJJb5y4mydWLlmBRAq0ToQt3kLJDuFGqii5WWG7RbJ5HQW9wY3c
	 nA0Jg7TU/7sWXZl00w12nFOIwLewuHhwl+VP6h2l7IlKo8zkFIioT9du/4mBgwXk11
	 KAVVMgee6VUGTW+cQHcAbFmR9B8bPKP1R004anHOfU+hO8+U0GfPJSaEUgxlKF1hu3
	 ao5kzugGtU0Jg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 09/32] x86/boot/e820: Call the PCI gap a 'gap' in the boot log printout
Date: Thu, 15 May 2025 14:05:25 +0200
Message-ID: <20250515120549.2820541-10-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515120549.2820541-1-mingo@kernel.org>
References: <20250515120549.2820541-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

It is a bit weird and inconsistent that the PCI gap is
advertised during bootup as 'mem'ory:

  [mem 0xc0000000-0xfed1bfff] available for PCI devices
   ^^^

It's not really memory, it's a gap that PCI devices can decode
and use and they often do not map it to any memory themselves.

So advertise it for what it is, a gap:

  [gap 0xc0000000-0xfed1bfff] available for PCI devices

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: Arnd Bergmann <arnd@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/kernel/e820.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 0a324d0db60e..d85623c9ee1b 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -741,7 +741,7 @@ __init void e820__setup_pci_gap(void)
 	 */
 	pci_mem_start = gapstart;
 
-	pr_info("[mem %#010lx-%#010lx] available for PCI devices\n",
+	pr_info("[gap %#010lx-%#010lx] available for PCI devices\n",
 		gapstart, gapstart + gapsize - 1);
 }
 
-- 
2.45.2

