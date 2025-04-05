Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13602E62C8;
	Sat,  5 Apr 2025 08:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743841423; cv=none; b=E/MVEDaNAFv2RAb+isz4wG1uOHvgqtnIbTTrJVpDaHMmOTWK1GqLWkae1uGOI26beqQxZ6YdbaUJv5OjDfA2Kp+BioRNKm+9s2S+ufq37nLOK9y5hgvk7IKK8uMyIsUi7kYLHq+ErT9qsk9MKhQmUiObxAZI+QM8j7gFl6CyGkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743841423; c=relaxed/simple;
	bh=AXNyiUG4wn9leZjyRDglAGyC+fD8gfG4cDMPjR4ZATA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvOcOaxUHmjdjCQLyWcnDZ68M9fmgM4tr1/Wob0rFTvygiv1pLZGKkx3Znk5Q43s29VCxlz6lgjY3I4HlNkG+3r1XHhpRR9S835XHNdfbIpB3+wf+9IqK5OrT3ONEYB7shg8TrRVXvUQ0CxiEPf2lr+LaBpvcIO01jHAoZF4Oe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=P3ftj74g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="P3ftj74g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9527CC4CEE4;
	Sat,  5 Apr 2025 08:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743841420;
	bh=AXNyiUG4wn9leZjyRDglAGyC+fD8gfG4cDMPjR4ZATA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3ftj74gFELv8K5pmOOb86fUq1JrQj6Bg+gU1fBe3OZTq0coFgE7gcgtjVt0GTC5C
	 mBpfXFcNiZllXvnTNikfAIDq4NJna+/9CqLuNJyj67kW3PHpy0MzvjHvsmvOjSWaiS
	 hjTK0BCEhmc7/CX3Hq/NgLgFyr6f9fqiuyYu1AhY=
Date: Sat, 5 Apr 2025 09:22:11 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: julia.lawall@inria.fr, andy@kernel.org, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
Message-ID: <2025040547-vagrancy-imagines-384b@gregkh>
References: <Z/B019elTtKG/PvD@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/B019elTtKG/PvD@ubuntu>

On Sat, Apr 05, 2025 at 12:09:59AM +0000, Abraham Samuel Adekunle wrote:
> Replace the bitwise AND operator `&` with a modulo
> operator `%` and decimal number to make the upper limit visible
> and clear what the semantic of it is.

Eeek, no.  We all "know" what & means (it's a bit mask to handle the
issues involved), and we all do NOT know that % will do the same thing
at all.

So this just made things more difficult to maintain over time.

What tool suggested this type of change to be made to this driver and
these lines?

thanks,

greg k-h
