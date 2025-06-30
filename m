Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CB02868B4
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 12:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751288057; cv=none; b=FMxF/UJ6HdisR5LCfoCKV7omfOQj+mM3+lNTze4dITB8XoBfHOoaN+X4qlmC7s/CqHEP+98nSxqKtBAzrIrUbvbs0J45+Mt6Jt3HUcsAHSWvVfGZvWY1kSvUSJrTix7atgTHk0g2sn3kqWNs5uaG2bPRwVyrrelVJZQch41ADj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751288057; c=relaxed/simple;
	bh=8nqmo+rei3qHajtCEfFO/50ktkdd63V9ts90xmZ/CYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aWfsTvaeMpR6EoFqTQ1vEJfabDXnO2XHH8XwoUe8CzuyfQuq+hYd6TX/o6LhiLrn0SRnfDbP1LsyFUU52ccnbmA5gJOk46vnBhH6krb8OoRcUvDSH4z6nHFvMmTwISU3V0cVxrTJ88SrUZ9xEQLqJEQkd94Zpt7OiGbUGCeh9V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QwMRPb0o; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QwMRPb0o"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453608ed113so21443415e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 05:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751288053; x=1751892853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9jLkQ7o3FXtEXi1IQ3ub2+DODNHsq6Ub6aaCXUQMmD4=;
        b=QwMRPb0oIAoSVEQDp/W32PrncU30nDp8d92xqem/clRd38Owp3U35YH2Va6UwaX12O
         GP9TWW09JnxrfU1M+LOpLpgm3OE/TvOko8dtxZOsoGR1gsFNT25WSp5DuiHud7CeSgAZ
         6FzWImvPSuf9wdk9rj5UTlQp6cdC3rDt9AsIRBrXkz0p9cHxURCJxxtXI1kBSi6l8RYL
         5v17isumdDZeBBYOilzoaN6g501T5dKO21yl3oJE0mW0moi+d47rvJYaiC/in6dyt7wq
         3vYpejMJJ5GID7HWqjfAXUStWpVeq8uqdmLMh71+++tD5JsWBMCE2PxLuj+PJxGI6dJH
         0CKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751288053; x=1751892853;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9jLkQ7o3FXtEXi1IQ3ub2+DODNHsq6Ub6aaCXUQMmD4=;
        b=fQ9S4xusL4KSI+r05hM/jgAAafHHNgJQFcFmLsZUVU3T6XRRVZhAvRrrhyijEsMKAm
         EYJ8zOagAOi4LSdldUB4aYjbKFqdSKne/x6voUOGXn+TFVm6cscqfAqH7Dbs3ZCN18Dz
         DlybfkiQGsoDyrZEGDsQ9axGtJuJAAVP9TCzfIx9NWeFhQXqXJVvnNA9a6rlP2h27Hx2
         Tqlfra+jHV/GfTP5/XyMckZXODFxYnsd2ZNF6zrWOb/vNu+2TImkRRhpiKxaU+HpxsBs
         dVqTwiD/Krwsg5pzcjMpF1PF9xHrHrMHoFthYiwfjEf32OQEGWaHL2/K7J8PNFfGuCZD
         bE9w==
X-Forwarded-Encrypted: i=1; AJvYcCWNvwqW53TLfpPWvestCuEVxCwGHnp7MeFcCo95NaAIEr1Odq0TNQjvKVNPtRn6JYCKnegpMUOlNkc6nfs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyypY4kAahIB+BqwWO/f+Dy6a9c8H6FBq/zldhpyDefeETnu43B
	PiKULratVjKMVbO7c955kWKXt1c5Lww9v4enqQr9wdGQxoyf/oWMcvN8AjgzFTL7ryY=
X-Gm-Gg: ASbGncvTB2CFEPz2WdEOlb/xIP3zeaZVORq9AH5pC5006JzsXNDOFdlBCGEKoLnbLgz
	501GDJ+iKNoE7y2IzUMSTbhif/TGKrYvJ+jNrxwbbuAZymIJsNUbTiWHpVs73bwWtk0LfdODF1b
	umzRAECk9nSsQNj0VJxb+ujloHVlC8Y0z2S8UZ1hXz+3Yt1jxWVI8QXrPpHo107C1noaMCYY08A
	XPrnZX4PhdQ7qHrXTqt7ieIA9SK+i/F6ncJC8tL0/7BcZgutW9V433XieIYbdMq+jEcZ/ee+g4x
	xF2LlbbZ7OzcWV9C4Kdiw2XcepEoMUojK6iJWdeIXWaxspt8M59U1qM5weYY/OsB3MA=
