Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5411C1A3A80
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 10:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744541125; cv=none; b=QCqb/FUsljf7RGfTTtkhHk9LayuenEDxzMqfW3lf/WIOUvgKSoumAtGiejTVEoOZfA6Mm+wVMdOojz1YVJD5m3akD6DAhID/qdxdG0UF9pJvhYqGL3dAW6bm5JGDuN1mnK4HEwnDwFC4pG3W2H4hANNzeAvzVvi5bCpsOj2PMp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744541125; c=relaxed/simple;
	bh=AJL0CDqIx0xIbEJu/Xf67GLDBdvbhcm5WC10joUnXb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GAnYqV79QJyDyicScnsyzhSZqZyDcF2yuah+EspfoXqvRqG9LFsZvpM9SuBafMD0zq0SuL/5ef+HUDDvS785KLc9ifDLLaF3PjSw6rIR+bc3YwrR2TUpxObiVESjkFuKWn9P+JIc8APIQS43FKf/+HoC7Co2ITYOert6o2b1Spw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFkjIC2m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFkjIC2m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6386C4CEDD;
	Sun, 13 Apr 2025 10:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744541124;
	bh=AJL0CDqIx0xIbEJu/Xf67GLDBdvbhcm5WC10joUnXb8=;
	h=Date:From:To:Cc:Subject:From;
	b=iFkjIC2mTJamdmm2FYK18oCsU/we6FTnTYRXNDZAaXZ8QuiFs8EUzizwu9LlrewV3
	 Jc842VOevFC05oO8KhkdE9vhISmWB3UnA1K6i7KqmtaqAO7n0JGml/pgRH8qQ/Fnrk
	 /2XjXwJfOtOgbvMCbc/JreGC859Z1++np9nImMFagFmXSPrq1CLjMC+/TVTk/HpTrF
	 2Lr62wNKHgZBU56VHRSsl2r4TrriOvgw9Ls9pjtwvz1Itbq6K47BmjiGiun4oMPEC/
	 99thN9nkVbVujehFKhY8JzmTEiMe1vTY6NGovnxDs8HFO2MdlSnjCJ33LdCGvNOWRx
	 PjqqABhXE/HqA==
Date: Sun, 13 Apr 2025 13:45:19 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memblock: fix build of memblock test
Message-ID: <Z_uVv28hqoc03UMg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock tags/fixes-2025-04-13

for you to fetch changes up to ed471e1984939a500eea179bc16e1c2aadf00db5:

  memblock tests: Fix mutex related build error (2025-04-07 09:28:01 +0300)

----------------------------------------------------------------
memblock: fix build of memblock test

Add missing stubs for mutex and free_reserved_area() to memblock tests

----------------------------------------------------------------
Masami Hiramatsu (Google) (1):
      memblock tests: Fix mutex related build error

 tools/testing/memblock/internal.h    |  6 ++++++
 tools/testing/memblock/linux/mutex.h | 14 ++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 tools/testing/memblock/linux/mutex.h

-- 
Sincerely yours,
Mike.
