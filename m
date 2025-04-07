Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A3F267705;
	Mon,  7 Apr 2025 18:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744049685; cv=none; b=T0qSOvPNF+3CTlNkWsef9b8MkTNwHW9CINo0BMdPYNukPNKLIS4EjyvGxXbRZhOp9paROsoe43XijfSF52tQp7efEQ9+zCt+tdA4kENiQxzgqWNBcu862oux3Qxui2oCiZ3EI6Cpu0MqXOxszGCKVxMfB74sxPozQEA4tQ+JwyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744049685; c=relaxed/simple;
	bh=60auhyrboL/ZwZpJHheq4cqj9MXV+Wbk1i+Z0GHUTMo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HE49fe0v8dIZSmHFh+MWpLABPKW6jZm9LshoKwEn32aNCtCAM+C5NZMMil0K/cMHU9qiwY+3iAEGnkeYvoVRsiSkkU476H4BtNxUAqpAT5NhWwczFAMykJysQERjQWPn/c9F9P27MGwnLbDviX1fddGr2OIc1PkuqA1qpzW7Evs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nJuqTz6Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nJuqTz6Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62C0CC4CEDD;
	Mon,  7 Apr 2025 18:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744049685;
	bh=60auhyrboL/ZwZpJHheq4cqj9MXV+Wbk1i+Z0GHUTMo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nJuqTz6YMHBuw50X+DXx7JmS7hitj1TPuJtHKbMM1XK+PEepH+9O+EA9TFnDUMHqM
	 gjPjXjY6XGk1a2i9WNPXyyV+HkTzRofn3hvZcV9lXzHanFKKbopqt9qeVgTKMEx9aQ
	 xr0ygn9BkuO4xfOcvig6/MZDOlwS/aNsyPfz3LDrRYRaBkQVZ9dPUd2kMGAJy5CVPx
	 hrrPzpuByhfppuT4a90gRhB0nbAqEQcRrldGYSKmV9X6lqGyeb13HEhKXkP4ex1rUh
	 14xYlcMg4w55z9YUk/D5/gS80Mbl/4kgn41KP1lE6P2nSfxqHPvW7Q73K2NTdw2JpI
	 QHChScnGM3dzw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	kernel test robot <lkp@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 6.6 14/15] objtool, regulator: rk808: Remove potential undefined behavior in rk806_set_mode_dcdc()
Date: Mon,  7 Apr 2025 14:14:14 -0400
Message-Id: <20250407181417.3183475-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250407181417.3183475-1-sashal@kernel.org>
References: <20250407181417.3183475-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.86
Content-Transfer-Encoding: 8bit

From: Josh Poimboeuf <jpoimboe@kernel.org>

[ Upstream commit 29c578c848402a34e8c8e115bf66cb6008b77062 ]

If 'ctr_bit' is negative, the shift counts become negative, causing a
shift of bounds and undefined behavior.

Presumably that's not possible in normal operation, but the code
generation isn't optimal.  And undefined behavior should be avoided
regardless.

Improve code generation and remove the undefined behavior by converting
the signed variables to unsigned.

Fixes the following warning with an UBSAN kernel:

  vmlinux.o: warning: objtool: rk806_set_mode_dcdc() falls through to next function rk806_get_mode_dcdc()
  vmlinux.o: warning: objtool: .text.rk806_set_mode_dcdc: unexpected end of section

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Link: https://lore.kernel.org/r/2023abcddf3f524ba478d64339996f25dc4097d2.1742852847.git.jpoimboe@kernel.org
Closes: https://lore.kernel.org/oe-kbuild-all/202503182350.52KeHGD4-lkp@intel.com/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/regulator/rk808-regulator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/rk808-regulator.c b/drivers/regulator/rk808-regulator.c
index 374d80dc6d17a..bec22a001a5dd 100644
--- a/drivers/regulator/rk808-regulator.c
+++ b/drivers/regulator/rk808-regulator.c
@@ -267,8 +267,8 @@ static const unsigned int rk817_buck1_4_ramp_table[] = {
 
 static int rk806_set_mode_dcdc(struct regulator_dev *rdev, unsigned int mode)
 {
-	int rid = rdev_get_id(rdev);
-	int ctr_bit, reg;
+	unsigned int rid = rdev_get_id(rdev);
+	unsigned int ctr_bit, reg;
 
 	reg = RK806_POWER_FPWM_EN0 + rid / 8;
 	ctr_bit = rid % 8;
-- 
2.39.5

