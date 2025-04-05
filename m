Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBAEAE7;
	Sat,  5 Apr 2025 18:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743876861; cv=none; b=fV2kt35DbHcFCOfvNR6XwAJtrlM8Z5Op3/otmwB3vhDZ/5G8eJnXalHFsT0ZR/nNIUAGrCCSBE6REmp+c3uSe6/Bd1t+GUMvhBpiw6Pzl7gKahvFQDlMXjRV+c8StdsRyonQqYcvTPqIiy3YwQLOft2WQjtV9o/DNamxjChd/WA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743876861; c=relaxed/simple;
	bh=mCoZJU+8CwJEkwTluH3wfrA+bmFGeNCV1w/J601w2aA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=RV3n57EANovw0V0wTE/w/I7XfqTG9L5AOmi9dN+IOYzOznRiQnXDHeGeaNbIr3UV4jwkO1KLFpGjSIzjvvOu8hEd23bAbavKIW/+n8dx5YQXpjxsD5qUbBOHtD5USdqIxKnSrZpwmPKBVn+VOi4MVF3ELYwvEqKAHYoHa8yN8Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af06c.dynamic.kabel-deutschland.de [95.90.240.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 8929261E6478F;
	Sat, 05 Apr 2025 20:13:41 +0200 (CEST)
Message-ID: <a878c165-2990-4dcf-85a1-639626d26eb2@molgen.mpg.de>
Date: Sat, 5 Apr 2025 20:13:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <20250405084307.4080edf4@foxbook>
 <7ec5ba1d-1de7-409d-882c-2efab4922ed4@molgen.mpg.de>
 <20250405114924.7aa7f3a1@foxbook>
 <20a4400e-a175-47e2-91ce-a6b475a14b33@molgen.mpg.de>
Content-Language: en-US
In-Reply-To: <20a4400e-a175-47e2-91ce-a6b475a14b33@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Add logs for looking, when it started]

