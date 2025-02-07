Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C951D7E41;
	Fri,  7 Feb 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738919128; cv=none; b=CgYv5Z7F9gc0GFYn64c/SWAut8n25WBjHqB4Sx7uciwZJjZs7CK0KdiUJhLGsYTMdUs13TvKOgjq8zCfKRbsaJtD6uSXuDNzgD5SLNBZgxM0Hfnhww9l2xuqZdYwYpEG4NAKRf99LeymR4thzr1L8qwZ3fsiSUOQDScbctGebVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738919128; c=relaxed/simple;
	bh=HDV2XgWZWGOLz7GUhH/TJiTek9PEyoDKgc7XS8kOcu0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PQLXN9bDxOgomECFv59OHqYWfD2abNcysjVsu5RvnFmSKVlz2XdCrZmNXwZMQ8xgAVEJpgMaz8jc0d07GXLveMSaqLk+FCbg1yYfjYHAGp5WLzUhDAsewLfd4JattU7KGDiSkH9lk4aw6pHGxxLocwBoGvSISAFSx2+waYn93UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rWqnbIbx; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rWqnbIbx"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ADAF2BA;
	Fri,  7 Feb 2025 10:04:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1738919050;
	bh=HDV2XgWZWGOLz7GUhH/TJiTek9PEyoDKgc7XS8kOcu0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWqnbIbxXL9V47iBpD9vejgoCdnRi0MxEe7QGTvyQQY/zC4DHRW4Y+e/Ipoqh2K1U
	 UCqtBTQvNZeLsr7R1uDEN7FuYQTUbsWJuJDNqX9a8MO7CbjAfPzAJ4id00JZSeB+wU
	 QDu2NEN4YqiwZQi1C/3selmQkJce498ECtgQcMv4=
Date: Fri, 7 Feb 2025 11:05:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
Message-ID: <20250207090518.GE24886@pendragon.ideasonboard.com>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>

Hi Thorsten,

Thank you for the patch.

On Thu, Feb 06, 2025 at 03:30:10PM +0100, Thorsten Leemhuis wrote:
> Point out that explicit permission is usually needed to tag other people
> in changes, but mention that implicit permission can be sufficient in
> certain cases. This fixes slight inconsistencies between Reported-by:
> and Suggested-by: and makes the usage more intuitive.
> 
> While at it, explicitly mention the dangers of our bugzilla instance, as
> it makes it easy to forget that email addresses visible there are only
> shown to logged-in users.
> 
> The latter is not a theoretical issue, as one maintainer mentioned that
> his employer received a EU GDPR (general data protection regulation)
> complaint after exposing a email address used in bugzilla through a tag
> in a patch description.
> 
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Thorsten Leemhuis <linux@leemhuis.info>
> ---
> 
> Jonathan, what do you think of this? I felt somewhat unsure about this a
> few weeks ago, but I guess I was overly careful. If you think this
> change is fine and shouldn't cause any trouble for anyone, feel free to
> merge this. And if not, please speak up.
> 
> Note: this triggers a few checkpatch.pl complaints that are irrelevant
> when when to comes to changes like this.
> 
> v4:
> - slight wording change to make a implicity aspect explicit, as pointed
>   out by Mauro
> - Add reviewed-bys from Mauro and Shuah
> - The number of reviewed-bys is still smal, nevertheless drop the
>   DONOTMERGE and hole that Jonathan will speak up if he thinks this is
>   a stupid move.
> 
> v3: https://lore.kernel.org/all/c29ef5fa12e37c3a289e46d4442b069af94e5b05.1733127212.git.linux@leemhuis.info/
> - try yet again from a slightly different angle which loosens the rules
>   slightly. This from review feedback to earlier versions is apparently
>   what other developers want and from their "no lawyer" perspective
>   consider to be okay. As IANAL myself I don't feel totally comfortable
>   with this and have no idea if this legally is sound, so tag patch with
>   "DONOTMERGE" for now; will remove this for v4 if enough people add a
>   "Reviewed-by". Otherwise the story of this patch might end here, unless
>   someone else submits it for inclusion (you are free to do so!).
> - remote patch adding Suggested-by: tag to 5.Posting and submit it
>   separately
> 
> v2: https://lore.kernel.org/all/cover.1731749544.git.linux@leemhuis.info/
> - Retry differently. This slightly hardens the rule for Reported-by:
>   while slightly lessening it for Suggested-by:. Those in the end are
>   quite similar, so it does not make much sense to apply different ones.
>   I considered using an approach along the lines of "if you reported it
>   in pubic by mail, implicit permission to use in a tag is granted"; but
>   I abstained from it, as I assume there are good reasons for the
>   existing approach regarding Suggested-by:.
> - CC all the people that provided feedback on the text changes in v1
> 
> v1: https://lore.kernel.org/all/f5bc0639a20d6fac68062466d5e3dd0519588d08.1731486825.git.linux@leemhuis.info/
> - initial version
> ---
>  Documentation/process/5.Posting.rst          | 13 +++++--
>  Documentation/process/submitting-patches.rst | 39 ++++++++++++++------
>  2 files changed, 36 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> index dbb763a8de901d..22fa925353cf54 100644
> --- a/Documentation/process/5.Posting.rst
> +++ b/Documentation/process/5.Posting.rst
> @@ -268,10 +268,15 @@ The tags in common use are:
>   - Cc: the named person received a copy of the patch and had the
>     opportunity to comment on it.
>  
> -Be careful in the addition of tags to your patches, as only Cc: is appropriate
> -for addition without the explicit permission of the person named; using
> -Reported-by: is fine most of the time as well, but ask for permission if
> -the bug was reported in private.
> +Be careful in the addition of the aforementioned tags to your patches, as all
> +except for Cc:, Reported-by:, and Suggested-by: need explicit permission of the
> +person named. For those three implicit permission is sufficient if the person
> +contributed to the Linux kernel using that name and email address according
> +to the lore archives or the commit history -- and in case of Reported-by:
> +and Suggested-by: did the reporting or suggestion in public. Note,
> +bugzilla.kernel.org is a public place in this sense, but email addresses
> +used there are private; so do not expose them in tags, unless the person
> +used them in earlier contributions.

