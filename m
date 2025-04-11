Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF312BD58D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350189; cv=none; b=cvX77srwDM9a2pUw3G71aEYz/lYml1il2s5Ayadg2Pj0CawIvRUxK5L3H6MxiIKNd8CX71qLfmR7HAbKVf9ekpQS+qJ/tnYPt1Nl2oui4MNfp4nxP+6IKvuMp7n5vWG26kCNPmnn8cmfg4igAwjHAeQwGSv16KwEvFMmBydoIsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350189; c=relaxed/simple;
	bh=K68LeerggAQQqGdt2sTeYGoKvBpGLCia3hwfCbUThac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iA68LlgKl8UWrYhuXEAXXQ28Fnn7Y3MNJQWhpyuIeIWQVR0UvHC/0bxnQFtnLoAFG5v+D8pT3rmzKpvSLNzhVneCiuErL1auOYZ355hMkZWH/B0iuAkDCdHoHAQzuqEIm5hr2ilkuiPEJhdBTyJUeqhIhShG1m28gJ79O8hYNPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kz1DUX2P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kz1DUX2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A96EC4CEE2;
	Fri, 11 Apr 2025 05:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350189;
	bh=K68LeerggAQQqGdt2sTeYGoKvBpGLCia3hwfCbUThac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kz1DUX2PcuVXr6ZWkQGgGjdsLBI4uv/twZZsB0janAbJt/cuac/QqxhY92VXgQ4Zw
	 3eTAuxppIF1PjImNt9wOCInkEIJEN/Z3+6sUKlLTYcZtf3DKhmSFZZe9bcgAdlRWed
	 Ygv31hpayj81ZhZGFcBtooPSwmv6A9n/yOqKe6IOSs49TFbYzCrcUoc8mNN7M+xnbp
	 Gw96lIf3W9+e0Z+ITsGUDEC1Qe21+8ywuMSzfsD4hkrjHlBOjxxoNcUBT1RbOSj/9z
	 XkC8rK+iaaw0gblImxAhf0Y8mV3mBdr67eLV5Ot8v60JJ82cTR5gzg9nVVtBNuYeFt
	 KMcHXsm6YDLOA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 49/53] x86/alternatives: Remove 'smp_text_poke_batch_flush()'
Date: Fri, 11 Apr 2025 07:41:01 +0200
Message-ID: <20250411054105.2341982-50-mingo@kernel.org>
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

It only has a single user left, merge it into smp_text_poke_batch_add()
and remove the helper function.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index cd828c236fd2..c0be0663425e 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2831,14 +2831,6 @@ void smp_text_poke_batch_finish(void)
 		smp_text_poke_batch_process();
 }
 
-static void smp_text_poke_batch_flush(void *addr)
-{
-	lockdep_assert_held(&text_mutex);
-
-	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
-		smp_text_poke_batch_process();
-}
-
 /**
  * smp_text_poke_batch_add() -- update instruction on live kernel on SMP, batched
  * @addr:	address to patch
@@ -2854,7 +2846,8 @@ static void smp_text_poke_batch_flush(void *addr)
  */
 void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	smp_text_poke_batch_flush(addr);
+	if (text_poke_array.nr_entries == TEXT_POKE_ARRAY_MAX || !text_poke_addr_ordered(addr))
+		smp_text_poke_batch_process();
 	__smp_text_poke_batch_add(addr, opcode, len, emulate);
 }
 
-- 
2.45.2

