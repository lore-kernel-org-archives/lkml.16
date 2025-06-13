Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D841E8338;
	Fri, 13 Jun 2025 21:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749850396; cv=none; b=Ek8Zs7PiP2/SiXKPfdLPImU5jrRy0uqla+XRQ7ARKW0LFTMoSy9VDWQNt1UfdY2PwtAqVJZoxJqrI16NkVhtb4Ef+DT/AiKnHstroyHP5ONYmY2BKLfykHEqhqSulxXVu+VOPU9TULOuM6QZMgXpd54pG+uKAB/PAVKXuZrUrB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749850396; c=relaxed/simple;
	bh=VxTps1ojM4lnBA5ELCNmtgP1CD8XjdF3FjfSnngtjjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PLrsQHzCTdW8mN/ZionlREwWZhfypozXw8jB5fM5O4NZkOOjmjKh6li/W/vwyAibd47TqHGB2zO/TGRqBtHYiyGcSufRRbk1N5od4OTjZm/ThfwT1M4tJ19lb7aA9Qft13KuKtIBLhZNMC+AwzuOw7vm89DdnA+jTst2LY5Z0H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sK5qHeQw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sK5qHeQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 900B9C4CEE3;
	Fri, 13 Jun 2025 21:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749850395;
	bh=VxTps1ojM4lnBA5ELCNmtgP1CD8XjdF3FjfSnngtjjU=;
	h=Date:From:To:Cc:Subject:From;
	b=sK5qHeQwAcEYuyv+kSHMWmReYoBwyORxEZqlUx06U5Cxz+Lhpnd18QQvJrHwdIZvW
	 65WIFFZ9/NBbX93s+RhbaBmo72Xe8HXsDD5SCmTWBX6KL+p5CAJbaAT3lsg4bDoreA
	 S8oxBloPvu6hOX2gK+YFGelnv+Q6We5hRmplD3MYClYho+xlKuA/CxyEm3UOPMAyp5
	 /iqw0WJTmuf4/0nkCtPFAv4HtGVFnilhPRF+mkoYTUcA2RDyOPwk5gRA5wwlfAISkR
	 1Rwwx5Whsgdd+STkpSEQA2N2BH3H6aUMMYP26G9n/r7Quq2zmhSVX54VSjb7dxYpf8
	 Kt/+eYKHb6/8w==
Date: Fri, 13 Jun 2025 14:33:11 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 20.1.7 uploaded
Message-ID: <20250613213311.GA1445087@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 20.1.7 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new. This will likely
be the last 20.x release according to Discourse [1] but it is still
worth reporting issues in case there is another release.

[1]: https://discourse.llvm.org/t/llvm-20-1-7-released/86855

Cheers,
Nathan
