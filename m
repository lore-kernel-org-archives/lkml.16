Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18C54C6E;
	Fri, 25 Apr 2025 09:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571904; cv=none; b=na0F7JEd40a5D8bYQ78g/tOiTa7jtqlOvwHzAfwmxewstmybmDENwZND7CgZUKTbi5/apoRrke686fi/aIW7ItfqmaED7hYvlfyGj6x4RSfYAuTF485h4oDbHntHSNkvfr0Lz/DjZ7ti7oqHB1OfCYDYsxYvO4TrBo7MMQ/nFUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571904; c=relaxed/simple;
	bh=j2kEZAVHbIGqF6WESFWz2csF/2nLUhVcO8sVcf/FOKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EdFnqBwR5GsFbP2gOnocP436D8trf+Idmb/jNQ27q/ecAoCZVZT5rDPjPx72mh1T7RvcGY9i1oxC6eBFcBQPqfLvBGEjtq4m+ufFX6D/xOyxai+tAIorAKP9hrmfKAaVlVXEgmvvnYQlVpXpuu89NZ1GOrGQNHeCABNIk/1rUL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=y7CtDXrJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="y7CtDXrJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5777C4CEE4;
	Fri, 25 Apr 2025 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745571903;
	bh=j2kEZAVHbIGqF6WESFWz2csF/2nLUhVcO8sVcf/FOKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=y7CtDXrJahriY6eqN4F/feVideLn2FKeQo5JLDC/WWwARMS5QlYHDX+4XdMYpQB3T
	 Bhm5kDJ/RXDRRlbLofy58mZ2GdWw2UR7KF4ADTdP+d2VdMfpY2HH39DCqjEmFGCe69
	 B7s8G9efaHUMJz12itpf/QtfYn6npUekF41LuevE=
Date: Fri, 25 Apr 2025 11:05:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	linux-sound@vger.kernel.org, alsa-devel@alsa-project.org,
	LKML <linux-kernel@vger.kernel.org>,
	Basavaraj Hiregoudar <Basavaraj.Hiregoudar@amd.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Mark Brown <broonie@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Sunil-kumar Dommati <Sunil-kumar.Dommati@amd.com>,
	Syed Saba Kareem <Syed.SabaKareem@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Subject: Re: [PATCH 1/3] ASoC: amd: acp: Fix NULL pointer deref on acp resume
 path
Message-ID: <2025042554-gallon-coyness-3f58@gregkh>
References: <20250425060144.1773265-1-venkataprasad.potturu@amd.com>
 <6f4ee1e8-aa28-4d20-96bc-b2a7343ddbcc@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f4ee1e8-aa28-4d20-96bc-b2a7343ddbcc@web.de>

On Fri, Apr 25, 2025 at 10:55:16AM +0200, Markus Elfring wrote:
> > update chip data using dev_get_drvdata(dev->parent) instead of
> > dev_get_platdata(dev).
> …
> 
> * Would you get into the mood to replace the text “deref” in the summary phrase?
> 
> * Can a cover letter usually be helpful for such a patch series?
> 
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot
