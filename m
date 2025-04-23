Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89DDC266F1E;
	Wed, 23 Apr 2025 16:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745424324; cv=none; b=Ja7aOSXoTnZHnHLjEqKGQK05MJWXeYILI5miQZI0XxPFT3detcaWKz8UuF7goKRBVXwuXWCjnAZwsrzOxbAzygalLZ4GYxe0Y0bAm6Y5UE6sws6hMilDqResY1/Tt9/6vm2aF1/HD42Y58DE/qrvP5k3h8Oq0tT9gzF+yZjHdbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745424324; c=relaxed/simple;
	bh=3dzRklZ7ar/Z+lU1ajuWagKEaicvxwAoj0zZhUgFqyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6VcO2S2Z+H+aUKMDlgsZ7GziGlB/Ljq1MKTP3JKquBFPxQWHBuuuJyPJ36DsXHQMMNctvSTHlJROQGykCWUdFzubT48Yx+ejVB72zY/0WuUb1IT0KxByjOz5zFmgb4Ru8dhVTe+EYuMgKxUPPIEFHfdSON0wKUM0ZtZkdNVrGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=OV/ltiR1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="OV/ltiR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DBC2C4CEE2;
	Wed, 23 Apr 2025 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745424324;
	bh=3dzRklZ7ar/Z+lU1ajuWagKEaicvxwAoj0zZhUgFqyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OV/ltiR1ERJ/AQvFsoBmHQRfj7XCg7hAlEvlNF+59sBqJtvlYuFUiigte5E6B310i
	 o4y//LjXvcvN6iyvVHJ560aT5DzeFfqb2ZuODIgFyvfDdKdgGoT+fPwROz/Fij6oAt
	 zp6zYc9DHjLE8t69TyUcLM13PqSj2md1K8cvrs1k=
Date: Wed, 23 Apr 2025 16:50:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <2025042355-hypnotize-relight-789f@gregkh>
References: <2024122837-CVE-2024-56705-049b@gregkh>
 <aAicoAmxX0B_O3Ok@tiehlicka>
 <2025042301-flammable-masculine-ec48@gregkh>
 <aAiwaM5ru-FJG2fI@tiehlicka>
 <2025042329-mystify-dramatic-dcb9@gregkh>
 <aAjOK_f-GPFHIdWK@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAjOK_f-GPFHIdWK@tiehlicka>

On Wed, Apr 23, 2025 at 01:25:31PM +0200, Michal Hocko wrote:
> On Wed 23-04-25 12:20:47, Greg KH wrote:
> > On Wed, Apr 23, 2025 at 11:18:32AM +0200, Michal Hocko wrote:
> > > On Wed 23-04-25 10:21:04, Greg KH wrote:
> > > > On Wed, Apr 23, 2025 at 09:54:08AM +0200, Michal Hocko wrote:
> > > > > Hi,
> > > > > our internal tools which are working with vulns.git tree have noticed
> > > > > that this CVE entry has been altered after the announcement.
> > > > 
> > > > Good catch!
> > > > 
> > > > > There was an additional commit added to the CVE entry. The current state
> > > > > is
> > > > > $ cat cve/published/2024/CVE-2024-56705.sha1
> > > > > ed61c59139509f76d3592683c90dc3fdc6e23cd6
> > > > > 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
> > > > 
> > > > Yup!
> > > > 
> > > > > There seem to be handful of other cases like this one AFAICS.
> > > > 
> > > > Yes, we had to add support for this type of problem.
> > > > 
> > > > > I have 3 questions:
> > > > > 1) What is 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
> > > > >    relation to the original CVE which seems to be about a missing memory
> > > > >    allocation failure check?
> > > > 
> > > > Removing the driver entirely from the kernel "fixed" the vulnerability :)
> > > 
> > > What is _the_ vulnerability? While I do understand that _any_ potential
> > > vulnerability in the removed code is removed as well I still do not see
> > > how the driver removal is related to _this_ specific CVE.
> > 
> > "The" vulnerability is what is fixed in the last commit id, and is what
> > is documented in the text of the CVE, specifically:
> > 
> > 	In ia_css_3a_statistics_allocate(), there is no check on the allocation
> > 	result of the rgby_data memory. If rgby_data is not successfully
> > 	allocated, it may trigger the assert(host_stats->rgby_data) assertion in
> > 	ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.
> 
> I do understand this statement.

That is the commit information, and as such we deemed it a
vulnerability.

> 
> > That has not changed here at all.  It's just that the ranges of git
> > versions for when Linux was vulnerable to this issue has been "tightened
> > up" to only reflect when it was possible for this to be a problem (i.e.
> > we now do not count the range of releases where the driver was not
> > present at all in the kernel tree.)
> 
> But I fail to follow this. The commit itself says Fixes: a49d25364dfb
> ("staging/atomisp: Add support for the Intel IPU v2") which makes it
> clear since when the issue has been introduced. If this tag was not
> present then there is CVE-$FOO.vulnerable which can specify the same
> thing. I do not understand how 51b8dc5163d2 is related as it has a
> different implementation of ia_css_3a_statistics_allocate that doesn't
> have any unchecked kernel allocations AFAICS.

Ah, ok, that changes things.  The person who said that we should count
the previous version of the driver said it was vulnerable at that point
when it was in the kernel tree.  If this isn't the case, we will be glad
to change this CVE to reflect that.

> > > > > 2) What is the process when a CVE is altered? have I missed any email
> > > > >    notification?
> > > > 
> > > > We do not do email notifications when CVEs are altered.  You have to
> > > > watch the cve.org json feed for that.  Otherwise the email list would
> > > > just be too confusing.  Think about every new stable update that happens
> > > > which causes 10+ different CVEs to be updated showing where they are now
> > > > resolved.  That does not come across well in an email feed, but the json
> > > > feed shows it exactly.
> > > 
> > > I do understand you do not want to send notifications for that. Would it
> > > make sense to announce a new upstream commit added to the CVE, though? This
> > > would make it much easier to see that we might be missing a fix that is
> > > considered related to a particular CVE.
> > 
> > As this has only happened 2 times so far, it's a pretty rare occurance
> > given us allocating over 6000 CVEs.  And how exactly would that email
> > look like?
> 
> We have identified that CVE-$FOO fix has been incomplete so far and
> extended list of fixes required for this CVE. Please make sure that
> those are appplied.
> 
> Or something in those lines.

Again, that would happen every stable release, and every -rc release,
could you really keep up with such an email flow in a way that wouldn't
just mirror watching the json feed instead?

> > We are just changing the ranges here, we change ranges of where a kernel
> > is vulnerable all the time by adding new .vulnerable files to the tree
> > as people report them, and as fixes are backported to older stable
> > kernel trees.  That's much more important to you than this type of
> > change, right?
> 
> Nope, being aware of what is actually the CVE fix is the most important
> information. Which kernels are affected specifcally is something that is
> downstream specific and stable tree ranges are only of a value to those
> who are using stable trees. Updates to vulnerable files is helpful
> during evaluation phase but once the assessment is done it acts mostly
> as a double check.

.vulnerable files get added all the time, so hopefully you are catching
those updates :)

thanks,

greg k-h
