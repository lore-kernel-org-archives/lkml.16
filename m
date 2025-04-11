Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C7027EC83
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350160; cv=none; b=ctC+QhxCQmT9kJqX6j2PRPykrPIBhVNYC0qT8AhuCi6XYqjKKl7oBl6MoPtLOtutNePnpCfYuCW/8SgSiGHWNCYKKkK3lWagRE29LIK5hcDkjzO0fc1hca9JMcWywXsnMlNfav/jRiVI/fqHtN5eolyQlYRXrSYh42GmmZWqiFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350160; c=relaxed/simple;
	bh=8IVnwtasieQj9t3fVVSgTrFtPxkH9TpWV5p25obbWs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GzaUtyZXCN4rNVDtqfovMJshY8YYOxw1HbqKfurc7YwHzT7iLmo9o/QwQfVfTgu7XZlxqGh+QbRRp5k25gFEHeTfvgMOt8N9guT08XRnj70rlrcZh7hpp5XVOlP9plZosCK3y5vTTk7vDVpjDso0lFqycUYZtJUMwRR9K/Bvjgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiEYpPBC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiEYpPBC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA712C4CEE2;
	Fri, 11 Apr 2025 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350160;
	bh=8IVnwtasieQj9t3fVVSgTrFtPxkH9TpWV5p25obbWs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kiEYpPBCB0VDGMI/axO7VRnVP9psx9Wpz59ICjJQmqnuCYT3BSe0VRNn/7Hj00uBv
	 ngwv1flW9MmQGVfsWmqhyj08Si/HIDqkAEsSLhQFSSdwWHPEVD1ZJvzs4bpUTq+rJz
	 QyESsVTtw892nGmTtLOcI9AKkOWE2ZYQJqYiMKyQB8AzeqwxKJO7A1KCUjKYg01Vwp
	 4Y2viO9jYbbuftSLFg4ydEaGbNaGHOyC1X7/CLFOMJ75QL6e5nf/5c/lfuZW2VMl3g
	 byVp3iSQayTEB8VfPSbkgavay4EZ71vGB7NvV4nYRzIMA37yk3ZdsFw439ZGyfLEhv
	 2dwKlWrlfb5UA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 37/53] x86/alternatives: Document 'smp_text_poke_single()'
Date: Fri, 11 Apr 2025 07:40:49 +0200
Message-ID: <20250411054105.2341982-38-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250411054105.2341982-1-mingo@kernel.org>
References: <20250411054105.2341982-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend the documentation to better describe its purpose.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index f0bb2158f27b..a9726cc96972 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2880,7 +2880,7 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
 }
 
 /**
- * smp_text_poke_single() -- update instructions on live kernel on SMP
+ * smp_text_poke_single() -- update instruction on live kernel on SMP immediately
  * @addr:	address to patch
  * @opcode:	opcode of new instruction
  * @len:	length to copy
@@ -2888,7 +2888,8 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  *
  * Update a single instruction with the vector in the stack, avoiding
  * dynamically allocated memory. This function should be used when it is
- * not possible to allocate memory.
+ * not possible to allocate memory for a vector. The single instruction
+ * is patched in immediately.
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-- 
2.45.2

