Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B4B51A4AAA
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738225486; cv=none; b=Aca9u3/KqLUSPum1YoxY2DH720X2jln2wm/eT/hzocC7iiWRjVwKP7IPARBtivdZqclictieXCdPU/6CuwLYQVZF1sYvmHUYXcJg4qPZHos+QkpQiase0q/FOM7e/ZRCrMdiGWg+Y0TMgr7lgD7DTUEwENpe9V133yv+czB5vNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738225486; c=relaxed/simple;
	bh=WbDcjXKwFYfhd3CkFtwLyzcWnLW1mV8Sj4w/7O3RDg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pJ8WJUp/JQhlADotk/HYD/n4Nzdn9v65Gxzs2sXcq9cDo8KjKBGKG0I89/KggFrqca1OkGliExjemmHetQQvgq9/NaxueExTe6Dm+DlNT68hpvGPpBFARaa3b9a1x1IBMQMXXaLVaNYnKQXhoWmivlxoG2mKQchlfLgdSYTU8Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 50U8OYJm032492;
	Thu, 30 Jan 2025 09:24:34 +0100
Date: Thu, 30 Jan 2025 09:24:34 +0100
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tools/nolibc: make signature of ioctl() more flexible
Message-ID: <20250130082434.GB32424@1wt.eu>
References: <20250128-nolibc-ioctl-v2-1-4a07e91fd648@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250128-nolibc-ioctl-v2-1-4a07e91fd648@weissschuh.net>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Jan 28, 2025 at 10:22:46PM +0100, Thomas Weiﬂschuh wrote:
> POSIX defines the signature of ioctl() as follows,
> to allow passing a pointer or integer without casting:
> 	int ioctl(int fildes, int request, ... /* arg */);
> 
> Nolibc ioctl() expects a pointer, forcing the user to manually cast.
> Using va_arg to make the signature more flexible would work but seems to
> prevent inlining of the function. Instead use a macro. "fd" and "req"
> will still be typechecked through sys_ioctl().
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Nice and clean approach indeed!

Acked-by: Willy Tarreau <w@1wt.eu>

Willy
