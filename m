Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFFD1F12F8;
	Tue, 11 Feb 2025 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739266880; cv=none; b=tFlQovAx82O3nfae1TIYwbE87Oa+TjZr6oWJ4Q4Eb6R5Bzm0VpNyoNAJh26HswJeAqwLzz85QFSlkM8V+whCTNIjBEFy+YjbjyZjLUNWYr2GrDa7oRBos5Jsaj4gO71LGBJYz8Bd4Bfh21MI1QpMtmv5mIvcE22O3c4MiO6Q6X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739266880; c=relaxed/simple;
	bh=Elhf16ia3QS/HSWAwlp2+dQGl6UKy9ADI24OK1aDw6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2nV7+Zc+0XC/dm05NJfBGS+AUNQvEnk1tEvJXIRBNx4m9KAadPvCHcAppmDm6cavObZPieGazVQ+INEWdekNZ85iLwEwSJ70y37wKl5795ZtrCAqozTqMfMAy15uEP+sYr7TjmnYdZFvmUvGUUsNjVE5bBT8VjtxX2xJZ1hNNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tDGmnQ8E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tDGmnQ8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23A92C4CEE7;
	Tue, 11 Feb 2025 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739266880;
	bh=Elhf16ia3QS/HSWAwlp2+dQGl6UKy9ADI24OK1aDw6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tDGmnQ8E+YJFPrwUnTRJkbA4gbiZgfrEYcJ4Xz9OMzfYs2R8cvzWFFRvkh7yU0RbN
	 40ndxDGiaQg5fxXA1GbWcAiUIsmG8XAkfsFbP0DS0DAHA/j94vUIUdy+QZSl5PTpN2
	 IgCkXVWlTjzV47u/qWoGKr2M9jJUZHSQK+adw/Z8zs4QtsrdNa2NrWluxSpRbsRiNE
	 GlBIFSNcL0yjtjyT0qxAPFl9hPpMO1YmH8dKgkxxjI/rp0NH8VPzxpEFDpBPrcJ4bl
	 i7+ItQkZmhzsQbeY+l0oHlT4ze4jVAgnYl3xeu6BsBnGaM4E+8MXyFruQzVJ8FEPEz
	 9wR1656ZrlFBA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmlj-000000007TW-1l1c;
	Tue, 11 Feb 2025 10:41:27 +0100
Date: Tue, 11 Feb 2025 10:41:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/3] drivers: usb: serial: mos7840: Improved baud rate
 support
Message-ID: <Z6sbRwXCYQA903h-@hovoldconsulting.com>
References: <20241024100901.69883-1-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024100901.69883-1-tony467913@gmail.com>

On Thu, Oct 24, 2024 at 06:08:59PM +0800, Tony Chung wrote:
> This patch set has made some improvements for baud rate setup:
> 1. Optimized register configurations for common baud rates.
> 2. Added clock select registers to choose between 96M, 30M, or external clock sources,
>    allowing baud rate setup to 6M, matching the hardware's maximum data rate.
> 
> Tony Chung (3):
>   drivers: usb: serial: mos7840: Add defines for clock select register
>     offset
>   drivers: usb: serial: mos7840: added optimized register setups for
>     common baudrates.
>   driver: usb: serial: mos7840: add more baudrate options

Thanks for these. As for the clean up series, use the established
patch prefix here too:

	USB: serial: mos7840: ...

Johan
