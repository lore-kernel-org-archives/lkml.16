Received: from 1wt.eu (ded1.1wt.eu [163.172.96.212])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE3654782
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 09:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=163.172.96.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745053868; cv=none; b=NxAUABvm2oHnjAPJUVByp34eTvZaqM7Po3SQ6hpLeqnhQ/7WBTp6P3W08VJ3Fe+fk1KFA1UxSx+8aml47zgjzoFhPSoJPHtpQpGuYQXq2ZONtszUMrL6E/ZOxlQllVhMNBRuhw5kaBsawxKAPFE5jKJFLc11cTGy0VNhut1L5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745053868; c=relaxed/simple;
	bh=qyQa7VdH4IxbpkMROC/t8mMjyu8L2nvpcKNj8s++QCo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYQhR5FP/59Te3pCSbK+WLA4yz8ckOx0YNdUbuZY84MF4fJGnQ0INMvHQ8nlpTiq62HSW0F9B7Jxw5sfK52NlIJU3IsLjog0C/AoBa4o+r/ibMhET4VgM20TgsCc5wxMAZVY2d+nMXnttRPJyCqaB0JQLlcnHyAkEvdZ9lFCgjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu; spf=pass smtp.mailfrom=1wt.eu; arc=none smtp.client-ip=163.172.96.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=1wt.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=1wt.eu
Received: (from willy@localhost)
	by pcw.home.local (8.15.2/8.15.2/Submit) id 53J922r0031937;
	Sat, 19 Apr 2025 11:02:02 +0200
Date: Sat, 19 Apr 2025 11:02:02 +0200
From: Willy Tarreau <w@1wt.eu>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/10] tools/nolibc: split out functionality into new
 headers
Message-ID: <20250419090202.GA31874@1wt.eu>
References: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-nolibc-split-sys-v1-0-a069a3f1d145@linutronix.de>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Thomas!

On Wed, Apr 16, 2025 at 02:06:15PM +0200, Thomas Weiﬂschuh wrote:
> Porting applications to nolibc is made harder by the lack of standard
> header names. Split out the existing functionality from the big catch-all
> headers into new dedicated ones.
> 
> This series does not introduce any new logic.
> 
> The last patch for sys/wait.h will conflict with 
> "tools/nolibc: implement waitpid() in terms of waitid()" [0].
> But as both patches will go through the nolibc tree anyways we can take
> care of the conflict there.
> 
> Based on linux-nolibc.git/next
> 
> [0] https://lore.kernel.org/lkml/20250411-nolibc-kselftest-harness-v3-21-4d9c0295893f@linutronix.de/
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Nice work! Now we'll have sys/types.h, which will simplify the port to
many trivial programs that had to use it (as well as the few others of
course, but that one really stands out during tests). And I do appreciate
that we can continue to include everything at once using -include nolibc.h
without having to care for such details.

For the whole series: Acked-by: Willy Tarreau <w@1wt.eu>

Thanks!
Willy
