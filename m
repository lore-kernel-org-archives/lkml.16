Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13712A8C1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 14:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799552; cv=none; b=qv9oqXM4L64cGDW/0WUMWRyubCOuaub870kMwxWfyhQoSBHWJZ+k4L/13REM8qTSK9wvccdb4b7bqJhJUouUtwSU/A55K+8Tt2zv+2Y9461pmKl5uo0CtDBNr+z68mkyktSg6uI0NjCS4/9wUgWojZ/riA+153hHbOkBAFJ/2ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799552; c=relaxed/simple;
	bh=57yrXjniyka9vWidD9DuoDUPGCgZ7kNXE7C9Z5IyI0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IgTUD8UYhHB17sQcuBu4MOSf33naQeyRR4eFVf4vcsmvi+mIU3aHcszvCa0853c0k6963Z+EPTIJCjYBOztHdFyoSV9ptTC8LQJIhMCxy6VZr4C3ZKx4Qozvix4zqOVXdYEXUB+qAoUectuhn5LKDKM/SDoKok9RD8FK0JMRUsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-82-148.bstnma.fios.verizon.net [173.48.82.148])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 549E5bZO019412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 May 2025 10:05:37 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id 341C82E00E1; Fri, 09 May 2025 10:05:37 -0400 (EDT)
Date: Fri, 9 May 2025 10:05:37 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
        linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <20250509140537.GB92783@mit.edu>
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>

On Fri, May 09, 2025 at 09:47:20AM +0200, Dmitry Vyukov wrote:
> By running fsck on the image. Or what do you mean?
> 
> > AND which version of fsck?
> 
> This needs to be answered as part of establishing the vulnerability
> triage process. I would go for a relatively fresh version. That will
> remove bugs fixed a long time ago, and if users rely on it for
> security purposes they have to update it.

If someone can come up with a fuzzed file system that can cause
fsck.ext4 to crash, or which fsck.ext4 can't fix said corruption such
that any kernel in the last 5 years (or heck, I'll be generous,
*ever*) results in a kernel crash or vulnerability, feel free to file
the security bug against e2fsprogs.

The last time an image triggered a e2fsck crash was three years ago
(CVE-2022-1304), and the last time that fsck.ext4 failed to fix a
corruption which could trigger a kernel issue was six years ago
(CVE-2019-5094).

My only caveat here is that it needs to be a real crash --- if it's
some bullsh*t fuzzer that treats e2fsck using more than 6 megabytes as
a "security vulnerability" that I have to fix in 30 days or "we will
tell the world", I'll stop engaging with the fuzzer project (i.e.,
oss-fuzz).  As far as I'm concerned, calling things like this a
security vulnerability says a lot more about fuzzer project than
e2fsprogs.  There are security research labs (such as TALOS) that can
send me security reports for e2fsprogs that doesn't waste my time.

In any case, if fsck can't fix the problem, then it's a e2fsprogs CVE,
not a kernel CVE --- so it's not something the kernel cVE process
needs to take into account.  If it's a corrupted file system image,
then fsck.ext4 should fix it, and if it can't, that's an e2fsprogs issue.

> I think classification should be tied to users and use cases in the
> first place. I, as a developer, wouldn't want any CVEs assigned to my
> code, if I could just wish so :)

I think classifications should be tied to what develoeprs say is a
valid way to use their code.  If users do something irrresponsible,
that's the user's fault.  And if the product ships the system in an
insecure default, then it's a security problem with the product.

	 	       	      	       	       - Ted
