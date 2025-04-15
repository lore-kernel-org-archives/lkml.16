Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC029A3EB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 16:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744733704; cv=none; b=pFYygM9m3crbdk2HQ0WnrFrrYyf/a8fdVU7WqGC+5yTnOMhjGpyR8S4zs6AZhZ3kS6RGVvLTXWe+WQ74ifoY1KHe3zwfpoqHLNG+fVY7PyRwZDUHnLFt5VjRH6XoWLJLaeTSnkOZQLI00GPOoZqd5dt+ggu9D6TOlZbfAfBI5k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744733704; c=relaxed/simple;
	bh=P2heep8QRP6wa2OUbD7gIHSwRsZJZtY9PNNJGgeww4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V+YI79jD0FLxFBW+nlkrvrGyKsI4lHBlrkblPhmB6yk1oRPxcqvHvnaturkc7jnPzamrYumPTs3o7IsNBg6lMO9sKUzDJJzW7SjYfJ5Kmb+5npNswCKWSXEPeP0esg0JIgVhCsRVfP6UwvPOmkfTbleZSbPzIVLIlY3vpy5B+BY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=HHG1mJ/p; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="HHG1mJ/p"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6e8fca43972so64425686d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1744733701; x=1745338501; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ndpxizfxk8xZf2a+Grdyq/15OyW+aUtbkxycLRMyjwc=;
        b=HHG1mJ/pFo+oELt+PRC07I2S34bJSqaGOezUWe9W4ucpcXkVOaJcuLgdV3KPYHkXs0
         RKR1JvY4arF1Fl5ip+vabOVH4d6a14Wc5B+uoinoh+ZYZP/pEHKOxIBXI3iT5zIZQ6pd
         9Tvi+romyUKFyWGrqA24ttO0Dm8C70BhCElGhm5byimWptN02dY61bBToteTj/5rwof+
         Rvi/wzakeHqCCtXXspAFrKvQ9o48Zb3gh8Z5y881C403yzXXsIpeDG0MPLhHcJqRCcUF
         /7SD0TdE/yxlTTR9xl0PqsV7ngGP+7jF8QcQfd3vXkqnKzpch2MtN1M2YWaHWYFrGEVu
         ID+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744733701; x=1745338501;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndpxizfxk8xZf2a+Grdyq/15OyW+aUtbkxycLRMyjwc=;
        b=t4nPwc0LX0KB/lxsBsHzWv/jMpJsfpbRYKkPjzR8Qq5DgNqfjd2effLq8XP/ec39Kl
         6MjSo4LhhROe1F/iMuihBb3UjIcT+SEftYT0E7aLlj/vX2WG+d9/+sUK1p+tajEEpwr3
         GEjqmJHOqiL1M+xqphD1BxMgNOSVfTHVlzoOuqpHSEatIhoRfRQhpLq+1QgkQaXehuFI
         0aLGoY/H67yyn+eUqKSxgs2rfypl8r5qhEXg31eaZ3/+cyxqrpzArexYyyimtd7Olbuu
         RkVdBzxjfQv5uuC3oxBg/FBgYmVXE7OmWVOPtb0/7KImH/O4YuHvj9w3GpgMWC9EtRnY
         AX7A==
X-Forwarded-Encrypted: i=1; AJvYcCVvy+Nv4pmVsSMeFAb8YXNt4cd3jJ3X+R+i6W/2DA9GXRSg8lNCYm19kJhVAVvhLTHYtKTP774KVJ0usNU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpSfolKHRhz7E3Gh3gohAI/R0aiXUeyK2Ug/NfXhlAzVSt3Ulx
	wer7kae806kD7QIlWpNvGI/gb2H7hZJqARSUJXa5STiTR96Yz1QezJhydXboBA==
X-Gm-Gg: ASbGncucS3EAp4vkR9gPvhFJij4rPXXSU9/zbxu5AcwqrTGJbYQuFg5wR7hkb3X5Pgc
	7tW3N6Qx2ktdbi9R3EhgSfLT2U1C8UypKDwuvJ1H/ZqKdbXqgKan2PduavW+4DIzb44x8TFcQ+a
	+5crUg/UmM6rMUYkXnN4rlm298RXQqmvtjKqyBsoq2ik5nfznav39qjutOmdrHHwt5YO1q1RMwG
	L6fULxp3T1NDJxyRpT0WrdH8TX7X/gytgJPSgxzT92HjZutEk+1Utm6TVqJS4suSh8fBZi4575f
	UIv2mU8QGpVhZIgtJfLIhFCguTiHlcg5DTKWTgyJZRP/DyWwu4yyTnOweFs=
X-Google-Smtp-Source: AGHT+IHVUO0u2fUfe3cE7yKE+AvfIu9alQQpKOFF/bjctFrsoljoFwZ4RwBudswu4kxmKH8NY56W/Q==
X-Received: by 2002:a05:6214:1bc6:b0:6ef:cc6:953a with SMTP id 6a1803df08f44-6f2ad89c716mr906026d6.12.1744733701032;
        Tue, 15 Apr 2025 09:15:01 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f0dea07d86sm103193866d6.72.2025.04.15.09.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 09:15:00 -0700 (PDT)
Date: Tue, 15 Apr 2025 12:14:58 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	=?iso-8859-1?Q?Herv=E9?= Codina <herve.codina@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Subject: Re: DWC2 gadget: unexpected device reenumeration on Rockchip RK3308
Message-ID: <8c2e18a9-44d1-47b3-8fe4-46bdc5be8d76@rowland.harvard.edu>
References: <20250414185458.7767aabc@booty>
 <a96409af-4f82-4b65-b822-dd8c71508212@rowland.harvard.edu>
 <cf84f5ca-8c7a-b6c6-492c-c9cf6f73130d@synopsys.com>
 <20250415162825.083f351c@booty>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415162825.083f351c@booty>

