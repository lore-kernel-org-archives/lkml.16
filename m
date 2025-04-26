Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B5B1991CF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 16:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745683322; cv=none; b=t7r/794GcH5mtUgJ3hQFuCh+xaZs9QizWkYJ9KLuHbgGN45SXlW5jV1wJStmjfpu1MsWzOtd1VfTu4NkxFMLxJ519jT3wZO8Jvh1vXs7F54ifxlveqXlcGktRaQ74Md7GVF0LH2Uwi9e05vfX4ly8tSw5WNm+cJ30vWbf/aoWzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745683322; c=relaxed/simple;
	bh=9UVuevIK4pN01S5JNfR8C86Tbh//DF7vt8izgjeOOpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0+A+8iVWIa6qMbpoSjPx1lrpCpwECHXlT6uXaDQQ3Q9eDJhZSlh3ERkxY31TLib0TVsrMpBz+bfwY75msJOybzrfWxHy2newXVU4tGn0OeuYcxCHsBefnlMJbjxmbVFQJ5weF/kfn0TFSuQloD1aQOAHitQTv8Co1wzYiZPQqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=CMi8wIgT; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="CMi8wIgT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745683309;
	bh=9UVuevIK4pN01S5JNfR8C86Tbh//DF7vt8izgjeOOpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CMi8wIgT5HftdrjNJK5N6pcvA3Y6O5YNMYust/Rah6icPDCqnNNwB7Vo1sjtzEiRC
	 3UxaUVn+1/7nj4CSvqQr8HTLpYsZYHNnX4sEWINR/TV4EISIHsp5f8BptROhkT0i+m
	 l61q6YNh1bVXygUwXqXb8+TYjaCAIDFBWUbWL+WI=
Date: Sat, 26 Apr 2025 18:01:49 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Daniel Palmer <daniel@0x0f.com>
Cc: w@1wt.eu, linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org, 
	linux-kernel@vger.kernel.org, Daniel Palmer <daniel@thingy.jp>
Subject: Re: [PATCH v2] tools/nolibc: Add m68k support
Message-ID: <dcbd27d0-eb72-447c-8bfd-810a6939b0dd@t-8ch.de>
References: <20250426065323.259267-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250426065323.259267-1-daniel@0x0f.com>

Hi!

On 2025-04-26 15:53:23+0900, Daniel Palmer wrote:
> From: Daniel Palmer <daniel@thingy.jp>
> 
> Add nolibc support for m68k. Should be helpful for nommu where
> linking libc can bloat even hello world to the point where you get
> an OOM just trying to load it.

Thanks for the patch, it does look good in general.
Could you rebase it onto the nolibc next branch [0] for easier application?
Also normal clang does not support m68k yet, so it should be skipped in
run-tests.sh in the llvm case.
As for mmu vs nommu, this choice has no impact on the userspace
application itself, right? If so, having only one configuration in the
nolibc testsuite should be enough.

[0] https://git.kernel.org/pub/scm/linux/kernel/git/nolibc/linux-nolibc.git/log/?h=next

> 
> Signed-off-by: Daniel Palmer <daniel@thingy.jp>
> ---
>  tools/include/nolibc/arch-m68k.h            | 141 ++++++++++++++++++++
>  tools/include/nolibc/arch.h                 |   2 +
>  tools/testing/selftests/nolibc/Makefile     |   5 +
>  tools/testing/selftests/nolibc/run-tests.sh |   1 +
>  4 files changed, 149 insertions(+)
>  create mode 100644 tools/include/nolibc/arch-m68k.h

<snip>
