Received: from outgoing.mit.edu (outgoing-auth-1.mit.edu [18.9.28.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA85347C7
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 12:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.9.28.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747137966; cv=none; b=oD7fKr69goANW0HII5nVNq1tcOq8UISXK02RHKQc7UtKLPUJVRUjqd5j0cldgmWvtfF6SF5YwSnFtUO7IdNGb2zqEdjaIeleSIi4uDSCvXOvnloCkJskfbji5cjFMrCaYO4+EtXrHlH1+LxIw8b9HZQQaFznDwvxRpt79mb9p1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747137966; c=relaxed/simple;
	bh=ZVXJY0WFp5OD5tS4jz0/e5PLTTFZVDR+TVRX3n9M8Hw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wpx8G6u8Mg3A0+ZmQ4nMv/2EGVvegAgVf8jbjwBkg0FSZdEfZrdRtuXYv2c1DF/1xB/eTyukSckmcT1xDFQgPVzqHB3tmFWrllHClCU/F9SnaixGgI1sSHSpbb70CzILSM5sL91BmyfzOcX5kY3m0YvavD93lPtTcqBQx3ZF9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu; spf=pass smtp.mailfrom=mit.edu; arc=none smtp.client-ip=18.9.28.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mit.edu
Received: from trampoline.thunk.org (pool-173-48-112-151.bstnma.fios.verizon.net [173.48.112.151])
	(authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
	by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 54DC5oTT032707
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 08:05:50 -0400
Received: by trampoline.thunk.org (Postfix, from userid 15806)
	id D4C4F2E00DC; Tue, 13 May 2025 08:05:49 -0400 (EDT)
Date: Tue, 13 May 2025 08:05:49 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Dmitry Vyukov <dvyukov@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org,
        linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
Message-ID: <20250513120549.GA9943@mit.edu>
References: <2025040820-REJECTED-6695@gregkh>
 <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh>
 <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh>
 <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu>
 <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
 <20250512144402.GA200944@mit.edu>
 <CACT4Y+as-Uy_BUjLDxfNwC2+78U3kJdaaKL=vbUNMZH9VcLiGQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACT4Y+as-Uy_BUjLDxfNwC2+78U3kJdaaKL=vbUNMZH9VcLiGQ@mail.gmail.com>

On Tue, May 13, 2025 at 09:09:34AM +0200, Dmitry Vyukov wrote:
> I just hoped for something at least somewhat stronger. Bugs flagged by
> fsck won't require fixing in that model.

Well, if you have the budget and the headcount to back up that hope,
you know where to reach me.  Personally, I've hoped to win the lottery
and own a private jet, but given that I'm not willing to pay the $$$
for the private jet --- I fly economy.

Consider carabiners.  I have one that I use for fastening my keys to
my belt loop or knapsack. But there are also carabiners that are
certified for climbing.  If you try to use the former for climbing, it
wouldn't be safe.  But the climbing carabiner is a lot more expensive
and a lot heavier.

As far as file systems are concerned, a hardened file system will be
more expensive, and will have less performance.  But if you are using
file systems in a data center, where the hard drive is in within the
Trusted Computing Base, paying the costs for a hardened file system is
silly.  And in fact, companies are not silly; I have yet to work for a
company, including my current employer, which has been willing to
invest in a hardened file system.

Now, the good news is that there are ways we can use a non-hardened
file system in a safe way.  You just to have the system enforce the
constraint that the file system must be fsck'ed before mounting the
file system.

If you want to be even more paranoid (or the proprietary file system
doesn't have a good fsck), you could mount the file system via a guest
kernel running in a VM, where the VM is locked down using a seccomp
sandbox, and which provides file system services via 9pfs to the host
kernel.  9pfs is a remote file system which is easy to audit, and this
is a key part of the security strategy used by gVisor.

See?  Easy peasy!  And far cheaper than attempting to harden a file
system.

						- Ted

P.S.  If some company wants the equivalent of a titanium carabiner,
where we invest a huge amount of SWE effort in making a hardened file
system which is as performant as possible, I'm certainly willing to
work with such a team.  I haven't yet seen the business case where the
ROI makes sense, but perhaps some company has a unique situation where
such an investment makes sense.

