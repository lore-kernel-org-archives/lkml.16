Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D152AF07
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 10:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750416610; cv=none; b=unr086fGFJHYmyOViAjC2EQSIUJjxjcbAR390s7a53tMHQT8sjAL+5ogSzBz2KGCRX7/1QpeZN2D56z9mcm0124i/pt67HXrj2xWex07ezBS6VjMpiREYE0zAn+Q6zjh3N7ZH2d/1U0nXFeKO35/IAoS+gDkmXDcdzt1yX9fPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750416610; c=relaxed/simple;
	bh=vCwR+vgZaANWT+DX6tuXMLx5vzPlxMcIfrhlOdZgpE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPwlqeF3O9R8oWZGeW5/qKWlY183s7VnO2J886ycNTplMPbK2wXtxOtR6oxt/RG/QTgSv6IK5geEf833YLBMz30tkkW2w4J2GA3k2lM1VN5H3EmnPrjYPLqS485iFjGdJycRi6XpRzqHQRzagxNNQz0I2uvO9vlJG6K08BEUqPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eHFzJ+E7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eHFzJ+E7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EF55C4CEE3;
	Fri, 20 Jun 2025 10:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750416610;
	bh=vCwR+vgZaANWT+DX6tuXMLx5vzPlxMcIfrhlOdZgpE0=;
	h=Date:From:To:Cc:Subject:From;
	b=eHFzJ+E7tzfit7vZPwamrR96dRzKK40YBJ5L8zwfpfmezE697ryxGA5+B0QnjFlC+
	 XOg70mzx+mQ9k6/WPClZXDuJLkjGmU0ZwiM69v2qGy9ckITaKNl6WCklzU+gaBQFnV
	 YIE7mrsVAR17y9GPsnhd4ksecWrRsNunrH8637RhuuZND/0rNGdQs4auoWNvwusbd8
	 hRNjs734BqfCrUzLJ1/rrWgPUS5codBZE0gVXty4st2jRuTIN7NhyFvDw27kovakTT
	 fzYZNa5hTdqSTaRJODM2/b6BvaPb9iJe4BTJTLUNQLhOLK7eOUDDEnrzGhXHwoodBy
	 zMhJYWhccOGDg==
Date: Fri, 20 Jun 2025 11:50:06 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 fixes for -rc3
Message-ID: <20250620105005.GA22615@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Linus,

Please pull these four arm64 fixes for -rc3. There's nothing major (even
the vmalloc one is just suppressing a potential warning) but all worth
having, nonetheless.

Cheers,

Will

--->8

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-fixes

for you to fetch changes up to 39dfc971e42d886e7df01371cd1bef505076d84c:

  arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth() (2025-06-12 17:28:18 +0100)

----------------------------------------------------------------
arm64 fixes for -rc3

- Suppress KASAN false positive in stack unwinding code.

- Drop redundant reset of the GCS state on exec().

- Don't try to descend into a !present PMD when creating a huge vmap()
  entry at the PUD level.

- Fix a small typo in the arm64 booting Documentation.

----------------------------------------------------------------
Dev Jain (1):
      arm64: Restrict pagetable teardown to avoid false warning

Lorenzo Pieralisi (1):
      docs: arm64: Fix ICC_SRE_EL2 register typo in booting.rst

Mark Brown (1):
      arm64/gcs: Don't call gcs_free() during flush_gcs()

Tengda Wu (1):
      arm64/ptrace: Fix stack-out-of-bounds read in regs_get_kernel_stack_nth()

 Documentation/arch/arm64/booting.rst | 2 +-
 arch/arm64/kernel/process.c          | 4 +++-
 arch/arm64/kernel/ptrace.c           | 2 +-
 arch/arm64/mm/mmu.c                  | 3 ++-
 4 files changed, 7 insertions(+), 4 deletions(-)
