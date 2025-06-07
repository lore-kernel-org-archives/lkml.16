Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D38E1C7009;
	Sat,  7 Jun 2025 09:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290287; cv=none; b=NV4PRXM3XP2GaBBD9UvwA+GysoOePHA5eu+WRCKrPmShN9HpPGqao9a6l0zr2PPk7mKdeeolhwCWnhZveFBjXs2+oEql1nRUn/LAUtoPrboasjp+ymToT2e4/JRlTIFaXzXuFpqdSzV5/IDAOjbUtSKktTQRI2jcTRRhLqXmdtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290287; c=relaxed/simple;
	bh=lSpSS0EzOkBuVxvWvFJ1gqXaLx6zLSewgz/9e/JU9HM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LgMjLer4SMTIzDjbb/+QPaFdMeUrOvH9XHKGQ4QBv6Cwk1RCIpVqSkhzyXW4F8T9YySQUWobEh06vQ7vAAQ3bLcuOSo5xoOFdoPiIfTwQAkzIHJAcaKQ3vHTwG4AqrfX6sAdtFU5tbcf7ui9uogqU53wButchVKjLL6y5Ocns34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ID4sVFmM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ID4sVFmM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CADAC4CEE4;
	Sat,  7 Jun 2025 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749290286;
	bh=lSpSS0EzOkBuVxvWvFJ1gqXaLx6zLSewgz/9e/JU9HM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ID4sVFmMe9+1Phqgim3HmjHXhhNNgOCypLNwC0r1OtIZ+bT4QqnOPYXweMAQfe0JO
	 albcSHDVhJwdBlqPTT/OUcDPqYD0SYLlfQqpjFlHsbanm1LgOuE4qOJSxEc49N6FIW
	 9CdnGVNBeu6GsQEMRkT82H6X4JZyXn61tUh1fKYhB85dZ/NJM2ugXCgEMFMA23DPvr
	 Lfo6Mq/p7vC8bTIMwNbDQJ0P0FqtIDAVr3YEkQ2z3u+Xp4zRVRnc1uSEtLL6s9fHAi
	 YLV73htQt9QDJ16sxhIynUqQwUpIaViLqDcULRLQCtctJm4MzzGBhujvGCkLSreaQr
	 DXHtHAXAEdncw==
Date: Sat, 7 Jun 2025 11:58:02 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] A series of kernel-doc tweaks
Message-ID: <20250607115802.0ce61a17@foz.lan>
In-Reply-To: <20250606163438.229916-1-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:29 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> I will freely confess that I merged the kernel-doc Python rewrite without
> fully understanding the code; at the time, the fact that it worked as
> advertised sufficed.  I *do* feel the need to understand this code, though,
> going forward, so I've dedicated some time to digging through it.
> 
> In the process, I've been making some adjustments to the code that, IMO,
> make it a bit more approachable - for myself and, hopefully, for others.
> The goal is to try to get functions to the point where people of limited
> mind (like me) can soak them up, make the code slightly more Pythonic, and
> removing redundant code.
> 
> Here is the first set of tweaks.  The output from "make htmldocs" remains
> entirely unchanged throughout the series.  The docs build is slightly
> faster afterward - but that's not the point.
> 
> Mauro, the more I dig into this the happier I am that you pushed this
> change through - it was far overdue.  Hopefully you don't mind me sweeping
> up a bit around the edges...

Sure, feel free to help improving it! The main goal of the conversion
was to make it as close as possible to the Perl version, being
bug-compatible. Due to that, there are several places where it can
(and should) be improved. It is now time to clean it up and improve
it ;-)

> 
> Jonathan Corbet (9):
>   docs: kdoc: simplify the PROTO continuation logic
>   docs: kdoc: move the core dispatch into a state table
>   docs: kdoc: remove the section_intro variable
>   docs: kdoc: simplify the kerneldoc recognition code
>   docs: kdoc: remove the KernelEntry::is_kernel_comment member
>   docs: kdoc: remove the KernelEntry::descr pseudo member
>   docs: kdoc: remove some ineffective code
>   docs: kdoc: move the declaration regexes out of process_name()
>   docs: kdoc: some final touches for process_name()
> 
>  scripts/lib/kdoc/kdoc_parser.py | 152 ++++++++++++++++----------------
>  1 file changed, 75 insertions(+), 77 deletions(-)
> 



Thanks,
Mauro
