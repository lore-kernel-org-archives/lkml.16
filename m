Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F7B615C15F;
	Fri,  4 Apr 2025 08:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743754048; cv=none; b=glXg7+k9tWJpnPc0TfQ/7MT25OuoGeCqhvDPiUnPc0FsxkYiDt7oI4eIOJzXKY043DoodWx4PaB0AKmxODhgBifF0UYm9DBQgOoOIKfis3/TdWaWMfRQ7eQSsb67nKJV82QYoBnHtPCi+UMs89/Ok1YQZWUDFyo2dZDqWNGbrhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743754048; c=relaxed/simple;
	bh=Sz1iuzebfPsBONySM2XTPncowIF2FemvaVg8CiCd2vU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UmhBM4Czh293zJ17zvGzttnLw27m9OnNKn8CoLfqistvCNf3g7/i0bjR6HvirXzCo4T6NWFYNj9zJoU4Oes3tmPAQx40Kbbkm017qFNDk1u/8mfLetVjmC15mR3D7dS6z7+W5SmY8Aj8M3Dbp5KLJm96C85KS3HjzqzjZXrjlyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cngcwsSR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cngcwsSR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FA2C4CEDD;
	Fri,  4 Apr 2025 08:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1743754048;
	bh=Sz1iuzebfPsBONySM2XTPncowIF2FemvaVg8CiCd2vU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cngcwsSRG1dr9xwJWeJeNNG3Yw39Z8BBAtvW849N95yZD3BCDD8d7kbIWJzPILTqK
	 hH2ptDH3SF5nd/Et/W7bxt0byS0N9dmIDJjGiDYVCpbtqW9GnDKQICYbjvCpp6kfYx
	 c2A0FawCGk0BA3f5SpL0Vm8h4z97PFaIDe9rnru8=
Date: Fri, 4 Apr 2025 09:06:00 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, linux-spdx@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <2025040403-contrite-dipped-13b2@gregkh>
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org>
 <CANiDSCtfcMBMj3=_gWrMd3P1Bt19uZaWs1TYQ+ZPHo5amPi+TA@mail.gmail.com>
 <2025040417-aspire-relenting-5462@gregkh>
 <CANiDSCvqhzBq73=A+MWLQoTfLEDL-T07srmnyZuSHYsnv06oRg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCvqhzBq73=A+MWLQoTfLEDL-T07srmnyZuSHYsnv06oRg@mail.gmail.com>

On Fri, Apr 04, 2025 at 08:29:21AM +0200, Ricardo Ribalda wrote:
> On Fri, 4 Apr 2025 at 08:22, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Apr 03, 2025 at 11:34:14PM +0200, Ricardo Ribalda wrote:
> > > Friendly ping
> >
> > Empty pings provide no context at all :(
> 
> Do you mean that I'd rather left the whole patch as context, or that I
> should provide a reason for the ping?

Both, as it is, I have no idea of what you are asking for here with a
one line blank email.

> Let me try again:
> 
> Is there any change needed for
> https://lore.kernel.org/linux-spdx/2025040417-aspire-relenting-5462@gregkh/T/#t
> 
> that was sent for review over a month ago?

It's in the very-long review queue on my end, sorry.  Give us some
change to catch up.  While waiting, please feel free to help out in
reviewing changes from other people so that your changes bubble up to
the top.

thanks,

greg k-h
