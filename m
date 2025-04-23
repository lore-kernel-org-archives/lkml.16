Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21F6426AA93;
	Wed, 23 Apr 2025 08:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396473; cv=none; b=Ir33WbvjqmOIIBWHZya7ddGEKmUWdsF7bQMZpU5ap6yZWUKzxLssXwdcgbDZU1eBhnz6awy17gDFCA3e+d2g6lOOzWYVo9g5yXfD1EhvhJ741CWQ3+GhWS0GR7wo1zDI8FVBjm5B1bs5Qg5EhK7tLdbnHQ07GvYY6WatvJFvKWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396473; c=relaxed/simple;
	bh=I1q2Dpm1ydFtkNUSvYSxkbmRdd0OEB80H9jvtglEtt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I/BXibv1Joio41Axxq5jimWF6ES5yKVBLFKER+UKjhT4kV0keK/Kasyas3IVZblZo99o0rW1ncCsjI9mPZt07hM9oyRUJe/1r0INQrThVIQF7l4uQK0qAKP/0VtQWktTbJHToWJQPTSgT9vuCno57CL9t13JItpnp/bU/yrD1qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hkIdFz1W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hkIdFz1W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4539CC4CEE2;
	Wed, 23 Apr 2025 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745396472;
	bh=I1q2Dpm1ydFtkNUSvYSxkbmRdd0OEB80H9jvtglEtt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkIdFz1WcY8wkJlqvDDv1ObJS2X/+ILWIFxxo9VTzxv6asQdnhfZV/IJUZDESK/48
	 ZSQmTspuewRjK8lk/5OJ2CMTFWG/ihC8p89dMgGUCsSNxBe8AIssTOa6z62q4RKUH7
	 ufugjgn4/t7KTqLP2yPqslYeNgkLBHzuySM5ulFk=
Date: Wed, 23 Apr 2025 10:21:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <2025042301-flammable-masculine-ec48@gregkh>
References: <2024122837-CVE-2024-56705-049b@gregkh>
 <aAicoAmxX0B_O3Ok@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAicoAmxX0B_O3Ok@tiehlicka>

On Wed, Apr 23, 2025 at 09:54:08AM +0200, Michal Hocko wrote:
> Hi,
> our internal tools which are working with vulns.git tree have noticed
> that this CVE entry has been altered after the announcement.

Good catch!

> There was an additional commit added to the CVE entry. The current state
> is
> $ cat cve/published/2024/CVE-2024-56705.sha1
> ed61c59139509f76d3592683c90dc3fdc6e23cd6
> 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654

Yup!

> There seem to be handful of other cases like this one AFAICS.

Yes, we had to add support for this type of problem.

> I have 3 questions:
> 1) What is 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
>    relation to the original CVE which seems to be about a missing memory
>    allocation failure check?

Removing the driver entirely from the kernel "fixed" the vulnerability :)

> 2) What is the process when a CVE is altered? have I missed any email
>    notification?

We do not do email notifications when CVEs are altered.  You have to
watch the cve.org json feed for that.  Otherwise the email list would
just be too confusing.  Think about every new stable update that happens
which causes 10+ different CVEs to be updated showing where they are now
resolved.  That does not come across well in an email feed, but the json
feed shows it exactly.

Or you can follow the github cve feed, which shows this, OR you can just
follow the vulns.git git commits which also show this.

> 3) Until now CVE -> sha was a 1:1 mapping. Can we expect this to change
>    and what exactly is the process here?

The process has changed in that we have had to handle a number of CVEs
where both the commit that caused the vulnerabilty has been tracked to
mutiple commits (think of one-off changes that only happened on
different stable branches, and then were fixed with different commit
ids, like what happened in CVE-2025-40364), or this example you are
pointing out where a vulnerability was introduced, later removed by
having the entire driver removed, and then added back by adding the
driver back and then resolving the vulnerability.

The original CVE had this information as you point out:

 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 5.10.231 with commit 0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 5.15.174 with commit 4676e50444046b498555b849e6080a5c78cdda9b
 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.1.120 with commit 02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.6.64 with commit 8066badaf7463194473fb4be19dbe50b11969aa0
 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.11.11 with commit 74aa783682c4d78c69d87898e40c78df1fec204e
 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.12.2 with commit 0c25ab93f2878cab07d37ca5afd302283201e5af
 	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 6.13-rc1 with commit ed61c59139509f76d3592683c90dc3fdc6e23cd6

And now it shows this:

	Issue introduced in 4.12 with commit a49d25364dfb9f8a64037488a39ab1f56c5fa419 and fixed in 4.18 with commit 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 5.10.231 with commit 0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 5.15.174 with commit 4676e50444046b498555b849e6080a5c78cdda9b
	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.1.120 with commit 02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.6.64 with commit 8066badaf7463194473fb4be19dbe50b11969aa0
	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.11.11 with commit 74aa783682c4d78c69d87898e40c78df1fec204e
	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.12.2 with commit 0c25ab93f2878cab07d37ca5afd302283201e5af
	Issue introduced in 5.8 with commit ad85094b293e40e7a2f831b0311a389d952ebd5e and fixed in 6.13 with commit ed61c59139509f76d3592683c90dc3fdc6e23cd6

Showing that the kernel ranges from 4.18 -> 5.8 were NOT vulnerable to
this specific issue.  Information that is hopefully very valuable to
distros dealing with old kernels, like yours :)

So now we can properly handle this types of issues in an automated
fashion, thanks again for noticing, this was a non-trivial amount of
work to implement.  Given that no one had ever done this before, we have
had to create all of this "from scratch".

Our trees are crazy, hopefully this helps explain the lifecycle of
vulnerabilities and their fixes better than before.

One other note, perhaps you just want to parse the .dyad files we
create instead of mbox files?  That provides a machine-readable format
of what commits caused a specific vulnerability, and what commits fixed
it, if any, in any specific kernel branch that is known.  I know at
least one distro and one company that just relies on those files
directly instead of attempting to parse the crazy json output that
cve.org requires which in some places, I would argue, shows actually
incorrect information, but that's a different topic...

I really should write up more information about all of this one day, but
we've just been heads-down trying to implement all of this to deal with
the complexity involved in a way that is scalable over time.

Does that help?

thanks,

greg k-h
