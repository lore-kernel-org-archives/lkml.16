Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D572036FB;
	Thu, 10 Apr 2025 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268828; cv=none; b=bIPQUVfuTMWzeTfCNm1SDasKndlMS8O2Lgu8lPtKeCfdPQ38ovM9Jx8kwdrCLFCuUvZr5lLahrQgXB5+BCRjPWQXSR1NYRm0TLeIeyAzqHbb/9P3z+kdGSclC9U8YzhZvK8hrXdwSQ8M3DO/eV6aESqY3LND1NL7mPpnfOIpAJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268828; c=relaxed/simple;
	bh=AvAy7N8OavCk5XHGcoZ5uf+rHWu0j7jl6cO4p2OZt1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hTkPClThuJ9UUrxns1guH1Ikp9x1eZtMGJTgcl0VR4y47O9LZIv2QQtTmvG2uP0Ze3tWcV6obxnGqXehipP43a1mLFxCgyD6+NhjZI0dYQhQ1y/eIZ4oldVABrTsedyk1wOZz3LuaGpgBM3cNUIXLy9nXYyYfekKVaTzN3AC8pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=KmX93ACy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="KmX93ACy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC15FC4CEDD;
	Thu, 10 Apr 2025 07:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744268827;
	bh=AvAy7N8OavCk5XHGcoZ5uf+rHWu0j7jl6cO4p2OZt1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KmX93ACyTc5fyq4RRm+kanfF4AR/XeS5oZN4WM1g/E5NwWGAo7vUIisHAFdJ2M9Lp
	 /YfnsPu8vtKdYCvCXrywId2Ia270A3pDU9yWaTr+/vW8nMfuShk7xAKrLCrsOdR19d
	 O/kNnFsgeuTRG6O9kLVy1sMtkVVtfO6CvopoBmbI=
Date: Thu, 10 Apr 2025 09:05:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gon Solo <gonsolo@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>,
	Thomas Gleixner <tglx@linutronix.de>, linux-spdx@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Subject: Re: [PATCH v2] scripts/spdxcheck: Limit the scope of git.Repo
Message-ID: <2025041001-justify-snowless-5e3d@gregkh>
References: <20250409-spx-v2-1-168115798db2@chromium.org>
 <Z_bbHP3JeRh2hLe2@pampelmuse>
 <CANiDSCvLartP0qB1WN0AaqJ3KP+aOhw0KcPGMK4oKx=QpjV-DA@mail.gmail.com>
 <Z_djVbSqYhKM1ZAO@pampelmuse>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_djVbSqYhKM1ZAO@pampelmuse>

On Thu, Apr 10, 2025 at 08:21:09AM +0200, Gon Solo wrote:
> > > This is not necessary as it was Python's fault and is fixed by 3.13.3
> > > which came out yesterday. I just checked.
> > 
> > It will take some time before this reaches all distributions. This
> > patch is relatively simple.
> > 
> > I might be biased, but I think the benefits outweigh the cons.
> 
> 3.13.3 is in Arch core-testing and Debian unstable, Debian stable's 3.11
> is not affected by this bug. But I agree, it's annoying to be hit by
> it. :/

As this is a bug in python, let's not work around it in our scripts but
rather rely on the proper fix in python instead.

thanks,

greg k-h