I like this text very much, it's concise and clear. My only possible
concern is that "explicit permission" isn't defined. I assume that
someone sendubg a Reviewed-by or Acked-by tag in a public mail thread
counts as permission, but strictly speaking it's not explicit.

Regardless of that, I think we can clarify what explicit permission
means in a follow-up patch. If you would like to merge this one as-is,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

You have my explicit permission to include this tag in the commit :-D

>  Sending the patch
> diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
> index 8fdc0ef3e604f4..72f6de419ccc4c 100644
> --- a/Documentation/process/submitting-patches.rst
> +++ b/Documentation/process/submitting-patches.rst
> @@ -495,10 +495,10 @@ list archives.  A "# Suffix" may also be used in this case to clarify.
>  
>  If a person has had the opportunity to comment on a patch, but has not
>  provided such comments, you may optionally add a ``Cc:`` tag to the patch.
> -This is the only tag which might be added without an explicit action by the
> -person it names - but it should indicate that this person was copied on the
> -patch.  This tag documents that potentially interested parties
> -have been included in the discussion.
> +This tag documents that potentially interested parties have been included in
> +the discussion. Note, this is one of only three tags you might be able to use
> +without explicit permission of the person named (see 'Tagging people requires
> +permission' below for details).
>  
>  Co-developed-by: states that the patch was co-created by multiple developers;
>  it is used to give attribution to co-authors (in addition to the author
> @@ -544,9 +544,9 @@ hopefully inspires them to help us again in the future. The tag is intended for
>  bugs; please do not use it to credit feature requests. The tag should be
>  followed by a Closes: tag pointing to the report, unless the report is not
>  available on the web. The Link: tag can be used instead of Closes: if the patch
> -fixes a part of the issue(s) being reported. Please note that if the bug was
> -reported in private, then ask for permission first before using the Reported-by
> -tag.
> +fixes a part of the issue(s) being reported. Note, the Reported-by tag is one
> +of only three tags you might be able to use without explicit permission of the
> +person named (see 'Tagging people requires permission' below for details).
>  
>  A Tested-by: tag indicates that the patch has been successfully tested (in
>  some environment) by the person named.  This tag informs maintainers that
> @@ -596,11 +596,11 @@ Usually removal of someone's Tested-by or Reviewed-by tags should be mentioned
>  in the patch changelog (after the '---' separator).
>  
>  A Suggested-by: tag indicates that the patch idea is suggested by the person
> -named and ensures credit to the person for the idea. Please note that this
> -tag should not be added without the reporter's permission, especially if the
> -idea was not posted in a public forum. That said, if we diligently credit our
> -idea reporters, they will, hopefully, be inspired to help us again in the
> -future.
> +named and ensures credit to the person for the idea: if we diligently credit
> +our idea reporters, they will, hopefully, be inspired to help us again in the
> +future. Note, this is one of only three tags you might be able to use without
> +explicit permission of the person named (see 'Tagging people requires
> +permission' below for details).
>  
>  A Fixes: tag indicates that the patch fixes an issue in a previous commit. It
>  is used to make it easy to determine where a bug originated, which can help
> @@ -618,6 +618,21 @@ Finally, while providing tags is welcome and typically very appreciated, please
>  note that signers (i.e. submitters and maintainers) may use their discretion in
>  applying offered tags.
>  
> +.. _tagging_people:
> +
> +Tagging people requires permission
> +----------------------------------
> +
> +Be careful in the addition of the aforementioned tags to your patches, as all
> +except for Cc:, Reported-by:, and Suggested-by: need explicit permission of the
> +person named. For those three implicit permission is sufficient if the person
> +contributed to the Linux kernel using that name and email address according
> +to the lore archives or the commit history -- and in case of Reported-by:
> +and Suggested-by: did the reporting or suggestion in public. Note,
> +bugzilla.kernel.org is a public place in this sense, but email addresses
> +used there are private; so do not expose them in tags, unless the person
> +used them in earlier contributions.
> +
>  .. _the_canonical_patch_format:
>  
>  The canonical patch format
> 
> base-commit: e8bcda12176c47f2ce6c5104955845d028a640e8

-- 
Regards,

Laurent Pinchart
