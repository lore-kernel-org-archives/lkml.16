Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BDB139B;
	Tue, 15 Apr 2025 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728362; cv=none; b=ezRncbL3mpkk5YQO/Qiouh+sJhFwTh9Khwyu5Rw4Zq6spUobUrVLzpIdDb+JlL9Fhz6WLzDWR24QOy7Wc+3woPZ8iLlZQyU19ohoYwN1GCPBfkVQp+YCqgYZ+Y82V9GwunUSSIyRjJV7FnZzLlX2GrAZo8KH9y8wR48yyjdXhIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728362; c=relaxed/simple;
	bh=Q2mdkazmyOd7RZ3BPP6cPsj96S8kTWjZxEwO/ntQFZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MyRJ7DqOQB025mfQZP1HC/O4cSY9jdKV+d6bVFPXgqHupN8D6bUc+ktOPfX/6i1mo+mH4NGfZZZIjHylDqbll0kx1JY3FCAJhSyf92e6ihRM0PYTjzEF6StZT208XRekD564hnTKzPzhIzFfo+pBIKi0pYp+pSrjjnF1263mEmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=NYps62jU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NYps62jU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C26C4CEDD;
	Tue, 15 Apr 2025 14:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744728361;
	bh=Q2mdkazmyOd7RZ3BPP6cPsj96S8kTWjZxEwO/ntQFZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NYps62jUGiJs642s1X3yAUtXmC8mfVo1s6Y4EtkpdluPkQq55RR7vmiCPb8gEMgrs
	 VSfiAlGKaj3+ejolbZ1ElT9iuT85Oh/DXKmOTbV4Fv38cjlJbtyS+qicghKxSKxxgi
	 huH6zV5AKTVzinZvYP0j/OyRM+sl9vvIldhgKpTo=
Date: Tue, 15 Apr 2025 16:45:58 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/23] staging: gpib: u8 over uint8_t and u64 over
 uint64_t
Message-ID: <2025041519-drier-decimal-8a7f@gregkh>
References: <20250409180953.398686-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409180953.398686-1-matchstick@neverthere.org>

On Wed, Apr 09, 2025 at 06:09:30PM +0000, Michael Rubin wrote:
> Preferring u8 over uint8_t and preferring u64 over uint64_t to adhere to
> Linux code style.
> 
> * Patch 1 - Patch 22:
> 	Reported by checkpatch.pl.
> 	CHECK: Prefer kernel type 'u8' over 'uint8_t'
> 
> * Patch 23:
> 	Reported by checkpatch.pl.
> 	CHECK: Prefer kernel type 'u64' over 'uint64_t'
> 

Only a portion of this series could be applied, as I hit some patch
errors that I couldn't resolve easily.  Odds are we are out of sync
somehow, can you rebase and resend the remaining ones?

thanks,

greg k-h
