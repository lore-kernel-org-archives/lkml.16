Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9F1EAF9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887830; cv=none; b=JzrrHtw8KuncvvY2pUg7XwUK0Re6LZPN86CHSHn7W1+Xn/dajKe9JcI4cWJb8wAx/gCjNyGr5toQav66kXNeEKgyCaJXP7vCkxrHS+ggWD/JmfXXGypeOaFmyxvmy2D5b/LrlT/CfRwc9VKqeGc7rLheZFO/Bs/0InO2VgomG5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887830; c=relaxed/simple;
	bh=2Cxd3jS8VMSsjweHbN859HTp8jM+cKEyz1r4yJ8hT4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qG400EkrGR7p/qtWN2L5sagrreI9MTEXTZQuX3QNLhNd93j676K6lBeYjMwgcTwEDVbNCApfe4lHNLmR3KHp2CaHCkCnzVvpY7CHRTEj+2Vyalnx67ITU+Dm5xJVaUFcgeCi6sT6ZBRshRNz8/a0gXfSdgzi16iFB4ZKx8jibCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hdKgQhgv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hdKgQhgv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34EF4C4CEEB;
	Mon,  2 Jun 2025 18:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748887829;
	bh=2Cxd3jS8VMSsjweHbN859HTp8jM+cKEyz1r4yJ8hT4M=;
	h=From:To:Cc:Subject:Date:From;
	b=hdKgQhgvE8SV7l63uUx/PI0qaLfr+AddJIlOhFXQVpI4acJ5Nnf10WmeeXIAxbsQp
	 AsGvl+0AuDBWFK7cUlyxj89iVSQsxsgk/BrhCHFwjF7cB7Q+F8R35xsig5wAu1NHWj
	 wSQ9+nZelJK6bUgFov4ZXhuutY/ike3CLWuPRV1YNUYrFhTfZc9TUTsYhkQ0W4+JdP
	 s4q1mVj8wTI5vbddmAsTs60R+UvjkL4F5G1QLJhZSqtwThHEmXC10+vsDlH4Gfed+A
	 kTUoEP80XaU2DtcTBhlSMsnmZcKPNuB7vzSrhLeZbZ6Yy01qIWn2ODFQJNyhyBW5Za
	 Fg6645twCxlJg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: pi: use 'targets' instead of extra-y in Makefile
Date: Tue,  3 Jun 2025 03:10:18 +0900
Message-ID: <20250602181023.528550-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

%.pi.o files are built as prerequisites of other objects.
There is no need to use extra-y, which is planned for deprecation.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/kernel/pi/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 81d69d45c06c..13b7d68c95b5 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -39,4 +39,4 @@ $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
 obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
-extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
+targets		:= $(patsubst %.pi.o,%.o,$(obj-y))
-- 
2.43.0

