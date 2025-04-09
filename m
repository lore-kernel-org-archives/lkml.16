Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AC126659D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744209614; cv=none; b=RKn4bOFhublV/iC7ONVCG+Oqu3FFc3zVI2goy1O8Qnojxuv3mz9Zdks1ZEEKmHVjgnATrwsEvcMUzDSx3F4Vmsz6Pa6ge7YpY4SQP47G9qDlyUCq/cS9pLQDbEFefq9W5DjdEesdZD4DcCkgUFsZ1qZChsh7ossm0K1k1EPXs70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744209614; c=relaxed/simple;
	bh=lWvZ4+vpN/Bibq0xkCXmoImagsyMWBCFn9tokeYvmo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/OddyF6AEGuUYqe3gE6CM+7cwZ9VBdh9Tmy35oqiXJlhH/MRiBlYiHgv3nFmtPiqJvw2aS7APvEi9DRJpzcvst86YwQtrHbq9Yupy2JrRlivwXEkTi7Q2IVwirQV1zqFGRV/GruZ4lc8Xxte01q+Y2RkgaIqNJ1s2THdOqwZpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OBVxVfBo; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OBVxVfBo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FJwD1kB1PkwXytvuPVoOlghXHjtZdfHyoxFHaSFyru4=; b=OBVxVfBopLRT/BjNI12zZfBgM9
	6HY2l5wXY/8MtWEZzhNhzzQt1LvjXNxcfgCDxKaxc9Fxh2/dWD1FuQktt/4i0VaRJwx3EZxCgcf4v
	xinNkzrLomOe97hzD/wLF4hbUaYLdM1a8Q//8mdw2yPu1pmXbFGpGbvVJb8X6JAHpzuDlqimET5MS
	7yW37cIEYNaqf4L4IN/kI5zTSOeN7aqgNvoWQ3oxM/EBm37F8Q0DEx29RZ48FhRtiAKiOg5nnWB0Z
	eJojwZFaUBXBq6QVmOx+/J47lJtdkWHj9DVLl5Dd1/TSLC1hgD5EXbw2kiOsOAHoDFMNgWKdMT3on
	OjFkfBJw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Wb4-00000001bEc-0oOj;
	Wed, 09 Apr 2025 14:40:10 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2AC8330057A; Wed,  9 Apr 2025 16:40:10 +0200 (CEST)
Date: Wed, 9 Apr 2025 16:40:10 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH RFC 5/5] objtool: Improve code generation readability
Message-ID: <20250409144010.GF9833@noisy.programming.kicks-ass.net>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <fa33720aa6022c6fab2336e129e08575177a8009.1744098446.git.jpoimboe@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa33720aa6022c6fab2336e129e08575177a8009.1744098446.git.jpoimboe@kernel.org>

On Tue, Apr 08, 2025 at 01:21:18AM -0700, Josh Poimboeuf wrote:
> Improve the readability and compactness of the objtool annotations.
> This makes it easier to see them and differentiate from other code.
> 
> Before:
> -------
> 
>  911:
> 	.pushsection .discard.annotate_insn,"M",@progbits,8
> 	.long 911b - .
> 	.long 1
> 	.popsection
> 
> After:
> ------
> 
>  # <ANNOTATE_NOENDBR>
>  911:	.pushsection .discard.annotate_insn,"M",@progbits,8; .long 911b - .; .long 1; .popsection
>  # </ANNOTATE_NOENDBR>

Conversely, I don't mind the compact form here too much, since the only
bit that really matters is the annotation type (1, in the above case)
and that is already explicit in the marker (ANNOTATE_NOENDBR).
