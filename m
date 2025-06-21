Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4355C1531E3
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 08:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750495468; cv=none; b=Bxb64ICreC0iwoHqTyTbY5zWAGCuthuceG6Kxe0Qt4UgvP7KUi1ZWVxmvL9qhlCsNuwaGaCnqjPznbLzcGmzrZmZVpANm24brONWydicfxn9woGZtexB094qsH6dU4zQq0Ht0OdKqJwWkNJQH5kuD1P5UrGRI16z+aSDzVKGkww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750495468; c=relaxed/simple;
	bh=Ss4fSQN+dHlsHOaJIQb8+zdTYKAwWsf4AR7WLQWm5bY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N4VVMqUCgcR3l0sLWNnjxwR407xkiwlURQmXth8qdNxc74dQdNGtVIEsqzE1XrrsmTPYZmLqmMydwoYeNCePSm2hGdQujhuoYrlPNladrlssTGp/zXPohWjhlCIHTECv1q7dH6V/EDghT8dqsKDQYZ63Lu0MdSjWWRiixx33Gtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 55L8iC7L026949;
	Sat, 21 Jun 2025 10:44:12 +0200
Date: Sat, 21 Jun 2025 10:44:12 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC PATCH 1/3] tools/nolibc: merge i386 and x86_64 into a
 single x86 arch
Message-ID: <20250621084412.GB26934@1wt.eu>
References: <20250620103705.10208-1-w@1wt.eu>
 <20250620103705.10208-2-w@1wt.eu>
 <d577e0ed-0cdd-4fe9-a678-9669993ee9f7@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d577e0ed-0cdd-4fe9-a678-9669993ee9f7@t-8ch.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Sat, Jun 21, 2025 at 10:29:41AM +0200, Thomas Weiﬂschuh wrote:
> On 2025-06-20 12:37:03+0200, Willy Tarreau wrote:
> > This remained the only exception to the kernel's architectures
> > organization and it's always a bit cumbersome to deal with. Let's merge
> > i386 and x86_64 into x86. This will result in a single arch-x86.h file
> > by default, and we'll no longer need to merge the two manually during
> > installation. Requesting either i386 or x86_64 will also result in
> > installing x86.
> 
> We should do this in any case, independently from the series.

I agree, initially I made it part of the small improvements series but
I thought it was less important.

> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Thanks!
Willy
