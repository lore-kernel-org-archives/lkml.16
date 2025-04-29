Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7512C108C;
	Tue, 29 Apr 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934507; cv=none; b=D8/uH587EYk6ltZha6ig8xSKGuiC+nOmCVkbs/8mVONyFvKX/GxKsPfkYvK8zZjTnfbGMWH8wt3JHrC1uS6qTK3hn890q0FahDCYSHKOn5pG6anHrphTuBqZI6floF1iWpLCTWhpfjWKOV/px3zP0Tn4s+570sb2Pfv1xDtZ1eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934507; c=relaxed/simple;
	bh=iZToqGD9omVyqEtlmMRY9QaKdtLLbOij0uIwmUcvpJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gzp3TLd1rPmlpzQfhnmmoIxDd8TDWOKzEVc8G+eS2jGMw/dMxdAvt0azBH+4BOh83yF+CR+uN1MHY/MXSpWKLqa3Oie9gNO3HmqhPiyo/7TD0ykkgrfDJlJbG/JopI98hM8NpaO2ZzSpYsaSIABQTbH5IUkIsXOWOyxKbR9eUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=mBuMXy6d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="mBuMXy6d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECF0C4CEE3;
	Tue, 29 Apr 2025 13:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745934506;
	bh=iZToqGD9omVyqEtlmMRY9QaKdtLLbOij0uIwmUcvpJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mBuMXy6dWLtGpOlDk1HHW3ImBC9IgNkprFw0kvKO+NDbQmyh2L8WI3JOIUXfbOr6n
	 zdcm2SRliSFxAp/rQSJ9wp3y1cwWEh5CzPWWDvXDAXJ80DJaKLzp4gHcOZICj7Gb7a
	 uay2Jrk6fsr/c1XmYvX1yQBihibz5YjDFrvRCvVA=
Date: Tue, 29 Apr 2025 15:48:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: hoff.benjamin.k@gmail.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: hid: allow dynamic interval configuration
 via configfs
Message-ID: <2025042944-velvet-underwire-e0f5@gregkh>
References: <20250429133310.353977-1-hoff.benjamin.k@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429133310.353977-1-hoff.benjamin.k@gmail.com>

On Tue, Apr 29, 2025 at 09:33:10AM -0400, hoff.benjamin.k@gmail.com wrote:
> From: Ben Hoff <hoff.benjamin.k@gmail.com>
> 
> This patch adds support for dynamically configuring the polling interval
> (bInterval) for HID function drivers using configfs. This enables
> custom HID gadgets with user-specified poll rates without recompilation.

But you changed the default from:

> -	.bInterval		= 4, /* FIXME: Add this field in the
> -				      * HID gadget configuration?
> -				      * (struct hidg_func_descriptor)
> -				      */

 to:
 
> +	opts->interval = 10;

do you mean to do that without documenting it?

thanks,

greg k-h
