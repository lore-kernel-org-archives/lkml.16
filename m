Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2DC149C64;
	Thu, 10 Apr 2025 07:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268416; cv=none; b=ENcdqF6zAsbRmSAskaK1EYw2Re9fua2oymX8SVAvmBgE+8vlS+AN5b4CGvCZ8t88R5VErWcl1Y35+5ntJ1ohJNmdeb9ZU8qmIaSEFChR8igQIjjEDgsBj1YtVtr4PthehNvyVZiJ0t4FUne72krsbMbLXcwrj08V6OXJFIFKAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268416; c=relaxed/simple;
	bh=VP76GzUayCaXhydS5Vh+H6zKpg0TsSsNsdF8YjRIX3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPkK3QPcNIAp0vnAzV/3/19IuejDYAON+FFNwtSGEZNxsv5lLsi3GH6ZgC6S4+uJk1HN2PmeUFsoLGMrrTwgSqrU9TcHPr37T1mn7nak6+FYSQEWiGiTyC4DpkpZEzBLexnclSzd15q1uuelki3PyYIYL2bMIy+ywQxxAVVaB1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BKazwGBj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BKazwGBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B56CC4CEE9;
	Thu, 10 Apr 2025 07:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744268414;
	bh=VP76GzUayCaXhydS5Vh+H6zKpg0TsSsNsdF8YjRIX3o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BKazwGBjxUfo4iOOb49BPiXZoIMpBV49WNj7jxttfOzDwFIm7UhAZ1zPR4DlVIA0L
	 2A2601p/AGsBEOd9tbG3/wxWdqDgkSkvWiJIL9uRE+uc5QOpOZSCDpzWkHv8tHOyF0
	 O9c4Z+YLuMwF+IXXc/ko4m+NM/+DUYDfyXd1gNJs=
Date: Thu, 10 Apr 2025 08:58:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ivan Hu <ivan.hu@canonical.com>
Cc: krzysztof.kozlowski@linaro.org, limiao@kylinos.cn,
	wangyuli@uniontech.com, jinxiaobo@uniontech.com,
	huanglei@kylinos.cn, mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: quirks: Add quirk to prefer vendor-specific
 configuration
Message-ID: <2025041055-debtless-delirium-d5ca@gregkh>
References: <20250410024626.981215-1-ivan.hu@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410024626.981215-1-ivan.hu@canonical.com>

On Thu, Apr 10, 2025 at 10:46:26AM +0800, Ivan Hu wrote:
> Some USB devices with multiple configurations expose a vendor-specific
> interface class that should be preferred by default. However, the generic
> usb_choose_configuration() logic selects the first configuration whose
> first interface uses a non-vendor-specific class, which can lead to
> incomplete or limited functionality.
> 
> Introduce a new quirk, USB_QUIRK_CHOOSE_VENDOR_SPEC_CFG, which
> instructs the USB core to prefer a configuration that contains a
> vendor-specific interface class when multiple configurations are present.
> 
> Apply this quirk to the ASIX AX88179 USB Ethernet adapter
> (0x0b95:0x1790), which requires selecting its vendor-specific
> configuration for full functionality, instead of falling back to
> cdc_ncm.

Shouldn't this be done in userspace instead?  And how does other
operating systems handle this, the "first" configuration is usually the
default for them as well, do they have some built-in quirk to handle
this or do they rely on a vendor-provided driver?

thanks,

greg k-h
