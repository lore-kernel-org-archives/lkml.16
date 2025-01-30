Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2921E9B2C;
	Thu, 30 Jan 2025 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738248419; cv=none; b=kcWHZ7MipK4YiNwTf6GFB5ws3+/V+pePiO/VexrQ8DL7Gi4IqJlbdLzJmQEzbpmW9d3XYizSF+go/lSibnfAhWKy5Q4iQzhvSfhwahpRTZTks1A4wQ5ZHUcYQ810lRO4PiZAgsQeXxHFxb2rPnS0SHvA2M1WGnYsL+QPLvzM33s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738248419; c=relaxed/simple;
	bh=QabU8vJZ42C6MmWCpLg20aHi5qYxFGWvQNkgWHte9Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NuSyvPU7/yf5Xkw3UXgCEGgk/c/0XLQ/9CLd1UonEE9exRIyfx+gI0lS7JbzQO28mhRAqqorhYqOI3ZePPLNmk1AqUW/U1mA2Bzvq71VfbP++HDOPVsbibneNYl0X5Vgx3tufTyakaWpj6ghTBaIKzCajeZ+GwXq+ppX6UlB0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WQYVwSEa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WQYVwSEa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2164b1f05caso16062325ad.3;
        Thu, 30 Jan 2025 06:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738248417; x=1738853217; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XLrZxTNnYFjF9He7mjhRdfsyiyO7rlerLD3PmO8XEew=;
        b=WQYVwSEa78lKbz9Oz6kz6UrpNkaeOI7JQ4gUZRl1i8+0oeBHWhZ0kstzpU+wjZWpoU
         OWqUpj4knDXpjwD9dSk+r+AZmn4U5GLaMR9CcEUZq/fVWTBeOzDk964OHioFAj4PX6r3
         MJGaIG0qnw0xJmU2gRTMoDlNF+viYfYqYbYqHYCjrpaCzPClG9kH1kjXMqHDds/QseUx
         kI72vSc+njypDnTMaL9wAPNmFrGDnsWcZpZ+fWEv8IzWecHpO0qVRI5UIGqOwU9K8wYi
         orl4c2dCdjlR1mlD3J2KH5Xtnpa1Hg87IT4gAkcVuoQcQCxl/4+UHJz5hsuro8IBVtxf
         L2eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248417; x=1738853217;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLrZxTNnYFjF9He7mjhRdfsyiyO7rlerLD3PmO8XEew=;
        b=uDjOVMs2SqBTenB//6VNvuJzI3HHhZnnJhgPLwu9krusEecqdCrEUPn6f2oI6W6ObY
         q5LrTRem8gTIBTFz8NQTBRB5HIlNoF9YVoNFu42jP0edifsefxBhpU0GnUmpPPoxOV6d
         DHhnB/wDGQ6TgySzcPoThUwZX9BFYGnzG56fkV/rxtHLN9p4uzBVc8u3R6MI98Pujdy9
         BpLrzCxVzagpHHICG9u7jnptB9MmJJwbJ5ivBMG+bqbJ5DA7kzGSFO9A4EHIWwa/BfZi
         doZBuXjzfU8kS/9Tl29u0oKbtCS75wVe09Vh0qgYYbeb8bATa3DqD0z5321pS6qidIfS
         8VyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXksDUWKem1LCMCBzllBkLRBPzIUgIViIcrZLIIkKOLtsNOe5u3Sl0pT7nzBVXO3saOccjIztOkUC/EMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvlEjZtRivJ475fsPDkk6PKKg+wP70h3jldsu8/+jhrZbpc6Ce
	KAy1r8jTxZTRFRtU36oiJ6WJfdge3O2GV/oXt6twC+Xq4XfKOQ79ADvGWw==
