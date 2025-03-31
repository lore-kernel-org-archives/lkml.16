Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC7721CC5D
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464995; cv=none; b=nFLnBjISbY7GAihC9BeY/i9zrGqRI5h0yh/HHdLuQvO3gFFwBlhD1q8DH4cGO9aBlDB0RvCJBPspgQHw27QHQJqTWrDLElASgN/egsySk0SEBru8bBDC6W2Vpu6dix9zIhVv+HggU0wQM+rX/vhme/ojNb6YjPIn0ebH9QsT2Ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464995; c=relaxed/simple;
	bh=7rGt8Eh//HNg+rLIWTgIIJ61fMIPanZaEXUjLulXGOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dnSwJNbadXx46qwPK//1W9yHD2HDLmyHOztXngPk2q6DQRygSTrWaf5Bu/UH9X7Eu03K7ShO6Kfxf1prBQ7WNpEHsCmQuYvl/cm6+gR0JCE9rmymiTP6XV9qgheiKLKtJ4+a5EdpaUXKNNb/5lwqV92F7n5bkrFu3GZMuE+Tf2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=0YR03sSk; arc=none smtp.client-ip=209.85.166.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="0YR03sSk"
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so5693315ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743464992; x=1744069792; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDbOavufpFo26W+Zku5x0VpH9Cvbcrt9SziwHnr6lV4=;
        b=0YR03sSkhC7ZV6uj0OQpsi5OGYKi8GCh/zkPS0dP+pQqb7xreCPbs9rcHoX8GEcRwK
         cYp50Bs8SFAmDXF0vVJog6GYzg9qpLFRQ6ugM8t/HDHAyWoJ0AiCSz30PyQyx9dsUJTm
         vCHmLr7q3yivaJ0OM/NznakN8M0l6Z0bO+iW1AnmY/JsgCkk1ppuAvKVOluRjZog8odX
         Aizoc8uhvXRNPLsqFwHazOxgglvqz/SZX30tF4y6MXW67mhfKwB3nrzbvmTmrwFU5Eni
         Ftqc31vg98lWBKST1EeGre4ymlhIruZ1N0RkpMsA3WYzoFZOAGT3hi1zIRL04jVgJpkj
         zYjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464992; x=1744069792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDbOavufpFo26W+Zku5x0VpH9Cvbcrt9SziwHnr6lV4=;
        b=TU/Ly+cvTMMmrbo9N2b1n+7Rzfz20ZNFTMWk8v+omdXk+snajaTOfzIPn919A+mr4C
         bdlk1253lnD+QNndorM+2fZdTDPwdcavgJ5zU2jmDrkqYQQTYMcRNf+yROZ0ePwU0oaa
         Cv1r2cAlfrpmAv6O8V2lvvJtbkeHNu9ovPOJ/hf1gjfjT8M9/vOn6B4WZLF3R2aQUn4a
         uFhvAKRGf9iuC3nzmWDq9i3W6ZO5UeyNUXRUjifzZhnXWFCrhl+F8kA7j7ut49YbHjP2
         m3D1vEEdkEulQZH9PDkBLPZmHvlW4OBZ38FqnEKoipkamPBgbciOuorEtDnvhubV7DLb
         5A3Q==
X-Forwarded-Encrypted: i=1; AJvYcCUI0kAhkQA4OuGkmdXFmhxnU/7Xj+XDHI9WLuH4qHOTYD3bCIGGCLa6uTal3wxSxpeMgm0BAHtp4baCfvY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzW5KfBiiWm4eAycSwnm1+6v4gYPJRD1YyjNjXKSTtHmivmpEz8
	OBUzXQtaAS8VQj9lm/QcEWMv6tt04pZenql/6LZatwkYnuSjE7nDx2V4FKCYySE=
X-Gm-Gg: ASbGncs7vbjTN7MtCNPm4+M22QN+iUnw3kN9cVFapXGHd17DtN5CtBkQGDULECgszI2
	iYKHqSfoKzsVkH9Gd5h4+wk5DlW1EtrYE4iI0Oy8uS/lXbnjqjZ5jzXEAXWJBri9i+KfTalK+io
	ssNljc5br8esvc9NNQe67tzSJGSHMhu6BPZQhAdv9tTe/N1++pxRyps9Ahlp7DtzQ1siOK0XlFb
	LJXMDt7x6cg9MQmet5t3rpanN0kRT6zOYWGXhYMoT4wsOjBO1qLDtI1bKDex5tAFFyyzh03c0Mn
	9F+Hve5AP9g+ZIyksxmnXdjujohgHoPdtBh86KhwJO3akMr1G1LsMOnhVCc/kdOlnqHhbeR99Vt
	bTzMfBNjz
