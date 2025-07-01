Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C233273D90;
	Tue,  1 Jul 2025 12:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751372549; cv=none; b=tLN6PTwFUWujQh626fMr2TK+7w+U/yiC4/IWhf7o9Br4be7+g7oXCY39arbJGt8/JSIZapCM/6P41duXvPtdeADnawoGz2YsmQq2bOTBRTHTsfkVfxkHBYWmgn5KktQz+zUSG1tpk/0JGDzVThV3HnyZac8CjEmno6bWTFkrsDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751372549; c=relaxed/simple;
	bh=254CU+o/PFeNIU/JlYJ59aAPA3HHr7d1xC1p/E4fWdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vCCRJYhDbRY2jJHBA8AyxM63ep04Qb0nT9ubQ0nWIlZc0Q8+LGkX4jMD/iNqJVfIyP0z31yYgWkG/j5tCC9ItAHxXgh5PvMakkv+qz8QYdoM7s+JW4gFDInv5CoqHlVNZAmhak3r0u2sVVwa5S7nJGJl2t48lq9y0KQUnAsYi0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4dXZdIy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4dXZdIy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27FD7C4CEEB;
	Tue,  1 Jul 2025 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751372549;
	bh=254CU+o/PFeNIU/JlYJ59aAPA3HHr7d1xC1p/E4fWdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a4dXZdIy+PDoHmH7xISBVLfVN7Niu0wnXTvRhm9OkdXE6Bzjka39HFr9A44aLDQak
	 CvOxWmKKuMVfubdN9s01yeutvUSIcMoGBQawoXIPGcNfs0it0MMVKwmPgvo7OwKvyO
	 U+sy8sKa4ku/p83x/UNgg7/dQZmMxsDmQGckxsuOs5ql38weERKQ9tIWUzzgL60HVI
	 NN8r3QW0uRuJR/+xn9KPtCnZxGgc8o1rBt1/CXb5pVc3euiU6ihI2ba1Pe4Ddac+oB
	 G/lpeyr1xYZ+ysu/Q7gEZxh8dn8KnAqMZDeXy2GN/Xz3S3NDt2iItey6DvTAyjYCFn
	 K94d5TDgoR6oA==
Date: Tue, 1 Jul 2025 05:22:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] loongarch: Use '.ascii' instead of '.string' in
 __BUGVERBOSE_LOCATION
Message-ID: <20250701122224.GA1879931@ax162>
References: <20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org>
 <CAAhV-H5BEe2FtKwh+SMNAKeKadhf4ALHb0nTFa5e_BBY1TOWCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H5BEe2FtKwh+SMNAKeKadhf4ALHb0nTFa5e_BBY1TOWCg@mail.gmail.com>

On Sun, Jun 29, 2025 at 11:59:57AM +0800, Huacai Chen wrote:
> On Tue, Jun 17, 2025 at 7:23 AM Nathan Chancellor <nathan@kernel.org> wrote:
> > Fixes: 5d476f66e6ad ("bugs/LoongArch: Concatenate 'cond_str' with '__FILE__' in __BUG_ENTRY(), to extend WARN_ON/BUG_ON output")
> 
> 5d476f66e6ad is not in upstream, so I prefer squash this patch to 5d476f66e6ad.

Sure, that's fine with me, assuming Ingo is fine with rebasing that
branch. I just want my builds back to green :)

Cheers,
Nathan
