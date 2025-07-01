Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78E427603A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380731; cv=none; b=IiZ2Rwpk6bhxd13ZhaC/5g3IduooN9FuIfqdpAFp4Cmz8KHCrYvam0ykEOsMgrfbLCt58xN2l9EwLDe0H+GvN+kdVmcEQ5nCFS0hHl688GEiFkvS7FRGySM47Pofv/I+DFQiktSp2qG26o2EbCaG4sbfu7jDFoNme+aJ7cAgvec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380731; c=relaxed/simple;
	bh=xLGzyJ4wASsmB0W72B4BQYByjEj3lUQpUta0j2dvizQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fw21cKRcjsoSUvZ7ZB5V+acGuuMXSGuotTi1aexS/LNrRpfSOPJLh8D2sHlm9+5bjH2/a24eFCLeidRgnD6D64DNB+tw48/IGi8JMsqjJIBzKG1N4ARAdgAL5PmIAAXkMYSxpfXhp5IMY6hRBGv1kuGqs8ff0MNd9LtqET67yJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=iPlRKZ6T; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="iPlRKZ6T"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bWlyY18dHz9t0n;
	Tue,  1 Jul 2025 16:38:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1751380725;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8dQnsRgXInr3waVHxViXnNBvv1CdWWosUAIrljCq518=;
	b=iPlRKZ6TnLDi/HqwbaMg51Y3gLGbguTtKaoL5tr6qxKpDGQSY/rLF+xOQFWDj9X0LK8MKX
	v9XTlj15YPkWFo+hvm1SGi8xh88pZEKgB2zdyQewFnld6Gqkjx+ua47NiBWBQGcrF9LvvA
	/u6Rfuy69NpHexbqP2BButGcc2jIIcy9bQBCK160fuEdZarcx3O/XBu/KxxJa04lfLwPPB
	tr4N4yTlOoux8eGm9k/+Myinw9hFYntm0pACHMy+Hu4TX0Hpj/FbbKWMquIudn8hXv7cVV
	y6KqVg7k801Z+TPveXUS0xby/IjqsxGgkTFjSklFeGZLqUp0i7D8sOl8rcgOLw==
Date: Tue, 1 Jul 2025 20:08:34 +0530
From: Brahmajit Das <listout@listout.xyz>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, alexander.usyskin@intel.com, 
	tomas.winkler@intel.com
Subject: Re: [RFC PATCH] samples: mei: Fix building on musl libc
Message-ID: <6iseanlkrqoci3fgylsnzf4lxrvtf6o32tfvpoux4axyugiv6a@dnx76o5t2l2j>
References: <20250630204430.10968-1-listout@listout.xyz>
 <2025070153-deputy-these-7ca3@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025070153-deputy-these-7ca3@gregkh>
X-Rspamd-Queue-Id: 4bWlyY18dHz9t0n

On 01.07.2025 07:13, Greg KH wrote:
> On Tue, Jul 01, 2025 at 02:14:30AM +0530, Brahmajit Das wrote:
> > The header bits/wordsize.h is glibc specific and on building on musl
> > with allyesconfig results in
> > 
> > samples/mei/mei-amt-version.c:77:10: fatal error: bits/wordsize.h: No such file or directory
> >    77 | #include <bits/wordsize.h>
> >       |          ^~~~~~~~~~~~~~~~~
> > 
> > mei-amt-version.c build file without bits/wordsize.h on musl. I'm not
> > sure we can remove the header completely or how it's used under glibc.
> 
> Can you look into that instead of just adding a #ifdef that might not
> actually be needed?
> 
> thanks,
> 
> greg k-h

Did some testing and it seems like we can remove the bits/wordsize.h. It
does not affect build on either glibc or musl.
I'll send a patch.

-- 
Regards,
listout
