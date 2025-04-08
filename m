Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C39D218587
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744100487; cv=none; b=HpcZq+WbRcoVDPCtujqncguLx7tIhF+nhELZYWOA9xDNH/s8J66H0o3mEuxRprS18nDJFrxth6NN6ueh9U89pB3rmpn6lU+lUp/rMqOCiR2b3Qud35i/CN3358cBj0QJ3IN4XsOwE8JDs65Y6/I1J1JgKhzOi0dy9lA8mNn0RoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744100487; c=relaxed/simple;
	bh=OzubH/iNw9h8hZuS0TT0EdUvu9fzgbimX42quzovMK4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SsE1P3lZpZhOyLzZghV0axYS6k/aOPsloYNFyIn6GgdhBoNE9dfOn4qMibTsW1pshl4BoQUvxMwT09qI0iyrEMUUpbDJQVdlKO2fDKnGZN6sroXcU576UIGx2LN7yDuczTXOGT1NhlsqvZIYYpdoTGeUsR1wt6DLb3MHFAh1dq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOqyAEbv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOqyAEbv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998E1C4CEE5;
	Tue,  8 Apr 2025 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744100486;
	bh=OzubH/iNw9h8hZuS0TT0EdUvu9fzgbimX42quzovMK4=;
	h=From:To:Cc:Subject:Date:From;
	b=TOqyAEbvBPMglz0f6GonBJBZgmeCD4zWmmV2xSA8BKmbVA2x3n7v5N/DULjsshqeN
	 qCrDu1I83lDepJT6pGvpcDhhTy3kOhg4pXgfQ/QnW6zWiAQ8A+W5HeYlOMUWk4VT8/
	 NQG1k5LXomkQF1zkASy/X56K7JzV2ZIAcn7DMUfSl5pZoofe5ZH+HoCLnARdxMakEu
	 9tstbZHa6r34hMOL002wU7EFWHwsFtsz6Z4ju0DUVKCHLuukb3DjZOk329FmXXKyk1
	 9EdrqhvlUucL2pL5gUQcTa5fFJ8cisrOiwSpbjSeI2SNiHf5Po5f0Kiq0R6lSNAoVO
	 qgUnSv1gaEBzA==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH RFC 0/5] x86/asm: Improve code generation
Date: Tue,  8 Apr 2025 01:21:13 -0700
Message-ID: <cover.1744098446.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some various improvements for inline asm code generation.

The "RFC" is really patches 4 and 5, they propose a more readable format
for alternatives and objtool annotations.  Bikeshedding welcome.

If a general format is agreed upon, we could do similar for other
annotations like WARN/BUG, static branches/calls, etc.

Josh Poimboeuf (5):
  objtool: Remove ANNOTATE_IGNORE_ALTERNATIVE from CLAC/STAC
  objtool, x86/hweight: Remove ANNOTATE_IGNORE_ALTERNATIVE
  noinstr: Use asm_inline() in instrumentation_{begin,end}()
  x86/alternative: Improve code generation readability
  objtool: Improve code generation readability

 arch/x86/include/asm/alternative.h  | 88 ++++++++++++++++++--------
 arch/x86/include/asm/arch_hweight.h |  6 +-
 arch/x86/include/asm/smap.h         | 12 ++--
 include/linux/instrumentation.h     |  4 +-
 include/linux/objtool.h             | 97 ++++++++++++++---------------
 tools/objtool/check.c               | 30 ++++++++-
 6 files changed, 149 insertions(+), 88 deletions(-)

-- 
2.49.0

