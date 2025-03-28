Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB22B17A2EC
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168531; cv=none; b=GTsEhzpmTprnnY2ZmX4I/k3nnDuoU4Woo/IRGRHCQVqNRM0CJGHC/8ZQb065moty2GZdq8N3aauEUaJDHZm36KYxPs1dgunm3VFktJv2BSsbvm1tez/j0bYtTKa20luJjZRGg3N3tvLDJ90YRUMxaZtF/7VT5MdNEsM7Q5xFrbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168531; c=relaxed/simple;
	bh=TyCgl0WWPcOFP2Yn2IFD0dA42cp18RAgWIU+KtDMm2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HuXKK5QvBJIY3UrwCHFHJ0daHKZv7GB2A6Ark1Wamr/STPsWOBYksN4oaIF9qimWkjrn2ksgI3C7bFKvf23w0soBhS1wm3qjYWBsF3Ski4to2K/hKVFBT/R+KIx3ofrieSYA6zk2juexPG81ByWCSh7grHjIHQ3N4IB/OEHOAGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmXgEdeh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmXgEdeh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661BCC4CEEA;
	Fri, 28 Mar 2025 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168531;
	bh=TyCgl0WWPcOFP2Yn2IFD0dA42cp18RAgWIU+KtDMm2Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YmXgEdehZg8Ga80NAc5jukulPYjNJT9nfyujIPdUriNAjuptXbeP9VmPs+7wq5XK5
	 UUjyLBHfsSBze+tHIkkMWjkNnCkM0/AI0xZPsdYnYXBkgdr2SlWgO7HcmebmxA+OjA
	 V7DImR3ecyH/Z+p5oTrFC1OLXiRZyEabV8uwlfxTtVQ1oZy8BWrDdR2eXbClKdBlmw
	 8oAZEfz0hSHHnop+pj0rAHmzpD0uDy4qA+EnTsqAhNW64SQAUkfBuKeiP1FUYcq+Nm
	 6i7z+onIX/LIIKr45QqBqtPWJNybvU2f7WYwebhlJBYP3VLg0xneeGsgCj80REfRcr
	 1jGJx7QRD5EBw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 36/49] x86/alternatives: Add documentation for smp_text_poke_batch_add()
Date: Fri, 28 Mar 2025 14:26:51 +0100
Message-ID: <20250328132704.1901674-37-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>
References: <20250328132704.1901674-1-mingo@kernel.org>
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
index a32959019589..1df8fac6740d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2873,6 +2873,19 @@ static void smp_text_poke_batch_flush(void *addr)
 	}
 }
 
+/**
+ * smp_text_poke_batch_add() -- update instruction on live kernel on SMP, batched
+ * @addr:	address to patch
+ * @opcode:	opcode of new instruction
+ * @len:	length to copy
+ * @emulate:	instruction to be emulated
+ *
+ * Add a new instruction to the current queue of to-be-patched instructions
+ * the kernel maintains. The patching request will not be executed immediately,
+ * but becomes part of an array of patching requests, optimized for batched
+ * execution. All pending patching requests will be executed on the next
+ * smp_text_poke_batch_finish() call.
+ */
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
 	smp_text_poke_batch_flush(addr);
-- 
2.45.2

