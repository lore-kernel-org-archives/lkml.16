Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BF91DB34B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233102; cv=none; b=hXpn+0qSWJ1OVU5POPS2nBTUU0wxGTHSYeQnxf9aXJEruK/gfUrR8CKtL6pXd12gM03xoJ86BrAkZN9sq5mVMKmZX++iOgm5yDzwptGa4jirlgtdO1KvJTqm85Lm103ROJjPnb+XljG2V+ededstTa2NXM7n1Hd9OxCHu+A9a1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233102; c=relaxed/simple;
	bh=eJTlTLsy0my7U6cHhkhoHNY8hFx6eYTSa9v4rjr5Vpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c0CTZM4VhJUbFvuSs6KNtd3nEtEtMI/sSQMM50NgAgJpX3FMFj/Wj2J8LukFqNbL9ayUt4Bgx2uhAay1MfKYQPSVNuWh4kNE2H16VQJoT5cvQqurvyZvgtRmW4/xoKToy3xkt4F9Xo3LIjsRiIsOL0zKmDh5q874bPwJ5nNHSY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HhyaIajH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HhyaIajH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02712C4CEE9;
	Wed,  9 Apr 2025 21:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233101;
	bh=eJTlTLsy0my7U6cHhkhoHNY8hFx6eYTSa9v4rjr5Vpo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HhyaIajH5BuV1wZOhZ3G6JTvZf/ST0sLZe6Kx/+A87EgArWdvg1TVdu+D1CWUqb74
	 eWR9Y/mLReMZYWLoJv+Zf4mUgcJ5Uv9e9+01u/YlrSlwMEAVTZHjVbkLdstc6AvARV
	 L961ZoB+EGrO6U/k8/BQS1WCxPcR8EEaWhLvTkMES2njDmE9D7lUbftQaaZNH4PLPI
	 qjTKemDaLVJWnqg5nj/sX5sBenv1WfWDiRbh+CoUTo9yr2ZU7KnbtCVzJ9+dPKcUKb
	 +wF3YdW/iVCXgzkvaLvPxYwAe8HZ93Xyq+L6ibjg7A33jiuZ+J1Q4X0MBrLm8VpT3S
	 ICTQDydIfU2Mw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>,
	Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 1/8] x86/fpu: Introduce the x86_task_fpu() helper method
Date: Wed,  9 Apr 2025 23:11:20 +0200
Message-ID: <20250409211127.3544993-2-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409211127.3544993-1-mingo@kernel.org>
References: <20250409211127.3544993-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The per-task FPU context/save area is allocated right
next to task_struct, currently in a variable-size
array via task_struct::thread.fpu[], but we plan to
fully hide it from the C type scope.

Introduce the x86_task_fpu() accessor that gets to the
FPU context pointer explicitly from the task pointer.

Right now this is a simple (task)->thread.fpu wrapper.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/include/asm/processor.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
index 5d2f7e5aff26..2f631e0adea3 100644
--- a/arch/x86/include/asm/processor.h
+++ b/arch/x86/include/asm/processor.h
@@ -523,6 +523,8 @@ struct thread_struct {
 	 */
 };
 
+#define x86_task_fpu(task) (&(task)->thread.fpu)
+
 extern void fpu_thread_struct_whitelist(unsigned long *offset, unsigned long *size);
 
 static inline void arch_thread_struct_whitelist(unsigned long *offset,
-- 
2.45.2

