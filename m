Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84A912DD95
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172620; cv=none; b=CVX0LJu1NjfBK5hSGGITREDj5Oe5KDZ+IlbVQSEeeQD2CVM3lUCC9W6lOiTQXjbiz+oPLeawqIRqDMNkV2QObwKc8XtF0KkLsSr3ht0W5hTUayLFaOMSIURXaRLFHBfrnTyDI/6Li8ypzH9dIganOxIJ1OaeUxBHBJ+F0E7AXzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172620; c=relaxed/simple;
	bh=+ljuS1Hmt5aoIwZDAvdVK8rZHg2DojpzB7iAeWjM8kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzMwqKLWirRnJISoe9craDL9/M7XGBFm9MusJN49d9OfnU2MGuIUbRCRbFYvhSnr6GlIh5Ftk9OAOiqeRaolWhc2SGDPhiJKhTMUfHLHQKMZlUG3OzASaNeECKHye4JyF7jf0iaZfcHsnGyhoc3uG81NFbtHEtTwvsuVikEBDVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-112-151.bstnma.fios.verizon.net [173.48.112.151])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 54DLhEQB022904
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 17:43:14 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 248E72E00DC; Tue, 13 May 2025 17:43:14 -0400 (EDT)
Date: Tue, 13 May 2025 17:43:14 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
        linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <20250513214314.GA6368@mit.edu>
References: <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu>
 <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
 <20250512144402.GA200944@mit.edu>
 <CACT4Y+as-Uy_BUjLDxfNwC2+78U3kJdaaKL=vbUNMZH9VcLiGQ@mail.gmail.com>
 <20250513120549.GA9943@mit.edu>
 <CACT4Y+Y+E6xnOOJ8zwSdy09FT-OLPPYVFLvZsdpEOkYQ2vsTRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+Y+E6xnOOJ8zwSdy09FT-OLPPYVFLvZsdpEOkYQ2vsTRg@mail.gmail.com>

On Tue, May 13, 2025 at 06:09:24PM +0200, Dmitry Vyukov wrote:
> 
> Ted, have you read what this thread is about? :)
> I was talking only about images that fail fsck.

If it fails fsck, don't mount the !@?@# image.  For ext4, we can fix
pretty much any corrption, so using fsck.ext4 -y should work for nearly all
file system images.

> Re headcount, if we want that to ever happen, shouldn't we do what I proposed?

Do what?  Tell users that they should be able to mount untrusted file
systems that fail fsck, and after we have a catastrophic security
failure, hope that someone will fund it?  I don't think that's very
responsible.

Or did you mean spamming open source volunteers with syzbot reports
hoping that you can shame/abuse them to do the work for free?  Sorry,
that's not going to work.  It's just way too much of a lift ---
multiple SWE-years worth of work is not something that I'm going to do
after midnight or on weekends.

If you really want to mount file systesms that fail fsck, or you're
too lazy to run fsck on untrusted images (and this shouldn't be hard
to teach the desktop software check the file system automatically
before auto-mounting it), then another possibility is:

> > If you want to be even more paranoid (or the proprietary file system
> > doesn't have a good fsck), you could mount the file system via a guest
> > kernel running in a VM, where the VM is locked down using a seccomp
> > sandbox, and which provides file system services via 9pfs to the host
> > kernel.  9pfs is a remote file system which is easy to audit, and this
> > is a key part of the security strategy used by gVisor.

       	     	     	 	  	   - Ted
