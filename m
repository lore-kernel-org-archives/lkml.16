Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D782BE7AC
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350196; cv=none; b=srgswKZZY6hMTxbmT+IEo+iCc1Ea09ITkcpp3Ft1g0AUBcvWhQYvR4vkPfM8kCI4IQexeZppEwA/afrPAF0a2EVywpHLHJLxfHpH0VSgz4+/UxVNWIN6tAoFQ4DBqA3cRJzsqOi+VkUD4T4ZH1yPdP0T1+yV7uLfeSWTqE63GiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350196; c=relaxed/simple;
	bh=EFn+5AyjrVdlK00O2v7ECfvpshL8IgYUH9Ij5AZDLac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OI5g5+YcydTx1WOIIgPN5w2N9/cFSO9Xm+MnH4Nd3XC6+OfjJh1uH7NTjeo0GgrQXVKneiMSS17VIBnRfqVrybhdiigQnCd+MpER4uwxc7y5M6agU0Y30vlFQedfhoUITz4XJQ7jHGHDrVKtbsfcgiJOO2rZnJEQhYqqYuvex+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KuRLmuTj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KuRLmuTj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65E33C4CEE5;
	Fri, 11 Apr 2025 05:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350196;
	bh=EFn+5AyjrVdlK00O2v7ECfvpshL8IgYUH9Ij5AZDLac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KuRLmuTj1Y5U/2VgaJkOtj/ToLebzAdyPU0s/vWeke84VGZIzhdYjT7Z3ow5kQYaE
	 NDufGw7EDINZ2lfVnEvCGQrxhkh0e159jCGjJE0+9oL1xeD71l7dF7ue/J+bakJuxU
	 TQ9McPRWSayEbBAhCi/LDXYptHoXpxAidq+CNMP7WOwWXaOvnkZ6Zr6YuxUC9C6rPi
	 qdU4fl9VCgamD7Sf0rF8hOGWcxZonZh9PUwnyuHZSVwP7h2nKeJ3HR561KDhL24PBm
	 +3xThuz1eCHdew6H/KWhPv7k94S8cARP/wrxiMBEuTSHiQZmj2GaYtW4I0AlyFHj6I
	 enCvCgkLVSD5g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 52/53] x86/alternatives: Add comment about noinstr expectations
Date: Fri, 11 Apr 2025 07:41:04 +0200
Message-ID: <20250411054105.2341982-53-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 231b2acbe360..604dd608d281 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2447,6 +2447,11 @@ static struct smp_text_poke_array {
 
 static DEFINE_PER_CPU(atomic_t, text_poke_array_refs);
 
+/*
+ * These four __always_inline annotations imply noinstr, necessary
+ * due to smp_text_poke_int3_handler() being noinstr:
+ */
+
 static __always_inline bool try_get_text_poke_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&text_poke_array_refs);
-- 
2.45.2

