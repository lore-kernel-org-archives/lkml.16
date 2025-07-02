Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A9D2F50B2
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477772; cv=none; b=ik0pNt+6KbHCUPRv9/36pbfFGM2lceAjTKgvm81sWcbkF+8PWZu8lMjlBzmQ79edLAFKaeMr6urWdxfGPjbndSUWoDHdR4lEL2adp8ajZfEea4nTtXhk4Qb7/iLZNLt8imORkqLy6J4nqZ+uZJPtZt9q4l/C4UORz7z73USA7xY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477772; c=relaxed/simple;
	bh=Gr3Ve95+6vneq95YADNHp0XvCrzGX+l9hyFLnpGs5/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pmKUNuWkyxc4znmEEP/GugzjlstL2nRjxa7QV2tIZWnKWSq1kvsiB0temgOVvp1dpvhQbvu2l6SeNvL8KrnXIrHC1XGQ9x7B6DBD0TtowJhiS3pTvkAHjUFekG1BPuvB+9MfRWkXPxNsoTiNFsLGSDzBjyndgZPycgzd0ntCfr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DA9OZ6Xa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DA9OZ6Xa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC75DC4CEE7;
	Wed,  2 Jul 2025 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751477772;
	bh=Gr3Ve95+6vneq95YADNHp0XvCrzGX+l9hyFLnpGs5/E=;
	h=From:To:Cc:Subject:Date:From;
	b=DA9OZ6XaPQhKSNN8L9LXTw06LvNpWtkFRBg8ytk6kYDWw6vzgjR06iCaUQGIVHAmX
	 /pyLhXduQ5RhTiz01TdbViGCu7gJI0D7LU/tpAEplQMFDKKC1+bBmZf01oNEBRAc44
	 +mz7g7ruD4I0Ehi+tWNttXAFp+7oeC/1Wn4O0aji82nNZdJdA36obtmJNCkxk50PrG
	 UOSFMmqoWQrdSmNTqJm8mLEbj+bI5+VxehSeQcV5lkmuIsbiZDZE1fsqgUD7OjTh44
	 UnH0anQJfgKV5Moa8Vf5xIVlcjSWw57kXMZhJz85MSmEMRBuNVjwDieI/BrAfzSCaQ
	 usUT0iOFqcbXw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Pratyush Yadav <ptyadav@amazon.de>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/3] cma: factor out HIGMEM logic from __cma_declare_contiguous_nid
Date: Wed,  2 Jul 2025 20:36:02 +0300
Message-ID: <20250702173605.2198924-1-rppt@kernel.org>
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

