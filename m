Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A88155C97
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 19:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750619344; cv=none; b=hRlOEMduLtE6PGBy6CpDD0QpxHpL3VuWoAH43cdAiTGZ4xqRrLPMsNUNwIvOqmjdMcUPgjwy+sUy86ZlvEjeBfls/uXpyl/hMqFHFy0E5rA2w5RLorI/y8VDucIjHJjYPFJTLgeN58PvlqXnbxpbGfHE97UuCljsAg7upkbA4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750619344; c=relaxed/simple;
	bh=5uq9U95xetAEdfYaxJoX7pftJ4HxoJ8sSXX494DjvuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D8FUZgZ/Cx/jvJ/F0jtteHVfiC+Kw+cK6rHIM/sKLANwR43kERlOgyim+iHvv2FGxuZe5mdB43gQOiySRHbeL28VZDrRak11KAOPWQRz7l/Y1Wft4nEh6JCAmh6omIfnJMcxV9s0iqFKhEdJjaR1Io6NH8gd8SQ0h7NhXkIO2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AOZWAFw2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AOZWAFw2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 605A9C4CEE3;
	Sun, 22 Jun 2025 19:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750619344;
	bh=5uq9U95xetAEdfYaxJoX7pftJ4HxoJ8sSXX494DjvuQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AOZWAFw2G6nw//KwBElILCC717XC2H1Zc5M2VkGzloauCOeuG/qWoqmUHzk6JTe7d
	 8vo2mpdIio5AF5Cq7zj8dXbfWVk6ThhiYO6VW9gYHFSxHrm1PcGqnGK55cWY250rXc
	 dJVEJwqgZacqgvBqeQfyOLapn0Oegd9htjezBFXg9/+T2Fn4RjWzJ1p2OlNxeEO9Hd
	 vAEOkWO8dpURmuOP60VT3+n2Cdbi9AqFaQivz8+60H2UyBGTIrj64YpsdErqY6gTXV
	 eptmOApQzuLOg/nrRL6uWDArZ73lSilwMgZ+s0WWy9rEvfJkNH59C4LFp+ifMfxTye
	 XPXDPlh6kuK0Q==
From: Pratyush Yadav <pratyush@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Cheng Ming Lin <chengminglin@mxic.com.tw>,  Cheng
 Ming Lin <linchengming884@gmail.com>,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org,
  alvinzhou@mxic.com.tw,  leoyu@mxic.com.tw, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v2 1/3] mtd: spi-nor: macronix: Drop the redundant flash
 info fields
In-Reply-To: <ff485da8-1a02-40a9-9286-94459e52b26c@roeck-us.net>
References: <20250407075400.1113177-1-linchengming884@gmail.com>
	<20250407075400.1113177-2-linchengming884@gmail.com>
	<d98f6eee-d5f7-43b7-bbc8-d6e7e274723a@roeck-us.net>
	<mafs05xh6pf7s.fsf@kernel.org>
	<da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net>
	<a2a0c40e-69d7-4408-add2-88616c92b0ca@roeck-us.net>
	<aa2a4480-9b78-4ed9-8f9d-b18a87eb01e9@linaro.org>
	<ff485da8-1a02-40a9-9286-94459e52b26c@roeck-us.net>
Date: Sun, 22 Jun 2025 21:09:01 +0200
Message-ID: <mafs01prbvbjm.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Hi Guenter,

On Tue, Jun 10 2025, Guenter Roeck wrote:

> On 6/9/25 23:46, Tudor Ambarus wrote:
>> On 6/10/25 1:14 AM, Guenter Roeck wrote:
>>> On 6/8/25 18:13, Guenter Roeck wrote:
>>>> On 6/8/25 05:53, Pratyush Yadav wrote:
>>>>> On Sat, Jun 07 2025, Guenter Roeck wrote:
[...]
>>>>>> With this patch in place, some of my qemu tests no longer recognize the
>>>>>> flash chips (MX25L25635E/F). Do you have a suggestion on how to handle
>>>>>> this other than avoiding Macronix flash chips when working with qemu ?
>>>>>
>>>>> Could you share some logs? Does the flash fail to detect, or does the
>>>>> SFDP-based probing fail? Since this is qemu, it would be even better if
>>>>> you can share a setup/reproduction guide. I have been meaning to set up
>>>>> qemu for SPI NOR testing for some time now, but never got around to
>>>>> figuring it out.
>>>>>
>>>>
>>>> I suspect that the SFDP data for the affected flashes is incorrect in
>>>> qemu.
>>>> Since this is very likely a qemu problem, I'll just configure
>>>> different flash
>>>> chips when running affected tests.
>>>>
[...]
>
> Some debugging shows two problems with qemu: The returned SFPD data for one
> of the flashes is wrong and does not reflect the data qemu is supposed
> to provide, and qemu does not provide SFPD data for all flashes.
>
> I don't know if the bad data is due to a bad Linux driver (unlikely), a bug
> in qemu's SPI emulation code, or a bug in qemu's flash emulation code.
> Unfortunately I don't really have time to track this down further.

I used the command you posted in [0] and tried to reproduce the bug, but
for me the flash probes just fine:

    root@romulus:/sys/bus/spi/devices/spi0.0/spi-nor# cat manufacturer 
    macronix
    root@romulus:/sys/bus/spi/devices/spi0.0/spi-nor# cat jedec_id 
    c22019
    root@romulus:/sys/bus/spi/devices/spi0.0/spi-nor# uname -a
    Linux romulus 6.16.0-rc2-00308-gf7301f856d35-dirty #5 SMP Sat Jun 21 19:29:15 CEST 2025 armv6l GNU/Linux

The rootfs is also mounted on a mtdblock device backed by this flash,
and everything appears to work fine.

Which version of qemu are you using? I can see that SFDP data for
mx25l25635e was added to qemu in commit dc907a667c ("m25p80: Add the
mx25l25635e SFPD table"), which was released in v7.2.0. Older versions
of qemu might run into trouble with this flash if SFDP data is not
available.

FWIW, my qemu version:

    $ qemu-system-arm --version
    QEMU emulator version 10.0.0
    Copyright (c) 2003-2025 Fabrice Bellard and the QEMU Project developers

[0] https://lore.kernel.org/linux-mtd/da58fc81-3c99-4951-85bc-e3c139283b5a@roeck-us.net/

-- 
Regards,
Pratyush Yadav
