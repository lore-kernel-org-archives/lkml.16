Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005E015D1;
	Sun, 20 Apr 2025 06:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745130578; cv=none; b=oC+W5e0tgwDAS1K/k7o1T2d9jhJCU+ehf3jq+cU30FvPVW3qXLGPg19lhnmQFDzRS90P0FrnSAE0eHAQ9tHoMfk2BoTS4AncyAgIcVd5v/Hrk9rqwvg+RSy5JjlmM7OY+VVFfUYMyFtsyflEO89RENGkwU4HwPAZr0QOQ0cibio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745130578; c=relaxed/simple;
	bh=CWLsFjXkfMaPdDYEAz3sVvU7KguBrcMAdTY5irSWP5Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jy+DX5teQ5NSo/kphrdQgzq7odMMXmilqk548hg4obGxs5rGs50qfS/3agVBLC/wY9kXlEl5z0o6d6UNjEzB/bTdybGQ0ijw+99vrpG16/u4CM4UW/wSq3I/ZtRC8IIaZMAddQfJ1uLH+2BSVS8IkGxSR+f+YWNn5p+4VhA3XQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pNKourAt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pNKourAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10F97C4CEE2;
	Sun, 20 Apr 2025 06:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745130577;
	bh=CWLsFjXkfMaPdDYEAz3sVvU7KguBrcMAdTY5irSWP5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pNKourAtM9yoRFmr6ql1kuNUujCqqFq/raRrU4qQDe2E/BWLE+1FzScuyLGSFcLiv
	 93TQwEQTHZTwD/J17/TQM5GoCgOvKWzrLard3TIMD7qzpPO8vAVuq/njyEEIa9h6VW
	 kND6t5EwU6sdXHj3987UXgbf8Hs+Lg6YHnIGMYlE=
Date: Sun, 20 Apr 2025 08:27:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] usb: Add checks for snprintf() calls in
 usb_alloc_dev()
Message-ID: <2025042041-uninstall-expansive-04c3@gregkh>
References: <20250321164949.423957-1-andriy.shevchenko@linux.intel.com>
 <aAPO3P1_-C7Nhil4@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aAPO3P1_-C7Nhil4@smile.fi.intel.com>

On Sat, Apr 19, 2025 at 07:27:08PM +0300, Andy Shevchenko wrote:
> On Fri, Mar 21, 2025 at 06:49:49PM +0200, Andy Shevchenko wrote:
> > When creating a device path in the driver the snprintf() takes
> > up to 16 characters long argument along with the additional up to
> > 12 characters for the signed integer (as it can't see the actual limits)
> > and tries to pack this into 16 bytes array. GCC complains about that
> > when build with `make W=1`:
> > 
> >   drivers/usb/core/usb.c:705:25: note: ‘snprintf’ output between 3 and 28 bytes into a destination of size 16
> > 
> > Since everything works until now, let's just check for the potential
> > buffer overflow and bail out. It is most likely a never happen situation,
> > but at least it makes GCC happy.
> 
> Any comments anybody?

It's been added to my tree last week, why comment again?

confused,

greg k-h
