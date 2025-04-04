Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D8C1F3B94;
	Fri,  4 Apr 2025 14:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743776987; cv=none; b=ZQSORARuqtTdI85CP8+hjs7Bi8+IKhY9tCYA1JC3QSqLkEY2VTot3vhAfY3/nGrVjYFFQ9Y1yKDbFVPAPmMKIzsZj9R1CS/crAGQADEuXPK8OTjn2ZF3VdsbAuV6gIsgTDJpqyE/YV9WLvfV2+XFno5IA90OYOgpg1gvmjO3tXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743776987; c=relaxed/simple;
	bh=pv4RMDin1G2s80kdMx9FCTirOhjc/CI7pmLRINL3VJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TfuoyYxEMYDygonsEBbzRz9cKLuTKuD8osrafngoR5w7n6+CyciN28Gv0+JnmwE/kz85GJ1A+m36rzKVNALlBKkZK8FcR0WrHX6abxwkN9r9hg+JJMCk69Z4FB9DOoFmZ7QpkjKWAtZbo5JjPlxeYsD6tZ9agt0d9RDCUJC8nFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.43] (g43.guest.molgen.mpg.de [141.14.220.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id BBA3261E64799;
	Fri, 04 Apr 2025 16:29:19 +0200 (CEST)
Message-ID: <d69acb96-a90e-450f-94bd-d8116ca54ae4@molgen.mpg.de>
Date: Fri, 4 Apr 2025 16:29:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: xhci: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep
 state.
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <c279bd85-3069-4841-b1be-20507ac9f2d7@molgen.mpg.de>
 <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <b356f743-44b5-4f48-a289-fae0afe106ff@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Mathias,


Thank you for your quick reply.


Am 04.04.25 um 16:26 schrieb Mathias Nyman:
> On 3.4.2025 21.02, Paul Menzel wrote:

>> Just a heads-up, that connecting an LMP USB-C mini Dock [1] to the 
>> Intel Kaby Lake Dell XPS 13 9360 with
>>
>>      00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP 
>> USB 3.0 xHCI Controller [8086:9d2f] (rev 21)
>>
>> resulted in Linux 6.14.0-12966-ga2cc6ff5ec8f logging the warning and 
>> trace below.
>>
>> ```
>> [   74.898485] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
>> [   74.916241] sd 0:0:0:0: [sda] Media removed, stopped polling
>> [   74.916634] sd 0:0:0:0: [sda] Attached SCSI removable disk
>> [   98.803081] PM: suspend entry (deep)
>> [   98.813999] Filesystems sync: 0.010 seconds
>> [   98.819226] Freezing user space processes
>> [  105.534176] xhci_hcd 0000:39:00.0: WARN Set TR Deq Ptr cmd failed due to incorrect slot or ep state.
>> [  105.606437] usb 4-1.4: reset SuperSpeed USB device number 5 using xhci_hcd
>> [  118.822270] Freezing user space processes failed after 20.003 seconds (2 tasks refusing to freeze, wq_busy=0):
> 
> Thanks for the report.
> 
> Looks like it's triggered during system suspend.
> 
> "The Set TR Deq" command that fails here is queued when
> - endpoint stops to remove cancelled transfers.
> - endpoint resets to clear STALL or other halt due to transfer error.
> - canceling a transfer while endpoint is mid stall or tt clearing.
> 
> Looks like there are at least some gaps in verifying endpoint state in 
> endpoint reset handler  before queuing the "Set TR Deq" command, this
> could be a possible reason.
> 
> If this case could be reproduces with xhci dynamic debug enabled it 
> would help narrowing down the real cause.
> 
> echo 'module xhci_hcd =p' >/sys/kernel/debug/dynamic_debug/control

I haven’t found a way to reliably reproduce it. I’ll try, but it might 
take a while.


Kind regards,

Paul
