Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31258347B4;
	Thu, 17 Apr 2025 14:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744901596; cv=none; b=O10vrEW22m3ZcItDybCxOZQFFrfjol2FAGnLi3SCutzy1vgpZlfF/z+EZA1zN0VrbRHEfIwx4pJ4OJmmM1msUNeNBA5F8ceMxt0Nr/LaT6ftInKrrCiZWMimN9X+C5Sv+U71fb9wCwcJfQQi2hCUBzPhtI+TFF3GE6g8h5a1pm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744901596; c=relaxed/simple;
	bh=DAo42bLLP8jnmdgkhpFN1oL7OI3lgU9wqnf7Xp53/pU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XukVl4T4PA8vrpPF+CkmZjGnDiXkor3r7XMa2XIN75XYCWy5835Sc3ZxbeIx/talxgCRlnCf1l4sQR6OUkreO1f2aR57sa2wnOw0T1J5EC/6pw4289zJVuGD+XTimKam/InOYt/OJYZcRem9D9sAjxt5UpwpAr6OMQ84DAaeVdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hHiNazYa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hHiNazYa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5353BC4CEE4;
	Thu, 17 Apr 2025 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744901595;
	bh=DAo42bLLP8jnmdgkhpFN1oL7OI3lgU9wqnf7Xp53/pU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHiNazYaR4MbLyA/LHm0yTEpDL0L4DzS8/HJoqODiV1FeuaXmh/ejuQYLrtgEQIGY
	 DK77oVXkTo1NSvuGd/gQLyDuCmkwaxXQgPMY5b0cPP+bvqxhlb4PgA35rcnRGm4z1H
	 i92oMCe3OTEXMALj8aLV8kN52QsOPG6egBTfJGFLemQ/sshiv21lGsi/wwNGPJX9Mz
	 x7X6EBG0AKUZu8ebDv1fAEpXJH6DEnniDD7O62SikfFIxStJkBnLv70tUEZ2huMTl/
	 e2MBA6+ck80hkMbehFGu9v75XZ9KXvszJUCexvATlnmkn8zs8wVwk9l6RLvVmXKRGw
	 3fu7kgNuPWXOA==
Date: Thu, 17 Apr 2025 07:53:13 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Song Liu <song@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	kdevops@lists.linux.dev, Jim Zemlin <jzemlin@linux-foundation.org>,
	Konstantin Ryabitsev <mricon@kernel.org>,
	Javier =?iso-8859-1?Q?Gonz=E1lez?= <javier.gonz@samsung.com>,
	Greg Marsden <greg.marsden@oracle.com>, Tso Ted <tytso@mit.edu>,
	Gustavo Padovan <gus@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Subject: Re: The future of kernel-patches-daemon - folding under LF?
Message-ID: <aAEV2U2A1sXdVffx@bombadil.infradead.org>
References: <Z_6bxZUiodrE45HJ@bombadil.infradead.org>
 <CAPhsuW5HYYvGoFO2L81EBkHDmozxxjpmdRh+GPrAxea-+91YNQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhsuW5HYYvGoFO2L81EBkHDmozxxjpmdRh+GPrAxea-+91YNQ@mail.gmail.com>

On Wed, Apr 16, 2025 at 10:28:06PM -0700, Song Liu wrote:
> Hi Luis,
> 
> How about we discuss different options over a video conference?
> We have a BPF office hour scheduled every Thursday at 9am PST.
> Would this time work for folks?

Works for me. How about next Thursday April 24th?

  Luis
