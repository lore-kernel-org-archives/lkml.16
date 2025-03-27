Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575A1FCF6B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108910; cv=none; b=TtyIs1cW8g1mWc2w74tgR+JTmrF+7bDQ769FslJX2kqT3WwaqB/bJIkP9XX03cgs515LniFg703q8YOdEs47e/ri5EN+CpIpGNBZVd+P632PyDcqEttJuPnWwyCfEMC/osXc4prTnma+CWuQ6H+rMoevmcO+g9kRwMDDFOWCWVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108910; c=relaxed/simple;
	bh=DgovOuuyafFnae2SeX+P/RmrowYrTqPQkxMedo3u53s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ev3XQqOtCIEdKQ3phiVOuyco8X2F1VtgurT/d4Apo7C7a5kbvRIT5lhxpek+0CXzuco3JMWW2gk5zdsRojWCMeyv5y73ffIl0Amk+eUqmnbvORdT0P8C9W2J6Cxt6IPEmdKNg7hMlz0GyK1AHO+ozAIpY7Zq7zDhB1MFxxu0mB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UpxEleeB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UpxEleeB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8E7C4CEF6;
	Thu, 27 Mar 2025 20:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108910;
	bh=DgovOuuyafFnae2SeX+P/RmrowYrTqPQkxMedo3u53s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UpxEleeBQ3RSJluK2UdswiaqGVfcS5u0OPyqEN+at7Ri6uY0AwcdR95VjdNcPRXws
	 BQfP1x0ySQvyayPNy6pLmyHVzfcPoRXNxpOLF1HnuFn+e2miXeryjx0yXCpkfSyKh9
	 SHlSRyFyXEpxxcZrx3HmsKuFgB/xGS8Wl9hAUrKEa36ifpDsr5zUYZ+Rdb2dbngUk5
	 wCngQD3Bm7nGj6+SoHz7Fp7C6LE9F5XiD6owc0Jt00X6Unhnnirv4wQypd2TDfdWuu
	 C+zUW2m8MtMxcfEMn3D98IT4Ke4EStRr2o56mgt53fcgKg3kQkbncp19tfhKkQgiaJ
	 Ep0qFcjmbF0/g==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 29/41] x86/alternatives: Rename 'put_desc()' to 'put_tp_array()'
Date: Thu, 27 Mar 2025 21:53:42 +0100
Message-ID: <20250327205355.378659-30-mingo@kernel.org>
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

Just like with try_get_tp_array(), this name better reflects
what the underlying code is doing, there's no 'descriptor'
indirection anymore.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 4b5ab9002e07..0b11f53d6e6d 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2486,7 +2486,7 @@ struct text_poke_int3_array *try_get_tp_array(void)
 	return &tp_array;
 }
 
-static __always_inline void put_desc(void)
+static __always_inline void put_tp_array(void)
 {
 	atomic_t *refs = this_cpu_ptr(&int3_refs);
 
@@ -2590,7 +2590,7 @@ noinstr int text_poke_int3_handler(struct pt_regs *regs)
 	ret = 1;
 
 out_put:
-	put_desc();
+	put_tp_array();
 	return ret;
 }
 
-- 
2.45.2

