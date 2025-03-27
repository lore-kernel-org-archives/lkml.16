Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019491E1E03
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108932; cv=none; b=DpNKvWig3Kw5X68xz0eUIHiw/osdTNqSVR5E6mR70L7ssFZOLJdUf2/l6Yq4dXsLC47UpfQK9iZ6jDNNA3YLR0ao5c3giKk1vhH8AFk7cGdLaHTK+8Zsaq4Cokt8GHbuxdi6pSJ9aPCHhN0SORb5nF/5rc35sya8YZ+rk7cdo8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108932; c=relaxed/simple;
	bh=HoQveO0faaYUoFjWPwusKNMrw5MJAE1bF14xLtyj8eY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g72sMevrQD7JaERUuNg/BX3PutSfyHy2f8tZhorsl4LtmgOKceHGyUPJMtfG3DUZUbyV0ZQk4EtUBNhm5vfULZxT+uukZYo+2otVkB9OMsG90rkfBdbGovs8GcXVIEauxumjutgbKiC24vH3IWlaryn2AOLmdmjt+yuDE7u8RJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gWba+j92; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gWba+j92"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DEDC4CEED;
	Thu, 27 Mar 2025 20:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108931;
	bh=HoQveO0faaYUoFjWPwusKNMrw5MJAE1bF14xLtyj8eY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gWba+j92Od66vSce4cx0+yMFEra62orchrfe1wJgiN5oko4vysfWprWVHVFWc0bGT
	 AsThOnXwMJ/RudFMrEEURR9HBo6r2BJ4Ox3cCnsHAY61cr9LW5qYL9OFQQ/FxnJc7H
	 3YGyamFZdYOy0h6xDA9x4sE6zVaruZOSkmqX8DMMj0R+h9tEZ3ABF4mlzEltrfIdss
	 pjfrHGpEpOX7VKWuZbBPlfSIJ/nsyesj5esL7uThTAYCCu0aL3aBXO+GYocqG1ygG3
	 aOm5EzJtp265msOsdNjSEx1Pv37NMrzz5MTy/5V89JcLhJ6EcNiw7E8byIHG51xHYD
	 czSAVjVB9htlQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 38/41] x86/alternatives: Add documentation for text_poke_int3_queue()
Date: Thu, 27 Mar 2025 21:53:51 +0100
Message-ID: <20250327205355.378659-39-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 6e2fab1768e2..ba322a29aefd 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2873,6 +2873,19 @@ static void text_poke_int3_flush(void *addr)
 	}
 }
 
+/**
+ * text_poke_int3_queue() -- update instruction on live kernel on SMP, batched
+ * @addr:	address to patch
+ * @opcode:	opcode of new instruction
+ * @len:	length to copy
+ * @emulate:	instruction to be emulated
+ *
+ * Add a new instruction to the current queue of to-be-patched instructions
+ * the kernel maintains. The patching request will not be executed immediately,
+ * but becomes part of an array of patching requests, optimized for batched
+ * execution. All pending patching requests will be executed on the next
+ * text_poke_int3_finish() call.
+ */
 void __ref text_poke_int3_queue(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	text_poke_int3_flush(addr);
-- 
2.45.2

