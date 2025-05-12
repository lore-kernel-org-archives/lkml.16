Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82F219E4;
	Mon, 12 May 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057705; cv=none; b=uAeRwatSbJqyNhkJ5WWIDySzzXnVbOCYItYS8/z6w1yWn5hR390dtCikVcgvFCxINDI2hCDoP2qLRmnCzewoOgwEMcDy9fk3y5KYhCfIRtWGmQfQ7vUGwBDEEaF26EwnpXm7Z/Ot+rjkBDmYd6gIlNGZwQ6foAi4aLNnzB1Hb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057705; c=relaxed/simple;
	bh=DNYSN+ylh/jXEnA3iZxmH6KlXH1W+/6ULPk8mmvd8G4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Nt5VIWhy/lqrWQoM5GcRTsoUfHDaLu533/9jU9Teu9sdZThgVvZ9Z63tR3skM7VCYw5MEOw0Jdqw6dv6IRGuKxIIdG9PPG81LV51Zu3XePMIvxwEZ0ncvHSu8hNqrRk9ocAUoyWgUTUuNy/oKcmibjQoUEmwpWFjbME9S/XHVnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GHkm0veZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GHkm0veZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 828E2C4CEE7;
	Mon, 12 May 2025 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747057704;
	bh=DNYSN+ylh/jXEnA3iZxmH6KlXH1W+/6ULPk8mmvd8G4=;
	h=From:To:Cc:Subject:Date:From;
	b=GHkm0veZOZ/FoxV80eSVOD4Kew8bfqr5GdmoxS/810uPy9ujlUa8EGENgrmkaMOL1
	 kZzz69xN6IV7bnNhH5PuZAtG1D153oaqfEw19buthRaEpsb/r8Wxx3CeM2YVjUy9VV
	 uFwHVjt5Q0BpZz0NLVTjpw+Oaihzm3q918W9QTMQpFj1ceBtx/x7SbTouvpR8Zetn3
	 TMSwMJHoKajnAm6aP2XI5b+IQ4cADJyyiNsQYnKYX/8KT6os5fTk2tLyxn+AtBAo0H
	 8qNEySIyqllucoYVfnVkgZ2GyfYS9SbFpxJWeBi5mLM1m+DntkzNEAGZ5WRhq/7s5O
	 Teq/kSXUPCSng==
From: Conor Dooley <conor@kernel.org>
To: linux-renesas-soc@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] Add specific RZ/Five cache compatible
Date: Mon, 12 May 2025 14:48:13 +0100
Message-ID: <20250512-daily-saga-36a3a017dd42@spud>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=893; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=OdJgFJtV7rKCQc1yIMfDPlfVFN9LSEtX5xUnvHIIr74=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBmKf2T+mLgdDxV+fTzLfIZ75BsxlgCDvnsH/LaxnP3Re q+Xeee3jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEykVYiRYb+CoFo/yyb3l5sk qrWuPV91Ou1CYmUXxwHnnONmNy2SAhkZvjL768y5e4Dnz7b7LFPfCE7yOxez5WrjGgmGJZv1f/k 95AcA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

v2: add "-ax45mp" to compatible string.

CC: Ben Zong-You Xie <ben717@andestech.com>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-renesas-soc@vger.kernel.org
CC: linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)

Conor Dooley (2):
  dt-bindings: cache: add specific RZ/Five compatible to ax45mp
  riscv: dts: renesas: add specific RZ/Five cache compatible

 .../devicetree/bindings/cache/andestech,ax45mp-cache.yaml     | 4 +++-
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi                   | 3 ++-
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.45.2

