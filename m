Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29D0195808
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750494585; cv=none; b=UPgprpNloU3euRl/jMbiN0Kkwc85XUADRjPmt0lOh54EtvvUR1zeew8T76se+fTYRmqbSKcnzPGLm5BQA/hA7+W7Bm8DbbGHO8PXOL4SxX1a5nAPylI4kYCzJ3JughJD+8tD90ysETKNOiojjBvphirYXVM7mP9inJcEECqKb1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750494585; c=relaxed/simple;
	bh=6oLof+tMLYEUMAxulB5yB42i0pbXTxoxmrArJWS36cE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T5VHO2LMsr3J20nMEP/bTzu1dbwFY20kQdXV+K2wNUcmQzcvvQ9Sex9KKnfzz4pQ7U7rhguucz+RjWxq7ua5SI1twWI//HaDkLQlE3sZjlD9gpm3LqqRKvOmT2N2zGhlrsjQ0KfBYY9/Ryu8kn+7vmjpP3G/jU/a4kPhzq708rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=sFA9RqwI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="sFA9RqwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1750494581;
	bh=6oLof+tMLYEUMAxulB5yB42i0pbXTxoxmrArJWS36cE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sFA9RqwIEAHQAVYGxLzT5WpQZ1R97+zP62X6BXqWSSQdXNKxU1UdCoNvZm/6S+z9T
	 u4nD1UQMjq6k+Ry9sxqdnIVYlPYYGrc2zKLLKJv5TfaaPCOPp8z7MVKlw3juM7xZ37
	 a7wX3hoh+Hn2Oq9RBLT4yvXS8DW0Rn5hSBQEV5gk=
Date: Sat, 21 Jun 2025 10:29:41 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 1/3] tools/nolibc: merge i386 and x86_64 into a
 single x86 arch
Message-ID: <d577e0ed-0cdd-4fe9-a678-9669993ee9f7@t-8ch.de>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-2-w@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250620103705.10208-2-w@1wt.eu>

On 2025-06-20 12:37:03+0200, Willy Tarreau wrote:
> This remained the only exception to the kernel's architectures
> organization and it's always a bit cumbersome to deal with. Let's merge
> i386 and x86_64 into x86. This will result in a single arch-x86.h file
> by default, and we'll no longer need to merge the two manually during
> installation. Requesting either i386 or x86_64 will also result in
> installing x86.

We should do this in any case, independently from the series.

Acked-by: Thomas Weißschuh <linux@weissschuh.net>

> Signed-off-by: Willy Tarreau <w@1wt.eu>
> ---
>  tools/include/nolibc/Makefile                 |  10 +-
>  tools/include/nolibc/arch-i386.h              | 178 -----------------
>  .../nolibc/{arch-x86_64.h => arch-x86.h}      | 180 +++++++++++++++++-
>  tools/include/nolibc/arch.h                   |   6 +-
>  4 files changed, 179 insertions(+), 195 deletions(-)
>  delete mode 100644 tools/include/nolibc/arch-i386.h
>  rename tools/include/nolibc/{arch-x86_64.h => arch-x86.h} (53%)

<snip>
