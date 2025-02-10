Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495082580C8;
	Mon, 10 Feb 2025 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739204229; cv=none; b=WHU9vUXUl6jYTIHBfDjVr1dtzD8bi4sRLeZOacmNtSF5GUs3WbtP9oMg6uuA8iu1KaY+EKYcEaKTki0F3FlXFDtnAhCHMTgO+ISbj934NxcJU5DRRkVXM7MN9wUDi5iDTr6O5rvVi0FjBlYExIj3dbp/nUV4MacdJcqA2RvfJ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739204229; c=relaxed/simple;
	bh=LBFXb/q8egi7aIgS1a/3CHKLjebuCXgihE4lRbZKC3k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p99Or570wt/1MuLmDkMnU0IJjxUoMmADRvLLWqCstna0GkFWW4xfmxWrlrWAnl1qawsGb/TDMaI9NRpDhPAKigqAUx1n/Ryqe7K/Xj3QjX7PB/dz4OUo7MB1HCpVeEzAG7oZGzbtb/xMoLS5eEpzW8Tt1VD+82USESeItZc/Nb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hieS5rm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hieS5rm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD704C4CEF0;
	Mon, 10 Feb 2025 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204228;
	bh=LBFXb/q8egi7aIgS1a/3CHKLjebuCXgihE4lRbZKC3k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=hieS5rm5ILhtBNITlfSOIS2HNBE7LoGeT1ZcLDYwxLHkBXszSXF85vadt/qgxJk6p
	 un1Ngt+H/xPFt0DbdYMlcqKhG6hmqpISHLeSQT/X94pWMPYJrMHcWI+xyuohziJE9H
	 dwMPnSgdl4S/ShJg5LQm7zauiJpxIdepytkvpdOf7A7ZPE2np3CXMe9wkOBu9urCQM
	 ZwX/+18vnohSZAUQZwLiYYXvCG3cOXaoJgB6yJFn++4dmBF2HjpGwlthB8ecX1345t
	 RuhaBBoSzY77jr6YKluok+GZKMAJFr394VUMUVHcX+nIEMaaLeEi7dsXdUAGLOVldk
	 lWfGHNQbcHxqQ==
Date: Mon, 10 Feb 2025 17:16:58 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4] docs: clarify rules wrt tagging other people
Message-ID: <20250210171658.5eb4dc2e@sal.lan>
In-Reply-To: <559e84cc-4da3-45a5-9ff0-2283d2c53d0a@leemhuis.info>
References: <588cf2763baa8fea1f4825f4eaa7023fe88bb6c1.1738852082.git.linux@leemhuis.info>
	<Z6Vk-7OgDB3DM7Yb@archie.me>
	<559e84cc-4da3-45a5-9ff0-2283d2c53d0a@leemhuis.info>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri, 7 Feb 2025 09:24:56 +0100
Thorsten Leemhuis <linux@leemhuis.info> escreveu:

> On 07.02.25 02:42, Bagas Sanjaya wrote:
> > On Thu, Feb 06, 2025 at 03:30:10PM +0100, Thorsten Leemhuis wrote:  
> >> diff --git a/Documentation/process/5.Posting.rst b/Documentation/process/5.Posting.rst
> >> index dbb763a8de901d..22fa925353cf54 100644
> >> --- a/Documentation/process/5.Posting.rst
> >> +++ b/Documentation/process/5.Posting.rst
> >> @@ -268,10 +268,15 @@ The tags in common use are:
> >>   - Cc: the named person received a copy of the patch and had the
> >>     opportunity to comment on it.
> >>  
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
> > So for example I can only include Tested-by: when a contributor who tested
> > my patch explicitly offer the tag by replying to it i.e. with the tag, right?  
> At some point a text must leave the interpretation up to the reader. I
> would say a "yes, that's okay" to the question "is it okay to add a
> 'tested-by' tag in the patch description; note, your name and email
> address will then end up in the commit history and can not be removed
> there" is sufficient "permission" as well.

For me, it sounds reasonable to accept a public reply about someone
testing a patch as a reason to add a tested-by tag. Yet, I don't add 
tested-by myself based on replies. What I do when someone sends 
a reply saying that the patch was tested is to request the tester to 
reply with a tested-by with a short description about the test scenario.

IMO it is important to ask it to the tester, not only to have an explicit
tag, but also because as a simple tested-by without a test scenario is 
usually not very useful. 

Regards,
Mauro
