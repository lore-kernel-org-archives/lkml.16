Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5FB11EF371;
	Fri, 28 Mar 2025 23:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743203813; cv=none; b=CUYfOyDekz4aZTCb8F1r108Owuy7kPRfagR2LCGvYyPdUtkGsErnSdL3kLbrbexslo0EnWl76d7306GlD0AxfK0tZvkqB8lIJjDnRLlTPZqThYLJCaTmwZV1fjNXrPhPTV4TlMSyswS00PK1KcDMOmPrjh6qgFAaWfRT9le6MI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743203813; c=relaxed/simple;
	bh=rOeQ29iHUEe7VYVjwMsjoak+9UQWDwnBX9tidfIgRTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQ10OYvqxl+WtyMkECR5ZyerSfDtm11uzEBFQmkmwqf0da9bUUrX3+SU2bWUKOGkybJNYManY37s3CAvGhAsCpCBn8uBg1WtpPJk2QY40v2fUq4HJ9CVQfiwkg8cGQZhL/Z0A28RQ/GG72WGptj+KYrZ1eoNPBVFpiUpLLJft5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=v+aJ51sc; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="v+aJ51sc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rOeQ29iHUEe7VYVjwMsjoak+9UQWDwnBX9tidfIgRTM=; b=v+aJ51scLVAGjkxY/hRI5MobCJ
	zXwHSQCI4Sntj6V7rlbf4y2+FGkRDzjbgu3f2TNLH5hS7Hx7RBjSNLI02Hi2GxkYbhw97dF4WrfCZ
	yWWlRnICZse4E8JKDPvfpYP2hKZtIODtU2d28Q6LFwGpOXR09Gi8kOfsv8zwKOufTob+i+0c9ukku
	2prom6fSYwZ+HcqoFkk7nSyzHO944a9iselJOyux39E3SHgFmJCQyox0veo0cJVgwMJ0rm6H/QGWv
	UhTp5gJv5aMcnUVlN+zAXtMB1HBbO35UghZfu+kDjfO3qgcXxAWFbKbuT3/UM8FLTXz4AD67Y2MVk
	Dh0myypA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <carnil@debian.org>)
	id 1tyIwM-006gio-1i; Fri, 28 Mar 2025 23:16:42 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
	id 009D8BE2EE7; Sat, 29 Mar 2025 00:16:40 +0100 (CET)
Date: Sat, 29 Mar 2025 00:16:40 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: "C.D. MacEachern" <craig.daniel.maceachern@gmail.com>,
	1100928@bugs.debian.org
Cc: Takashi Iwai <tiwai@suse.de>, Kuan-Wei Chiu <visitorckw@gmail.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: Re: Bug#1100928: [regression 6.1.y] microphone no longer records (on
 VivoBook_ASUSLaptop TP401MARB_J401MA)
Message-ID: <Z-ct2D6uIN1f6UbL@eldamar.lan>
References: <174248253267.1718.4037292692790831697.reportbug@x>
 <Z95s5T6OXFPjRnKf@eldamar.lan>
 <Z-MMsp3XJyNHOlma@eldamar.lan>
 <87iknwb80x.wl-tiwai@suse.de>
 <174248253267.1718.4037292692790831697.reportbug@x>
 <CAJ8x=4jNhsjw_s-p5FXBk9WScPHEdUMZ0tXnhCiya8fCf_PH7w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ8x=4jNhsjw_s-p5FXBk9WScPHEdUMZ0tXnhCiya8fCf_PH7w@mail.gmail.com>
X-Debian-User: carnil

Hi,

On Thu, Mar 27, 2025 at 04:39:56PM -0400, C.D. MacEachern wrote:
> Sorry I gave up trying to get kernel build to work and troubleshooting this
> issue. I'll stick to working kernel version. Thanks for trying to help!

Okay sad to hear that, because we need your help to track and pinpoint
the regression.

There was a question from Takashi to provide information from
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1100928#29 and
provide the alsa-info.sh from working and nonworking kernels.

I think that would be the next step.

Get the script: https://git.alsa-project.org/?p=alsa-utils.git;a=blob;f=alsa-info/alsa-info.sh

And if Takashi finds it usefull to test a kernel with a reverted patch
I might be able to provide you prebuild kernel images for amd64.

Regards,
Salvatore
