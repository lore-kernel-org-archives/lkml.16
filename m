Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3AE27D79A;
	Fri, 11 Apr 2025 05:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350562; cv=none; b=HbNUT5QJzyYGrFA2s92wmBD8EIvytoUzx15ponNuwC2T//CRfaGTqcRLlPnVWw6+i5GkCLGTT3tm44jYUmKdFEO8/W7h0CqlpEWOeufq7/EZgrtuAUXMLwmiu1/MCfBtgC7lQuyiE8nmUW0jY1msZVvHfPn5XRBWFnsGEW1Ih4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350562; c=relaxed/simple;
	bh=gxSjk1SfTJ11oFok344IjOAHsD6mQ9jmSi1cEz+8+zI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E9EqO1gT6X5YZcOEi0vtSG53B+xXeKFfljBX38h/dy4h7KVnQLMf+Me3loCOQZcvlknzf10ysRDKPP0UGSx6Gchc+pnon/ataseermcVYkzbnER6XxDqypg5op2xuoaEVjg8+pdSV4kqKX5OuIKFmIXE+rRR+Q4pxK62ieoe2zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=zxRZ7GYN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="zxRZ7GYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A7A8C4CEE5;
	Fri, 11 Apr 2025 05:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744350561;
	bh=gxSjk1SfTJ11oFok344IjOAHsD6mQ9jmSi1cEz+8+zI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=zxRZ7GYNYxQu8DY70SPXQW0PRiHCpIxQ0LLIw4Jg0WEC2XcmMVVkSFangYoEqFA6p
	 OMD94KAiq5qa20J0NawLYoMQrx+wQdryc54bodskJ/ugKEtAOOTr6yFnavxv1/YJwa
	 MnIkjDnHk2yn61xqtA6X+GiMg5W8qsy0dKfe/XwQ=
Date: Fri, 11 Apr 2025 07:47:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ivanhu <ivan.hu@canonical.com>
Cc: krzysztof.kozlowski@linaro.org, limiao@kylinos.cn,
	wangyuli@uniontech.com, jinxiaobo@uniontech.com,
	huanglei@kylinos.cn, mathias.nyman@linux.intel.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: quirks: Add quirk to prefer vendor-specific
 configuration
Message-ID: <2025041129-retired-grading-1de9@gregkh>
References: <20250410024626.981215-1-ivan.hu@canonical.com>
 <2025041055-debtless-delirium-d5ca@gregkh>
 <09496c1d-3e2b-46c5-9ef2-75fdd8a61bda@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <09496c1d-3e2b-46c5-9ef2-75fdd8a61bda@canonical.com>

On Fri, Apr 11, 2025 at 01:25:23PM +0800, ivanhu wrote:
> On 2025/4/10 14:58, Greg KH wrote:
> > On Thu, Apr 10, 2025 at 10:46:26AM +0800, Ivan Hu wrote:
> > > Some USB devices with multiple configurations expose a vendor-specific
> > > interface class that should be preferred by default. However, the generic
> > > usb_choose_configuration() logic selects the first configuration whose
> > > first interface uses a non-vendor-specific class, which can lead to
> > > incomplete or limited functionality.
> > > 
> > > Introduce a new quirk, USB_QUIRK_CHOOSE_VENDOR_SPEC_CFG, which
> > > instructs the USB core to prefer a configuration that contains a
> > > vendor-specific interface class when multiple configurations are present.
> > > 
> > > Apply this quirk to the ASIX AX88179 USB Ethernet adapter
> > > (0x0b95:0x1790), which requires selecting its vendor-specific
> > > configuration for full functionality, instead of falling back to
> > > cdc_ncm.
> > 
> > Shouldn't this be done in userspace instead?  And how does other
> > operating systems handle this, the "first" configuration is usually the
> > default for them as well, do they have some built-in quirk to handle
> > this or do they rely on a vendor-provided driver?
> > 
> > thanks,
> > 
> > greg k-h
> > 
> 
> Hi Greg,
> 
> Thanks for the feedback.
> 
> In this case, the device advertises three configuration descriptors. The first is vendor-specific, the second is CDC-NCM, and the third is CDC-Ether:
> 
> Device Descriptor:
>   idVendor           0x0b95 ASIX Electronics Corp.
>   idProduct          0x1790 AX88179 Gigabit Ethernet
>   bNumConfigurations      3
> 
> Configuration 1:
>   Interface 0:
>     bInterfaceClass       255 Vendor Specific Class
> 
> Configuration 2:
>   Interface 0:
>     bInterfaceClass         2 Communications
>     bInterfaceSubClass     13 (CDC-NCM)
> 
> Configuration 3:
>   Interface 0:
>     bInterfaceClass         2 Communications
>     bInterfaceSubClass      6 (CDC-Ether)
> 
> In drivers/usb/core/generic.c, the logic currently prefers the first configuration whose first interface is non-vendor-specific,
> based on the assumption that Linux is more likely to have a generic class driver than a vendor-specific one:
> 		/* From the remaining configs, choose the first one whose
> 		 * first interface is for a non-vendor-specific class.
> 		 * Reason: Linux is more likely to have a class driver
> 		 * than a vendor-specific driver. */
> This results in the CDC-NCM configuration being selected by default, even though the kernel already supports the vendor-specific driver ax88179_178a,
> which provides the correct and full functionality.
> 
> Of course, this could be handled in userspace,

Great!  Then handle it there.

> but due to security restrictions on certain systems, such as Ubuntu
> Core, modifying configuration selection in userspace becomes
> significantly more complex and less straightforward.

That's a design decision you made, don't force the kernel to do
something that you can do in userspace just because you made a foolish
decision in your userspace design patterns.

And really, how does your userspace restrictions keep you from doing
this in userspace?  What exactly prevents this?

> And although I don’t have insight into the exact design in Windows, but during testing on a standard Windows install, the device is correctly initialized with the vendor driver without any additional configuration or modification.

Watch what happens at device insertion on the bus to see how it decides
which configuration to pick.  Is Linux's logic different somehow?  It's
odd that only now would something like this start showing up.

> Given that this quirk is device-specific and not a general change in
> policy, the proposed quirk simply allows the kernel to prefer the
> correct vendor-specific configuration when it's known to be required.

This is a policy change of "if you can do it in userspace, you should.

thanks,

greg k-h
