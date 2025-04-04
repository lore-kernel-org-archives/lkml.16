Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D911F152A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743775135; cv=none; b=o4OuLpLleo2TX30ZsPg/TFkmqsQ5lHm7WqVUdTPjyrs2SdDHyN/H4hm73RBd2FlOzxT1jV+jpHf6yS/0QX7cOc2uTGu7ZCzQDEbySL/69K13qPlRVEeJHbiW5cwaZ8W4AoVfgb8RdUjZj2CIRqWnSyEug7+ANiW9ZqvY5wzm6So=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743775135; c=relaxed/simple;
	bh=pjbR2oy4MEVD+Xk/Xm1QPe81N6K7y4Fo/TP5+T2tFHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0r+sB59hbUr61uhocuA9sfHiCGkFLMm/8z1/95T1++cts2d3VTySAjccRTN0g8E6uAQwO3albvcYx073cgNlDykYjVMFGf/NvNYnyK0O7ahmk+BF5e3iYxHVL6g7jDW0MkZBGfFW4NRkaGA1dexQxxAbRVHgnerhJIQwJbLqL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sMlFGb5G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sMlFGb5G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C99C1C4CEDD;
	Fri,  4 Apr 2025 13:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743775135;
	bh=pjbR2oy4MEVD+Xk/Xm1QPe81N6K7y4Fo/TP5+T2tFHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sMlFGb5GTBXgtAW1+GkgBPXDMXW6Dck/Dypw4CpaboAcsfiEI5FM0AcznQdmlIHhJ
	 IC2QusyqYAsZzokNDpneK0U9DytGOP5nfxxIXRkQ09tetjpl3afkQlWDzzfQwT8Y+E
	 K9HMjzHNHX831cy9o9cGssAxBwmYrSc6xnxPvkrHHLkGLo8suaCOKD4U4DKUr7JQ2T
	 ytveJh22O5hz00GEbTRU9OBUpRq55bVQ6AXDscGkihhAwUfwq1WGlR+v2DLFWMj7tv
	 P703owfrY2bxYbU14xLTNplE2R8RlAoDzYFgdI0npIpK465n1jYXL44CQZewG+We/g
	 Q7Ll5cURWccUg==
Date: Fri, 4 Apr 2025 14:58:50 +0100
From: Will Deacon <will@kernel.org>
To: Angelos Oikonomopoulos <angelos@igalia.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
Message-ID: <20250404135849.GA29860@willie-the-truck>
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
 <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
 <c5d835bc-883d-449f-afd3-16a09e418e1b@arm.com>
 <D8V6FN8TF5IK.DV6F5X5L61V@igalia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D8V6FN8TF5IK.DV6F5X5L61V@igalia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Apr 01, 2025 at 10:58:48AM +0200, Angelos Oikonomopoulos wrote:
> On Tue Apr 1, 2025 at 10:22 AM CEST, Anshuman Khandual wrote:
> > Makes sense. A small nit - just wondering if the following restructuring
> > here would make things bit more readable ? Regardless, your decision.
> >
> > 	if (handler)
> >         	type = handler(addr, instr, regs);
> >         else
> >                 return 1;
> 
> I went with the original formulation since -- to my mind at least -- an
> "early exit" idiom feels more appropriate for something we found we
> can't handle. Could work either way though.

What you have is fine.

Will
