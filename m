Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A3C1FECD4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738781739; cv=none; b=VaKxD8W4SmzsfM8WGD0dduFxRHBKJXpzH6EKV4+AZdOMsLfOL+u6gLlcAJH28PAc7Nteff+2EB2deoijKkF6CAlG9C8ZV8kGvSls3h0bRj2Eh3yeZP0MDvEiAaXwQBcRJk1tMN2BH5DrREXslF6h3AbSXfujGLyFlVXVNQF1tQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738781739; c=relaxed/simple;
	bh=VOeBAbYYCMq7QxgP1hqwv/NT+ZfOd4w+P098DfwvpzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJg3IOvOSWmHc1ILsFTbE+Qe1gE1d+e80jTyPjW9aWDIur8rIMDjL+CId77q10nruUmupGp6qnyZ1D3xSc81VURxPTgQuylQpoLio01SGmIb/sGPwkf5dMGGNgzwyl1e4mIbzBahbV1F6zO6yX1bjgIR6f5XWFz75bUxLp84OqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXnDh6lm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXnDh6lm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FFB7C4CED1;
	Wed,  5 Feb 2025 18:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738781739;
	bh=VOeBAbYYCMq7QxgP1hqwv/NT+ZfOd4w+P098DfwvpzQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mXnDh6lmyQUGcsYW3T4fIDuS9V70T7a9/Mz55sO3DpVoDjTdtFkvHAxSFQaDpP4q3
	 U3/QQN8TMKTejKXWG86PlOJj5rWsoQU0ol0zUo35+6nc0KJrSAB9Kmxj/c9VkctccC
	 m+FNfZAKA9gTSjGG0RE0LS90TYdOPvXSItwOtMeKG85J/KoHfcDolqDYIyaBjHkyRR
	 U65RPmVUQr0Z5OqyEVsXcWGefmV0C0YA6Mrla+VwA8clYSAVT5Xs6sFNiy6glHlzuv
	 XaOSZGDeC/U1YwYGyORiAGXYZZI2/yK+Pas2xnarhQDZaPTSYQ/9eEl6FA8XCTjAg7
	 RKmNE1JPUdKgg==
Date: Wed, 5 Feb 2025 10:55:38 -0800
From: Kees Cook <kees@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: Linux 6.14-rc1
Message-ID: <202502051054.D785DC7@keescook>
References: <CAHk-=wicYNCkEgH06w0mpR+GJhJ_ywe0BLTTFXBAj1+y0dqe4Q@mail.gmail.com>
 <28ff9a23-f7cc-49da-8975-788ba0646763@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28ff9a23-f7cc-49da-8975-788ba0646763@roeck-us.net>

On Mon, Feb 03, 2025 at 07:58:54AM -0800, Guenter Roeck wrote:
> The failed unit tests are
> 
> 	m68k:q800:stackinit
> 
> The patches introducing the failures are:
> 
> e71a29db79da stackinit: Add union initialization to selftests
> ad9f265c7328 stackinit: Add old-style zero-init syntax to struct tests
> 
> Similar to 1e1a9cecfab3, those are all last minute patches, so I did
> not have time to analyze the problems.

This should be addressed by:

https://lore.kernel.org/lkml/20250204174509.work.711-kees@kernel.org/

It's in -next currently and I intend to send it in time for -rc2.

-- 
Kees Cook
