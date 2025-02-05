Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52832215168;
	Wed,  5 Feb 2025 23:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738799889; cv=none; b=hyADemkGMqHzES1ILjRwKLwVs+P42EK4WBvTKb0ouW51Pbt7hRIOIDLWbp0Q69+YYX7snVtAl1p3vqwwqmRBZD2fKFZMmuueA7ruy6/ZlH7cVcekQds9okA2XRzGn2kaC1txHcaUGc7vqzUKzaKUzqOhGp0kcAJfFdnJ10bGiVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738799889; c=relaxed/simple;
	bh=TKBr4UCtuqVIZF577QhoEnYgTfW7I/au+E4bVRllQjk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cxv6srzV7gOXWyfExwhYX+aVzAmFiXjB/8fnpCLvjiSYCVsb1p06YLCPs8uDgMlGkOE51evheAiqGKnB98k7gVmdBJD8QT4uRx0Lm0EwGb5lVX/kccA8qtDUPKg1SBf3vY/IUrihYbNIEpYmxQJuQJKb4yGaG2cXlRq5CrknbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=f9fUF5oo; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="f9fUF5oo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=FAlp+M0TmzwrsCIWIPnbpYTzhq5mHUxMLnZfrSvrNSo=; b=f9fUF5ooWoQOvm4y
	XtXdLusZBt97PCS5S0nPFKYmk+R/opcterH28aTThFY2dOaVwVPb7l/rro+NbmRoPfYt1KqU5ckcE
	fQvSCmkw0/Wy7Z8XPlMTCBrSRN6UOB/if6NEapoY8ekxmkRP+xY44XaGLLKnNGv+588aMwFgERG08
	8gzCR1AMdv0oGUIY3OB9LbIFAQvmc+t2c/Be7kas6LCTZJZQPotG7CnTdTJRGr5G4ThHjQOqv1YvZ
	iYT08reazIOfHraiI0NSmZMwT5XyRrBdZUuqhYAKO4iWQPyKrkC4Osb+dOIidB2JIBispqIVPEAu+
	fNurX5rp1FbvXCUy0A==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tfpHN-00DsGN-0O;
	Wed, 05 Feb 2025 23:58:01 +0000
Date: Wed, 5 Feb 2025 23:58:01 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: max98095: Remove unused max98095_jack_detect
Message-ID: <Z6P7CaRSk4RD3jLc@gallifrey>
References: <20250205014458.486207-1-linux@treblig.org>
 <dc0bc826-6105-49f1-8a59-bb4881e9143e@sirena.org.uk>
 <Z6Nbr4XIN421orTF@gallifrey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z6Nbr4XIN421orTF@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 23:57:04 up 273 days, 11:11,  1 user,  load average: 0.07, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> * Mark Brown (broonie@kernel.org) wrote:
> > On Wed, Feb 05, 2025 at 01:44:58AM +0000, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > max98095_jack_detect() was added in 2012 as part of
> > > commit 9dd90c5db040 ("ASoC: max98095: add jack detection")
> > > but hasn't been used.
> > > 
> > > Remove it.
> > 
> > > -	max98095_report_jack(client->irq, component);
> > > -	return 0;
> > > -}
> > > -EXPORT_SYMBOL_GPL(max98095_jack_detect);
> > 
> > No, this is exported for machine drivers which might not be in tree.
> 
> Ah OK; of course it would be nice if they were in the tree.

Mark:
  Is that also true of mt6359_accdet_enable_jack_detect ?
I can't find any callers in tree.

Dave

> Thanks,
> 
> Dave
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
