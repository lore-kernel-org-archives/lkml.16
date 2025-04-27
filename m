Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F4F2746A
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745797967; cv=none; b=Ty0jjR3B3sD1R5MO4aam9ZGcXXJ2QofjHz+QV2+tqNfAJxy/Fly/IudI8jMrUiWyQbq1z+yGtNkH0WNohwyGjz/mRndjABIS6W8lesBVI7GZDouSJAivpkJzgXg7bO6YhrNmY7Yp17y53xb1Q5qlbWLwS3iZ3Xm1CqXU8jtg9Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745797967; c=relaxed/simple;
	bh=Blf2oY+040PZ8xuTRe4ED2+TJCxrPdGmdNIzr1Xdpec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZvsKSFRBpuwCjCtNgb0h0u9Ea5EzGMUUNMdvI1gSQRaZLK2SW4/CwVfY51xZBF6kDhgrNoby0z2hby7nIMjaTH+eO05GD7AY1lwqPfKoB75JFvxW7m3tfdi2IKtwdClTpF6O3icRMyPv4FAx5JHs0qCanH2e9rj22w4v9VMY0kM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F618C4CEE3;
	Sun, 27 Apr 2025 23:52:45 +0000 (UTC)
Message-ID: <8e6f3ad3-393b-4777-a4d0-24a524aad5aa@linux-m68k.org>
Date: Mon, 28 Apr 2025 09:52:43 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] m68k: Replace memcpy() + manual NUL-termination with
 strscpy()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
References: <20250415072433.75505-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: Greg Ungerer <gerg@linux-m68k.org>
In-Reply-To: <20250415072433.75505-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Thorsten,

On 15/4/25 17:24, Thorsten Blum wrote:
> Use strscpy() to safely copy the command-line string instead of memcpy()
> followed by a manual NUL-termination.
> 
> The source string is also NUL-terminated and meets the __must_be_cstr()
> requirement of strscpy().
> 
> No functional changes intended.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Thanks, applied to m68knommu git tree, for-next branch.

Regards
Greg


> ---
>   arch/m68k/kernel/setup_no.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/m68k/kernel/setup_no.c b/arch/m68k/kernel/setup_no.c
> index f9872098f5ca..f724875b15cc 100644
> --- a/arch/m68k/kernel/setup_no.c
> +++ b/arch/m68k/kernel/setup_no.c
> @@ -145,8 +145,7 @@ void __init setup_arch(char **cmdline_p)
>   
>   	/* Keep a copy of command line */
>   	*cmdline_p = &command_line[0];
> -	memcpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
> -	boot_command_line[COMMAND_LINE_SIZE-1] = 0;
> +	strscpy(boot_command_line, command_line, COMMAND_LINE_SIZE);
>   
>   	/*
>   	 * Give all the memory to the bootmap allocator, tell it to put the

