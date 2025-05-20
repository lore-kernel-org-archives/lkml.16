Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E30E276022
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739010; cv=none; b=VusabUC0A7KBwcgaZMX5eE0eCPwxlr2qiP75Mc7KBFJm6VgAk6jBcOqSLnIbb5Y86VgJtZyf3Uk/uecEodUjpz1H6wAb8y9ckZuZ/aLYdx1U/MSMnaatZ1jwNSlRVJ07vdMp3zrenkloZokGxe0EIfQ3C+8+0mmD0YsJz4dBExc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739010; c=relaxed/simple;
	bh=Xfy8iNfU7PtNAo7rqhBK0w5ct0Sb9RUgu85+Ge9NCqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kDzHD4Dz7c1BkNJ4hfgLhATC+JCPRDnsVIdh3pFRxNxDuFxKA3JzLOzNHLZIWSwMA+mL8cj2tjg7+Pydwva+I2+wPhkoYVEbq3S9CYjgivKMeQEfzagNwYB7nJ3A5kiCbrRfjYsXtCPWIWnDSfK7Z9dKuPlXQEgQrvN/PF8xA8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name; spf=pass smtp.mailfrom=shutemov.name; dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b=jBFKdMWx; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pAVJ32Ak; arc=none smtp.client-ip=103.168.172.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shutemov.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=shutemov.name header.i=@shutemov.name header.b="jBFKdMWx";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pAVJ32Ak"
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 223FA11400B0;
	Tue, 20 May 2025 07:03:27 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 20 May 2025 07:03:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1747739007; x=
	1747825407; bh=MgW/zmTcRDk5GdFtj+o2sHVaE4xIRve0LL0NptGGjqU=; b=j
	BFKdMWxc3JPLhePFNUGqwQV7Buwt4QFDdBH5qw1usm6/TvN95WbtOj+E0+OhcgTe
	ea7TRAi5fDVf8a+sHS5bnEdMIaCjKK/zW7xdghlATKvbFHNJegvDmEjIdrIJELKx
	bSKiPdilM9OjBRKz0BSA4FYI4M1iMCVhUoptK1N/6JKHALQdneQ+NXcC9w81nb9L
	oKs+Cx2cdz09rH/ZQ/y6LKT0UeoR+q6OXDPxb2jGfI7XnJpoDIWFYkTYTWZA3B+k
	nzhAd5UTiQzMXQlp1ego8nM86qpkUprBBtlvcIiPkJ3ndPQUMQ8ParQswslXtLUb
	BDmTCOLY98V7Ch7QGkbVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1747739007; x=1747825407; bh=MgW/zmTcRDk5GdFtj+o2sHVaE4xIRve0LL0
	NptGGjqU=; b=pAVJ32AkwizDkwBX1mLO//ISHl1VHSqnBGIu6BUjk3Be5gyR2XS
	qzNOVZIMoFP7eh8TyEm1xKFbPIyhF3GFoPmj8jyost5L65z2bcnd8v/PRz1kpZ8W
	a6QLjreCQCt07RifzeiCMoyNpOL2x1zecOzM6TKFZJ3lbIHn5v4qx5cvkJNY7YZg
	8XFQ5cazKlxPYBmPYM4N7k2RFIY7sKj3PRYPRMLzmf0WRiCc5AvGFZNnElF6O8wi
	enKoaujTWlfkI7fKaidOeMwAnEnJ3ibyHlQhKE2Kaxmsr3H03QECt8+w7hjcgDdG
	9ry60bNn7MMo/Sk2Q1i/74qd69PG5TFRjcQ==
X-ME-Sender: <xms:fmEsaPaFpwHG1Sus95vjjScEOMWSCPaOSqfAOT1Qt7saIbMdk4xIRw>
    <xme:fmEsaOYpbVGkcTRi-E1i7n5mkXunwMFk6m-0G46NFN5ZoUfVir3yk5PlG5Sr7BJbd
    431qe6KwgLSZuI2ugg>
X-ME-Received: <xmr:fmEsaB_Th8rqYFp8PW_Fn2R-326u0NV2lepuWUFKM_dWlN7-8C0EBLotwW86-9478a4N2A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddtgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecu
    hfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllhessh
    hhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffdvveeuteduhffhffev
    lefhteefveevkeelveejudduvedvuddvleetudevhfeknecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhhovhdr
    nhgrmhgvpdhnsggprhgtphhtthhopeekpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegrrhgusgdoghhithesghhoohhglhgvrdgtohhmpdhrtghpthhtoheplhhinhhugidq
    khgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgiekieeskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehmihhnghhosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtohhrvhgrlh
    gusheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepsghrghgv
    rhhsthesghhmrghilhdrtghomhdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
X-ME-Proxy: <xmx:fmEsaFoq-gpgHn8wLXv6dkUk4c5Ls3f4Fv2oj7X2J7Fvke4sVYnOhQ>
    <xmx:fmEsaKqozMGGnbYyaXZGTF_Ykikf4wWNIblJtZHpce9dLQyoZeowQg>
    <xmx:fmEsaLQoS80nSHGzfjI55G89OKCOuk_aDn2BnEF0QviSpe4-bSYk8w>
    <xmx:fmEsaCqeHwBZEkQbCT1w_HxRg7uCPfcKoBSNX8PLgKVrNZo-ah2tLg>
    <xmx:f2EsaBZNiOHDuWdiZrz7863dWW1xo4ys_iF4jESxroJ8zsuAnVXIDxIg>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 20 May 2025 07:03:23 -0400 (EDT)
Date: Tue, 20 May 2025 14:03:20 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable
 to record pgdir_shift
Message-ID: <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
References: <20250520104138.2734372-9-ardb+git@google.com>
 <20250520104138.2734372-11-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520104138.2734372-11-ardb+git@google.com>

On Tue, May 20, 2025 at 12:41:41PM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> Shrink the global variable 'pgdir_shift' to a single byte, and move it
> to the cache hot per-CPU variable section so that it can be accessed
> virtually for free.

Hm. I am not convinced about per-CPU being useful here. Read-only cache
lines can be shared between cores anyway.

Putting it to __ro_after_init should do the trick, no?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
