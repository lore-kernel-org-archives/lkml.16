Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF95EEBB
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746281119; cv=none; b=NJ/jUHAPQPVTbMMhxSkZ9aSW0SF/9PFd5mDoyrA9grxuAX5gPDnmHhasEBuEjB89gXOTBlNU295eulYwRXTbe3uz1ozbZCDMNMgE7LFto2yE8QOZ01qf+2LgyCL+2IimBVB/lqfiRO4IX60tIgw7baZJmOyydPZGmG7P8gHKumQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746281119; c=relaxed/simple;
	bh=g9NJHAlBW7HIs4g5OZs65GWHHdecEv7BH2OMVTqtXm4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RWcPuL/KrEE+b9zqHGCmtjYYempn6p301DiHQaKpj1pwHQwl1Q/W1FHBdNq/VQYmtP4onysrDHiel7G0mYlrvbM8yngmOwXVn218RoJ6ahgi3Wht9Q24euiZFOMrS+xd663duYdngtLy/UNnBiTbfSneQyIcZ8pV83plfCMQaZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcQdPQhx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcQdPQhx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB08C4CEE3;
	Sat,  3 May 2025 14:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746281118;
	bh=g9NJHAlBW7HIs4g5OZs65GWHHdecEv7BH2OMVTqtXm4=;
	h=From:To:Cc:Subject:Date:From;
	b=kcQdPQhx6qjw/50nyP5lVELmS57Wke1KJP9KZU2MEN47M9P6JXFJH8eKItZ2QsnQB
	 2Cn6IJWIiLsAV17YXdj3WjwZoQLU3DjPoBxkfNqp1g9JWobNrBRvd6zzLepXPe1JBo
	 OBd1iESxQRohOC3+pZkbhxFFwa68OqOyPNazA5Y62Qs2IqbofuQGcWQ4DEp6c9BmsM
	 yTQpCjkvbzSfpXKbK7+FufsXTDZBeJKK+YGl6+JxVRkq5Vx3r6gvrljH7KkutjBaGj
	 5Ps1hGAjj5zqmoKynERQoPGmpjdp+dnNSdmHQJdaAV0dcstS+wxqYf5oH2yBE0SC/i
	 7M70TDTUWgclg==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64/fpsimd: hide unused sve_to_fpsimd() function
Date: Sat,  3 May 2025 16:05:10 +0200
Message-Id: <20250503140514.487947-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The one caller outside of an #ifdef was removed:

arch/arm64/kernel/fpsimd.c:676:13: error: 'sve_to_fpsimd' defined but not used [-Werror=unused-function]
  676 | static void sve_to_fpsimd(struct task_struct *task)
      |             ^~~~~~~~~~~~~

Add annother #ifdef around the definition.

Fixes: 929fa99b1215 ("arm64/fpsimd: signal: Always save+flush state early")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kernel/fpsimd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 92c1f647fef8..be8cb5b550a4 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -662,6 +662,7 @@ static void fpsimd_to_sve(struct task_struct *task)
 	__fpsimd_to_sve(sst, fst, vq);
 }
 
+#ifdef CONFIG_ARM64_SVE
 /*
  * Transfer the SVE state in task->thread.sve_state to
  * task->thread.uw.fpsimd_state.
@@ -691,6 +692,7 @@ static void sve_to_fpsimd(struct task_struct *task)
 		fst->vregs[i] = arm64_le128_to_cpu(*p);
 	}
 }
+#endif
 
 void cpu_enable_fpmr(const struct arm64_cpu_capabilities *__always_unused p)
 {
-- 
2.39.5

