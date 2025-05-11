Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86F68635D
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 05:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746941498; cv=none; b=Ew6XO+yzc9ezTXdDL0y0BeqN7fxPq9edP3uuPcj4RO5wnxOUpP4DBbL+E9bRSVuVQIHQ8i65lfxzUueBBk0BX1eJeHtHBdPPU4zbODLOgu/bOjOfu4UHstzd866tTrwd/qH6y+w24rSQ/Aw7+EFQ3VEVC8LyybgPv/6FgBttPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746941498; c=relaxed/simple;
	bh=L0ZeNcfNs7VEvAThiL2/Xt1T4t32hHmX9fa+yI++6FU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aBd+VqhqmGESMTZidy7r2AzcSBCp+1krBgBXXaoExR2KJAnCUzQvKsh7a9z68HC7Bw8j/ezVUorOQUJC/WjbKFGjFdDGGo1IrBFLvYS1UPFz6PJscJb+K292GywYm5V9aykr/zhHEe/7ZJ/f1RhTngxyAc9fRmxA/f6U/k9k/Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LGDY2MTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LGDY2MTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CFF5C4CEE4;
	Sun, 11 May 2025 05:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746941497;
	bh=L0ZeNcfNs7VEvAThiL2/Xt1T4t32hHmX9fa+yI++6FU=;
	h=Date:From:To:Cc:Subject:From;
	b=LGDY2MTURvp5edZOKg83d6KJoMVp80ktZouf+1z9sXe2MoouGYpX9+Y+kLmMvCJcv
	 0js0Mpg2XMGhONkWqJVj2s514Ys12Ls2KVeQ5guDKKtkFmBemdey4lT1PsJX0b9vpf
	 ykeNSXy2DxcxqQzTiXO2zU/ZidQUBE/IZoqQvPRhJhu3ztMA8XJLw1UasoHnGlslS5
	 UG9+tjxZoI1yBgr7iMc9cfLKTKPY3yn7Tlxo3C4ACEuRNmWGiHuu1gn7DL+FLVrJo8
	 96zWUYRd0eae16KMADe8SURblDkVWXfmD/bNHwCRek/iChwJBi3ScqhuI9qxk6I5FC
	 PPhhJYwzbWaRg==
Date: Sun, 11 May 2025 08:31:32 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
	Tom Lendacky <thomas.lendacky@amd.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memblock fixes for v6.15-rc6
Message-ID: <aCA2NKxG7r8QsJpw@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 92a09c47464d040866cf2b4cd052bc60555185fb:

  Linux 6.15-rc5 (2025-05-04 13:55:04 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock tags/fixes-2025-05-11

for you to fetch changes up to da8bf5daa5e55a6af2b285ecda460d6454712ff4:

  memblock: Accept allocated memory before use in memblock_double_array() (2025-05-09 08:53:12 +0300)

----------------------------------------------------------------
memblock fixes for v6.15-rc6

* Mark set_high_memory() as __init to fix section mismatch
* Accept memory allocated in memblock_double_array() to mitigate crash of SNP
  guests

----------------------------------------------------------------
Oscar Salvador (1):
      mm,mm_init: Mark set_high_memory as __init

Tom Lendacky (1):
      memblock: Accept allocated memory before use in memblock_double_array()

 mm/memblock.c | 9 ++++++++-
 mm/mm_init.c  | 2 +-
 2 files changed, 9 insertions(+), 2 deletions(-)
 
-- 
Sincerely yours,
Mike.
