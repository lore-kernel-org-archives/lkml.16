Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EDD29C339
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350170; cv=none; b=YnrBqPoTvNWwj8Iuxrop/HWBRUqCv802Qq8/fVV23m160nER16I2kwuv0wprbwCNwaEapO9u8Kz9jfZ9iCMyFT+QAtQjVU0PCzdM0Mg7SjDLDcqUHx3SaqA7yYpSLBf6aa6g6hwNph2SPOlGZLSRK+lQMulG0K5Yjp9Nx+3GU+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350170; c=relaxed/simple;
	bh=c7hl833vaOXPDceZ4VYoTj+KEMlhRXA+jNoUUU6pIbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C86TaLPqgE/IEuhmaB0aePcqfENsnRjQCPkxOXWI+D9LJSi6IYLxNCUD8L6hq1EK67RNm4MKHHc4br9IUhTJOEufE5m924wKEwxzXgYyCBGag1XhBCIKMiBWu+EA3WAx0MggplJ762EylHTMEFxGz+XopFSDwl8HGbhNEWOXadc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WvAWmSB4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WvAWmSB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E73C4CEE5;
	Fri, 11 Apr 2025 05:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350170;
	bh=c7hl833vaOXPDceZ4VYoTj+KEMlhRXA+jNoUUU6pIbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WvAWmSB43lT8BPWWGWkoP00HBGDbKFbfWlXHO/ag55fe0HzLlJ6qPf2dBz8DhXtYR
	 47mdei15TvPEuHgflbjeeBn534Yc93Rh2f//JKiQ/JL3OryUZLBHG0jZamcWKuvpGs
	 kE9UVe+AqyGRm2oBk/vs413yQSRfTmAokVa9r13o7/7RGF5hM+qVF3goG+X9wYFSLj
	 4Qn2Vplio+t80Zht4dZP7EIU4rTbqc5y+mTv/nURk9kX8diT3B9zYRn9KjAoCUtxsJ
	 +UKQaygMQQMIyU3RwWvmLLVJbUCULstXE4q+fV5CxbtGkk17WUcjzyoHjLmK8YUscl
	 aRU4zAIAl/ADA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 41/53] x86/alternatives: Simplify text_poke_addr_ordered()
Date: Fri, 11 Apr 2025 07:40:53 +0200
Message-ID: <20250411054105.2341982-42-mingo@kernel.org>
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

 - Use direct 'void *' pointer comparison, there's no
   need to force the type to 'unsigned long'.

 - Remove the 'tp' local variable indirection

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index e4c51d81a72f..a747b0885f9a 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2838,8 +2838,6 @@ static void __smp_text_poke_batch_add(void *addr, const void *opcode, size_t len
  */
 static bool text_poke_addr_ordered(void *addr)
 {
-	struct smp_text_poke_loc *tp;
-
 	WARN_ON_ONCE(!addr);
 
 	if (!text_poke_array.nr_entries)
@@ -2851,8 +2849,7 @@ static bool text_poke_addr_ordered(void *addr)
 	 * is violated and we must first flush all pending patching
 	 * requests:
 	 */
-	tp = &text_poke_array.vec[text_poke_array.nr_entries-1];
-	if ((unsigned long)text_poke_addr(tp) > (unsigned long)addr)
+	if (text_poke_addr(text_poke_array.vec + text_poke_array.nr_entries-1) > addr)
 		return false;
 
 	return true;
-- 
2.45.2

