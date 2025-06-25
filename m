Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1D262FCC;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750861259; cv=none; b=gdOwD03CCWAXgQyzMG//NZNkreqvwgEAWAPzm+AmABG7MwUBw4gFhTDAVQqWvl/AYFiy/EaLh1W7c0lMv8TB8hdoZch8eGDoWsflx0qgg6RVAGDBNvgJF07GbgKSSvP+35eQWKxei0vddbwWipOiFZCZuNSm8IneJNrbGdOCOQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750861259; c=relaxed/simple;
	bh=AKkCB0Fn/Ec0J/1YhLs2exR0gTfL+alBY0dWRjOKJfY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dKGCGV8v+uDX7ffzE3aUU/aFALl0h+0tp5aoh98uD2F+W+jTEGvAv5QRnNX3PnoFHIh6oKFImMsUGqF7HZQI38IUp+EofI2BhODU6auKEcJ7965o6V6MkxhUxvQr2gSghwMWdKYBJ6dE6Gex0CJbN+txUeHttrRpplFAgRyfEaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHPcQqlh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHPcQqlh"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73A1BC4CEF3;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750861259;
	bh=AKkCB0Fn/Ec0J/1YhLs2exR0gTfL+alBY0dWRjOKJfY=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=kHPcQqlhBqBz6om3lVhgh+BuhcVVtS3SVOtH2YV0rrk7lFet1oJgI6j1H+TzRftye
	 C4aa+GnG+DPFlZK58vqUPm5N0uAf6iph89rPGGctjtqWbEw6wQNi24NdAhbxN1usgv
	 DDDonqyDXNw6HS91V3R5yx17MU6lEhWHeyQAb1rr8/uus6hI+R0y3mPAaEqaD6/XJr
	 20NqICYdnjPf+lh/tT4m+9vGzHDTyH1lYa0cPjlI4yl1707Zm6i4v+e/TA9JOhvy0o
	 DUpzMopORVJeaU/rx2QwbeJSvNYV8aYtWux2jdv7MrHFsE8YBmNj1OK2sRaexxAVkI
	 SIuAq8QP1gy4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68EEEC77B7C;
	Wed, 25 Jun 2025 14:20:59 +0000 (UTC)
From: Aleksa Paunovic via B4 Relay <devnull+aleksa.paunovic.htecgroup.com@kernel.org>
Subject: [PATCH v4 0/7] riscv: Add support for xmipsexectl
Date: Wed, 25 Jun 2025 16:20:55 +0200
Message-Id: <20250625-p8700-pause-v4-0-6c7dd7f85756@htecgroup.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMcFXGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMT3QILcwMD3YLE0uJU3ZTkJDMTS0szi1QjEyWgjoKi1LTMCrBp0bG
 1tQCI/NDSXQAAAA==
X-Change-ID: 20250424-p8700-pause-dcb649968e24
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Aleksa Paunovic <aleksa.paunovic@htecgroup.com>, 
 Djordje Todorovic <djordje.todorovic@htecgroup.com>, 
 Aleksandar Rikalo <arikalo@gmail.com>, 
 Raj Vishwanathan4 <rvishwanathan@mips.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750861257; l=3219;
 i=aleksa.paunovic@htecgroup.com; s=20250514; h=from:subject:message-id;
 bh=AKkCB0Fn/Ec0J/1YhLs2exR0gTfL+alBY0dWRjOKJfY=;
 b=/HMVj1SwzEI08oQFtLo1Ahc7Gh6hhXWEWC5Ge5p6KquI8NEYcZUJKfIghbMpNuj39KKehh1df
 0AfmJD3xM0WD6sDJrQFM0OI3s1rkWUsydP4U4YfOpkrEHfC2X5QKF8V
X-Developer-Key: i=aleksa.paunovic@htecgroup.com; a=ed25519;
 pk=gFVSVYLKAgJiS5qCnDyUMGOFuczv8C6o0UmRs+fgisA=
X-Endpoint-Received: by B4 Relay for aleksa.paunovic@htecgroup.com/20250514
 with auth_id=403
X-Original-From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
Reply-To: aleksa.paunovic@htecgroup.com

This patch series adds support for the xmipsexectl vendor extension.
A new hardware probe key has also been added to allow userspace to probe for MIPS vendor extensions.

Additionally, since the standard Zihintpause PAUSE instruction encoding is not supported on some MIPS CPUs,
an errata was implemented for replacing this instruction with the xmipsexectl MIPS.PAUSE alternative encoding.

Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
---
This is a continuation of a previous series, which did not implement the full
xmipsexectl vendor extension. The title was updated accordingly.

Changes in v4:
- Add support for the xmipsexectl vendor extension
- Remove the ifdef/else from errata_list.h
- Replace the ifdef/else with a hwprobe call in the userspace code.

Link to v3:
https://lore.kernel.org/linux-riscv/20250129131703.733098-1-arikalo@gmail.com/

---
Aleksa Paunovic (6):
      dt-bindings: riscv: Add xmipsexectl ISA extension description
      riscv: Add xmipsexectl as a vendor extension
      riscv: Add xmipsexectl PAUSE instruction
      riscv: hwprobe: Add MIPS vendor extension probing
      riscv: hwprobe: Document MIPS xmipsexectl vendor extension
      riscv: Add tools support for xmipsexectl

Djordje Todorovic (1):
      riscv: errata: Fix the PAUSE Opcode for MIPS P8700

 Documentation/arch/riscv/hwprobe.rst               |  9 +++
 .../devicetree/bindings/riscv/extensions.yaml      |  6 ++
 arch/riscv/Kconfig.errata                          | 23 ++++++++
 arch/riscv/Kconfig.vendor                          | 13 +++++
 arch/riscv/errata/Makefile                         |  1 +
 arch/riscv/errata/mips/Makefile                    |  5 ++
 arch/riscv/errata/mips/errata.c                    | 67 ++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h               |  3 +
 arch/riscv/include/asm/cmpxchg.h                   |  3 +-
 arch/riscv/include/asm/errata_list.h               | 17 +++++-
 arch/riscv/include/asm/hwprobe.h                   |  3 +-
 arch/riscv/include/asm/vdso/processor.h            |  4 +-
 arch/riscv/include/asm/vendor_extensions/mips.h    | 23 ++++++++
 .../include/asm/vendor_extensions/mips_hwprobe.h   | 23 ++++++++
 arch/riscv/include/asm/vendorid_list.h             |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |  1 +
 arch/riscv/include/uapi/asm/vendor/mips.h          |  3 +
 arch/riscv/kernel/alternative.c                    |  5 ++
 arch/riscv/kernel/entry.S                          |  2 +
 arch/riscv/kernel/sys_hwprobe.c                    |  4 ++
 arch/riscv/kernel/vendor_extensions.c              | 10 ++++
 arch/riscv/kernel/vendor_extensions/Makefile       |  2 +
 arch/riscv/kernel/vendor_extensions/mips.c         | 22 +++++++
 arch/riscv/kernel/vendor_extensions/mips_hwprobe.c | 22 +++++++
 arch/riscv/mm/init.c                               |  1 +
 tools/arch/riscv/include/asm/vdso/processor.h      | 27 +++++----
 26 files changed, 286 insertions(+), 14 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250424-p8700-pause-dcb649968e24

Best regards,
-- 
Aleksa Paunovic <aleksa.paunovic@htecgroup.com>