X-Google-Smtp-Source: AGHT+IFyQu7Ki5gvo4BFA4TtGfnQe5plFXKRj5DMPY5AOJVNuPnTNV4ZjZhKg8wcPBmJAG48luD+rQ==
X-Received: by 2002:a05:600c:314c:b0:441:b3eb:574e with SMTP id 5b1f17b1804b1-4538f377598mr125587895e9.5.1751288052641;
        Mon, 30 Jun 2025 05:54:12 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c05csm165217675e9.5.2025.06.30.05.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:54:12 -0700 (PDT)
Message-ID: <423f101a-0826-4b7c-ace7-f5e7f4790c4c@linaro.org>
Date: Mon, 30 Jun 2025 13:54:11 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-2-178dba20c120@linaro.org>
 <20250627213041.vp6yfcgf4xysdklf@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250627213041.vp6yfcgf4xysdklf@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2025 10:30 pm, Vladimir Oltean wrote:
> On Fri, Jun 27, 2025 at 11:21:38AM +0100, James Clark wrote:
>> This will allow us to return a status from the interrupt handler in a
>> later commit and avoids copying it at the end of
>> dspi_transfer_one_message(). For consistency make polling and DMA modes
>> use the same mechanism.
>>
>> Refactor dspi_rxtx() and dspi_poll() to not return -EINPROGRESS because
>> this isn't actually a status that was ever returned to the core layer
>> but some internal state. Wherever that was used we can look at dspi->len
>> instead.
>>
>> No functional changes intended.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
> 
> This commit doesn't work, please do not merge this patch.
> 
> You are changing the logic in DMA mode, interrupt-based FIFO and PIO all
> in one go, in a commit whose title and primary purpose is unrelated to
> that. Just a mention of the type "while at it, also do that". And in
> that process, that bundled refactoring introduces a subtle, but severe bug.
> 
> No, that is discouraged. Make one patch per logical change, where only
> one thing is happening and which is obviously correct. It helps you and
> it helps the reviewer.
> 
> Please find attached a set of 3 patches that represent a broken down and
> corrected variant of this one. First 2 should be squashed together in
> your next submission, they are just to illustrate the bug that you've
> introduced (which can be reproduced on any SoC in XSPI mode).
> 

Thanks for the debugging, yes it looks like the patches could be broken 
down a bit.

Just for clarity, is this bug affecting host+polling mode? I can see the 
logic bug in dspi_poll() which I must have tested less thoroughly, but I 
can't actually see any difference in dspi_interrupt().

WRT the patches attached, we could remove dspi_rxtx(). It's only 
encapsulating two function calls, and the return half way through is 
something that is for the outer loop in the caller anyway. Open open 
coding the dspi_fifo_read() and dspi_fifo_write() ends up being clearer IMO.

> The panic message is slightly confusing and does not directly point to
> the issue, I'm attaching it just for the sake of having a future reference.
> 

The panic is a bit confusing, I didn't expect to see dspi_interrupt() if 
it only affects polling mode. Do you have a reproducer? I wasn't able to 
reproduce it in interrupt mode.

