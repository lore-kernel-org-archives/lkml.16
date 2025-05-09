Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B572139B5
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746800251; cv=none; b=AxttvDDsNQjJouL0Y0OPPeWzcP51nPQ+55m9d8S7MG1cvZqxbitW8JS46hPjVnFJs4ylqxPhVf00b1oCdlDXY0y3wfOXh5w5q/LBbGI2Ml7P4WQKW0xTTGWUodUg/xB+ZgP7tV0MVSVhXBhOCO9fkwXjNK1mgRdjkAUTXRYz/8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746800251; c=relaxed/simple;
	bh=OtQKOG7VhTI3zdW6+rNp3Aflv3idF1yielCwycvSK7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNKcDRQZkIdWJ9lRM0WCa38bHMQHpTXX+zSH2J0ypWflXyL0LZqUavJLg22vyOX+mICwnB22r4/5YcuXfUW+jW7qJZrAKygSwwl4J7Vadb+KslSXEwzG25bEs5XlvpneuivmHosu+rYbtn4tdWWNn5VWl6BgYgK/VDPn8axhcy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-148.bstnma.fios.verizon.net [173.48.82.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 549EHFtw028787
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 10:17:16 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id CFDAE2E00E1; Fri, 09 May 2025 10:17:15 -0400 (EDT)
Date: Fri, 9 May 2025 10:17:15 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Attila Szasz <szasza.contact@gmail.com>
Cc: Dmitry Vyukov <dvyukov@google.com>, Greg KH <gregkh@linuxfoundation.org>,
        cve@kernel.org, linux-cve-announce@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <20250509141715.GC92783@mit.edu>
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
> 
> Since then, I saw Canonical folks mention that they wanted to
> allocate a new one but needed to obfuscate the description so it no
> longer sounds like a kernel bug.

Sure, it's an automounter bug; or an fsck bug, assuming that their
system is running fsck -y on the file system before trying to mount
the file system.

> Which, incidentally, is not quite true either, it *is* a kernel bug.
> 
> Since then I checked, and 5.4 LTS (any<=5.6) had been vulnerable without
> the need to ever mount an untrusted/malformed FS just by systematically
> corrupting a vanilla fs's B-trees with normal operations.

So if you can come up with a reproducer that *starts* with a valid
file system which passes fsck, and then using normal, non-root
operations, you can corrupt the file system and then trigger a kernel
crash or some vulnerability, then that's a valid security bug in my
opinion.  I'll certainly treat it that way for ext4.

But you need to demonstrate this using a reproducer that doesn't start
with a fuzzed file system.  In my experience, this rules out 99% of
syzbot bugs reported against ext4.  But if you can come up with such a
reproducer, send the POC to the file system developer, and ask them to
address it.  If it's against ext4, I'll get on it right away.

> There was also a logic issue I wrote about that hasn't been
> patched, since hfs_brec_find() can return with -ENOENT, and
> hfsplus_create_attr did not treat ENOENT as a problem when
> inserting records, resulting in a flow completely missing the
> only boundary checks that were present earlier. With the issue
> that commit 25efb2f patched upstream and another issue I found,
> the condition for the rejection is no longer true.
> The image to begin with is not even corrupt.

Great, but that's not this CVE.  Note that it was entitled "... with
manually crafted filesystem"

						- Ted
