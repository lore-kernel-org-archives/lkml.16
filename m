Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E02C1C5D7C;
	Mon, 10 Feb 2025 11:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186114; cv=none; b=eLbEmW7cBhDmtIs1Q7/iOSSRDMLDZPiM27be47z75VNo3/llFQOas6v9to1MEFeDh6bxyD0/j/YLAnE3LKR0Mj1QlJrh5Ty6GLs+hzul58nDdw56uiyMtUiEKuPISapI99N9TNtZd1XOzbSDVeckJlqQUuN4Hhqj11PF2b1DQ14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186114; c=relaxed/simple;
	bh=5CBqDfYk0oFqMBufkZckF4ZUcwXX+m/vSHvF0rrzvWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZOHaUGhlZEsOfY5oa3U4r+8RDks9e7LrzFkrnICLGNVIf5+eePev4DlgqPEpZp5uoGzm5+M6+uB6xD3rTlJZfnYJiU90+VyDxvnSAC9+P74uVxYLU12yL/MEMAa90f8o7+egC8iLi549tdKd/73/u1c6WQRVsSJKd+Ji/99XIL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cw61DjqK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cw61DjqK"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14815352;
	Mon, 10 Feb 2025 12:13:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739186034;
	bh=5CBqDfYk0oFqMBufkZckF4ZUcwXX+m/vSHvF0rrzvWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cw61DjqKaw7PXxQCCiwrbqPgnn0D4nalMo8V9cnkjFNi432mQszqyzPYk7e3j9lxB
	 XUGZnn6e5C/vQO5o8wC3GAYdgCntxcHhq+e3Rlzjy0xred0b+g+R/PB0U0tbUU/8Ty
	 4zgRXFAk/VrrIni2ntTpQyHuQJBP9raAD2P6hOOk=
Date: Mon, 10 Feb 2025 13:15:01 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
Message-ID: <20250210111501.GF2966@pendragon.ideasonboard.com>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
 <20250207090518.GE24886@pendragon.ideasonboard.com>
 <f50c7b22-2b31-47d2-8353-41d80f5241c1@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f50c7b22-2b31-47d2-8353-41d80f5241c1@leemhuis.info>

On Sat, Feb 08, 2025 at 04:36:47PM +0100, Thorsten Leemhuis wrote:
> On 07.02.25 10:05, Laurent Pinchart wrote:
> > Thank you for the patch.
> 
> Thx for saying that!
> 
> > On Thu, Feb 06, 2025 at 03:30:10PM +0100, Thorsten Leemhuis wrote:
> >> Point out that explicit permission is usually needed to tag other people
> >> in changes, but mention that implicit permission can be sufficient in
> >> certain cases. This fixes slight inconsistencies between Reported-by:
> >> and Suggested-by: and makes the usage more intuitive.
> >>
> >> While at it, explicitly mention the dangers of our bugzilla instance, as
> >> it makes it easy to forget that email addresses visible there are only
> >> shown to logged-in users.
> >>
> >> The latter is not a theoretical issue, as one maintainer mentioned that
> >> his employer received a EU GDPR (general data protection regulation)
> >> complaint after exposing a email address used in bugzilla through a tag
> >> in a patch description.
> > [...]
> >> -Be careful in the addition of tags to your patches, as only Cc: is appropriate
> >> -for addition without the explicit permission of the person named; using
> >> -Reported-by: is fine most of the time as well, but ask for permission if
> >> -the bug was reported in private.
> >> +Be careful in the addition of the aforementioned tags to your patches, as all
> >> +except for Cc:, Reported-by:, and Suggested-by: need explicit permission of the
> >> +person named. For those three implicit permission is sufficient if the person
> >> +contributed to the Linux kernel using that name and email address according
> >> +to the lore archives or the commit history -- and in case of Reported-by:
> >> +and Suggested-by: did the reporting or suggestion in public. Note,
> >> +bugzilla.kernel.org is a public place in this sense, but email addresses
> >> +used there are private; so do not expose them in tags, unless the person
> >> +used them in earlier contributions.
> > 
> > I like this text very much, it's concise and clear.
> 
> Glad to hear!
> 
> > My only possible
> > concern is that "explicit permission" isn't defined. I assume that
> > someone sendubg a Reviewed-by or Acked-by tag in a public mail thread
> > counts as permission, but strictly speaking it's not explicit.
> > 
> > Regardless of that, I think we can clarify what explicit permission
> > means in a follow-up patch. If you would like to merge this one as-is,
> 
> Hmmmm. Not totally sure that I exactly understand what you mean, but I
> think I see it.

What I meant is that I interpret "explicit" as requiring an explicit
mention of permission (e.g. "You can add my tag to the commit"), while
replying to a patch with a tag on a public list seems to me to convey an
implicit permission instead.

> But I'm not sure how to solve that. Would simply
> dropping the "explicit" solve this? Or should I start the section like this:

Dropping "explicit" seems to be the simplest solution, but the next
sentence mentions "implicit permission" which would then sound weird.

> ""
> Be careful in the addition of the aforementioned tags to your patches,
> almost all need permission by the person named; one can be assumed if
> the person provided that tag in a reply or acknowledged its inclusion

"in a reply to a public list"

> after being made aware that name and email address will end up in public
> places where they can't be removed.
> 
> The tags Cc:, Reported-by:, and Suggested-by: are an exception: for
> those three implicit permission is sufficient, ...
> """

This sounds good to me.

-- 
Regards,

Laurent Pinchart
