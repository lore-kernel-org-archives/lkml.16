Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453D73232
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 23:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743463883; cv=none; b=kNiVqOfyxLMBtwbUHUH2WVx7TckwlUSmILh9MR1C+l/VddQ97aWGuf4sUA0i5VHjvv5ETKsfP+qrV5ZpGE28SrJxuj60qzs2Abk9G5TsNQ9vP9IYe/hslNbGQMxjagplUPTDHCBlRT3GRWcZI/pvxBehdV2+nHkvnO8Un0AZvH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743463883; c=relaxed/simple;
	bh=sUwfTHOCw9ZhqXto7fQMfJGGtRziqbuwKy80hrXngmQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qmRvZf4tNEHzOrYSXEQGPpQT1lSeyGpPhj25xY1qPP7ThPl41pqYqbgnI6YRvfC3CJqjzOBj3dzQk48EgYckP94YtzH1oFTx3ChZSOz9OrmJPCtJld+KB73oFQhDFlGgTnznimz35Snp+IGAKobQLS669+1yMDmZ5B6Isemgi2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=HeGZWZBR; arc=none smtp.client-ip=209.85.210.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="HeGZWZBR"
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72bd5f25ea6so1189441a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 16:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1743463880; x=1744068680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJ+toMwTx18/8SXmfnJl/GpEKdrIgAfy+X1oEZCBOJg=;
        b=HeGZWZBRCcz4fyjMzFUCPzICCRT3nVRgQczfjGB0NbtRehea9zLJKebhts3Y9rkjxx
         IMiJEVIsu+mFGmdgBCHG1o++T1TB8F7VNsY5BSKDvLgtvRmiYWdKGWuP4MGceknDsaID
         G376R/GsUaJhyIRtN3+atoO/aXi5PcJt4tst4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743463880; x=1744068680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJ+toMwTx18/8SXmfnJl/GpEKdrIgAfy+X1oEZCBOJg=;
        b=AKeloZ7lXOhXvo8tQ7lY7BJLKe/4BCCTmeetOU6BXNykRkAX92sd2132Xz159RKcwm
         2ZxGzM95bJ1d83pM5nXYSmPhVm47bmOY4GEfKX3qgFN2jZkBnUJzqgch1Og5zd8V2rPV
         w9nTraVxgeeG75sQFk49BEMZVLJmpXq/f8YFeifjxEMSkjRhpr/viYkljmu3cwCg50Q0
         ufYorkwrRfbM72ahR0HP88Ri24Zqqj/M8QFaGMzqEc+OD+WE8O7PBCoTIi8qKpoZ4zrv
         MO4SLJNE9eCpBQdlNc1u1e4Njtkn7libwOrvRt7EmkifYvlv4Zgv9zQy4Lkhnrb+7vVR
         qj/A==
X-Forwarded-Encrypted: i=1; AJvYcCUW8Ue9CosTHbktKKHFifjp5HN/dJIOj9DbXJCHcuOeQZ/uvmyDG4V86COQCdx6g7OUM10aTHFu0q/Qle0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrN81BbaLOfgUXUq4tH4m3NmGpiZEbzn4DhbpTjxLhzS7/Yr6m
	16RLUSB/qxpdnFLR9GxLSyouGzlb8TockWiZFSEzODk5brB0k34vyLpxFHbKcQ==
X-Gm-Gg: ASbGncs6qXlNdLe8ZfMvy10PmZfGKRomkmZkcDxyI3kEnMLZP4+KuzJLFYxHKooGLMP
	33XtidDsi4oLQ4+gbSQrn5vxJflA9dUdTqr+1cCZDGBjq5oQqBEavQDwCRSJSkPaMqUXO56NzdU
	4g62Hoo10K7Cy1AfciYJQ9xxhxHq+iF8kztZXbniU0WIkhNpTBUVIDuEdaMcKEtlVyeDwY0gVyM
	soljbStuT0gAYGHk0zIDVpKNWLWQbFkl6C0SpY/KvWaMtiTz3QOiic8MeJcs+xA3HYE7uFboa8N
	Ye1G4VFaroFskni3VKG0fThGoYgj91sJQ8wygMKc3Mdt3enFM3m+wrg8hqzFBa9FUC7yuEfkrl1
	8d5E=