Am 05.04.25 um 16:08 schrieb Paul Menzel:
> Dear Michał,
> 
> 
> Thank you for your reply.
> 
> Am 05.04.25 um 11:49 schrieb Michał Pecio:
>> On Sat, 5 Apr 2025 09:36:03 +0200, Paul Menzel wrote:
>>>> And the problem appears to be that some USB device gets reset
>>>> periodically, probably /dev/sda, whatever it is. This reset loop is
>>>> also visible in your new log today.
>>> I guess it’s the SD/eMMC card slot, which I do not use though.
>>
>> Yep, I just realized that your dmesg shows it clearly:
>>
>> [   37.517985] usb 4-1.4: new SuperSpeed USB device number 5 using xhci_hcd
>> [   37.535773] usb 4-1.4: New USB device found, idVendor=058f, idProduct=8468, bcdDevice= 1.00
>> [   37.535780] usb 4-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>> [   37.535782] usb 4-1.4: Product: Mass Storage Device
>> [   37.535783] usb 4-1.4: Manufacturer: Generic
>> [   37.535785] usb 4-1.4: SerialNumber: 058F84688461
>> [   37.552531] usb-storage 4-1.4:1.0: USB Mass Storage device detected
>>
>>>> 3. is it reproducible on 6.14, 6.13, ...
>>>
>>> As written, from my logs it happened sporadically in the past, but
>>> since at least commit a2cc6ff5ec8f it happens almost always. I didn’t
>>> see it with commit 08733088b566, and after that I didn’t use any
>>> USB-C adapters for three days.
>>
>> To be exact, I'm wondering if the reset loop itself is a regression, or
>> business as usual. So simply look for this repeating every few seconds:
>>
>> [   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd

Please find this at the end since March 20th. It looks like it really 
happened first on April 3rd.

>> Relevant commits in your range are:
>>
>> 0c74d232578b xhci: Avoid queuing redundant Stop Endpoint command for 
>> stalled endpoint
>> 860f5d0d3594 xhci: Prevent early endpoint restart when handling STALL 
>> errors.
>>
>> Reverting 0c74d232578b will remove the warning, but this means that
>> 860f5d0d3594 isn't having the intended effect. Not sure  if reverting
>> the latter will solve the reset loop or if it was always there. And
>> these commits look alright, so IDK what's going wrong.
>>
>> I could send a debug patch which might clear some things up.
> 
> That’d be awesome.
> 
>>> PS: Hints on how to try to reproduce this in QEMU would be welcome.
>>> (Passing the controller and device to the VM.)
>>
>> If you need help setting up PCI passthrough, I'm afraid I can't help.
>> As for reproduction, simply booting a buggy kernel should give those
>> repeating resets and xHCI warnings if you are lucky.
> 
> After this morning I wasn’t able to reproduce it by un-/replugging. 
> Maybe I am lucky to find a reproducer (reboot needed?).
> 
> 
> Kind regards,
> 
> Paul


PS:

$ journalctl -o short-precise -g '(reset SuperSpeed USB|Linux version)' 
--since "2025-03-20"
Mär 20 00:08:00.231704 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 20 00:18:48.167112 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
-- Boot 3ea39eea535d4632b729a02da58602f9 --
Mär 20 07:52:48.689043 abreu kernel: Linux version 
6.14.0-rc7-00074-ga7f2e10ecd8f (build@bohemianrhapsody.molgen.mpg.de) 
(gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils f>
Mär 20 07:52:53.334932 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 20 07:52:53.870941 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Mär 20 10:05:12.596050 abreu kernel: usb 4-1: reset SuperSpeed USB 
device number 2 using xhci_hcd
Mär 20 10:05:12.611540 abreu kernel: usb 4-1.1: reset SuperSpeed USB 
device number 3 using xhci_hcd
Mär 20 10:05:13.411380 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Mär 20 10:05:13.412813 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 20 10:05:13.520530 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Mär 20 10:19:43.723369 abreu kernel: usb 4-1: reset SuperSpeed USB 
device number 2 using xhci_hcd
Mär 20 10:19:43.729133 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Mär 20 10:19:43.730388 abreu kernel: usb 4-1.1: reset SuperSpeed USB 
device number 3 using xhci_hcd
Mär 20 10:19:43.731913 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Mär 20 11:02:43.835499 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 20 18:01:52.267150 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
-- Boot 629669479b524bdab34fe7680c42a7a5 --
Mär 24 23:57:23.843173 abreu kernel: Linux version 6.14.0 
(build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-19) 14.2.0, 
GNU ld (GNU Binutils for Debian) 2.44) #112 SM>
-- Boot 6c1fe16dbae14fd0a6f0cb40e53d5bb8 --
Mär 25 07:07:42.335002 abreu kernel: Linux version 6.14.0 
(build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 14.2.0-19) 14.2.0, 
GNU ld (GNU Binutils for Debian) 2.44) #112 SM>
-- Boot e28046c9e8574016893c427cbfdb0291 --
Mär 27 07:12:50.494548 abreu kernel: Linux version 
6.14.0-03565-gf6e0150b2003 (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
Mär 27 19:01:39.512306 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 27 19:01:40.048285 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Mär 27 20:04:42.722172 abreu kernel: usb 4-1: reset SuperSpeed USB 
device number 2 using xhci_hcd
Mär 27 20:04:42.723941 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Mär 27 20:04:42.724399 abreu kernel: usb 4-1.1: reset SuperSpeed USB 
device number 3 using xhci_hcd
Mär 27 20:04:43.264714 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 27 20:04:43.340835 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Mär 27 20:05:55.848463 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
-- Boot 4c04b7389e95458d92cd5dc6287e9921 --
Mär 28 09:13:58.729320 abreu kernel: Linux version 
6.14.0-03565-gf6e0150b2003 (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
Mär 28 09:19:46.164632 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 28 11:07:42.609647 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 28 14:10:06.705580 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 28 17:43:53.576222 abreu kernel: usb 4-1: reset SuperSpeed USB 
device number 2 using xhci_hcd
Mär 28 17:43:53.577330 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Mär 28 17:43:53.577612 abreu kernel: usb 4-1.1: reset SuperSpeed USB 
device number 3 using xhci_hcd
Mär 28 17:43:53.846447 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
-- Boot ce6db56afe624e83be5ef5a2cb3a6e40 --
Mär 29 10:36:26.267141 abreu kernel: Linux version 
6.14.0-09584-g7d06015d936c (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
-- Boot 12207fec721d42c288eea93e45cfa809 --
Mär 30 09:37:25.950469 abreu kernel: Linux version 
6.14.0-09584-g7d06015d936c (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
Mär 30 20:36:24.314743 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 30 22:28:18.687766 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Mär 30 23:13:41.324239 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Mär 31 12:22:06.411268 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Mär 31 17:12:26.652278 abreu kernel: usb 4-1: reset SuperSpeed USB 
device number 2 using xhci_hcd
Mär 31 17:12:26.661024 abreu kernel: usb 4-1.1: reset SuperSpeed USB 
device number 3 using xhci_hcd
Mär 31 17:12:27.218665 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Mär 31 17:12:27.252912 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 9 using xhci_hcd
Mär 31 18:07:11.111291 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 01 00:03:45.605614 abreu kernel: usb 4-1: reset SuperSpeed USB 
device number 2 using xhci_hcd
Apr 01 00:03:45.611421 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 01 00:03:45.617429 abreu kernel: usb 4-1.1: reset SuperSpeed USB 
device number 3 using xhci_hcd
Apr 01 00:03:45.911494 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
-- Boot fc756d26fe7246c795c3fe53ad898d02 --
Apr 01 09:58:07.337525 abreu kernel: Linux version 
6.14.0-11270-g08733088b566 (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
-- Boot 1573a3e845f1478ea125cdeddfe4eff6 --
Apr 03 09:17:06.873201 abreu kernel: Linux version 
6.14.0-12456-gacc4d5ff0b61 (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
-- Boot 84f61314c960427b9bb45d6ec89c6614 --
Apr 03 18:42:47.976090 abreu kernel: Linux version 
6.14.0-12966-ga2cc6ff5ec8f (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
Apr 03 18:43:51.556142 abreu kernel: usb 4-1: reset SuperSpeed USB 
device number 2 using xhci_hcd
Apr 03 18:43:51.557244 abreu kernel: usb 4-1.3: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 03 18:43:51.558589 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:43:51.559826 abreu kernel: usb 4-1.1: reset SuperSpeed USB 
device number 3 using xhci_hcd
Apr 03 18:43:52.088207 abreu kernel: usb 4-1.1.3: reset SuperSpeed USB 
device number 6 using xhci_hcd
Apr 03 18:45:27.463280 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:45:27.486916 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:45:30.490492 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Apr 03 18:45:30.958620 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:46:02.627820 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:46:33.317049 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:47:04.045034 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:47:34.761816 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:47:44.993087 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 18:47:55.253046 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 5 using xhci_hcd
Apr 03 19:52:36.334831 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 03 20:00:32.646468 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
Apr 03 20:01:00.642987 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 6 using xhci_hcd
-- Boot 6099270581994a2aa70a9e39704f5ea0 --
Apr 04 10:17:32.182910 abreu kernel: Linux version 
6.14.0-12966-ga2cc6ff5ec8f (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
Apr 04 11:21:19.902554 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
-- Boot a0da16dab85141bca894311ff0fdcd40 --
Apr 04 17:05:33.747034 abreu kernel: Linux version 
6.14.0-13189-ge48e99b6edf4 (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
Apr 04 18:01:54.884238 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:02:26.742658 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 04 18:02:26.748318 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:02:57.436240 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:03:28.164017 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:03:58.884086 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:04:09.120015 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:04:39.840032 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:04:50.076141 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:05:20.792110 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:05:51.520281 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:06:01.752056 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:06:32.480027 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:06:42.719989 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:07:13.432019 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:07:44.160279 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:08:14.876025 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:08:25.116045 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:08:55.844030 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:09:26.556268 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:09:57.272207 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:10:07.512295 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:10:38.232295 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:11:08.955980 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:11:39.672263 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:12:12.448213 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:12:45.219993 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:13:17.988027 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:13:50.751984 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:14:23.528136 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:14:56.284128 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:15:29.056052 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:15:30.924114 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:16:01.832029 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:16:34.596101 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:17:07.352025 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:17:09.224053 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:17:40.120076 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:18:12.896101 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:18:45.656289 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:19:18.432050 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:19:20.296050 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:19:51.216053 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:20:23.964048 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:20:56.728070 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:21:29.500020 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:22:02.271994 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:22:35.040109 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:23:07.804109 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:23:40.580113 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:24:13.339137 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:24:46.104066 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:25:18.880124 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:25:51.644024 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 18:25:53.520052 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 04 21:45:20.823589 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
-- Boot 3034d348a12c478aaaaaa8ccedfb60d0 --
Apr 05 06:46:26.182292 abreu kernel: Linux version 
6.14.0-13381-g4a1d8ababde6 (build@bohemianrhapsody.molgen.mpg.de) (gcc 
(Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D>
Apr 05 06:48:01.272675 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:48:32.632910 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 05 06:48:32.683062 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:49:03.328728 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:49:34.056908 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:50:04.775938 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:50:15.008645 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:50:25.260640 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:50:55.972654 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:51:26.688750 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:51:36.937097 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:52:07.663998 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:52:17.896785 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:52:48.628378 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:53:19.335917 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:53:50.065039 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:54:00.294102 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:54:31.016760 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:55:01.728636 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:55:32.448921 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:55:42.696872 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:56:13.416711 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:56:44.152779 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:57:14.856755 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:57:47.632774 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:58:20.388779 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:58:53.164861 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:59:25.932717 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 06:59:58.688704 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:00:00.556770 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:00:31.460656 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:01:04.225645 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:01:37.004759 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:02:09.760732 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:02:42.528767 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:03:15.308745 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:03:48.064632 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:03:49.928644 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:04:20.836709 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:04:22.676714 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:04:53.620719 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:05:26.380753 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:05:59.136647 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:06:31.916711 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:07:04.680874 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:07:06.548726 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:07:37.448881 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:07:39.300743 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:08:10.216652 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:08:42.976749 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:09:15.753005 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:09:48.520687 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:09:50.356654 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:10:21.280716 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:10:54.056716 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:11:26.816872 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:11:59.588664 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:12:32.352879 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:13:05.124700 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:13:37.892639 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:14:10.656717 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:14:12.500681 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:14:43.432733 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:15:16.208855 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:15:48.960771 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:15:50.804722 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:16:21.740747 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:16:23.604866 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:16:54.500716 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:17:27.272758 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:18:00.044738 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:18:32.804708 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:19:05.588664 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:19:38.345176 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:19:40.220851 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:20:11.112681 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:20:43.884707 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:21:16.644671 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:21:49.416771 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:22:22.176708 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:22:54.944724 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:23:27.720913 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:24:00.488648 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:24:33.256866 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:25:06.032663 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:25:38.792860 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:26:11.552723 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:26:44.324749 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:26:46.180683 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:27:17.088741 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:27:18.928727 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:27:49.872701 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:28:22.624667 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:28:55.404706 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:29:28.168740 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:30:00.944688 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:30:33.708692 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:31:06.488710 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:31:39.240707 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:32:12.000712 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:32:44.768704 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:32:46.608705 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:33:17.536661 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:33:50.312729 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:33:52.164684 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:34:23.084653 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:34:24.916846 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:34:55.864872 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:35:28.620668 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:35:30.476755 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:36:01.396724 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:36:03.240759 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:36:34.152669 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:36:35.996679 abreu kernel: usb 4-1.4: reset SuperSpeed USB 
device number 4 using xhci_hcd
Apr 05 07:37:14.512098 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 05 15:49:50.740214 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 05 15:58:31.922724 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 05 16:43:31.640804 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
Apr 05 18:47:47.461907 abreu kernel: r8152-cfgselector 4-1.1.3: reset 
SuperSpeed USB device number 5 using xhci_hcd