X-Gm-Gg: ASbGnctdw/p5B/JtNbyCjWnMDaog8cWpuSoTYzuYit+3/vUrha43yhbhyBQCuVzEeoF
	2NTMNWR+jQ9aP8ht5p5EBvARYpTxQVDrSEs7+HQnteyypxzA3PkeMsIsoa4iyTZbZ+2hv3JE6ws
	SiJM7bsdK5Ul4OATBADWKs+Qz1Ldtbr8jmZMRJGEKZ90W1ol4HqY4si/7VsiCUG14ahN9dpFKbd
	qDgf1dW01z46iZFjvxiopB5x4JGoMz5NJqi0XkLz2/KVFK4/h4AV68wh8CO4EZYeTNxfEcX5uHK
	NiDLDQLtYAPdXITr/GqDOBcrQuzwUi3qdqrmwi8xwZPVGQ1tj2nD/D+9nLKuUToS
X-Google-Smtp-Source: AGHT+IFgaL0bukm+AJ2YNjZZgyKKc/dSujZQjnseFHVYCyB2oLFXhBO+4KSCQLsxGnO4EpjrSXNFLQ==
X-Received: by 2002:a17:902:d549:b0:215:a7e4:8475 with SMTP id d9443c01a7336-21dd7d64c6bmr128756725ad.24.1738248417012;
        Thu, 30 Jan 2025 06:46:57 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f704esm14855925ad.85.2025.01.30.06.46.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 06:46:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <89e646a2-9377-4544-91e6-cfc55bbbf783@roeck-us.net>
Date: Thu, 30 Jan 2025 06:46:54 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: Use 64-bit arithmetic instead of 32-bit
To: =?UTF-8?B?0JLQsNGC0L7RgNC+0L/QuNC9INCQ0L3QtNGA0LXQuQ==?=
 <a.vatoropin@crpt.ru>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
References: <20250130070324.20403-1-a.vatoropin@crpt.ru>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250130070324.20403-1-a.vatoropin@crpt.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/29/25 23:03, Ваторопин Андрей wrote:
> From: Andrey Vatoropin <a.vatoropin@crpt.ru>
> 
> Add suffix ULL to constant 500 in order to give the compiler complete
> information about the proper arithmetic to use. Notice that this
> constant is used in a context that expects an expression of type
> u64 (64 bits, unsigned).
> 
> The expression PCC_NUM_RETRIES * cppc_ss->latency, which at
> preprocessing time translates to cppc_ss->latency; is currently
> being evaluated using 32-bit arithmetic.
> 
> This is similar to commit b52f45110502 ("ACPI / CPPC: Use 64-bit
> arithmetic instead of 32-bit")
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 

First, this does not affect the entire hardware monitoring subsystem,
just a single driver. The subject is misleading.

Second, the result of the calculation is used as parameter of a function
which takes unsigned int as parameter, and calculates jiffies from it.
If the number of jiffies to be calculated ever exceeds 4,294,967,295
microseconds, the code has severe other problems to be concerned about.

In other words, your patch does not fix anything, and neither does the
referenced commit. It just helps hiding a (hopefully non-existing) different
problem.

Yes, commit b52f45110502 "fixes" a similar "problem", and also completely
misses the point, since the 64-bit result of the calculation is also used
as parameter to usecs_to_jiffies(). The same applies to commit 8338b74a750c5
and maybe others.

I am not going to apply this patch.

Guenter

> Signed-off-by: Andrey Vatoropin <a.vatoropin@crpt.ru>
> ---
>   drivers/hwmon/xgene-hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
> index 1e3bd129a922..43a08ddb964b 100644
> --- a/drivers/hwmon/xgene-hwmon.c
> +++ b/drivers/hwmon/xgene-hwmon.c
> @@ -61,7 +61,7 @@
>    * Arbitrary retries in case the remote processor is slow to respond
>    * to PCC commands
>    */
> -#define PCC_NUM_RETRIES			500
> +#define PCC_NUM_RETRIES			500ULL
>   
>   #define ASYNC_MSG_FIFO_SIZE		16
>   #define MBOX_OP_TIMEOUTMS		1000

