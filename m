Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AA71C5F14
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745908004; cv=none; b=TFz8m5e4iGqmy40GYbbSZrAwoVDPhluGEEH69gzLOJJU++IiiqtEfxQEVd43XG1aCaUGAyRFij6/UtFNGoDU8j1VijO/eg6g533GuR3rVcFO4QrOeoX8+3FdRNsijOtzCBIE0VxndAM8+MuFkBRugLTnwO6gKUv88QOKorvhgng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745908004; c=relaxed/simple;
	bh=qRBwxCPjrAEMnQU9tgT+tvB1rwycmOzjTVnF0rK6PfU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aOaccRQFRi/KNchJJotRBDcQvTGG+VH9RojHC+NZk/Fk5Dsd8iWrpSDUuaAbYfXhvjzfJM3p9fI2Xv7ibBDlRjPXKTtl7P0eieMjBHUeCGWAazb2lo4QsynFZAz3skf1X+2B4acNbDhe9sOWsPexs5aY6nZ+HaAUlJVrRNEsQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNQlRwGe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNQlRwGe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41706C4CEE3;
	Tue, 29 Apr 2025 06:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745908003;
	bh=qRBwxCPjrAEMnQU9tgT+tvB1rwycmOzjTVnF0rK6PfU=;
	h=Date:From:To:Cc:Subject:From;
	b=fNQlRwGezoEMDCirFgxxijTcBuPpD0r7xJqV+ooDIvDWHGMonaSyyNNCapEsnOZRQ
	 MNYkNk2boIX2kiYIBDN6ymxNCSdVf9154xOPZaFqbfkws3MdxFf0z34hNOKW0P/aDN
	 c3q/2KM9MtG6vaN8InDxERhhiYf+imAZ7Jwd8fk+R5Uu/u/mBkmxM8lmOSrpiqFtfB
	 rXyPBqhl+5Llr6uJ/ezR0r7kqtdlHSpz4bdC8Zv8yv2zK80AwzfIkQhRdJlFWfGU9q
	 h4y9tRGS90+nzjHoYfLXbHnt2KxbaFD1m/6TfO2K85sRKUnFCMi9Vx2gNDzSsebFvL
	 lVFEnUGCbMEcQ==
Date: Tue, 29 Apr 2025 09:26:37 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] memblock: fixes for nid setting in
 memmap_init_reserved_pages()
Message-ID: <aBBxHaHCu8qyO3E-@kernel.org>
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

  https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock tags/fixes-2025-04-29

for you to fetch changes up to 3b394dff15e14550a26b133fc7b556b5b526f6a5:

  memblock tests: add test for memblock_set_node (2025-04-07 09:28:01 +0300)

----------------------------------------------------------------
memblock: fixes for nid setting in memmap_init_reserved_pages()

* pass 'size' rather than 'end' to memblock_set_node() as that function
  expects
* fix a corner case when memblock.reserved is doubled at
  memmap_init_reserved_pages() and the newly reserved block won't have nid
  assigned

----------------------------------------------------------------
Masami Hiramatsu (Google) (1):
      memblock tests: Fix mutex related build error

Wei Yang (3):
      mm/memblock: pass size instead of end to memblock_set_node()
      mm/memblock: repeat setting reserved region nid if array is doubled
      memblock tests: add test for memblock_set_node

 mm/memblock.c                            |  12 +++-
 tools/testing/memblock/internal.h        |   6 ++
 tools/testing/memblock/linux/mutex.h     |  14 +++++
 tools/testing/memblock/tests/basic_api.c | 102 +++++++++++++++++++++++++++++++
 4 files changed, 133 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/memblock/linux/mutex.h

-- 
Sincerely yours,
Mike.