> [    4.154185] DSA: tree 0 setup
> [    4.157380] sja1105 spi2.0: Probed switch chip: SJA1105S
> [    4.173894] sja1105 spi2.0: configuring for fixed/sgmii link mode
> [    4.232527] sja1105 spi2.0: Link is Up - 1Gbps/Full - flow control off
> [    4.312798] sja1105 spi2.0 sw0p0 (uninitialized): PHY [0000:00:00.3:07] driver [RTL8211F Gigabit Ethernet] (irq=POLL)
> [    4.443689] sja1105 spi2.0 sw0p1 (uninitialized): PHY [0000:00:00.3:00] driver [Microsemi GE VSC8502 SyncE] (irq=POLL)
> [    4.575718] sja1105 spi2.0 sw0p2 (uninitialized): PHY [0000:00:00.3:01] driver [Microsemi GE VSC8502 SyncE] (irq=POLL)
> [    4.588012] Unable to handle kernel paging request at virtual address ffff8000801ac000
> [    4.595960] Mem abort info:
> [    4.598757]   ESR = 0x0000000096000007
> [    4.602515]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    4.607843]   SET = 0, FnV = 0
> [    4.610902]   EA = 0, S1PTW = 0
> [    4.614048]   FSC = 0x07: level 3 translation fault
> [    4.618939] Data abort info:
> [    4.621822]   ISV = 0, ISS = 0x00000007, ISS2 = 0x00000000
> [    4.627323]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    4.632388]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    4.637714] swapper pgtable: 4k pages, 48-bit VAs, pgdp=0000000082b7a000
> [    4.644437] [ffff8000801ac000] pgd=0000000000000000, p4d=1000002080020403, pud=1000002080021403, pmd=1000002080022403, pte=0000000000000000
> [    4.657016] Internal error: Oops: 0000000096000007 [#1]  SMP
> [    4.662693] Modules linked in:
> [    4.665756] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.16.0-rc3+ #30 PREEMPT
> [    4.673615] Hardware name: random LS1028A board
> [    4.679116] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    4.686103] pc : dspi_8on32_host_to_dev+0x8/0x24
> [    4.690742] lr : dspi_fifo_write+0x178/0x1cc
> [    4.695025] sp : ffff800080003eb0
> [    4.698346] x29: ffff800080003ec0 x28: ffffc25414698b00 x27: ffffc2541464c170
> [    4.705512] x26: 0000000000000001 x25: ffffc25414b06000 x24: 0000000111705fd3
> [    4.712677] x23: ffffc25414257bae x22: ffff8000801ab5e8 x21: 00000000fffffd98
> [    4.719842] x20: 0000000000000000 x19: ffff00200039a480 x18: 0000000000000006
> [    4.727007] x17: ffff3dcc6b076000 x16: ffff800080000000 x15: 0000000078b30c40
> [    4.734171] x14: 0000000000000000 x13: 0000000000000048 x12: 0000000000000128
> [    4.741335] x11: 0000000000000001 x10: 0000000000000000 x9 : 0000000100010001
> [    4.748500] x8 : ffff8000801ac000 x7 : 0000000000000000 x6 : 0000000000000000
> [    4.755664] x5 : 0000000000000000 x4 : ffffc25411a308d0 x3 : 0000000000000000
> [    4.762828] x2 : 0000000000000000 x1 : ffff800080003eb4 x0 : ffff00200039a480
> [    4.769992] Call trace:
> [    4.772441]  dspi_8on32_host_to_dev+0x8/0x24 (P)
> [    4.777074]  dspi_interrupt+0x6c/0xf0
> [    4.780747]  __handle_irq_event_percpu+0x8c/0x160
> [    4.785470]  handle_irq_event+0x48/0xa0
> [    4.789319]  handle_fasteoi_irq+0xf4/0x208
> [    4.793428]  generic_handle_domain_irq+0x40/0x64
> [    4.798060]  gic_handle_irq+0x4c/0x110
> [    4.801820]  call_on_irq_stack+0x24/0x30
> [    4.805757]  el1_interrupt+0x74/0xc0
> [    4.809346]  el1h_64_irq_handler+0x18/0x24
> [    4.813457]  el1h_64_irq+0x6c/0x70
> [    4.816867]  arch_local_irq_enable+0x8/0xc (P)
> [    4.821330]  cpuidle_enter+0x38/0x50
> [    4.824914]  do_idle+0x1c4/0x250
> [    4.828152]  cpu_startup_entry+0x34/0x38
> [    4.832087]  kernel_init+0x0/0x1a0
> [    4.835500]  start_kernel+0x2ec/0x398
> [    4.839175]  __primary_switched+0x88/0x90
> [    4.843200] Code: f9003008 d65f03c0 d503245f f9402c08 (b9400108)
> [    4.849313] ---[ end trace 0000000000000000 ]---
> [    4.853943] Kernel panic - not syncing: Oops: Fatal exception in interrupt
> [    4.860840] SMP: stopping secondary CPUs
> [    4.864788] Kernel Offset: 0x425391a00000 from 0xffff800080000000
> [    4.870900] PHYS_OFFSET: 0xfff1000080000000
> [    4.875093] CPU features: 0x1000,000804b0,02000801,0400421b
> [    4.880683] Memory Limit: none
> [    4.883750] ---[ end Kernel panic - not syncing: Oops: Fatal exception in interrupt ]---
> 
> I still intend to do more testing, so please don't send the next version
> just yet. Tracking down this issue took a bit more than I was planning.

We could also revert to the original idea of adding the status int to 
struct fsl_dspi. Much simpler and nothing needs to be changed except 
reading it out in interrupt mode.

