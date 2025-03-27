Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A6D1F7554
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108900; cv=none; b=PEW8B87AOHLWQCJdsAJGz6CneLA44Q8WlXSIRcHtaXGG8qwpkzoMSbmuZK+tqhVtF9m8LZqgwQ66eAPJ1Du1LOtjBUqdLblWYVTc7QFr7ycMRjJSm3f2i3aQKvxzXSf3HvD+gUiUwdPuF+o/qO9vInUQdWv9k+VIzKb2lwYB6jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108900; c=relaxed/simple;
	bh=eW/8xw42s/o29z5huZ2CHNrtEu9TIFBu/E2GltPYfx8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TEyoyE6qnaW2Kg5D0FYz9gSGgWavMswZGuxwF8LX6yblKg8zmq7Fbqtxn86SzlI6/+joCnQ6jhUYV9oE1hLUw59QnfaKPcUQxKOc/f2N07/xGj6kV7bEFphxURMef05tQids4aac2PVDlBrmlLLVEIxQOqBYNXfj53owEcDdcvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTUklnma; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTUklnma"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D10DC4CEE8;
	Thu, 27 Mar 2025 20:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108900;
	bh=eW/8xw42s/o29z5huZ2CHNrtEu9TIFBu/E2GltPYfx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qTUklnmaK7a1yadaXFYAKq70RUz3OkmvE94vFVDV5BZ5AiF12ySh1OfYrSggD+cFx
	 hH2//iyJ0pfzh/u+q45F1VQFDr6FXreIpxmDJW+EDy+VziVzEAIFFA8TzjnBOrTk9+
	 Yv0Ce4c36PwyBpdoqhWIcJb0KHLSU/pRK/MmpxY/NPljxF1pgOq19tputXkqzbHQlb
	 cUUqbDLjh2szFTxdzabCQUyq9Ilu6diw2ZTrh+GEQpFzDLqxIxL975RIpgKVytArtH
	 MhgZk1Nns+JKNJ3D3xFNeEWx2M6XqcAxboYo5oD71rELVOFezmAgmQ5o7BuFiIpaln
	 YeOAxn9yYjz+w==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 25/41] x86/alternatives: Assert input parameters in text_poke_int3_batch()
Date: Thu, 27 Mar 2025 21:53:38 +0100
Message-ID: <20250327205355.378659-26-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250327205355.378659-1-mingo@kernel.org>
References: <20250327205355.378659-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

At this point the 'tp' input parameter must always be the
global 'tp_vec' array, and 'nr_entries' must always be equal
to 'tp_vec_nr'.

Assert these conditions - which will allow the removal of
a layer of indirection between these values.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4f23f6b4d51d..393d796e797d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2627,6 +2627,9 @@ static void text_poke_int3_batch(struct text_poke_int3_loc *tp, unsigned int nr_
 
 	lockdep_assert_held(&text_mutex);
 
+	WARN_ON_ONCE(tp != tp_vec);
+	WARN_ON_ONCE(nr_entries != tp_vec_nr);
+
 	int3_vec.vec = tp;
 	int3_vec.nr_entries = nr_entries;
 
-- 
2.45.2

