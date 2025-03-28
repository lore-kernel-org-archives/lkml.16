Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170C1ACECF
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168499; cv=none; b=sL/8DTldwd2Zi1CGoAMCu2yHu8oEJmRKHkKHJK/4RAWravaFSDOFyokhciH9VFWM+HTQB7AvzI7RIxK+yVYSEZNQo+4XesLA1CykRXlhcfnuuTp2xNpwLs8+n3Uy81BMM0PO+tKzSF6U+RDRugd70qMmXrnumIDuE1L4nD+xy4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168499; c=relaxed/simple;
	bh=zcSLh9zb2Qc3VpXhOklk3s3w0Tr/O8DBH2iEqzq6lck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgBr0p6ab6o/G6O8NSLurvjyJJf0BYiITSRhtpXF+k//qeoxbuoiHidcBJpxSePDbsW9QE8D8b+Smk619CDJKnYPtlAVxMSqda6ALgMjv7VFvZ3UfgcgRi7DroSVWG8zzNLnxZUPLCAaiaYwk1uN0Oly+0vn1qtMsW6kPy2pcz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJ4hPLrM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJ4hPLrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0CEC4CEEA;
	Fri, 28 Mar 2025 13:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743168499;
	bh=zcSLh9zb2Qc3VpXhOklk3s3w0Tr/O8DBH2iEqzq6lck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rJ4hPLrMaYHLD34kxbKrSiGFbLSno7OHB+POiTD4uR/rYUOiQ+ajr70d6SP/XXiFf
	 LYIRbOmKb5AyvvSDBHXLPFVRtNWkY7D3YSiXeOy8WLtEEhZ9lIZCXsoL5qI9ujRUpu
	 Fpl/jrQCegPJhF34UrO/xU/uOLmtkIGdEGiNtHrzkFV+jxOcwDuJTeZSFAdh+clQ+P
	 /gWeJoY/GvEx5dSQxbPXpXo+0TGqzcxNbCL5/gBkUnZ3vgmHhN+pNxKn/MjXxw4Q+5
	 0tOxblXjOGlwJTFOKI/OuQ2dw7bO1ww67X2i1IStFrO+751bO6+biCqtwROf/zkQeE
	 ZfHPSmrM0ce+A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 23/49] x86/alternatives: Simplify smp_text_poke_single() by using tp_vec and existing APIs
Date: Fri, 28 Mar 2025 14:26:38 +0100
Message-ID: <20250328132704.1901674-24-mingo@kernel.org>
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

Instead of constructing a vector on-stack, just use the already
available batch-patching vector - which should always be empty
at this point.

This will allow subsequent simplifications.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index ffffec4597b7..70abc636b87c 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2906,8 +2906,13 @@ void __ref smp_text_poke_batch_add(void *addr, const void *opcode, size_t len, c
  */
 void __ref smp_text_poke_single(void *addr, const void *opcode, size_t len, const void *emulate)
 {
-	struct smp_text_poke_loc tp;
+	struct smp_text_poke_loc *tp;
+
+	/* Batch-patching should not be mixed with single-patching: */
+	WARN_ON_ONCE(tp_vec_nr != 0);
+
+	tp = &tp_vec[tp_vec_nr++];
+	text_poke_int3_loc_init(tp, addr, opcode, len, emulate);
 
-	text_poke_int3_loc_init(&tp, addr, opcode, len, emulate);
-	smp_text_poke_batch_process(&tp, 1);
+	smp_text_poke_batch_finish();
 }
-- 
2.45.2

