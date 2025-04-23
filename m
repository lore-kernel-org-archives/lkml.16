Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E613B242D69;
	Wed, 23 Apr 2025 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745403651; cv=none; b=heR2ppKx1JBBBli4DUqmIRbx12/idGNZx/3thSh1mJTg11/FCEBgkodkLwUB9PgPFOT6gb3V7VlyOaOZNm2ISInRAfyTMwagWEXgs8N1yag9It8/SYd7DOhZnorsDOZ3dPQm7DZTD7IjgMgsE5F6kggDbCceu01wH641ngspveQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745403651; c=relaxed/simple;
	bh=Zw/IMifo2Sug27qP6e0SQG9z+HJ+7Cn8KOOF3Mi1N9s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwsiyGT6xYDuLeCSg+CgoDdcOTVnp8YezMuX2RoFxayou3maypk/Lh4pVIP+J1VQdiUR2QXK0h52zhy2MYCPK2zKmB63C0pwNXFWKGd76zabAhq0MSKXE5jWRot73uX/yjv2idEZ6gl04xSpzE9Z7Lce53Hp9vRn00ui3MIuslk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cQq4o4pf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cQq4o4pf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1F7C4CEE2;
	Wed, 23 Apr 2025 10:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745403650;
	bh=Zw/IMifo2Sug27qP6e0SQG9z+HJ+7Cn8KOOF3Mi1N9s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cQq4o4pfzr2aZ66PP3K36PkbKN9pQXmQU79B7qDqVDPrFIRCYvh/W0QO3J2vCFq3r
	 bwWpBzKqkVH+pgOT6S2VFWULj+Gq8BAHKzHjiJ5wDrgUnSzPJbbyWgLFT4tmzXh8eW
	 uC/wcXa0LNkx9ayyoYB/jA44PDZwoXfdihRiXKBY=
Date: Wed, 23 Apr 2025 12:20:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michal Hocko <mhocko@suse.com>
Cc: cve@kernel.org, linux-kernel@vger.kernel.org,
	linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2024-56705: media: atomisp: Add check for rgby_data memory
 allocation failure
Message-ID: <2025042329-mystify-dramatic-dcb9@gregkh>
References: <2024122837-CVE-2024-56705-049b@gregkh>
 <aAicoAmxX0B_O3Ok@tiehlicka>
 <2025042301-flammable-masculine-ec48@gregkh>
 <aAiwaM5ru-FJG2fI@tiehlicka>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAiwaM5ru-FJG2fI@tiehlicka>

On Wed, Apr 23, 2025 at 11:18:32AM +0200, Michal Hocko wrote:
> On Wed 23-04-25 10:21:04, Greg KH wrote:
> > On Wed, Apr 23, 2025 at 09:54:08AM +0200, Michal Hocko wrote:
> > > Hi,
> > > our internal tools which are working with vulns.git tree have noticed
> > > that this CVE entry has been altered after the announcement.
> > 
> > Good catch!
> > 
> > > There was an additional commit added to the CVE entry. The current state
> > > is
> > > $ cat cve/published/2024/CVE-2024-56705.sha1
> > > ed61c59139509f76d3592683c90dc3fdc6e23cd6
> > > 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
> > 
> > Yup!
> > 
> > > There seem to be handful of other cases like this one AFAICS.
> > 
> > Yes, we had to add support for this type of problem.
> > 
> > > I have 3 questions:
> > > 1) What is 51b8dc5163d2 ("media: staging: atomisp: Remove driver")
> > >    relation to the original CVE which seems to be about a missing memory
> > >    allocation failure check?
> > 
> > Removing the driver entirely from the kernel "fixed" the vulnerability :)
> 
> What is _the_ vulnerability? While I do understand that _any_ potential
> vulnerability in the removed code is removed as well I still do not see
> how the driver removal is related to _this_ specific CVE.

"The" vulnerability is what is fixed in the last commit id, and is what
is documented in the text of the CVE, specifically:

	In ia_css_3a_statistics_allocate(), there is no check on the allocation
	result of the rgby_data memory. If rgby_data is not successfully
	allocated, it may trigger the assert(host_stats->rgby_data) assertion in
	ia_css_s3a_hmem_decode(). Adding a check to fix this potential issue.

That has not changed here at all.  It's just that the ranges of git
versions for when Linux was vulnerable to this issue has been "tightened
up" to only reflect when it was possible for this to be a problem (i.e.
we now do not count the range of releases where the driver was not
present at all in the kernel tree.)

> > > 2) What is the process when a CVE is altered? have I missed any email
> > >    notification?
> > 
> > We do not do email notifications when CVEs are altered.  You have to
> > watch the cve.org json feed for that.  Otherwise the email list would
> > just be too confusing.  Think about every new stable update that happens
> > which causes 10+ different CVEs to be updated showing where they are now
> > resolved.  That does not come across well in an email feed, but the json
> > feed shows it exactly.
> 
> I do understand you do not want to send notifications for that. Would it
> make sense to announce a new upstream commit added to the CVE, though? This
> would make it much easier to see that we might be missing a fix that is
> considered related to a particular CVE.

