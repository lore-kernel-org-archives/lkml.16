Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3F21ACEDE;
	Mon, 23 Jun 2025 11:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750679707; cv=none; b=R+/FIeVU+055xEpq7ISjpcl/kdCqJ6e0K2qOeH2cArOHZ2yhDTFO2gspqEKrXJFS2zwPUezt+b1W3f1oNmeNnNCvFYSapPD97OmfdXmIRfdhzGJiBqQ9e92APLYPnXIUzAz0oFfeK4ANW2HPE/rLG0A6PAXs/uscVK2OGKdd9Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750679707; c=relaxed/simple;
	bh=NuOPFfSC8q0YK4nKJwmp0Dt/jeyROAJj92ZrYJI9kb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aNDl7eXqXVVEPp70i72WNM3LIfNRjkRWlc1/lGzgeqZfHoVHUErSAuXgm+UAR5GqoGHiiTb/+8jaLym4K+qzKFhXA9ha2/sg8CQfd7Jum0zUacqjOTRJJllnojJj2DUrL9V9Kg7lEr9TfdaZ8kg0YW7m/WhNot7UfOEfFtqQn/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5uM6nD2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5uM6nD2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90601C4CEEA;
	Mon, 23 Jun 2025 11:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750679706;
	bh=NuOPFfSC8q0YK4nKJwmp0Dt/jeyROAJj92ZrYJI9kb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5uM6nD27M78ewGmS/GmiNz6feGB4D/gUhAzvn7Qp9IjhZnKjOJ0gCTkQ+ojoXSKI
	 VqGGttfTyeiWw83tZm8uMHHctaREOyLIQykqYl6FvUpdyU351XCmPUoFD/01antj2w
	 BU0UssZ3YqgFcDF+wAI5LDDBR7xR8/kr6pX71eHTlzajbj+SiFwZcriaxu3hEpk5qz
	 8btl7VvjwSEVdABIndHT95GknOmPt2MwVfnOOkARbqxZgkAi2F7WgeZg30ei0ZPm+l
	 Y2FGCqYTWkZNtNtnG/ItMhHTodoWGFyiFBX91rqeabsQrduEp4dxcS19dyC+k1Etjn
	 2lJ+FyPebErfA==
Date: Mon, 23 Jun 2025 13:55:02 +0200
From: Christian Brauner <brauner@kernel.org>
To: Salvatore Bonaccorso <carnil@debian.org>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Luca Boccassi <luca.boccassi@gmail.com>, Oleg Nesterov <oleg@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: coredump: add %F for pidfd number
Message-ID: <20250623-anwesen-hierin-326b4aaf5fec@brauner>
References: <20250612060204.1159734-1-carnil@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612060204.1159734-1-carnil@debian.org>

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

Thanks!

Just throwing a random thought out there: It would be nice if we could
optionally create a connection between a source code path/file and the
documentation directory/file in Documentation. For example, coredump
stuff is documented in Documentation/admin-guide/sysctl/kernel.rst so
there could be a line to that effect in fs/coredump.c and it creates a
warning if that file is removed.

Maybe that's dumb but it certainly would help to not miss such updates
in the future.

Christian

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
>  
> -- 
> 2.49.0
> 
