Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3663597A;
	Wed, 16 Apr 2025 06:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744785333; cv=none; b=crqIJMW1kedLJJIulsK74Z6nswC65Qd0p8H+xRp/P2JbLnqpsJseOAEXSzA4OnWQn/axj4lkLmpnhqZtfW0Psu7ceB3mAOYIebfMKB9Mkb3jXFRYzizwrOPxjYiM4G5EFaZZbaO/ffABIdJpVYlO4yR1tXuGOajbLPQcaw4ok3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744785333; c=relaxed/simple;
	bh=uAz0mpaZ1a822icq6bDEJvy+jiunxJBixzq+WVVONd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qpZULWUvrE+/ektlOd0DPpSD+BQCMu/kWFYAAObhZD+QTVlvvCCIpNiILykjQPX3YF0mldsfA4iA3hvV6AcbUDzs0NsBAYtB+1NlbIyDyaOl6epytxQEMdj9FbOKTYC2P36flBQVpnqGUD78rcnEH/X9FfSBFnlRc7wVyiWeIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kqIGa8Bh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kqIGa8Bh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B371C4CEE2;
	Wed, 16 Apr 2025 06:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744785333;
	bh=uAz0mpaZ1a822icq6bDEJvy+jiunxJBixzq+WVVONd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kqIGa8BhbSw65hv20D9N8g3inr/eD8uGeejiw6LexK4SmIfhysgcPeoy2Nk1BscUW
	 s8o7mogPGdGOA/yJayv6u11XxmCKfpPXNGYh0bxdOoQzfvi9r9CHgHxgrAmQvEA9o1
	 WNEn9kaHOzeZ7Q8AOYdQEQfwaIcyVYcv7vmgvyv8apk6rp2qrlesWaGvWXueY+JesB
	 NBa5Qsp6kjSzXPV//n87s6J/MBEP7imPyVbsfNyLDngdxbr5AG3U5mTtr7vfmrdJ9G
	 SGaFozrVEFxPDNU4IsB5KnZr47w4/+PmsuHSyUkxZqaVuJTyltGHxbdIAU+ARcS9O/
	 dFsKCimxkg60A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u4wMs-000000006CK-1Vzz;
	Wed, 16 Apr 2025 08:35:31 +0200
Date: Wed, 16 Apr 2025 08:35:30 +0200
From: Johan Hovold <johan@kernel.org>
To: Craig Hesling <craig@hesling.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, sboyd@kernel.org
Subject: Re: [PATCH] USB: serial: simple: add OWON HDS200 series oscilloscope
 support
Message-ID: <Z_9PssdqzDrAmgUb@hovoldconsulting.com>
References: <20250408232703.954945-1-craig@hesling.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408232703.954945-1-craig@hesling.com>

On Tue, Apr 08, 2025 at 04:27:03PM -0700, Craig Hesling wrote:
> Add serial support for OWON HDS200 series oscilloscopes and likely
> many other pieces of OWON test equipment.
> 
> OWON HDS200 series devices host two USB endpoints, designed to
> facilitate bidirectional SCPI. SCPI is a predominately ASCII text
> protocol for test/measurement equipment. Having a serial/tty interface
> for these devices lowers the barrier to entry for anyone trying to
> write programs to communicate with them.
> 
> The following shows the USB descriptor for the OWON HDS272S running
> firmware V5.7.1:
> 
> Bus 001 Device 068: ID 5345:1234 Owon PDS6062T Oscilloscope

> OWON appears to be using the same USB Vendor and Product ID for many
> of their oscilloscopes. Looking at the discussion about the USB
> vendor/product ID, in the link bellow, suggests that this VID/PID is
> shared with VDS, SDS, PDS, and now the HDS series oscilloscopes.
> Available documentation for these devices seems to indicate that all
> use a similar SCPI protocol, some with RS232 options. It is likely that
> this same simple serial setup would work correctly for them all.
> 
> Link: https://usb-ids.gowdy.us/read/UD/5345/1234
> Signed-off-by: Craig Hesling <craig@hesling.com>

Thanks for the patch. Now applied.

Johan
