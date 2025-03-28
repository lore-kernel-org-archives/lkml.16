Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9481E4B2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743138266; cv=none; b=F+nsg9oL1qBfBuu1iloqGcN0Yw2W6FiPk/41tE0M51p9THISA1s9pnC25fjL34luwJKP3kf8zErjV2XAvDXXYh7YgDC67ODtf4blcrCxKDv6qoOzXLu0fKP5VfzDxbmnD42BuYnVrVEvwoQyx6le+ip/pItE4RwOrRtiKdq1mKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743138266; c=relaxed/simple;
	bh=08nGmJVmbFUEEjKgAwrwwri+iDle7j4sBHU8/J41fHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HsnhRRtk9kYyy3xsA26/bZLEdXW2IbesitA6dQT4xkDYAsLCR14/lPuNFoeBLFv4ZP4aGnCy3azDcBSwKToDa61ZIcs1hh3B95uOdACIXghVVGkmJClwoFDzspYMu40Xt7HbIpyidVSJz6Ku8UK/Wn7QA23wMCd7ehNWZ9J9Kl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BuWpNYJh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BuWpNYJh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F21BC4CEE4;
	Fri, 28 Mar 2025 05:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743138265;
	bh=08nGmJVmbFUEEjKgAwrwwri+iDle7j4sBHU8/J41fHU=;
	h=From:To:Cc:Subject:Date:From;
	b=BuWpNYJhvXKPt10SGS6S4feh1iGJxmWT50s2VohP5XWqlK5nUc7lPLCD0NVRWuHz0
	 S4gfQ9wxoahgLwBFfZyNqgvDgwWHyZHIUJfTVvQ07luPnzV8Kh9YjRYOfZubI/ozos
	 q9ua4cFhyyOeLMtb/pz9jQ5jdT5FKiAM5FmF99hrN7+nhHstuDi+srt/0ZD07PIuV4
	 ZvLG/qhKYgPd8W2RDcJrhmbxj4XY2AUxfPmows91512kwqaxwtVLrrlUlDNulsZGwc
	 cvJXu1ojdA0MzxdCoH1BkigE1onCak2HPMvH1FqZNltis1rYCBQy+29IDMWWf8qu/6
	 UMYqJRKKZI4kg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/3] More objtool fixes
Date: Thu, 27 Mar 2025 22:04:20 -0700
Message-ID: <cover.1743136205.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patch 1 fixes an objtool seg fault which was seen in the error path of
another bug fixed by patch 2.

Patch 3 removes an unnecessary function ignore for ORC.

Josh Poimboeuf (3):
  objtool: Fix seg fault in ignore_unreachable_insn()
  objtool: Fix STACK_FRAME_NON_STANDARD for cold subfunctions
  objtool, drm/vmwgfx: Don't ignore vmw_send_msg() for ORC

 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c | 2 +-
 tools/objtool/check.c               | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.48.1

