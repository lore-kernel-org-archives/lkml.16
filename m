Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4320125A2C0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 18:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568438; cv=none; b=jIuuGhqWnRtNZxqvSnZRUe4fzNXWmX92QVcijybx7/FkZHiUh7sJ+RU4HXwKDnUIuxWi6FTyDDQlADNiNYT1Be/zIsafMjQrtM0iyhyUS+fmlDZOwKb4T94lZuK4pifSyG48VMZbMKH5MM/FGPqBKL5yU6zspl/4GfAIlJUgNOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568438; c=relaxed/simple;
	bh=TcQaXnWW6IUn9W4dMLk8v54EINbNUwiCmBsDGPUcV9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UIuQJAwwJfIfjj85VrcdL+7+WPRAdIEZ9j5pFVDxWUatXBmX4uzO3C/890hglXCgSaz4Q7DAgcs+tF3yRkkKmoZ8zgi/1WcSBXIArrvpPGMXwPwY2jfQqBv4yCCH+qndPj/Wcy5MPMUzAtzH7mrcAz1YbiVOtccmWvhMrjJgwdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joKLbCdN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joKLbCdN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0F2C4CEE3;
	Thu,  3 Jul 2025 18:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751568437;
	bh=TcQaXnWW6IUn9W4dMLk8v54EINbNUwiCmBsDGPUcV9M=;
	h=From:To:Cc:Subject:Date:From;
	b=joKLbCdNiiG13TDNpoytVPeFUUL8750bf6Cecxg0/m76e1dbAj2H823Xfu695ZgGH
	 uFcTNifsjXvePP1y5zuQiBPs0CM0hgmUm9Qk5AG1WM8L1AryUtnJTEnprBp3DMNxVh
	 4+IVaSMUt/yAyZeP+TRUYpaHVllF5/3Y+mvrDcc32EdGttw+aAG+oLLPh9hJVjMSXA
	 qJ6Omi3ZETcj/R+LsiTyCPyuSqU7ODcUmK2Rh4I1cE2/6C7dJ6YZ697mI775Hy6Tvm
	 U9iVvFMSiqzP6gFudVQiYjhju0gEj0XHVFG1GUzHyyWBuCSdFKN6HCo6uS7IlX/c0+
	 0y5HOsO6DbyEQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pratyush Yadav <ptyadav@amazon.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 0/3] cma: factor out allocation logic from __cma_declare_contiguous_nid
Date: Thu,  3 Jul 2025 21:47:08 +0300
Message-ID: <20250703184711.3485940-1-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

We've discussed earlier that HIGHMEM related logic is spread all over
__cma_declare_contiguous_nid().

These patches decouple it into helper functions.

v2 changes:
* use already declared 'ret' rather than 'err' (Oscar)
* rather than factor out only HIGHMEM allocation move all of the
  allocation logic to a helper (Oscar and David)
* add Acks, thanks!

v1: https://lore.kernel.org/all/20250702173605.2198924-1-rppt@kernel.org

[1] https://lore.kernel.org/all/aCw9mpmhx9SrL8Oy@localhost.localdomain

Mike Rapoport (Microsoft) (3):
  cma: move __cma_declare_contiguous_nid() before its usage
  cma: split resrvation of fixed area into a helper function
  cma: move allocation from HIGHMEM to a helper function

 mm/cma.c | 315 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 165 insertions(+), 150 deletions(-)


base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.47.2

*** BLURB HERE ***

Mike Rapoport (Microsoft) (3):
  cma: move __cma_declare_contiguous_nid() before its usage
  cma: split resrvation of fixed area into a helper function
  cma: move memory allocation to a helper function

 mm/cma.c | 312 +++++++++++++++++++++++++++++--------------------------
 1 file changed, 162 insertions(+), 150 deletions(-)


base-commit: 86731a2a651e58953fc949573895f2fa6d456841
-- 
2.47.2

