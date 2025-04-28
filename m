Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC99F25F988;
	Mon, 28 Apr 2025 10:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745834661; cv=none; b=fpzJzwBXPnWeJAFw0AtxZTyJyHUab5MZ314PIsf0jUKUXL1u/bTtNRn97kkEEbhlC3QzFqWMC7YVMBO5QiEvx7NJwC8uak2TJRiI4cNP2t5FFFou6FgbEEiB8XpSnr3IH7iVrKELeUCT+iHttcOSzaIAApQZg2AN0Nf68PInSoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745834661; c=relaxed/simple;
	bh=rOFGbtpv4MrY1owxitYHQCckxfJhhUZ64PuiQrfe3co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TIBUqKFNSCtbtiH2k0rJfzdopOCEg8DVWBtQYt4kcufoTQ6M7IuW0NhkDrC1ENEtHoANPPgduZ4Y6V47EjWEQEuK2C5S1HyCOz208LbT2W5HCPrFNwdm+IYTr7RHcx2T6K9FIgEPbkRTXsW5DWPOkpdCWcTgAOLvS1ReJeBstdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=F/szESDb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="F/szESDb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E44C4CEE4;
	Mon, 28 Apr 2025 10:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745834660;
	bh=rOFGbtpv4MrY1owxitYHQCckxfJhhUZ64PuiQrfe3co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F/szESDbkRIp609MnQsoIntZkEgl78J2QHxTxTRoi0r8bS+oKSHOooN4Ff0n94ubs
	 LxJ4VdgumPFw3LH4zxYAM730ij+YcaAzhc3ySkPVbgSETvDJIipKp7C8fZIxKgUT58
	 sJeZo1RV4aRf49dTgJZ1gvdHP8mM83XcC7mMN0Kc=
Date: Mon, 28 Apr 2025 12:04:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zongmin Zhou <min_halo@163.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Christoph Hellwig <hch@infradead.org>, i@zenithal.me,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	shuah@kernel.org, valentina.manea.m@gmail.com,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: Re: [PATCH] usbip: set the dma mask to 64bit default for vhci-driver
Message-ID: <2025042812-sinister-shaping-bded@gregkh>
References: <3e1f8fab-0155-4ff9-800d-5fa9df88c48c@linuxfoundation.org>
 <20250422063409.607859-1-min_halo@163.com>
 <aAdEM0crDfSP9JYf@infradead.org>
 <4c6660a6-29ce-4b97-b092-8fc15585e52a@163.com>
 <2025042512-corsage-handpick-bf2a@gregkh>
 <575ce02c-9128-4098-a852-d9e14f14010e@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <575ce02c-9128-4098-a852-d9e14f14010e@163.com>

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Mon, Apr 28, 2025 at 05:51:08PM +0800, Zongmin Zhou wrote:
> Dear Greg and Shuah,
> 
> I found out that the vhci-hcd driver added this virtual device
> as a platform device from the very beginning since 2014.

Ah, I should have caught it back then, but at the time there really
wasn't another option.

> I'm just getting in touch with this module and
> don't have a deep understanding of it，shuah should be clearer.

See the recent patches I did converting drivers to use the faux bus
code, it should be pretty simple to do.

> I don't know if using the faux bus to replace the platform bus can solve the
> problem that the error limitation on max_hw_sectors for usbip device
> since commit d74ffae8b8dd applied.

That is for the storage driver, not usbip.  As the faux bus does not
have any real dma operations, this should cause it to work properly
given the default values involed, but that's up to you to test to verify
it does just that.  Try it and see!

> But this change will request user to update kernel version to support faux
> bus.

That's just a normal kernel update to a newer version, what is wrong
with that?

> This will also be an expensive change to fix the problem?

Fixing things properly is the correct thing to do in all cases.

thanks,

greg k-h
