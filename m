Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA07728468F;
	Fri,  6 Jun 2025 08:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749197590; cv=none; b=JWPiVSrSemHH3ysiUNGu8AAnGrSvRQE2/QEBgRREup+Z3vN0zAH64qGXv3rm+lw1VNuq26nyA8idUtQ8q9dk9wP53KPe/Cp253Y0YMinbsC7cXpCvD0IRMtF9KOsVI7bfKSb9T0b1eOEzrbl0FAHXT/thNvpwGh4t/dbxrpr9sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749197590; c=relaxed/simple;
	bh=bwxw0tMmydl7ZuncZYi1aQfAWxJmBCMRzQ42hUzl6l0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=DkFdn8P05g2sEPzqBLDLJ/Kv2ZeJuAHqjoPPiiGdHcJ7O65hwiRJN5p+8Me02Q35Zt7ScfYiY+djLyNlb7gRNn8ZxnuRnax97A4Z82ZNEGRs4SC6lkAvVYmrfxnmNvDIq/qkV+tDfM30yFvn3LiDGJZYfLlhzekn1KUsNQloN/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AnyVBVGS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AnyVBVGS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2811C4CEEB;
	Fri,  6 Jun 2025 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749197589;
	bh=bwxw0tMmydl7ZuncZYi1aQfAWxJmBCMRzQ42hUzl6l0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=AnyVBVGSQm4Ek7KVYylU/RmzEYzORJSKGLVH3XxeYvTnZVzOJadKT2HDajX2jLIap
	 CDFAhSeIqUtzfARwPMmAlJuLFXUfk30zuj/CoMPcj8PkuWrjD29AWJH9dB5q5HNgRU
	 vdaIbIMj4hsXbHj0O0ZiNElkdLZy8ARieTOR4qnK4qagJLmvbB+i61/zM/Y/iYQQaM
	 NmIOjke/NL9uklp0HGxyyGgzis17sYMaZYbSF4afNLz/79X+8w91h3AE37l0lntXLF
	 Ql6gGaIbv2SmdwKL2yUsCx1qSLGUILqvpgnMHYEKO+PrPIQJGdKNER2Rr3sjtJuLBB
	 vo0vblFLuPjXA==
Message-ID: <09a5935e938f4ba3ea7ac79a7877264e@kernel.org>
Date: Fri, 06 Jun 2025 08:13:06 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Brian Masney" <bmasney@redhat.com>
Subject: Re: [PATCH v2 06/10] clk: test: introduce clk_dummy_gate for a mock
 gate
In-Reply-To: <20250528-clk-wip-v2-v2-6-0d2c2f220442@redhat.com>
References: <20250528-clk-wip-v2-v2-6-0d2c2f220442@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, "Alberto Ruiz" <aruiz@redhat.com>, "Arnd
 Bergmann" <arnd@arndb.de>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Gleixner" <tglx@linutronix.de>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On Wed, 28 May 2025 19:16:52 -0400, Brian Masney wrote:
> This is used to mock up a gate in the clk kunit tests.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
