Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D6B2989BB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350144; cv=none; b=takTRhfCxGdwpHVXgH8aUKj7nFoNch0j2Kbd7MDjQDKsIz8pURkXIGDhCwEzRXz73FNr+RpWZ4eXS9PbVpONbAyVQVPu9W0Ku4MhShDOAFNEgI59v9YuwYSLspJ2L2Zz1RFD+gIG/KfciYtsLXVYDZ7/6CP2s3pAiMgQCC4DAHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350144; c=relaxed/simple;
	bh=Mvjqf4G02sWBd7sPd73c+7EGfXBqP3D4JOuKEf5BPkc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aDZ556PnKNcNdn05uguEJhh1eTFwyNwWKMZcX1ZICohJx0QD18rRLEC8Q11RJKwA68Jf3eQMryqBUpqbYJA3k1goG0WXc1Zkj7uPRUucUhfJwvhr98jp+NVNriQ3WImzuYapFK6cD2s0J80m/gruRO9lK8+IaarF51ml74ysZNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sp3GnWHM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sp3GnWHM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED00CC4CEE9;
	Fri, 11 Apr 2025 05:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350143;
	bh=Mvjqf4G02sWBd7sPd73c+7EGfXBqP3D4JOuKEf5BPkc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sp3GnWHM6i+44MxSALjghldzg+JU+rTqt2x5j5K/fHddi498UOUjHqyG6Q6P6CoZx
	 Qp0lZCwTvV8P+pLa9GuFgdGQ4xDoiUcaUTuhHfu11gO9tr0Dl2oU2r9awEbd5HbiIO
	 c0BKP//bbjElA8eO4Eva2xfFMkkFmz3LzUu8KSlSsyLnOHr4VA/CgaB9KYlwLx69HP
	 Bsclhphud0k+PYo/x8FNqimSZ2ttrJO+yt3wFJn8VYOqz/WXMrwMunKfsE8yaEcwwi
	 wouj5nwFo3TZdxldaoDQRjMlsCyp0kVGGgNKnT96wp/WBGpJ+ndGr8g4mfNtV/27xI
	 4E78PJzc5QOCQ==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 30/53] x86/alternatives: Rename 'put_desc()' to 'put_text_poke_array()'
Date: Fri, 11 Apr 2025 07:40:42 +0200
Message-ID: <20250411054105.2341982-31-mingo@kernel.org>
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

Just like with try_get_text_poke_array(), this name better reflects
what the underlying code is doing, there's no 'descriptor'
indirection anymore.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 2bec5ba866ec..4ab9d227e306 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2486,7 +2486,7 @@ struct smp_text_poke_array *try_get_text_poke_array(void)
 	return &text_poke_array;
 }
 
-static __always_inline void put_desc(void)
+static __always_inline void put_text_poke_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2590,7 +2590,7 @@ noinstr int smp_text_poke_int3_handler(struct pt_regs *regs)
 	ret = 1;
 
 out_put:
-	put_desc();
+	put_text_poke_array();
 	return ret;
 }
 
-- 
2.45.2