On Tue, Apr 15, 2025 at 04:28:25PM +0200, Luca Ceresoli wrote:
> > > You should enable host-side debugging before connecting the cable:
> > > 
> > > 	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control
> 
> Did that, and here is my host log:
> 
> ### First enumeration starts
> 
> [105021.069029] hub 3-3:1.0: state 7 ports 4 chg 0000 evt 0010
> [105021.076825] usb 3-3-port4: status 0101, change 0001, 12 Mb/s
> [105021.080244] usb 3-3-port4: indicator auto status 0
> [105021.190710] usb 3-3-port4: debounce total 100ms stable 100ms status 0x101
> [105021.286322] usb 3-3.4: new high-speed USB device number 87 using xhci_hcd
> [105021.396995] usb 3-3.4: skipped 1 descriptor after configuration
> [105021.397009] usb 3-3.4: skipped 4 descriptors after interface
> [105021.398516] usb 3-3.4: default language 0x0409
> [105021.403247] usb 3-3.4: udev 87, busnum 3, minor = 342
> [105021.403257] usb 3-3.4: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00
> [105021.403262] usb 3-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [105021.403265] usb 3-3.4: Product: foobar
> [105021.403267] usb 3-3.4: Manufacturer: ACME
> [105021.403269] usb 3-3.4: SerialNumber: 12345678
> [105021.403762] usb 3-3.4: usb_probe_device
> [105021.403768] usb 3-3.4: configuration #1 chosen from 1 choice
> [105021.410537] usb 3-3.4: adding 3-3.4:1.0 (config #1, interface 0)
> [105021.412201] cdc_acm 3-3.4:1.0: usb_probe_interface
> [105021.412207] cdc_acm 3-3.4:1.0: usb_probe_interface - got id
> [105021.413917] cdc_acm 3-3.4:1.0: ttyACM0: USB ACM device
> [105021.413966] usb 3-3.4: adding 3-3.4:1.1 (config #1, interface 1)
> 
> ### 6 seconds delay, second enumeration starts
> 
> [105027.468951] hub 3-3:1.0: state 7 ports 4 chg 0000 evt 0010
> [105027.477656] usb 3-3-port4: status 0101, change 0001, 12 Mb/s
> [105027.481091] usb 3-3-port4: indicator auto status 0
> [105027.481116] usb 3-3.4: USB disconnect, device number 87
> [105027.481123] usb 3-3.4: unregistering device
> [105027.481128] usb 3-3.4: unregistering interface 3-3.4:1.0
> [105027.481803] usb 3-3.4: unregistering interface 3-3.4:1.1
> [105027.481899] usb 3-3.4: usb_disable_device nuking all URBs

This shows that as far as the host is concerned, the device was 
disconnected from the USB bus...

> [105027.591528] usb 3-3-port4: debounce total 100ms stable 100ms status 0x101
> [105027.686604] usb 3-3.4: new high-speed USB device number 88 using xhci_hcd
> [105027.797310] usb 3-3.4: skipped 1 descriptor after configuration
> [105027.797328] usb 3-3.4: skipped 4 descriptors after interface
> [105027.798834] usb 3-3.4: default language 0x0409
> [105027.803564] usb 3-3.4: udev 88, busnum 3, minor = 343
> [105027.803574] usb 3-3.4: New USB device found, idVendor=1209, idProduct=0001, bcdDevice= 1.00
> [105027.803578] usb 3-3.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [105027.803582] usb 3-3.4: Product: foobar
> [105027.803584] usb 3-3.4: Manufacturer: ACME
> [105027.803586] usb 3-3.4: SerialNumber: 12345678
> [105027.803919] usb 3-3.4: usb_probe_device
> [105027.803926] usb 3-3.4: configuration #1 chosen from 1 choice
> [105027.810831] usb 3-3.4: adding 3-3.4:1.0 (config #1, interface 0)
> [105027.812617] cdc_acm 3-3.4:1.0: usb_probe_interface
> [105027.812627] cdc_acm 3-3.4:1.0: usb_probe_interface - got id
> [105027.814357] cdc_acm 3-3.4:1.0: ttyACM0: USB ACM device
> [105027.814424] usb 3-3.4: adding 3-3.4:1.1 (config #1, interface 1)

and then reconnected.

> ### Second enumeration finished
> 
> Do you find useful hints in this log?
> 
> To me it doesn't, I'm afraid.

Not much, no.  There's no way to tell the reason for the disconnection.  
It could be something that the device did, or a problem with the cable 
(unlikely since it occurs regularly at 6-second intervals).

> > > It's quite possible that you're getting messed up by link power
> > > management (LPM).  But that's just a guess.
> 
> What would be a symptom, if that happened?

The debugging log wouldn't show much unless something went wrong.  You 
could see if there are any files containing "lpm" in their names in the 
/sys/bus/usb/devices/3-3.4/ directory (while the device is connected) 
and what they contain.  Also, there's a way to disable LPM on the host 
by setting a usbcore quirks module parameter:

	echo 1209:0001:k >/sys/module/usbcore/parameters/quirks

(1209 and 0001 are the device's vendor and product IDs, and k is the 
code for disabling LPM.)  You can do this before connecting the device 
and it will remain in effect until you reboot.

You could also try connecting a usbmon trace for bus 3, showing what 
happens during the initial connection and ensuing disconnection.  Any 
LPM transitions would show up in the trace.

Alan Stern
