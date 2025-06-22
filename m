Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC01F4629
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750632212; cv=none; b=Y3dYNS90y6CKPfhbrjIXKmmou8ZlLFSMv3D+wxbPducTKY9Wk73lG1hSOopMse7GGP3b3c/3fxctg4aLiVY1fy62DT9PCdjp72qX04nMc5mJMuy3CKDCTcTKeAKTJLo9rhsaHCH+tglbeQ1Bq89/hw44B+zfj1WPS6lQlf2CbdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750632212; c=relaxed/simple;
	bh=TgV7Hxb3xbHEX9bBWK8mzUFy/ZId3IWnjXib8sWDA94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXU1MVIs7h4FaZ4qhnVexeEZm963jifPLDDHQw+hSA26bKLqTVl19RQM/95VrsXZHaoSfyHc8jjgzrs220nnNnilr1yWbVfOTin2f5IQTnhh2RA2vQGJfwMlW0R8cG6vLNYb0QjCqre4gnL1rbINNyP+oDYZpTiMmG/n8+ctd3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=q1HM5cnj; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="q1HM5cnj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=34Elb6DXLSKatN2LwDoEbE44Yuov3/0AHslvennSdKY=; b=q1HM5cnjIWMCg7fy0h9PueY9ch
	mBcU72oDpf1y4zU1Cg1gOAcdNOwr8NaRBWofg1bIwguEZRw+y3WIsnzTUea350Hl9o00h8DMw+zJD
	n7Y8LZUxMVy8K3W1Cf3jEGmBmIEDlrNzSVs6vqK3RvPeHE+hELnylgRYoml+6+2JW0E31regde9Tu
	HTqt8P1F98oXir3Rk9SONTD8TIcKUYYw2ljQo92WekGKgm9wG4TSlk+GipQDU1vB35SCQYhcHRwJD
	HYLAfjZ0YrmWbt7o5m9PHm6WRyUuMj6eBsjahRGqs94xqxGPECsaeOTt9DJ/Gcm8uxJ9MiuEtysvQ
	aYVUoPmw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTTPL-00000000kmR-40GW;
	Sun, 22 Jun 2025 22:43:28 +0000
Date: Sun, 22 Jun 2025 23:43:27 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Arrsh Khusaria <arrshk01@gmail.com>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fixed spacing errors in drivers/staging/fbtft/fbtft-bus.c
Message-ID: <20250622224327.GY1880847@ZenIV>
References: <CAC6rj2wiGOWUyhhGDRA-U8i=ZToorF4o6hwFeuC3RBDZ+rtoJQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAC6rj2wiGOWUyhhGDRA-U8i=ZToorF4o6hwFeuC3RBDZ+rtoJQ@mail.gmail.com>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Mon, Jun 23, 2025 at 03:50:24AM +0530, Arrsh Khusaria wrote:
> Hi,
> This patch fixes spacing issues in drivers/staging/foo/foo.c,
> such as spacing before parentheses and indentation, to comply with the
> kernel coding style guidelines.
> 
> There are no functional changes.
> 
> This is my first kernel patch. Please let me know if anything needs to be
> improved.

Er...  Trying to compile the result, perhaps?

> Removed unnecessary whitespace and trailing comma inside a function
> parameter list, as reported by checkpatch.pl. No functional changes.

... and not treating the output of checkpatch.pl as unfallible oracle.

Seriously, try to build the resulting tree and see what happens.
