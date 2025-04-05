Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5BC3FC3;
	Sat,  5 Apr 2025 14:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862149; cv=none; b=FkWL86LmEkSWQ9MU/++caqlaLZzgWZRHK8BOrPPeyhfeBXgeNSLzQqP3E2YOdfF7ylLxPM7/SpHH9KLANDkt5OI5Lip1VUH7bqkRW78CKNYSymbjOfhhd64xHcBtDPYhxRBjDJIyDPVve46IoplG+tIkdcGhN6BPoLxzGX/OQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862149; c=relaxed/simple;
	bh=aPiGerDof7zYDp81C0rPZwzQgTelHPEeK8XxpmDKjbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H1mJxYSrBlGwoTxeJPgruPukEj7B4OqNdie86jSrJjZMu0g0ko9XJeL5Vk/K7ldVI6uZlXLjM9eiZ7cacx9ybIVlRDY0uP1SykegLv5ntdQVAXtlCKlmyaera3kR46fye0REXbO+WRrzy9O5oqknHjEyHsB9BKQvx3gQU+1Kzt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.2] (ip5f5af06c.dynamic.kabel-deutschland.de [95.90.240.108])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id AF7C561E64799;
	Sat, 05 Apr 2025 16:08:26 +0200 (CEST)
Message-ID: <20a4400e-a175-47e2-91ce-a6b475a14b33@molgen.mpg.de>
Date: Sat, 5 Apr 2025 16:08:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
To: =?UTF-8?Q?Micha=C5=82_Pecio?= <michal.pecio@gmail.com>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <20250405084307.4080edf4@foxbook>
 <7ec5ba1d-1de7-409d-882c-2efab4922ed4@molgen.mpg.de>
 <20250405114924.7aa7f3a1@foxbook>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20250405114924.7aa7f3a1@foxbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Michał,


Thank you for your reply.

Am 05.04.25 um 11:49 schrieb Michał Pecio:
> On Sat, 5 Apr 2025 09:36:03 +0200, Paul Menzel wrote:
>>> And the problem appears to be that some USB device gets reset
>>> periodically, probably /dev/sda, whatever it is. This reset loop is
>>> also visible in your new log today.
>> I guess it’s the SD/eMMC card slot, which I do not use though.
> 
> Yep, I just realized that your dmesg shows it clearly:
> 
> [   37.517985] usb 4-1.4: new SuperSpeed USB device number 5 using xhci_hcd
> [   37.535773] usb 4-1.4: New USB device found, idVendor=058f, idProduct=8468, bcdDevice= 1.00
> [   37.535780] usb 4-1.4: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> [   37.535782] usb 4-1.4: Product: Mass Storage Device
> [   37.535783] usb 4-1.4: Manufacturer: Generic
> [   37.535785] usb 4-1.4: SerialNumber: 058F84688461
> [   37.552531] usb-storage 4-1.4:1.0: USB Mass Storage device detected
> 
>>> 3. is it reproducible on 6.14, 6.13, ...
>>
>> As written, from my logs it happened sporadically in the past, but
>> since at least commit a2cc6ff5ec8f it happens almost always. I didn’t
>> see it with commit 08733088b566, and after that I didn’t use any
>> USB-C adapters for three days.
> 
> To be exact, I'm wondering if the reset loop itself is a regression, or
> business as usual. So simply look for this repeating every few seconds:
> 
> [   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
> 
> Relevant commits in your range are:
> 
> 0c74d232578b xhci: Avoid queuing redundant Stop Endpoint command for stalled endpoint
> 860f5d0d3594 xhci: Prevent early endpoint restart when handling STALL errors.
> 
> Reverting 0c74d232578b will remove the warning, but this means that
> 860f5d0d3594 isn't having the intended effect. Not sure  if reverting
> the latter will solve the reset loop or if it was always there. And
> these commits look alright, so IDK what's going wrong.
> 
> I could send a debug patch which might clear some things up.

That’d be awesome.

>> PS: Hints on how to try to reproduce this in QEMU would be welcome.
>> (Passing the controller and device to the VM.)
> 
> If you need help setting up PCI passthrough, I'm afraid I can't help.
> As for reproduction, simply booting a buggy kernel should give those
> repeating resets and xHCI warnings if you are lucky.

After this morning I wasn’t able to reproduce it by un-/replugging. 
Maybe I am lucky to find a reproducer (reboot needed?).


Kind regards,

Paul