X-Google-Smtp-Source: AGHT+IGS7o7rVQuhHRDL3VF0MNhBcsgv7O47l22zBrXWo8Fko9huCk4BOt5GOeICjubR5V7NnIFH4A==
X-Received: by 2002:a05:6e02:3387:b0:3d0:443d:a5c3 with SMTP id e9e14a558f8ab-3d5e08f0fd1mr125285725ab.3.1743464992484;
        Mon, 31 Mar 2025 16:49:52 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464871f77sm2140194173.77.2025.03.31.16.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 16:49:52 -0700 (PDT)
Message-ID: <d683962c-e8b7-4adc-9902-483976197637@riscstar.com>
Date: Mon, 31 Mar 2025 18:49:50 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Multiple cleanups and refactors
To: gpittala <ganeshkpittala@gmail.com>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Cc: hvaibhav.linux@gmail.com, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
 rmfrfs@gmail.com, pure.logic@nexus-software.ie,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 4:33 PM, gpittala wrote:
> This patch includes multiple meaningful cleanups for the Greybus staging driver:
> 
> 1. firmware.c: Replaced deprecated 'strncpy()' with 'strscpy()'

This is a good type of change to make.

> 2. sysfs show functions: Replaced 'sprintf()' with 'sysfs_emit()'

This is also an improvement.

> 3. loopback.c: Refactored a large function (gp_loopback_fn) to improve readability

I have only glanced at this, but refactoring something can
sometimes be clearer if you do it in several small patches.

> 4. audio_gb.c: Split logic in get_topology() into separate calls as per TODO

I'll comment more below, but you should almost always have
only one change per patch.  So each of the four items listed
above deserves its own patch.  You could send them separately
(because they're unrelated), or as a series of cleanups.

Note that "one change per patch" is a logical (not literal)
statement.  For example, you could do a single patch that
replaces *all* calls to strncpy() with strcspy().

> All changes are tested and pass checkpatch.pl
> 
> Signed-off-by: gpittala <ganeshkpittala@gmail.com>
> ---
>   .../greybus/Documentation/firmware/firmware.c |  32 ++--
>   drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
>   drivers/staging/greybus/arche-platform.c      |  11 +-
>   drivers/staging/greybus/audio_gb.c            |  37 +++-
>   .../staging/greybus/audio_manager_module.c    |  13 +-
>   drivers/staging/greybus/gbphy.c               |   3 +-
>   drivers/staging/greybus/light.c               |   5 +-
>   drivers/staging/greybus/loopback.c            | 170 ++++++++++--------
>   8 files changed, 159 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..8e375c88c881 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -47,12 +47,12 @@ static int update_intf_firmware(int fd)
>   	ret = ioctl(fd, FW_MGMT_IOC_GET_INTF_FW, &intf_fw_info);
>   	if (ret < 0) {
>   		printf("Failed to get interface firmware version: %s (%d)\n",
> -			fwdev, ret);
> +		       fwdev, ret);

The two changes in this hunk are not mentioned in the
description above.  Please remove these changes.  If
you want to do reformatting like this, do it in a
separate patch.

While it might be reasonable to include a little white
space change like this occasionally, you should avoid
doing it.  It is unrelated, and complicates your patch
unnecessarily.

This comment applies to several other changes you've
made below.  It also applies to removal (or addition) of
blank lines, or really, any other white space changes.

					-Alex

>   		return -1;
>   	}
>   
>   	printf("Interface Firmware tag (%s), major (%d), minor (%d)\n",
> -		intf_fw_info.firmware_tag, intf_fw_info.major,
> +	       intf_fw_info.firmware_tag, intf_fw_info.major,
>   		intf_fw_info.minor);
>   
>   	/* Try Interface Firmware load over Unipro */
. . .
