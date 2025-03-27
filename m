Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03EF1DDC2E
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108889; cv=none; b=FGD0VUfgRNOLvjHhz1X/YOvgNojYnminJA6Gi4+IDye9hP81Xk1uJAJDq+vqUVfqMg0anH0DN+9moU/Kk2Z3gz1DSyy6H8BS0y/3Avfr/UDgdV8jbjUdubPGqTtJIaYhPv3K4meXwH2OdR8z+CZxmipvX2tYjtlFXHlbMvWKtxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108889; c=relaxed/simple;
	bh=9GBZ9hxohiO2X7F9sa1OcOUm4FTwL2gytiXlhodCkRs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gyi2aY1I7z65IWTDsdZq2qMj2zSXCpeyj/fWmSfRosWG27vm2qmdIDay/PzdV/zJXPiYltL9SjYtC531SLyXcdh6+u/ABhX7stRtN8mmxdz9XVA0ic+o6uM9CYxeknNoXXOV69Gp2G/EGQinLhfxunz9xwo4ix5Nirz2lhAMS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gi7f/hK7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gi7f/hK7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F8AC4CEDD;
	Thu, 27 Mar 2025 20:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108888;
	bh=9GBZ9hxohiO2X7F9sa1OcOUm4FTwL2gytiXlhodCkRs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gi7f/hK7Fnp1PyOyaExFPyHmbZWKDyQ+VBjsFtlsxCYghkFVIsLzYEVRAlEAxrjc/
	 o1G86acv0lswardIJz0yd1FrhrUhyVU0ft5G02+Trm+3wuesBz9ie1ZUHTKl0ugtHa
	 53gvX+BPnlJKzqdLaje/Gd7Piy7pQI6G/ffIa/6Gli1p4tuuvfMGAPBoaWmzR3lcHP
	 /4S1bSddj9PeVQ7hYxUuemwj+wQfeuMzhdDGXMu9Nw1HPRzVb10D2BhWdLffLEy56x
	 c5oQtOvgVZyQJC9ZPQbzo41j7FKtdN6IGLl/ABNhjTehOGuxpoJ9ZDqZZYeDVhGLCv
	 lzboDRWWIBxJg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 20/41] x86/alternatives: Add text_mutex) assert to text_poke_int3_flush()
Date: Thu, 27 Mar 2025 21:53:33 +0100
Message-ID: <20250327205355.378659-21-mingo@kernel.org>
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

It's possible to escape the text_mutex-held assert in
text_poke_int3_batch() if the caller uses a properly
batched and sorted series of patch requests, so add
an explicit lockdep_assert_held() to make sure it's
held by all callers.

All text_poke_int3_*() APIs will call either text_poke_int3_batch()
or text_poke_int3_flush() internally.

The text_mutex must be held, because tp_vec and tp_vec_nr et al
are all globals, and the INT3 patching machinery itself relies on
external serialization.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
---
 arch/x86/kernel/alternative.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index a10e1b9db7b4..f75806d699be 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -2860,6 +2860,8 @@ static bool tp_order_fail(void *addr)
 
 static void text_poke_int3_flush(void *addr)
 {
+	lockdep_assert_held(&text_mutex);
+
 	if (tp_vec_nr == TP_VEC_MAX || tp_order_fail(addr)) {
 		text_poke_int3_batch(tp_vec, tp_vec_nr);
 		tp_vec_nr = 0;
-- 
2.45.2

