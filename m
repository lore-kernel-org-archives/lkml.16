Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C7528FFD9;
	Fri,  9 May 2025 13:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746797951; cv=none; b=Z8c8LJZQZwOM2oSudkiIgAXSTzdpnGleyYfIQGTuzYiLTW19cWRntFZk4PgfxVg/YgIB7puk44n1jaqfWRZXblIZ8P53pO1Pf+4p1K0qHW8+mVryt+bhIPa8eSzstcLRgLh4OHup0H95RgMkNvppEFFNgRNQysuDF7AP9HwA7Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746797951; c=relaxed/simple;
	bh=25l5i6/I1Lnoj4JbwkxNMbIQ+HVJy0snEzlOxAbOk6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyNca88my7IFwTXNzsmu/JlnudeSuXzhHiuk6BHtCZ60uyatujprQXmauJyeAPDoSRh/iNnD0JrAXOXWMfb7nHm2NrIRYAF+ealZimB0v/IAcSfJdawxcNx0qMrElmKm4oeNHeFJ+/0OHHB1xJxejhM/3bquRp2NOLklU1gWLgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=PnwclMr8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="PnwclMr8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2003C4CEE4;
	Fri,  9 May 2025 13:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746797950;
	bh=25l5i6/I1Lnoj4JbwkxNMbIQ+HVJy0snEzlOxAbOk6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PnwclMr8FFWAKkKvKQitSx3B1wvfy0FeBAgZDAfNqIpDZ0NnqQJGKU3+ZOPM/tsM0
	 YJhHQpiQaGFksrt7uzxb4UyMgBBrAPxvHKA6LZKltp8mPI6UrXf3KIH2hKQ5GFDoZq
	 MPOwcXBnnA8+7I/o7Gqlex4JaxBhGx/XoKCzfw5U=
Date: Fri, 9 May 2025 15:37:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Attila Szasz <szasza.contact@gmail.com>
Cc: Theodore Ts'o <tytso@mit.edu>, Dmitry Vyukov <dvyukov@google.com>,
	cve@kernel.org, linux-cve-announce@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <2025050945-prompter-aerobics-136f@gregkh>
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu>
 <6191c255-84cc-4721-91d1-1884472989f7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6191c255-84cc-4721-91d1-1884472989f7@gmail.com>

On Fri, May 09, 2025 at 03:18:19PM +0200, Attila Szasz wrote:
> > I would invite that security researchers
> > file CVE's with the *product* as opposed to the upstream open source
> > project.
> 
> The CVE was originally filed for Ubuntu Linux ;)
> Namely, cpe:2.3:o:canonical:ubuntu_linux.
> 
> It was moved to kernel.org CNA territory due to some politics,

There was no "politics" here, no other CNA is allowed to assign bugs
against Linux without going through cve@kernel.org first.  That's just
how the CVE system works, Canonical should not have assigned that from
the beginning.

It happens at times, nothing special here, Oracle did it earlier this
week as well, and we had to reassign a CVE over to us.  Other CNAs have
done it in the past too when they forgot that Linux was a CNA.

> then it was rejected on the same day the bug was fixed upstream.

That was based on the request of the filesystem maintainers, which we
use as the final word on these things.

> Since then, I saw Canonical folks mention that they wanted to
> allocate a new one but needed to obfuscate the description so it no
> longer sounds like a kernel bug.

That's great to hear, please let me know when they do that so that we
all can report them for violating their CNA agreement with CVE.org :)

thanks,

greg k-h
