Received: from dane.soverin.net (dane.soverin.net [185.233.34.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A6814F70
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.34.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750426405; cv=none; b=cTgQD9JS1gD6lR7Ux0Bf9x0jP9whzga+Y8j5twNoNfNXz705wPE5eRCFEMswlC/KcuklGSIEpKk6wAgYwDo0pZSKcXmwvf3aO2mXZGRoVHea02FnqckZxFssRIda5ZnN0kYUzIJOfrmTeFF5oUDyMyw2I86NlmRokLiGaEiRqr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750426405; c=relaxed/simple;
	bh=FPGphQYx6b7qeQBw6b6Z8fGijToU16xeu1elpiFKgso=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgL22SnFtc4T4v4E6aTpYM8GI9UysZnJQmNd72BOLQ0VwJMbNniq3k7kttZKir/OrE7x5mO+/JzAGO7k0s1snZOhrnCKGJUBOwT2JUNV0NY8cIdFWP772XfzdAcRzIGerqlAOaqBoNN8KPMDLAU1fuqB/fubLCpg8263mYeHlZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl; spf=pass smtp.mailfrom=jjverkuil.nl; dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b=iL54NTVE; arc=none smtp.client-ip=185.233.34.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jjverkuil.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.b="iL54NTVE"
Received: from smtp.freedom.nl (unknown [10.10.4.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by dane.soverin.net (Postfix) with ESMTPS id 4bNz1y5fMHz191B;
	Fri, 20 Jun 2025 13:33:10 +0000 (UTC)
Received: from smtp.freedom.nl (smtp.freedom.nl [10.10.4.107]) by freedom.nl (Postfix) with ESMTPSA id 4bNz1y0mXpz4c;
	Fri, 20 Jun 2025 13:33:10 +0000 (UTC)
Authentication-Results: smtp.freedom.nl;
	dkim=pass (2048-bit key; unprotected) header.d=jjverkuil.nl header.i=@jjverkuil.nl header.a=rsa-sha256 header.s=soverin1 header.b=iL54NTVE;
	dkim-atps=neutral
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jjverkuil.nl;
	s=soverin1; t=1750426390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sOom6N1XQVz40Jn1AkaDqwt+Ls9VfdwS4vkarVSIrNg=;
	b=iL54NTVEPuQJ7FxIUfmQqJMXDXyqrpVuK7uzySLzB0sQd4ERMTWUJgc2Bro/+adRucIkDy
	XEWi1Qa9QupOwg8UsuWzT56no+8/CJ6pYJgV5ljujha8KROHzh6wrVRHp1sU9kqtkxfC/a
	iDNgkAXNZLzNy0uSxmJ0o7Wxjxpyw4OiyHomo/nMVg9E5UO8Nxpz32JqSwFTv1lXXU3UKd
	NeiTkobhgPsrlToGKToBkcsmaU0ipfmYu7yUfH+YWU8rsTzFibXGX0rOYnz9xv/8at1gKK
	OI9VgBGX9+8ak/nFLosLM+WEbclFd2Z28Scw1bdTZP7NzRjRdz8LuD4WjZtlVw==
X-CM-Analysis: v=2.4 cv=d/oPyQjE c=1 sm=1 tr=0 ts=68556316 a=lpDW1mawwhc5Xzrow+Hbkg==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=Ltpjkhsd4fKLfEjNPkIA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfIgg2jk/FZdpSuIJd6A4NNeUdG6KJXv47nnAdDXmxIPKdb9Dtl/wybtE4Nr/Df0MILKxr+x8lADA+t3BhgxtyiuOf8EueXMCPR4AOvz2Mcs5tzIK8rv6 8Oju4HvYp8WenC4cR8JmCTMqxb7yRiQ09+G5DHl0AroIhUxXoAuZ4O3s112DquitV5E/xVcEgSMEs3rGkbHTqajcJHEtfPzopTNHTweynfNS9dpvt9YUdvk4 KL3V2Cukc/Yzk+pyDbzl3Mcr/zlNxrB8WaDA/FFLBPTTklaA9DGbVbe9P3OJtPUSNlRY0vFCzgLfFTkZrWC+HcRn9R7Yw0TDUN0qrmev/hcacGT6/YU8Zlla vdi0UDDxN7JwC9iWV7AoDU2wXiuCeQBxy0OSZ+xQpHqxE2C7qSrKeeoC+opJcO3aNC2rH3IN
Message-ID: <dc177375-5e28-40da-bab1-d0627c70bd85@jjverkuil.nl>
Date: Fri, 20 Jun 2025 15:33:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] media: av7110: Workaround a compiler warning
To: Stefan Herdler <herdler@nurfuerspam.de>, lkp@intel.com
Cc: hverkuil@xs4all.nl, linux-kernel@vger.kernel.org,
 oe-kbuild-all@lists.linux.dev
References: <202504262127.FkkWHzfs-lkp@intel.com>
 <20250426215409.36852-1-herdler@nurfuerspam.de>
Content-Language: en-US, nl
From: Hans Verkuil <hans@jjverkuil.nl>
Autocrypt: addr=hans@jjverkuil.nl; keydata=
 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
In-Reply-To: <20250426215409.36852-1-herdler@nurfuerspam.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spampanel-Class: ham

Hi Stefan,

On 26/04/2025 23:54, Stefan Herdler wrote:
> Avoid compiler warning caused by an empty block statement.
> 
> Signed-off-by: Stefan Herdler <herdler@nurfuerspam.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202504262127.FkkWHzfs-lkp@intel.com/
> ---
> 
> I could not reproduce this warning with gcc10 here, but I already had similar
> warnings with gcc12 on other projects.
> I think it has most probably been triggered by the empty block statement.
> 
> I'm pretty confident this patch will fix the warning, but not 100% sure.
> 
> The kernel test robot will pick this patch and test is anyway, if I'm correct.
> Let's wait, if it complains again.
> That's the best I can do right now.

Is this patch still needed? I noticed that it wasn't CC-ed to the linux-media
mailinglist, so it never appeared in patchwork, and was never picked up.

If it is still needed, then please post it to linux-media and it will be
picked up for v6.17.

Regards,

	Hans

> 
> Regards
> Stefan
> 
> 
>  drivers/staging/media/av7110/av7110.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
> index bc9a2a40a..962536ed7 100644
> --- a/drivers/staging/media/av7110/av7110.c
> +++ b/drivers/staging/media/av7110/av7110.c
> @@ -159,7 +159,7 @@ static void init_av7110_av(struct av7110 *av7110)
>  		 * some special handling for the Siemens DVB-C cards...
>  		 */
>  	} else if (av7110_init_analog_module(av7110) == 0) {
> -		/* done. */
> +		goto init_skip_analog_module;
>  	} else if (dev->pci->subsystem_vendor == 0x110a) {
>  		pr_info("DVB-C w/o analog module @ card %d detected\n", av7110->dvb_adapter.num);
>  		av7110->adac_type = DVB_ADAC_NONE;
> @@ -168,6 +168,7 @@ static void init_av7110_av(struct av7110 *av7110)
>  		pr_info("adac type set to %d @ card %d\n", av7110->adac_type, av7110->dvb_adapter.num);
>  	}
>  
> +init_skip_analog_module:
>  	if (av7110->adac_type == DVB_ADAC_NONE || av7110->adac_type == DVB_ADAC_MSP34x0) {
>  		// switch DVB SCART on
>  		ret = av7110_fw_cmd(av7110, COMTYPE_AUDIODAC, MainSwitch, 1, 0);

