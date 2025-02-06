Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA481B7F4;
	Thu,  6 Feb 2025 00:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738801125; cv=none; b=uSD5r16sGVpecCs+DKPMQq7cbj1UEBSciAYwMko+j3I5U+Yg+gjhfPpv4kxLRO6bByI4ONUiMx8E7LNARYwz7xN5yrMzK3fiZq6NAw2ysHwojR4SXzMFzDhrmNIBBTL714azEGPBtyUH2F4qbWg5NaZHxNDsmU7A9lajye4jXAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738801125; c=relaxed/simple;
	bh=E+pYdhsPvHhQ8jXoO5py2GVfuOrX2bUxO3EuEYYha4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk3hzQsLnzemNnRY4Tf0pvo4tDjINGbt9+LySAkAsl2WGcZ+3rjE0wKlBRI1D/qW62miZYSTOxoytRLC8akLEsaGdnxYUGEFqjmCe1YvQiycZaScQdC1VTUzLEpPK1ZR5/DQq54PRMFDIg3irtjDAIunQZRlbNTQcCaT8NMLsqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=HGjU/0Hf; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="HGjU/0Hf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=4cC94VJ94yQ9faGu3XJ7/RBBOppOOQ84dvzV/nxSx8U=; b=HGjU/0Hfp4E2LZK5
	BtWjKXV3HDTBuxLBrYMMAuzhYROjEPGBQ3kV0OFz5pSfdUByQgDYE8X5R2G9APXkuhypNxFpZMDkh
	OWHlANAPcPhFsp5qkEnkFZwhoFsHRR9AGZWEx0QdGBoVRI6OxCfNVqEpiEollScPHGjHucieAANNK
	nKNrS5uVQmKJnTSshHQXbjxTBosc86GCBL1C93DE3A1rbbJ/9B0yOCWvBK1v7oNZMODT+ZUYGMUqd
	Tvu1aIooS80Kh+3huwRVLD/OTMgzqhMwSCHhREeylhgJrtNYwqnPAdd0GLxJOrwImd9hdyE/xxK5u
	UQGpKsTHNMU6y6hiuw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tfpbI-00DsNa-31;
	Thu, 06 Feb 2025 00:18:36 +0000
Date: Thu, 6 Feb 2025 00:18:36 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: max98095: Remove unused max98095_jack_detect
Message-ID: <Z6P_3MkKx0WnlLOF@gallifrey>
References: <20250205014458.486207-1-linux@treblig.org>
 <dc0bc826-6105-49f1-8a59-bb4881e9143e@sirena.org.uk>
 <Z6Nbr4XIN421orTF@gallifrey>
 <Z6P7CaRSk4RD3jLc@gallifrey>
 <1853fc7c-39d4-4d15-819d-7c9426f671b0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1853fc7c-39d4-4d15-819d-7c9426f671b0@sirena.org.uk>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 00:17:47 up 273 days, 11:31,  1 user,  load average: 0.00, 0.00,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Mark Brown (broonie@kernel.org) wrote:
> On Wed, Feb 05, 2025 at 11:58:01PM +0000, Dr. David Alan Gilbert wrote:
> > * Dr. David Alan Gilbert (linux@treblig.org) wrote:
> 
> > > > No, this is exported for machine drivers which might not be in tree.
> 
> > > Ah OK; of course it would be nice if they were in the tree.
> 
> 
> >   Is that also true of mt6359_accdet_enable_jack_detect ?
> > I can't find any callers in tree.
> 
> Yes, and any other jack detection control following the same pattern.

OK thanks.

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
