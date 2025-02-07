Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DF11E1023
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931313; cv=none; b=tGT/T9svvUqcEys2DG2eqkGEzRnBv+81c6dFGnI5kFnPgEG1Hz/Tpz2NMbFKBvfmKM+xe4rOZB35uBmmenpD8plZ0uNIbq2pL+dWv7F5SCq8ZhcSdNmgtWtVzLqh3UF2G250DtGssK90Yz2zxIsr458CZJtKtTljahzv6F1uUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931313; c=relaxed/simple;
	bh=ZCrQE1A2flwQJjKL7HUBmrp1iENqyK4KCFYTznRSMJ4=;
	h=Message-ID:Date:From:To:Cc:Subject; b=OeGbE99UCOyOwpxHc7qO4NEg+SUOahviEwyARlxuv/K7OqkQx48N+YaixLyh33bDvsOsiy1axmxX2UY08wGVG9MjeQmUesIG5wBbPN8scHkZdTuNgXWLwE98PrCbR4oMIn4FFD3pws1bIyIur82wFQioc7C6N9ogrSXe/h2mxl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bYeFrZFN; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bYeFrZFN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Subject:Cc:To:From:Date:Message-ID:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=LNS9eFnM4MvjBAHvTpHsvwehvzhsGa949jv7sB4B9d8=; b=bYeFrZFNJgCK23EHkjOIjpZbhW
	ramhmNzRVpQds4WjPG3jmcqnvI4fsK1LZRJrG0abwurtT3D59w6A55rsRKlJnlQFlu6gHx1vdDKvt
	ThsBE4gbGGNo73VGCau5MP95nUY09InFsLsI1wVDskHASWKc/9XyxHC4cJEnY4BcXyEEjFaN5KPgv
	rBdIgZG+KzauBMS65NMjKO96I0jbV4YXYx9OZoyOhdKTaKy2c/fxEMGfVfA0f4m1FabrxQPjsEb1U
	JBM6j9YUf/QUnvdgofrNgrNTO91koy9fghWCLj9ASU5QM1EvyeW1SwTCAUR3DppQytwd8Zn2Swcu6
	VeQJGMFw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT7-0000000HAeS-2fna;
	Fri, 07 Feb 2025 12:28:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 2296C300310; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207121529.222723073@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:29 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 alyssa.milburn@intel.com,
 scott.d.constable@intel.com,
 joao@overdrivepizza.com,
 andrew.cooper3@citrix.com,
 jpoimboe@kernel.org,
 jose.marchesi@oracle.com,
 hjl.tools@gmail.com,
 ndesaulniers@google.com,
 samitolvanen@google.com,
 nathan@kernel.org,
 ojeda@kernel.org,
 kees@kernel.org,
 alexei.starovoitov@gmail.com,
 mhiramat@kernel.org
Subject: [PATCH 00/11] x86/ibt: FineIBT-BHI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi!

Respin of the FineIBT-BHI patches.

Scott has managed to get LLVM bits merged:

  https://github.com/llvm/llvm-project/commit/e223485c9b38a5579991b8cebb6a200153eee245

Which prompted me to update these patches once again.

They boot and build the next kernel on my ADL when booted with: cfi=fineibt+bhi

Aside from the last two patches -- which implement the FineIBT-BHI scheme
proper -- I'm planning on getting these patches merged 'soon'.

Scott, what those last two patches need, aside from a lot more testing, is a
coherent writeup of how the mitigation works and ideally also a few numbers
proving the performance gains are worth it.

Last version at:

  https://lore.kernel.org/all/20240927194856.096003183@infradead.org/T/#u

Current patches:

  git://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/fineibt-bhi

Patches apply on top of tip/master.

