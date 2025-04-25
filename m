Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D33719BBC;
	Fri, 25 Apr 2025 05:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745557848; cv=none; b=G9DVuatc8gSJuL3tKW7RwbWrKNeCUY4N/ZNv1Q7soreC+j2mpO5tjCgYtFM58+o9Mv3K2n37ogMV6r6PTh1hM3fip32sVcketHSa2+lUC0LbnQ78OjgIIPOWKwCFhpVj1DW9MZngyJcW3Hzz7P0YESKd0X8cI5JIEoJnwztWXH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745557848; c=relaxed/simple;
	bh=FHsXrPUWzyviHlP/9uAX7wN9htUpw2eijcVwY1LnBUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1FSQQGdsAw2eAAKh20963qkqTCb9g2FHUIaztvee1Lt3kQfPLWDILUBXt3mcX4KrRzD1JZm2MOmG5Wd2cB0O3+fthOVSs87rkf46GW/+0Tvpu0EhRnwFN6SuDGXsgxRv7hl/XHw/QUuvOu+HKxzrOyZDyPswiZWj0EHiKGjJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dx+ecYmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dx+ecYmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92013C4CEE9;
	Fri, 25 Apr 2025 05:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745557847;
	bh=FHsXrPUWzyviHlP/9uAX7wN9htUpw2eijcVwY1LnBUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dx+ecYmW+GyKhRju2DPkzeM37gSf8492sCKR9X64tz0pE5NH/Ge7ldzDv4nBSuRSF
	 wUvocKxLThEQjaXvcDjwmSR4ZVfrddo22ZlYycXfJU2eZdrpETDNlpV4jsRXJk76sX
	 BRXFgxPbvjsF63Zj1Tzadm5F8ZD2cEZ/q3fdzYJQ=
Date: Fri, 25 Apr 2025 07:10:45 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: julia.lawall@inria.fr, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] staging: rtl8723bs: Use scoped_guard for mutex
 handling
Message-ID: <2025042511-dose-rage-4c72@gregkh>
References: <cover.1745523325.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1745523325.git.karanja99erick@gmail.com>

On Thu, Apr 24, 2025 at 10:56:24PM +0300, Erick Karanja wrote:
> This patchset updates the rtl8723bs driver by replacing manual mutex lock and
> unlock operations with scoped_guard(), aiming to improve code clarity and
> safety through automatic resource management. This change makes the code
> more resilient to early returns and error paths.

But the places you changed do not have early returns or error paths, so
this really is just unneeded churn :(

scope_guard() is great, please use it for new code, or for places with
lots of returns or error paths.  But not for just general "let's convert
the driver to use this!" type of things, as that's not needed at all.

Also, for changes like this, I'd like to see the code actually tested to
verify it all is still working properly, as mistakes here can be very
common to cause.

thanks,

greg k-h