X-Google-Smtp-Source: AGHT+IEwmB2bcjMGzxlQpjRzg7wCA5OuVgfgfv5l11OQr+T9wVt6H6VgPvMbOoFq7GQ9enxJDZiAfA==
X-Received: by 2002:a05:6830:699b:b0:72c:320b:f76b with SMTP id 46e09a7af769-72c6376d027mr6148642a34.1.1743463880158;
        Mon, 31 Mar 2025 16:31:20 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-72c580cd6c5sm1662891a34.32.2025.03.31.16.31.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 16:31:18 -0700 (PDT)
Message-ID: <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
Date: Mon, 31 Mar 2025 18:31:15 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination
 checks
To: Thorsten Blum <thorsten.blum@linux.dev>, Viresh Kumar
 <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250331183935.1880097-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 1:39 PM, Thorsten Blum wrote:
> Commit 18f44de63f88 ("staging: greybus: change strncpy() to
> strscpy_pad()") didn't remove the now unnecessary NUL-termination
> checks. Unlike strncpy(), strscpy_pad() guarantees that the destination
> buffer is NUL-terminated, making the checks obsolete. Remove them.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

This looks good!  Although the NUL-termination check isn't
needed, it isn't safe to ignore the return value of strscpy_pad().
More below.

In all cases, it looks like strscpy_pad() (and not just strscpy())
is the correct thing to call, because the pad bytes are passed
either to user space, or supplied as part of a Greybus request
message.

> ---
>   drivers/staging/greybus/fw-management.c | 39 +------------------------
>   1 file changed, 1 insertion(+), 38 deletions(-)
> 
> diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
> index a47385175582..852c0830261f 100644
> --- a/drivers/staging/greybus/fw-management.c
> +++ b/drivers/staging/greybus/fw-management.c
> @@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>   
>   	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>   
> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error but
> -	 * don't fail.
> -	 */
> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent,
> -			"fw-version: firmware-tag is not NULL terminated\n");
> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
> -	}

Interesting this didn't return an error, while others below did.

The sizes of the arrays passed to strscpy_pad() are not necessarily
the same, so you should check for its return value.
fw_info->firmware_tag is GB_FIRMWARE_U_TAG_MAX_SIZE=10 bytes
response.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE=10 bytes also,
but these could theoretically change independently.

> -
>   	return 0;
>   }
>   
> @@ -154,15 +144,6 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
>   	request.load_method = load_method;
>   	strscpy_pad(request.firmware_tag, tag);
>   

Here the maximum length of the tag is GB_FIRMWARE_U_TAG_MAX_SIZE
bytes, and it may or may not be NUL-terminated.  The size of
request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE.  Again you
can't be sure they're the same, and even if they are, the source
could be truncated.

> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent, "load-and-validate: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> -
>   	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
>   	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
>   	if (ret < 0) {
> @@ -250,15 +231,6 @@ static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
>   
>   	strscpy_pad(request.firmware_tag, fw_info->firmware_tag);
>   

The size of request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE bytes.
The size of fw_info->firmware_tag is GB_FIRMWARE_U_TAG_MAX_SIZE bytes.
Check the return value for -E2BIG.

> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
> -		dev_err(fw_mgmt->parent, "backend-version: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> -
>   	ret = gb_operation_sync(connection,
>   				GB_FW_MGMT_TYPE_BACKEND_FW_VERSION, &request,
>   				sizeof(request), &response, sizeof(response));
> @@ -301,16 +273,7 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
>   	struct gb_fw_mgmt_backend_fw_update_request request;
>   	int ret;
>   
> -	ret = strscpy_pad(request.firmware_tag, tag);
> -
> -	/*
> -	 * The firmware-tag should be NULL terminated, otherwise throw error and
> -	 * fail.
> -	 */
> -	if (ret == -E2BIG) {
> -		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
> -		return -EINVAL;
> -	}
> +	strscpy_pad(request.firmware_tag, tag);

The size of request.firmware_tag is GB_FIRMWARE_TAG_MAX_SIZE bytes.
The maximum size of tag is GB_FIRMWARE_U_TAG_MAX_SIZE bytes, and it
may or may not be NUL-terminated.  So this case should stay as-is,
and check for -E2BIG.

					-Alex

>   	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
>   	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);

