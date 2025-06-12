Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A0720E034;
	Thu, 12 Jun 2025 07:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712613; cv=none; b=sid/ef5PS4ann8Ot01O/5k7KhFMNREfq5G77Ai0MXHoUZcfpHsPY8iUaxnT8ntvJkTJqTUffZHyNBcTOFz2kyyX5ezBPlza2YF0BfeN5FdTzZdtPpPFu+YjiUN57E8xOIKNvcsHRSWrM3/eFBLBRoYhcIhjbT6HKXG7ZUGA3iWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712613; c=relaxed/simple;
	bh=mS+ktpLhZh7Ds2xfhQioR5HHUvV1fzdiZYayXvlHjoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIQPD7mt7532qGQoqRLazVC16Y9lZf6O0OGw+jRyljIJ6fkug/IV9gfsUtV6wmyX9DQARjIdA30fy6d5OTgmhex9adnhaN5CZE3bkpnaGzZLsAsPdJIf4VIqFjrnk3yBGuwZsg7FzK5hc2XWx0IRI1YnWIOE7TQ2yITIhQ2/60A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Tk9s0aB1; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Tk9s0aB1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SJmgReSKLl4Wa+2IManyL48R1xCcWD1gvUcY9eksNmk=; b=Tk9s0aB1WhPtBiI4e9GgZGW9Qa
	mKNIe6qRwT8PbbSGCV63r7Wp4mN3FCZf36uws0HSHTi3SHuDIDohALaN5mTvrK3k0cwbGrd7jZziR
	op/CW5+mtA4LJ0KNIkIiaPw6tNCzo81/pDtRZP/GZStO4bIb4c/4xDbWLzjb7qG44iEMoRbYbkDac
	N7Cz0GnritfBjugTK8cvoSBKSggtJ5X0z3ssSSrjZ1FNRmUSmtNg1F7BSmdIWWH2NrPgOj24NMSvX
	Z5WAjWCL0a8VRwKAmhpvUsykjToqMi834USk+Xh5Dc/NRlSlmkgzjmHlE8fhlUeiC/DdICCacoHiK
	0HjOTKRg==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1uPbnJ-00A2YE-5D; Thu, 12 Jun 2025 06:52:13 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 163EBBE2DE0; Thu, 12 Jun 2025 08:52:12 +0200 (CEST)
Date: Thu, 12 Jun 2025 08:52:12 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Christian Brauner <brauner@kernel.org>,
	Luca Boccassi <luca.boccassi@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: coredump: add %F for pidfd number
Message-ID: <aEp5HBrBoU6mJALT@eldamar.lan>
References: <20250612060204.1159734-1-carnil@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612060204.1159734-1-carnil@debian.org>
X-Debian-User: carnil

Hi,

On Thu, Jun 12, 2025 at 08:02:04AM +0200, Salvatore Bonaccorso wrote:
> In commit b5325b2a270f ("coredump: hand a pidfd to the usermode coredump
> helper") a new core_pattern specifier, %F, was added to provide a pidfs
> to the usermode helper process referring to the crashed process.
> 
> Update the documentation to include the new core_pattern specifier.
> 
> Link: https://github.com/systemd/systemd/pull/37125
> Link: https://lwn.net/Articles/1024160/
> Signed-off-by: Salvatore Bonaccorso <carnil@debian.org>
> ---
>  Documentation/admin-guide/sysctl/kernel.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
> index dd49a89a62d3..f1b2ab219a08 100644
> --- a/Documentation/admin-guide/sysctl/kernel.rst
> +++ b/Documentation/admin-guide/sysctl/kernel.rst
> @@ -177,6 +177,7 @@ core_pattern
>  	%E		executable path
>  	%c		maximum size of core file by resource limit RLIMIT_CORE
>  	%C		CPU the task ran on
> +	%F		pidfd number
>  	%<OTHER>	both are dropped
>  	========	==========================================

FWIW, I was not sure if I should add a 'Fixes: b5325b2a270f
("coredump: hand a pidfd to the usermode coredump helper") to make
sure that it get backported as well to the series where a backport of
b5325b2a270f landed.

Regards,
Salvatore
