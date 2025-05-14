Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D083327464A
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747238127; cv=none; b=gISIk2ZOo+IXSs/KLD1XtrAXEFKdQ9GoTIBZuoG3i+PF+xtHD45Ka1ODkTt7rinC/kJIoKxxRak3SqQQli28LP4kgGTkJeON8xF1zMC++csApdlR9fBKsJHWztfsQ9LpIBvgjTcfLTt5WuNfXToc1PdtGLA9A/SdZdtlYrK3fgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747238127; c=relaxed/simple;
	bh=LxaouEa62R9bUZ58f8ZlZzAvQOpG2DjBAinwJJVeb0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7tqDSoZjv0DlOCUQnEs9HjNwDOPdqOpTffDArCOretT4lEqKG/CjgpY86G3PSmAETIs28kZK+hQgCH5qGoJncVIDyFnD+80f9JeK9KPtnJZ1cN9MjUSz6HrqGS2StZS5Tdr8N1FBVBKPPTKSuRO/BL/72jrfYbC1IVzaUUYXEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMiHZgku; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMiHZgku"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F88C4CEE9;
	Wed, 14 May 2025 15:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747238127;
	bh=LxaouEa62R9bUZ58f8ZlZzAvQOpG2DjBAinwJJVeb0Q=;
	h=Date:From:To:Cc:Subject:From;
	b=DMiHZgkuqraG3Sk5/wZDnyuK0LsRlRjO+rjavIrHN+j9PXgSF4mBEQSkjWvyMoAdS
	 /xzQhwBl/YLVxYpPwA6qa2vax7lBFNBLbMdAnKLRg0RTgFAA4ZACsAHxCaYOLn1SRP
	 IWVVeeHhKKhCjxx2T8Ri5rxip74+mlY0MpRkIGEOUHekmUnEAVfVGe6oqZFE2bpCFP
	 6IvGXJmkofy6U+M+oIjyVtM2vYBAqrJYSYYwPrY3vha3KcIOaA5WL+4Sq2UzFGmbNo
	 Vz+4+uv34edlkstRj+KGtonF+5H7/6MmsjQZpZnkT2PziUPYgiqtXI5AGPuFhesMtq
	 UtRGY4+ND6mFA==
Date: Wed, 14 May 2025 08:55:23 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>
Subject: [GIT PULL] execve fix for v6.15-rc7
Message-ID: <202505140853.4D9C198E2A@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linus,

Please pull this execve fix for v6.15-rc7. This fixes a corner case for
ASLR-disabled static-PIE brk collision with vdso allocations. It's been
in -next for a couple weeks and I haven't seen anything new pop up.

Thanks!

-Kees

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.15-rc7

for you to fetch changes up to 11854fe263eb1b9a8efa33b0c087add7719ea9b4:

  binfmt_elf: Move brk for static PIE even if ASLR disabled (2025-05-01 17:13:53 -0700)

----------------------------------------------------------------
execve fix for v6.15-rc7

- binfmt_elf: Move brk for static PIE even if ASLR disabled

----------------------------------------------------------------
Kees Cook (1):
      binfmt_elf: Move brk for static PIE even if ASLR disabled

 fs/binfmt_elf.c | 71 ++++++++++++++++++++++++++++++++++++++-------------------
 1 file changed, 47 insertions(+), 24 deletions(-)

-- 
Kees Cook
