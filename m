Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62491C5D7D;
	Mon,  7 Jul 2025 08:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751878170; cv=none; b=niul0cE0P3+HYhWzLrsJSsl2HDRWhWf/J+a8FXeW43foDyv1YZ7rXO/DZxt28t8dQ4w3oUPnJbcb93phNGa8Wzl/YGB4KILAnJwMlcZk1n0NAA9j++ueY8F6BklSXvk41NwTOqbjyAv++ZPsdxO97zLs5RuTEvX7/izfNAAgh3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751878170; c=relaxed/simple;
	bh=E08jZN7k1pGrat/Cyavs0pVvrOcz/fVCkhhacbMrFTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mB1+CVqvsM4WqNiyFCEZ1ffG5gJMS15ZBCL2oc6MuGqF9mw1md+ZA10qlQ0Z7ZWT7eX2Ls/BTueBZsR9R4BKV4CqkUGJDwe0NmW9L5BmUgGODUSfpDYQjQf2etYu7eBM8IuYBv/R9FpahL7m0+Y+r7JSzq4Xa4Y2Oty2WDZaKRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DEmAoLcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DEmAoLcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD4CC4CEE3;
	Mon,  7 Jul 2025 08:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1751878170;
	bh=E08jZN7k1pGrat/Cyavs0pVvrOcz/fVCkhhacbMrFTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEmAoLcyPU6g1PcARkcmA8exKvrDl2iQGIh3JHaxrqJYS17xpDwKhIwjQXN+IELSv
	 O0tYgeEi5TvD2+2TrVKhjWs6qpez8zczDINsIJHEXaGM+kR+yZ7f32m17suRpTXyx1
	 yDtdYoL81aSRJRpQ3HsyHXX21lMANklSea/Nv11M=
Date: Mon, 7 Jul 2025 10:49:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jie Deng <dengjie03@kylinos.cn>
Cc: stern@rowland.harvard.edu, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH v2] usb: storage: Ignore UAS driver for SanDisk Extreme
 Pro 55AF storage device
Message-ID: <2025070702-unsigned-runny-62c6@gregkh>
References: <2025070422-punctured-opal-f51e@gregkh>
 <20250707062507.39531-1-dengjie03@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707062507.39531-1-dengjie03@kylinos.cn>

On Mon, Jul 07, 2025 at 02:25:07PM +0800, Jie Deng wrote:
> The SanDisk Extreme Pro 55AF storage device(0781:55af) has poor compatibility with UAS drivers.
> The logs:
> [    1.359859][ 0] [  T163] usb 2-1: new SuperSpeed Gen 1 USB device number 2 using xhci_hcd

Nit, the [] stuff should all be removed, it's not relevant, right?

> [    1.385708][ 0] [  T163] usb 2-1: New USB device found, idVendor=0781, idProduct=55af, bcdDevice=10.85
> [    1.385709][ 0] [  T163] usb 2-1: New USB device strings: Mfr=2, Product=3, SerialNumber=1
> [    1.385710][ 0] [  T163] usb 2-1: Product: Extreme Pro 55AF
> [    1.385711][ 0] [  T163] usb 2-1: Manufacturer: SanDisk
> [    1.385711][ 0] [  T163] usb 2-1: SerialNumber: 323234323935343030343636
> [    1.927603][ 0] [  T306] usbcore: registered new interface driver usb-storage
> [    1.940511][ 0] [  T306] scsi host3: uas
> [    1.940584][ 0] [  T306] usbcore: registered new interface driver uas
> [    1.940843][ 0] [  T188] scsi 3:0:0:0: Direct-Access     SanDisk  Extreme Pro 55AF 1085 PQ: 0 ANSI: 6
> [    1.941363][ 0] [  T188] scsi 3:0:0:1: Enclosure         SanDisk  SES Device       1085 PQ: 0 ANSI: 6
> [    1.941697][ 0] [  T188] sd 3:0:0:0: Attached scsi generic sg0 type 0
> [    1.941783][ 0] [  T188] scsi 3:0:0:1: Attached scsi generic sg1 type 13
> [    1.942296][ 0] [  T189] sd 3:0:0:0: [sda] 1953459617 512-byte logical blocks: (1.00 TB/931 GiB)
> [    1.942373][ 0] [  T189] sd 3:0:0:0: [sda] Write Protect is off
> [    1.942374][ 0] [  T189] sd 3:0:0:0: [sda] Mode Sense: 37 00 10 00
> [    1.942534][ 0] [  T189] sd 3:0:0:0: [sda] Write cache: enabled, read cache: enabled, supports DPO and FUA
> [    1.943586][ 0] [  T189] sd 3:0:0:0: [sda] Optimal transfer size 2097152 bytes
> [    1.976797][ 0] [  T189]  sda: sda1
> [    1.977898][ 0] [  T189] sd 3:0:0:0: [sda] Attached SCSI disk
> [    1.980406][ 0] [  T267] scsi 3:0:0:1: Failed to get diagnostic page 0x1
> [    1.980408][ 0] [  T267] scsi 3:0:0:1: Failed to bind enclosure -19
> [    1.980414][ 0] [  T267] ses 3:0:0:1: Attached Enclosure device
> [    1.981068][ 0] [    C0] sd 3:0:0:0: [sda] tag#10 data cmplt err -75 uas-tag 1 inflight: CMD
> [    1.981071][ 0] [    C0] sd 3:0:0:0: [sda] tag#10 CDB: Read(10) 28 00 74 6f 6d 00 00 00 08 00
> [   33.819186][ 0] [  T188] sd 3:0:0:0: [sda] tag#10 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD
> [   33.819188][ 0] [  T188] sd 3:0:0:0: [sda] tag#10 CDB: Read(10) 28 00 74 6f 6d 00 00 00 08 00
> [   33.843186][ 0] [  T309] scsi host3: uas_eh_device_reset_handler start

So new devices are being made that can not handle UAS?  Are you sure
there's not some other quirk that could be used here instead?  How does
this device work on other operating systems with the UAS drivers there?

thanks,

greg k-h
