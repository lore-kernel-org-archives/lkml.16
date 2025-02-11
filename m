Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2A61F12EB;
	Tue, 11 Feb 2025 09:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739265306; cv=none; b=J0xYfAkuoRhS774egGWEw58P95Uxy8C7TRvX1oP6uRozUo2NA2trByAUC/iC/ISib7FxBfPEUSzyxd71GEmQuMU3MwJsbjy5jF/kmjPWqE1c1JncZP7BfgJshMYMJBN74HSpkkuDYAT3rYdVBMkLR9dPqUjQo0wWky93fYvRmxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739265306; c=relaxed/simple;
	bh=An89c79r31a50DrgLf1D/6uI8WBtaUJL0XPWqEiJctM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWZ/NC5OreXjtPns8WO2CUA86bs40/zi3f26VAUOKiEu/UAJKcnJqlKAKv2w+Vqh/eOF/V1pnepmS16a4Oh55Glxr1/iwSE0bRSEccXGfHNSl6MntPGQXC3Airx0xJAoCfsbAkujlyVlQ7iVDBGg9zey9DgDyQQkFA5LzcmImyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rw7+3uKo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rw7+3uKo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DE2C4CEDD;
	Tue, 11 Feb 2025 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739265305;
	bh=An89c79r31a50DrgLf1D/6uI8WBtaUJL0XPWqEiJctM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rw7+3uKoBRaccGC7H8ldVdpW3GrQ7N81TKdVc72sbWLgebuKXx/X+kpkV8Jcv93DS
	 v1G0/s9mChGLx9OYmhtiJYOnC1S69PcdpcXDiW7hEoKHhbAF+EbMnhTA+1Ntn2NUFx
	 Kj7hB6JkIvYT/CSTKnUikFFYC4NJ81dFYV2FWHwBR2/jTpTegQRyYGlEV2aEMsk7S2
	 Fcj/fIfW64WsreKlxMKx6rm0s6cVV5tyoO8QBe71IQJazJ1WLj0bwvJe53zppCFTHw
	 WVbXkAG1ESZRt45rrqPBc6vjqVQ06FE3ZrFPlwCSR1nvWaqZIb8rOjktg4vpISl9wx
	 +PJeC9yutFqCA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1thmMK-0000000070T-3cq6;
	Tue, 11 Feb 2025 10:15:12 +0100
Date: Tue, 11 Feb 2025 10:15:12 +0100
From: Johan Hovold <johan@kernel.org>
To: Tony Chung <tony467913@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/6] usb: serial: mos7840: Fix coding style warnings
Message-ID: <Z6sVIIzaRP_PhzpL@hovoldconsulting.com>
References: <202410250141.AEkzzW60-lkp@intel.com>
 <20241025061711.198933-1-tony467913@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241025061711.198933-1-tony467913@gmail.com>

Hi Tony,

and sorry about the late feedback on this one and your other series for
this driver.

On Fri, Oct 25, 2024 at 02:17:06PM +0800, Tony Chung wrote:
> This patch series fix all the coding style warnings shown by checkpatch.pl

Checkpatch should generally not be run on code that is already in the
tree. It's meant as a tool to be run on patches before submitting them
and you always have to use your own judgement whether its output makes
sense or not.

That said, since you are actually doing real work on this driver and
there certainly are some real style issues with this driver, I'll review
these.

> I have tested Patch v2 and it has no driver build warnings.
> Please have a look and let me know if something is wrong. Thanks.
> 
> Tony Chung (6):
>   driver: usb: serial: mos7840: fix warnings "no space before tabs"
>   drivers: usb: serial: mos7840: Fix Block comments coding style
>     warnings
>   drivers: usb: serial: mos7840: fix coding style warnings
>   drivers: usb: serial: mos7840: using '__func__' to replace function
>     name in dbg message
>   drivers: usb: serial: mos7840: replace 'unsigned' w/ 'unsigned int'
>   drivers: usb: serial: mos7840: fix the quoted string split across
>     lines

First, please try to use the established patch prefix for the drivers
you are changing (e.g. as can often be determined by running git log
--oneline on the files in question). In this case

	USB: serial: mos7840: ...

Second, please rephrase the patch summaries and commit messages so that
they don't give the impression that you're doing this just to make
checkpatch happy. Instead say, for example:

	Add newlines after declarations to improve readability.

as that is a valid motivation for doing clean ups like this as part of
other work on the driver (and try to rephrase as "clean up" instead of
"fix" as I think the latter should be reserved for bug fixes).

Johan
