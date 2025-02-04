Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128F20C494;
	Tue,  4 Feb 2025 17:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689145; cv=none; b=Te+pesXs1ergeAk1SDAV50Wy8NE1R+lrCwzu/J4tlYiHFIVABvPFhpoBo5ddXf6mXU92qHVAU/8XbBUPjo4Ic7LgfZfA8pd/lLjJwiFMvS4NFmX1MedaUmSHBAKI12QjctxHKwjf5YhK/uNACUWmd75ofh6Rt5l/sFqR2g7msPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689145; c=relaxed/simple;
	bh=iR2sbzJAEjLXciWP1jYs6XfoBYVX7safFi1f2dUn82w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Pmx14P6EwiXb8TEjCExLjR6ok/zrVcn3mKgJT+YNnmCgoA4u2XPR0ej1Cxrs0W3b0vY82VrVA1agIVuu8YjLNAMyPd8qgPYN0iAW6EbCqbQcu3UNE6frgZtQyERTxBLGgUPoc9mn8h+IyOzl0Qwd/bdhZo/EhGTm/ZKQOaAWPZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ji5bUV9W; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ji5bUV9W"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6057C404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738689143; bh=TXrO7/oYwpRMBVRgvRl+Am73fMub5NwGVUWMmKWKJxY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ji5bUV9W5KT1nRTq3KFLAaOba+tHcazi+cnuD5Z7oduMytD0qYVS3AylKf++CHR4/
	 DZxQ8PXdYQuWdcuU/4bXe4Xb9u7eFDe2EwKNZIFAC++PwDFKUE7Nj3QpvCeez7TIBJ
	 eSSl9KD1pvBWhsW6lAEUoJDxXRvuIAwpA8oWHTr8SkYpeJsk1IfbrhTkcn5xgtzJU0
	 wgSvT9hJUEUOKfXl/WhTjGJG/xO9viYHZXs+9wSeNeD+1u/mO6QUpJ4FfePAtClgB3
	 I50tyGoQeZ+kzvjAkJTTXEk2CL8nu1B5ptVJbrxukjLxZdNpy8Sj6fn+7aTCIVeg9X
	 O+qe/lW/dCeZQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6057C404FA;
	Tue,  4 Feb 2025 17:12:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 18/38] docs: sphinx/kernel_abi: use AbiParser directly
In-Reply-To: <20250202155652.1652e420@foz.lan>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
 <87lduu7efu.fsf@trenco.lwn.net> <20250129014324.60a8dfce@foz.lan>
 <20250202155652.1652e420@foz.lan>
Date: Tue, 04 Feb 2025 10:12:22 -0700
Message-ID: <878qqlfxc9.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,

> As I'll be preparing such patches for merge along this week, I'd
> like to know what do you prefer in terms of directories:
>
> 1. Keep it as-is;
> 2. have a separate library directory for Python modules
>    (scripts/lib?);
> 3. place python modules inside scripts/;
> 4. place python modules inside Documentation/sphinx (IMO a bad
>    idea);
> 5. something else

Honestly, I'm not sure.  I do feel that importing out of scripts/ is
inelegant at best; having a dedicated directory for modules meant to be
imported would be better.  So maybe scripts/lib?  Or lib/python, though
that might raise eyebrows elsewhere, dunno.  Pick something you like,
and we'll give that a try.

> Btw, I'm considering to also submit later a patchset similar to
> this one converting kernel-doc to Python. I already started writing
> something like that (written from the scratch, following as much
> as possible what we have today on Perl to avoid regressions).
>
> I would probably split the code into separate classes to make the code 
> more readable/maintainable (a base class, a class with rest output,
> another one with man output, and a few other helper classes).

I definitely approve of the idea - I've pondered doing such a thing, but
have never come close to finding the time.  It's probably worth looking
at the rewrite Markus did years ago as a starting point?

Thanks,

jon
