Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEEE2356CC
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 17:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744133796; cv=none; b=jwuIsZSGB+TLCkKpsuOymv2L6IErp948q28k2N96sgFj6tpXLPzQMgRUr9nb9NNlnMlOk61Yu7r+W7puNmF8NDX0ggNuY14a2Ht2N5/9TvZOe6OfWgJ8RnSyiL7aS5OqYAh0f3eB+b/zzzcdJHufQylCx6zD2I4zKJvq3j4HhrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744133796; c=relaxed/simple;
	bh=e1v03qhoKHe5NlE/St2NS6gkQC+osDJD17p9pFuJSoo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jg3dQeOwduarwSVQCdsRzZcioOji0an2Ikn+yaz2I95WLKDNPaRa1No1eu/9GyanJLbJxPOpziP8uXTWPgYVbS2OIPDK9MiBzmovGnIEqymueajPpLEtgGOFhgiU9TKG+sEQkr/EkIWbwqZzccR1SiCtp8gS1kC77HtyCaucDM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fg8mg9gE; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fg8mg9gE"
Date: Tue, 8 Apr 2025 13:36:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744133791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YiTj+TYMMrnw1KVdV+/Tp51hNrHvFavfK7rU6JmuP/8=;
	b=fg8mg9gEmWQ8T8G3GlTPaHrVH0lKp9cL+mxLgUqeAPE+fL3Mqw+vqjiPGr5eYr3VIGYaJd
	awCFAWoL3gBEldkX/wLwKOR3bvK81dNYUTock/dTngzseMmnH96uiw72FZEaK6G+IIkvq7
	50gtJzIvPVGm9GA1ogMfbS9gZ8Mzo7Y=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Phillip Lougher <phillip@squashfs.org.uk>
Cc: Jan Kara <jack@suse.cz>, Andreas Gruenbacher <agruenba@redhat.com>, 
	Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Carlos Maiolino <cem@kernel.org>, 
	"Darrick J. Wong" <djwong@kernel.org>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>
Subject: Re: Recent changes mean sb_min_blocksize() can now fail
Message-ID: <z3tovmo2cxgkvesiyrrvhnd3nk2qgogt6553hyxrmmodoiptdh@4hahwdkhx7da>
References: <86290c9b-ba40-4ebd-96c1-d3a258abe9d4@squashfs.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86290c9b-ba40-4ebd-96c1-d3a258abe9d4@squashfs.org.uk>
X-Migadu-Flow: FLOW_OUT

On Tue, Apr 08, 2025 at 06:33:53AM +0100, Phillip Lougher wrote:
> Hi,
> 
> A recent (post 6.14) change to the kernel means sb_min_blocksize() can now fail,
> and any filesystem which doesn't check the result may behave unexpectedly as a
> result.  This change has recently affected Squashfs, and checking the kernel code,
> a number of other filesystems including isofs, gfs2, exfat, fat and xfs do not
> check the result.  This is a courtesy email to warn others of this change.
> 
> The following emails give the relevant details.
> 
> https://lore.kernel.org/all/2a13ea1c-08df-4807-83d4-241831b7a2ec@squashfs.org.uk/
> https://lore.kernel.org/all/129d4f39-6922-44e9-8b1c-6455ee564dda@squashfs.org.uk/
> 
> Regards
> 
> Phillip

this would be a good time to use __must_check
