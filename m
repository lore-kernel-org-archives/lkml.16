Received: from zeniv.linux.org.uk (zeniv.linux.org.uk [62.89.141.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68AA92C033F;
	Tue, 13 May 2025 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.89.141.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747165821; cv=none; b=X2Y1DJ6HC4LvVqSapU2Zc+/9xz2WaVEbRsvHByoJ4hUIrz3KSu0pn2juBYOUAMrOETZWiSw00i5oKXbEbXHKqS5zFYsjoYGFc8ciCNwW+SaiANAhI3XEY/x51xPmCYyMmj3L1VTJ2OjD4wE20wyhhHgcovkDglKjSmP9m6IpLMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747165821; c=relaxed/simple;
	bh=BdiAPi41+n6IgIprGo+gdL28FCyx4j/abNEqeyMMNcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cdaB59DfV/g3VYcxvK78xGhmbXWaLkhHhsmHvXR8w9whAskPr6TngSXJ4PJbtQ0nOgVJXJ7Jhz38B9wwoHCT2gVdrNDcqJoAX4YCzpXQVjNKU8ySXWz9mtSDN30TnkYC81P0ZImpFyEKVhyp56EXoACSMY+NNwAKWXZno2ukB70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk; spf=none smtp.mailfrom=ftp.linux.org.uk; dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b=nm2zaUZm; arc=none smtp.client-ip=62.89.141.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zeniv.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ftp.linux.org.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linux.org.uk header.i=@linux.org.uk header.b="nm2zaUZm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xBX3BVNMa6IV68uHVwNRfoDz3Q9NSwuileV1QH3idjE=; b=nm2zaUZmSYQ6iFHiM1DiYQrIQw
	elZ10i2Ag1jNkQ+2pOe5tWtkf+cdgME+a7OPup9AvmvYL84mwtVBA5BMJ2yhdXhAY5qi+jRK7tWjK
	Yl71pO+HlBryIab1CuMICHVlffprDYZBrGz++ntdm2avM5bMTstB+bIHJuBMQWB+tkyCzb24YgOiE
	8HEx0c2bieByL5mDpU/X0o5K1WOfgI7UwZJMxmg7rxcQkNHG6y7QpqVASPeNwtfdCVu5ytwL+wv94
	CZUN2LiraalbB7Lm/rGkyPqQNHt5mAgV+NfXyW2ZoxFlpUCaI05H19hYwufg3PJM3u824CUjzT/qR
	d3n4EcOQ==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEvdo-00000004Byz-279G;
	Tue, 13 May 2025 19:50:16 +0000
Date: Tue, 13 May 2025 20:50:16 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] CodingStyle: make Documentation/CodingStyle into
 symlink
Message-ID: <20250513195016.GI2023217@ZenIV>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <87frhcsrva.fsf@trenco.lwn.net>
 <77f03295-df5d-4bc0-9a61-5be829969662@p183>
 <20250513041249.GF2023217@ZenIV>
 <0e43117a-d92c-4563-ad2d-de6cbd02e986@p183>
 <20250513190429.GH2023217@ZenIV>
 <da087640-494a-4803-b770-10758393bd80@p183>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da087640-494a-4803-b770-10758393bd80@p183>
Sender: Al Viro <viro@ftp.linux.org.uk>

On Tue, May 13, 2025 at 10:26:12PM +0300, Alexey Dobriyan wrote:

> Right now it is clear that Greg objects but I personally think
> his counter-argument is weak.
> 
> He is basically saying that LOC count is too much so Linux should stick
> to how things were always have been even if "old style" is objectively
> inferior.

Objectively by which metrics?  You are trying to force your personal
preferences upon everybody else, doing that on a list most of us
are not even subscribed to.

You are trying to change an equivalent of build artifact, without
bothering to change the source it is derived from.  That file is
*not* a mechanism for changing reality; it codifies the existing
general agreement between the states of wetware in developers.
And if you are interested in changing these states of wetware,
l-k is the wrong place for that.
