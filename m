Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5941D3A8D0;
	Mon, 10 Feb 2025 16:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739203447; cv=none; b=URnuREAlNAKs8NfDZ3fs5QrhD+Wqlb35ySj5O4AR25VlmUz7b0Bxp+eudeVU5FWpRwzK9biFRf57BfHxaNE5Q51VLzYcHb9bfeXSCNtM+kodRMIECb1pQjOPh+YcI+tJXtPa5IRqgjC4Ef4Omf62et1+7arnQLel7hKBgZNnpok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739203447; c=relaxed/simple;
	bh=z8vfLIoBAvejQktw8xOzUcIR7R1fhrav6NYTLYCU6U8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKlKPb94tcPTWXPJ07YOp4u1aM09r9qW6WUUTAJg/h5HBuTFIOJk5LkzaNsdEwurI3MBlLCRxfvgEe86ovpDYNBXC2KewriVAI9TUg2To+JvKufckh2ReXg/RZbLT+gKe8Zy3HVxBOtnwL9eCvqzDW3gn/2F1cpTFqMygYgFWzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=quM+P9MT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="quM+P9MT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3ACC4CED1;
	Mon, 10 Feb 2025 16:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739203446;
	bh=z8vfLIoBAvejQktw8xOzUcIR7R1fhrav6NYTLYCU6U8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=quM+P9MTDffPVNQtjl+sthzj6/49vwugixRbApeXQMFJJTZZpqESWn3y9SLd/aNKC
	 6MsuBUhS1NM026QxEw7LZsWICQEOOpM+t0OW0RG2YESCZCeIJbr5zU4aBYj2yIz9Q4
	 /4DnxoCMrJcvGEeyL4xwqVcWw+J0UzxzU21AH18OOHki3k4a4c6/ygz+3gM5OSQrkC
	 +Ta4Tc5GFxSBYMnKkwdMs7XrG6ZI9RnlkMtyaSiTrUYhgniXpeZ9SGxoaVRZDTLOpr
	 0BagGtG9TOW3rh5ECVaP36pBrmVG/FKpysbCBkiZ3K55YGyCAE9auTdlPlBi12c2/S
	 LaV9L1ahxRmDQ==
Date: Mon, 10 Feb 2025 17:03:54 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 18/38] docs: sphinx/kernel_abi: use AbiParser directly
Message-ID: <20250210170354.18c04f7c@sal.lan>
In-Reply-To: <87cyfp3ltp.fsf@trenco.lwn.net>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
	<fb800900352d90a0e501e5d6732e1bea277478f2.1738020236.git.mchehab+huawei@kernel.org>
	<87lduu7efu.fsf@trenco.lwn.net>
	<20250129014324.60a8dfce@foz.lan>
	<20250202155652.1652e420@foz.lan>
	<878qqlfxc9.fsf@trenco.lwn.net>
	<20250210082748.05ba85ae@foz.lan>
	<87cyfp3ltp.fsf@trenco.lwn.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 10 Feb 2025 07:40:02 -0700
Jonathan Corbet <corbet@lwn.net> escreveu:

> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:
> 
> > I took a look on Markus work: it was licensed under GPL 3.0 and it was
> > written in 2016. There were several changes on kerneldoc since them,
> > including the addition of a regex that it is not compatible with
> > Python re[1]:
> >
> >         $members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;
> >
> > This one use:
> >
> > 	- recursive patterns: ?1
> > 	- atomic grouping (?>...)
> >
> > Also, it is hard to map what he does with the existing script. I'm
> > opting to write a new script from scratch.  
> 
> That's fine, I just wanted to be sure you'd had a chance to look at
> it... 
> 
> >     Another option would be to re-implement such regexes without using
> >     such advanced patterns.  
> 
> Seems like a preferred option if that can be done.  Banging one's head
> against all those regexes is often the hardest part of dealing with that
> script; anything that makes it simpler is welcome.

Agreed. This one, in special, is very hard for me to understand, as I
never used recursive patterns or atomic grouping. The net result of
the struct_group*() handling is that it removes some parameters when
generating the function prototype. This is done using a complex logic
on two steps:

       # unwrap struct_group():
        # - first eat non-declaration parameters and rewrite for final match
        # - then remove macro, outer parens, and trailing semicolon
        $members =~ s/\bstruct_group\s*\(([^,]*,)/STRUCT_GROUP(/gos;
        $members =~ s/\bstruct_group_attr\s*\(([^,]*,){2}/STRUCT_GROUP(/gos;
        $members =~ s/\bstruct_group_tagged\s*\(([^,]*),([^,]*),/struct $1 $2; STRUCT_GROUP(/gos;
        $members =~ s/\b__struct_group\s*\(([^,]*,){3}/STRUCT_GROUP(/gos;
        $members =~ s/\bSTRUCT_GROUP(\(((?:(?>[^)(]+)|(?1))*)\))[^;]*;/$2/gos;


The first step basically eliminates some members of the function. At the
places I checked, the second step was just removing parenthesis from the
macro (and the STRUCT_GROUP name).

I suspect that the same result could be done with a much simpler expression
like:

	$members =~ s/\bSTRUCT_GROUP\((.*)\)[^;]*;/$2/gos;

But maybe there are some corner cases that would cause such simpler
regex to fail.

-

On a side note, the "o" flag used there at kernel-doc is described
as[1]:

	"o  - pretend to optimize your code, but actually introduce bugs"

I wonder if we're reaching any issues on kernel docs due to that ;-)

[1] https://perldoc.perl.org/perlre::#Other-Modifiers

> 
> Thanks,
> 
> jon
