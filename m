Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4992E3385;
	Wed,  2 Apr 2025 20:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743626120; cv=none; b=qnfXuajWKjekZtefvVNfwvHp0qVlNsj/pelYkg9z0u/40fOXP+yrTJ/gHyTaT23JwEFttBBO/E3tfV17f90lpvCvbJhtdB/NjAlOmaJonr+Rr7QuViNdG9wvw6IHtZlSk25SQmBUXd6f1rBNSVvDxYsDdTO5hVZrLNiAsDekpv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743626120; c=relaxed/simple;
	bh=/IF7pt4x/DqF80DOuCVvR7dftKIMSu5ebbbjJtk+RGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nb1rC4E4KN5ZqobGVtMfzLa3TZyr1NigyMOfN4JLnemmjk71FJ2t1BvLfabi/R56QIQBRYwH7xiD/v5QEoiuijfHMMWWi5Wft+1vNoINc2YWaJdLlWk2xq99nso3k8kKdsSJqrU9zEH1VvmRmrfZHmNk8oQngrA00t/tzLvDRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1PLrUhR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1PLrUhR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B81C4CEDD;
	Wed,  2 Apr 2025 20:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743626120;
	bh=/IF7pt4x/DqF80DOuCVvR7dftKIMSu5ebbbjJtk+RGg=;
	h=Date:From:To:Cc:Subject:From;
	b=C1PLrUhRApkZza5oFxCm6Dhv1AiLlop1pTFFbpOpCeXeAbWv5wlwYX3/UdyJVFUiR
	 CnwXEfEWZOCPHwbAUQq0KH84uegDENrjziCdJKO9L/aDFGx95fCTYAqgPE1AYP5t++
	 Ytso2famTpQ+dO6tDsC54ug9xoVZzNICPhLz7I3K54MK+3QX6/XaL383xxj/E+nbE5
	 RqKR8QINkU5kgnNhQKhszceHwHraEwH/9InOtzaN1yLB3Q/Xt0iDNCeEtq6X8Fu4Wc
	 QiX7zJemF61HyTz5+AsSl+khNEOeJgb+k5p7IjLk6eRVeUh7w2u2tG9f6jcYfyQVhm
	 ey/kxkfibFl+Q==
Date: Wed, 2 Apr 2025 13:35:16 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: llvm@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org
Subject: Prebuilt LLVM 20.1.2 uploaded
Message-ID: <20250402203516.GA281819@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I have built and uploaded LLVM 20.1.2 to
https://mirrors.edge.kernel.org/pub/tools/llvm/.

If there are any issues found, please let us know via email or
https://github.com/ClangBuiltLinux/linux/issues/new, so that we have an
opportunity to get them fixed in main and backported before the 20.x
series is no longer supported.

Cheers,
Nathan
