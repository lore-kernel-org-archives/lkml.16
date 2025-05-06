Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9716128032F;
	Tue,  6 May 2025 13:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536588; cv=none; b=s5H0QpqmgqeEeqqak0RTGrSW3V7a0H0SdI6lZR+IHnhBpmcqrWKNSl+Pt2gXDDUf5hO0HC0CTJkudBncOTutFmrjRtxt3z+kqn2TOibA0lWEk5Ye588FOpT7APfFIRcT+PRTuL+Ej27RdQ6vE/xEkzPK1N1tQX7gqdZw637jBfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536588; c=relaxed/simple;
	bh=frZ0PYstyl46/5nEUpd1FloieyQNYI1KDuIyAFHbXyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=b5Woop6eODmlTHxqkGRvg9HSCMKlXldx7pDZsPWKGS7RBnCQM5S9MrO/YUT/85eYmMnTqJ1eexnKbDD6oZEj61xjFjEuuUqtt1laflrm59fKWpJ/StaZkXK5fbTpOOLkSEQIPFGhjSYQrSgakAeGe8/FrKInXTRRpoVgr1XbN8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WzS8bhK8; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WzS8bhK8"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C5B5B403A7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1746536585; bh=frZ0PYstyl46/5nEUpd1FloieyQNYI1KDuIyAFHbXyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WzS8bhK8bOHyhhTzB4B2obBr7BSv4xyV1/naOLO/wtmPPQCjIwOt7ltsKywfXKtBI
	 9TEbi+SQ83Zh5Pu5S4sQEOc9KoxL54X4wlpnaF4lEA8AGQtxPat+M/69txUbdt2bwm
	 KmkupHiTNu8X0/WfVxOSFQn4G1knJ7HscxS52o3lv+tdNHwmUTgqdSZKaD5iIkgt5o
	 or9swuXrzywwx4rXod5rFllTBWTNR51y9qOWKLNB6W9q5ul4+Ofk5skCSQzUuhX+MS
	 RtaWaCoDoV4azApFey7QOzXwj+vSkb30k4M8zrYLJ9jiE9/G+o7+dO9zflqmJZbziA
	 +rP/SOwwOnzlA==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C5B5B403A7;
	Tue,  6 May 2025 13:03:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Documentation
 <linux-doc@vger.kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Frederic Barrat
 <fbarrat@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Alyssa Ross <hi@alyssa.is>, Rodolfo
 Giometti <giometti@enneenne.com>, Bagas Sanjaya <bagasdotme@gmail.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Nuno Das Neves
 <nunodasneves@linux.microsoft.com>, Eric Biggers <ebiggers@google.com>,
 Jan Kara <jack@suse.cz>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, Lee
 Jones <lee@kernel.org>, Lukas Bulwahn <lukas.bulwahn@gmail.com>
Subject: Re: [PATCH] Documentation: ioctl-number: Update outdated submission
 info
In-Reply-To: <20250502074504.26933-2-bagasdotme@gmail.com>
References: <20250502074504.26933-2-bagasdotme@gmail.com>
Date: Tue, 06 May 2025 07:03:01 -0600
Message-ID: <87r011x56i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bagas Sanjaya <bagasdotme@gmail.com> writes:

> Much like device numbers that used to be assigned by LANANA (see commit
> ebdf4040c16df5 ("Documentation: update the devices.txt documentation"),
> ioctl numbers list is maintained by general kernel community nowadays
> instead of contacting Michael directly as he's long stepped down from
> kernel-related activity (his last LKML message was from 2003 [1] and
> he's in CREDITS since the beginning of kernel's git history). Also,
> patch (including one to update ioctl numbers list) submission now
> follows process as described in
> Documentation/process/submitting-patches.rst rather than sending
> patches directly to Linus as in the distant past.
>
> Update the docs to reflect that.
>
> Link: https://lore.kernel.org/r/200305261446.h4QEkBVv023861@duracef.shout.net/ [1]
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Applied, thanks.

jon
