Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4C217BCE
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745797360; cv=none; b=FHOKdalqWVWfLLOqvPQugYKs5PHlzpCY0ADxV8oug0HNT13ziSp9pngI8bnEdVt032XfCaK8u4kfdjHjE24Krgnism5XACa3MF1qWoH5K86yYpb3KjdiOgiFbh1Io0Vw5W8AUfyQlu6buqFt3DhCUn9EJyjFhS25NBa1IEVF1B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745797360; c=relaxed/simple;
	bh=y7YGvbxfyiNsmyzwbd6N3ByyL66XkY8J2RjbfDSZwjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Autk/VTK7QyBz97TfDdodjylZ0ohLkJ/TYkLu2JzS7M/TWUltNX7YrNoo3PYckYs0YUYPcXRR2aJfUKsG4I7aggbP7dJl7XrizErT0YB6oWFDQ4kImNz1UBz/fvtCLxdzQYNTtG1gIfmz6ZOr86L95SSwf9VdMciNhCuHpxdLWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97765C4CEE3;
	Sun, 27 Apr 2025 23:42:38 +0000 (UTC)
Message-ID: <8c474cf7-87ba-424b-a7da-dab917d0a305@linux-m68k.org>
Date: Mon, 28 Apr 2025 09:42:36 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] m68k/kernel: replace strncpy() with strscpy()
To: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>, geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Homammad,

On 4/4/25 04:11, Mohammad Mahdi Anbaraki wrote:
> Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
> copying to commandp. strscpy() makes sure the string is properly null-
> terminated and gives a more useful return value so it's just a safer
> choice overall.
> 
> Link: https://github.com/KSPP/linux/issues/90
> Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>

Thanks. Seeing as this only affects nommu/coldfire I will apply this
to the m68knommu git tree, for-next branch.

Regards
Greg


> ---
> Changes in v2:
> - s/m64/m68
> 
>   arch/m68k/kernel/uboot.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
> index 5e52ea150..fa7c279ea 100644
> --- a/arch/m68k/kernel/uboot.c
> +++ b/arch/m68k/kernel/uboot.c
> @@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *commandp, int size)
>   	uboot_cmd_end = sp[5];
>   
>   	if (uboot_cmd_start && uboot_cmd_end)
> -		strncpy(commandp, (const char *)uboot_cmd_start, size);
> +		strscpy(commandp, (const char *)uboot_cmd_start, size);
>   
>   #if defined(CONFIG_BLK_DEV_INITRD)
>   	uboot_initrd_start = sp[2];

