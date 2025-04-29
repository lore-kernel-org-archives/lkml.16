Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C56D155A4E;
	Tue, 29 Apr 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745950596; cv=none; b=iDQPBpi6fi2DiNohUFiq5SgrugsefhChQSTPUUqqqh5O/ZVx1BOQW1TM6GnCH7+BvmyWFzc3OGtp5hCRGTCqvepALBtO5SrEOeGaX0aMgXS/UBGDToIqIXPmuYNEn4AL4ZwIaXnIhbMJTjtPWhpQrWxE4EEtoY3jxBX+yFV5DsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745950596; c=relaxed/simple;
	bh=X0uzYo7MqdZcxbZI0RKlEiQj1M9penRmqIMBo+SPXLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eQpkRsABIQj2ByBvAG4ncTCZMpbrvsAsXhSZ8NcPpvS4964Pfo44WEs+S+Y+mxU/thsb9RispMvTXcm2ow5iTFBC+Tf84oLz1+OqWlZk2Eq7TS/EKc2BjF8DryTiA4IRMgJ/UiZQtgDRnrWIWl+7EmblaG9mrUoRnFJsYXQnqX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gjk0uBpd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gjk0uBpd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B8BC4CEE3;
	Tue, 29 Apr 2025 18:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745950596;
	bh=X0uzYo7MqdZcxbZI0RKlEiQj1M9penRmqIMBo+SPXLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gjk0uBpd+L5Q98AN6nUI2N0SyZNHKHXkunnqhpGzfKzPoOMrsemnLtdbzXky3Uub5
	 rjumDY4C5kVW2SS21+lrWOZs9BdmP/cNAePfLSH95RuSjLbPuwlRQKqkliTSQBY2Bq
	 srgLcEJGZ35fIP23YECJAaRyegwOUPkhiGdgqfzo=
Date: Tue, 29 Apr 2025 20:14:54 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: hoff.benjamin.k@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: hid: allow dynamic interval
 configuration via configfs
Message-ID: <2025042929-activate-easter-77ae@gregkh>
References: <20250429180128.806780-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429180128.806780-1-hoff.benjamin.k@gmail.com>

On Tue, Apr 29, 2025 at 02:01:28PM -0400, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> This patch enhances the HID gadget driver to support dynamic configuration
> of the interrupt polling interval (bInterval) via configfs.  A new
> ‘interval’ attribute is exposed under each HID function’s configfs
> directory, and any write to it will adjust the poll rate for all endpoints
> without requiring a rebuild.
> 
> When the attribute has never been written, legacy defaults are preserved:
>   • Full-Speed (FS) endpoints (IN & OUT) poll every 10 ms
>   • High-Speed (HS) endpoints (IN & OUT) poll every 4 micro-frames
>     (~1 ms)
> 
> To implement this cleanly:
>   • Add two new fields to f_hid_opts and f_hidg:
>       – unsigned char interval
>       – bool           interval_user_set
>   • Introduce dedicated f_hid_opts_interval_show/store functions.
>     The store routine parses into an unsigned int, bounds‐checks against
>     UCHAR_MAX, assigns to opts->interval, and sets
>     opts->interval_user_set = true.
>   • Remove the string-compare hack from the generic F_HID_OPT macro.
>   • Initialize opts->interval = 4 and opts->interval_user_set = false in
>     hidg_alloc_inst(), then copy both into the live f_hidg instance in
>     hidg_alloc().
>   • In hidg_bind(), set each endpoint’s bInterval based on whether the
>   user has written the attribute:
>       – If interval_user_set == false, use FS=10 / HS=4
>       – If interval_user_set == true, use the user’s value for both FS
>         & HS
>   • Add <limits.h> to support UCHAR_MAX in the store helper.
> 
> Changes since v1:
>   - Added dedicated interval_show/store helpers instead of macro hack.
>   - Restored original default values (FS=10 ms, HS=4 µ-frame) for both
>     IN and OUT when unset.

The "changes" stuff goes below the --- line as per the documentation, as
that's not needed in the changelog.

Send a v3?

thanks,

greg k-h