As this has only happened 2 times so far, it's a pretty rare occurance
given us allocating over 6000 CVEs.  And how exactly would that email
look like?

We are just changing the ranges here, we change ranges of where a kernel
is vulnerable all the time by adding new .vulnerable files to the tree
as people report them, and as fixes are backported to older stable
kernel trees.  That's much more important to you than this type of
change, right?

> > Showing that the kernel ranges from 4.18 -> 5.8 were NOT vulnerable to
> > this specific issue.  Information that is hopefully very valuable to
> > distros dealing with old kernels, like yours :)
> 
> Nope, not really. Specific stable tree versions affected is not the most
> important information to downstreams like ours. We really do care about
> specific commits that are coupled with the CVE. If the specific commit
> doesn't have Fixes tag then we look a the CVE-$FOO.vulnerable as well
> (btw. I have a growing list of those that we have identified breakers
> for and I am looking for the best way to contribute that information to
> others. I am just not sure how to do that in the most efficient way -
> sorry slightly offtopic here - we can follow up off the list.).

The simplest way is to send us patches to the repo that add .vulnerable
files for those CVE ids, like others have been doing.  Look at the git
history for many examples of this happening.

And yes, git ids are the most important thing, and now we have also
tightened up that range.  That can be shown in the diff to the dyad
file:

diff --git a/cve/published/2024/CVE-2024-56705.dyad b/cve/published/2024/CVE-2024-56705.dyad
index d4897cd95a08..41ccd4b840c1 100644
--- a/cve/published/2024/CVE-2024-56705.dyad
+++ b/cve/published/2024/CVE-2024-56705.dyad
@@ -1,9 +1,13 @@
-# dyad version: 0752e6917bd6
+# dyad version: 1.1.0
+#      getting vulnerable:fixed pairs for git id 51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
 #      getting vulnerable:fixed pairs for git id ed61c59139509f76d3592683c90dc3fdc6e23cd6
-4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:5.10.231:0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
-4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:5.15.174:4676e50444046b498555b849e6080a5c78cdda9b
-4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:6.1.120:02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
-4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:6.6.64:8066badaf7463194473fb4be19dbe50b11969aa0
-4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:6.11.11:74aa783682c4d78c69d87898e40c78df1fec204e
-4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:6.12.2:0c25ab93f2878cab07d37ca5afd302283201e5af
-4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:6.13:ed61c59139509f76d3592683c90dc3fdc6e23cd6
+#      Setting original vulnerable kernel to be kernel 4.12 and git id a49d25364dfb9f8a64037488a39ab1f56c5fa419
+#      Setting original vulnerable kernel to be kernel 5.8 and git id ad85094b293e40e7a2f831b0311a389d952ebd5e
+4.12:a49d25364dfb9f8a64037488a39ab1f56c5fa419:4.18:51b8dc5163d2ff2bf04019f8bf7e3bd0e75bb654
+5.8:ad85094b293e40e7a2f831b0311a389d952ebd5e:5.10.231:0c24b82bc4d12c6a58ceacbf2598cd4df63abf9a
+5.8:ad85094b293e40e7a2f831b0311a389d952ebd5e:5.15.174:4676e50444046b498555b849e6080a5c78cdda9b
+5.8:ad85094b293e40e7a2f831b0311a389d952ebd5e:6.1.120:02a97d9d7ff605fa4a1f908d1bd3ad8573234b61
+5.8:ad85094b293e40e7a2f831b0311a389d952ebd5e:6.6.64:8066badaf7463194473fb4be19dbe50b11969aa0
+5.8:ad85094b293e40e7a2f831b0311a389d952ebd5e:6.11.11:74aa783682c4d78c69d87898e40c78df1fec204e
+5.8:ad85094b293e40e7a2f831b0311a389d952ebd5e:6.12.2:0c25ab93f2878cab07d37ca5afd302283201e5af
+5.8:ad85094b293e40e7a2f831b0311a389d952ebd5e:6.13:ed61c59139509f76d3592683c90dc3fdc6e23cd6

> > So now we can properly handle this types of issues in an automated
> > fashion, thanks again for noticing, this was a non-trivial amount of
> > work to implement.  Given that no one had ever done this before, we have
> > had to create all of this "from scratch".
> > 
> > Our trees are crazy, hopefully this helps explain the lifecycle of
> > vulnerabilities and their fixes better than before.
> > 
> > One other note, perhaps you just want to parse the .dyad files we
> > create instead of mbox files?
> 
> We are not parsing mbox files. We do care about CVE-$FOO.sha1 and that
> provides the base for our future analysis. If we need to expect several
> upstream commits there we are fine with that. Quite honestly seeing a
> stream of CVEs all fixing the same vulnerability just because those
> fixes happened in many commits doesn't seem to be optimal.

I don't see any multiple CVEs happening here for the same issue, so I do
not understand what you are referring to.

Again, try following the .dyad files.  I think that will help you out a
lot more.

thanks,

greg k-h
