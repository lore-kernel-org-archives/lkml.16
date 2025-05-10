Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974C71A841A;
	Sat, 10 May 2025 06:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746858011; cv=none; b=A/7CjZxU+21Ao6Q+Ixnd0X5b3JFj6kgMkof4gVMwRMgnLNKdywQoFxUd5EORXCZI4BhDuV1OYNRyfM0XND+tlHXwWwY0GvTI0QJRUhVW47d81+d3NltsNkG14YC3COPy/QlAjDx0wgLGB6p8UlOuRimyLqv8GtV3/NGKtPDP5z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746858011; c=relaxed/simple;
	bh=1VJImxCkdvElsFp1jkBFRXJkWpsnQDrCnov/e1gZxYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O9zW/w23Ihby6aElmmZbz7VygOIQJp1EOhg0ME7QhlXkkfg1jPIwpLa7a0+S5vVHz5dpuEiQc4QihoYO/xWzL/jCogAbPV5i3AUMdqevXf74K2s/mDXxGENApqPb0LwmgVEjScC5qJbQPIxZ33ACg5SrRuDjankpwOIPv34qHIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D/fPhLeu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D/fPhLeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A38C4CEE2;
	Sat, 10 May 2025 06:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1746858010;
	bh=1VJImxCkdvElsFp1jkBFRXJkWpsnQDrCnov/e1gZxYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D/fPhLeuLmSGUBdv5NYQtcwoIlyIfubECfDQJlfHUXjaZ3o2IdAhhyvQkBA57NMBY
	 ogCH5zCHmw+W+l2dBP1CEm1j/+cJRSQTCTkpvXOjfLkH5PJja/KkiXo6UWjBTzdyYy
	 FdGjYg360+wWyv7H4cS3lSfw0Sa6DicdMdsU0Nqo=
Date: Sat, 10 May 2025 08:18:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] CodingStyle: flip the rule about curlies
Message-ID: <2025051001-undertow-unsolved-3aee@gregkh>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-9-adobriyan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250509203430.3448-9-adobriyan@gmail.com>

On Fri, May 09, 2025 at 11:34:30PM +0300, Alexey Dobriyan wrote:
> Require set of curlies {} in all if/else branches and all loops
> not matter how simple.

Sorry, but no, we are not going to change this long-term coding style
rule for no real reason at this point in time.

greg k-h
