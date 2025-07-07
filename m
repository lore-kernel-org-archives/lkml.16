Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48E12275867
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 13:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894273; cv=none; b=WMUDd/bw8uiaKvJ2e84+nZAWyGQUhP4jhuOdGj6N+tCdRG+h1q7CsSAKFqC9gyowyJuSKiz0TG/prT0EoPlFEu68mN77dA3bQJBtOTUeIgHLrAAPJe5d1bbeWKyq628FNENDXV/YYXsh/EDTBnlYTbjc5S0OuKzUY0oVt4YONc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894273; c=relaxed/simple;
	bh=myoMndbFoqwFBX4tWR9wD/xRx84bvGhlwiRb39/wmUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b41bt8WXG29Q2CIyBhBsqmMRnuEtA8bDuzbbImnn5zmpJd+xjv4cr5O1Gt7LCnKkTfdPOkRbA8WqZZVKFP2CO+fAj9DLU4sFxpzDqQXJkZNSIkYj72nBE84qnPfvSjtsDJfg9XaN492YIlJiz+H6C3QFzYyQDX7iTIJ2iBcTN+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 567DHOXb032739;
	Mon, 7 Jul 2025 15:17:24 +0200
Date: Mon, 7 Jul 2025 15:17:24 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] tools/nolibc: avoid false-positive -Wmaybe-uninitialized
 through waitpid()
Message-ID: <20250707131724.GA32206@1wt.eu>
References: <20250707-nolibc-waitpid-uninitialized-v1-1-dcd4e70bcd8f@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707-nolibc-waitpid-uninitialized-v1-1-dcd4e70bcd8f@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Thomas,

On Mon, Jul 07, 2025 at 02:58:11PM +0200, Thomas Weißschuh wrote:
> The compiler does not know that waitid() will only ever return 0 or -1.
> If waitid() would return a positive value than waitpid() would return that
> same value and *status would not be initialized.
> However users calling waitpid() know that the only possible return values
> of it are 0 or -1. They therefore might check for errors with
> 'ret == -1' or 'ret < 0' and use *status otherwise. The compiler will then
> warn about the usage of a potentially uninitialized variable.
(...)

Yeah that sounds reasonable for such use cases.

Acked-by: Willy Tarreau <w@1wt.eu>

FWIW when facing such cases sometimes it's also convenient to use
__builtin_unreachable() to let the compiler know the situation does
not exist. E.g:

     ret = waitpid(...);
     if (ret == -1)
            ...
     if (ret != 0)
            __builtin_unreachable();

But here it's overkill, plus not all compilers used in user land have
it so it quickly becomes a pain to define it depending on the compiler,
and your approach is much better for this case!

Willy
