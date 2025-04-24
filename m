Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F2419CC02;
	Thu, 24 Apr 2025 13:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745502519; cv=none; b=jdeN1QaWrBRfZ3qJX/XQadO+tajlHmdSdE+EMGoUpSTwDZjXio4jLPomTSgLev3lUUWhmj44o9iTQJWt3yed9JbvyA7lyESHJodty8ix6dKaTu9V2zGceZrVTwnZ19rTZFYpeb3KFFFMGE+bZ8R2G0e0eQKCwx1T0M5AEEaQQzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745502519; c=relaxed/simple;
	bh=MD6RQCkFVVErsOAdSw1Blml2wWyRYQ3oNub1LnMfAZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sF1N0VArDKgoOCc1KIfLEycQ2kikshGi+3+ygKAc025Qie598GgTi31qkf9pmHKI5ubqblrdfPHdK0IfgGwPT+av8Yd+VEO35bgldPe7nhCw1l2WSe2ObdsutSd6OHZ+5kJeNh6Slc+SfIbwdN7ltre6CCPsOxuRS9bH5aaBX2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=or0C2NuW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="or0C2NuW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA95C4CEE3;
	Thu, 24 Apr 2025 13:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745502519;
	bh=MD6RQCkFVVErsOAdSw1Blml2wWyRYQ3oNub1LnMfAZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=or0C2NuWIPU0Di9pnsnreBxmCmkvWUhwWBjBoDji39XVG19wPWpIG0y2oQ5ke1VpM
	 bJc8KT00fJEBnFgzUZRYOmIKubyVpWesjxz31ooTQdI0uxO8dT609VufZe7tTSDThS
	 qRtU8F/Cp5iozc7bMDn2GJvIY1AtVfMJeUhzMYuE=
Date: Thu, 24 Apr 2025 15:48:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <2025042429-pediatric-tasting-20eb@gregkh>
References: <2024122837-CVE-2024-56705-049b@gregkh>
 <aAicoAmxX0B_O3Ok@tiehlicka>
 <2025042301-flammable-masculine-ec48@gregkh>
 <aAiwaM5ru-FJG2fI@tiehlicka>
 <2025042329-mystify-dramatic-dcb9@gregkh>
 <aAjOK_f-GPFHIdWK@tiehlicka>
 <2025042355-hypnotize-relight-789f@gregkh>
 <aAoLh_l-cEI4fDTa@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAoLh_l-cEI4fDTa@tiehlicka>

On Thu, Apr 24, 2025 at 11:59:35AM +0200, Michal Hocko wrote:
> On Wed 23-04-25 16:50:48, Greg KH wrote:
> > On Wed, Apr 23, 2025 at 01:25:31PM +0200, Michal Hocko wrote:
> > > On Wed 23-04-25 12:20:47, Greg KH wrote:
> [...]
> > > > 	In ia_css_3a_statistics_allocate(), there is no check on the allocation
> > > > 	result of the rgby_data memory. If rgby_data is not successfully
> > > > 	allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> > > > 	ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> > > 
> > > I do understand this statement.
> > 
> > That is the commit information, and as such we deemed it a
> > vulnerability.
> > 
> > > 
> > > > That has not changed here at all.  It's just that the ranges of git
> > > > versions for when Linux was vulnerable to this issue has been "tightened
> > > > up" to only reflect when it was possible for this to be a problem (i.e.
> > > > we now do not count the range of releases where the driver was not
> > > > present at all in the kernel tree.)
> > > 
> > > But I fail to follow this. The commit itself says Fixes: a49d25364dfb
> > > ("staging/atomisp: Add support for the Intel IPU v2") which makes it
> > > clear since when the issue has been introduced. If this tag was not
> > > present then there is CVE-$FOO.vulnerable which can specify the same
> > > thing. I do not understand how 51b8dc5163d2 is related as it has a
> > > different implementation of ia_css_3a_statistics_allocate that doesn't
> > > have any unchecked kernel allocations AFAICS.
> > 
> > Ah, ok, that changes things.  The person who said that we should count
> > the previous version of the driver said it was vulnerable at that point
> > when it was in the kernel tree.  If this isn't the case, we will be glad
> > to change this CVE to reflect that.
> 
> OK, so I have dived into this deeper just to be sure 
> 	- fix ed61c5913950 merged v6.13-rc1
> 	- breaker: the commit says Fixes: a49d25364dfb merged v4.12-rc1 which
> 	  indeed adds  ia_css_3a_statistics_allocate and uses it in atomisp_alloc_3a_output_buf
> 	- now we have 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
> 	  merged 4.18 mentioned in .sha1 file which drops the whole
> 	  driver. The driver was later reintroduced by ad85094b293e in v5.8-rc1
> 	- that being said the kernel has been vulnerable since 4.12
> 	  until 4.18 and 5.8 until 6.13. There is a gap when the code
> 	  was not there and the kernel was therefore not affected. 
> All that being said I do understand the second entry now but considering
> the first entry and its Fixes tag I believe the second entry is simply
> redundant.

Redundant if you are just using the .sha1 files, yes.  Not if you use
the .dyad files which show you exactly what you came up with here.

So for now, let's leave the .sha1 file alone, as without that second
commit in there, the tools can not figure out what you just determined
above in a programatic way.  Or if you think they can, hey, patches are
always gladly accepted!  The tools are now in rust, not crazy bash, with
a regression test suite, and any help is always welcome.

> CVE-2024-53204, CVE-2024-53205 are the same situation.
> 
> CVE-2025-40364 is different. Both of the sha1 entries are stable
> specific commits (same change) with a references to Fixes: c7fb19428d67d
> merged in v5.19-rc1. This one has a follow up fix merged in fc9375e3f763
> v5.19-rc3. 
> So this CVE seems like stable specific (probably a misbackport?) or is this
> a mistake?

It is a stable-specific CVE.  It's not the first time we've had this,
and will probably not be the last.

> > > > > > > 2) What is the process when a CVE is altered? have I missed any email
> > > > > > >    notification?
> > > > > > 
> > > > > > We do not do email notifications when CVEs are altered.  You have to
> > > > > > watch the cve.org json feed for that.  Otherwise the email list would
> > > > > > just be too confusing.  Think about every new stable update that happens
> > > > > > which causes 10+ different CVEs to be updated showing where they are now
> > > > > > resolved.  That does not come across well in an email feed, but the json
> > > > > > feed shows it exactly.
> > > > > 
> > > > > I do understand you do not want to send notifications for that. Would it
> > > > > make sense to announce a new upstream commit added to the CVE, though? This
> > > > > would make it much easier to see that we might be missing a fix that is
> > > > > considered related to a particular CVE.
> > > > 
> > > > As this has only happened 2 times so far, it's a pretty rare occurance
> > > > given us allocating over 6000 CVEs.  And how exactly would that email
> > > > look like?
> > > 
> > > We have identified that CVE-$FOO fix has been incomplete so far and
> > > extended list of fixes required for this CVE. Please make sure that
> > > those are appplied.
> > > 
> > > Or something in those lines.
> > 
> > Again, that would happen every stable release, and every -rc release,
> > could you really keep up with such an email flow in a way that wouldn't
> > just mirror watching the json feed instead?
> 
> AFAICS there usually are no updates to CVE-$FOO.sha1 file and that is what
> really matters to us to identify all the commits that are associated
> with the specific CVE.

Hopefully you all have the same tooling in place that we've created to
dig through the git repo to track what has been backported where.  But
again, if not, feel free to use the .dyad files which show you all of
the needed information in a machine readable format :)

thanks,

greg k-h
