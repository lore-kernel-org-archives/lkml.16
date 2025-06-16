Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 301451BC3F;
	Mon, 16 Jun 2025 14:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750084724; cv=none; b=RNq/L7Lbddb/k734V0TDQQVqkrKMIsBKG1coT4Xctq1JVFrYk6QLM7FU2nigCcwbW2oBemPLNIxS144JBVS/MePYuQKFbkKXPpKgBrnHqLDvvCyB4XdmExRkICnaJ8q62wI/iNKFTBhC06E8YWeZ8aUhVxxGcxUJDQL82NFEu88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750084724; c=relaxed/simple;
	bh=hsXrE98KlqHUSD0dJZdLooZZA2oPjVViexsRp35TUWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoTtFloiMwYdHwwYyyn60mBkSwfKTnWsVSb77VpIt8bTndEnlEuIJ8Y4uiBT1CoZrGTdEb+Fptp09CMjC7mM4xzg68g+Dq1ah/b4Mm+d14J/xVtXN2Ys7QhHXj7JLjsAs/1JMUIeqlbucS5oYCqPArn1HJxpW8RXDc974hd9WHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bcogmPrR; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bcogmPrR"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3141f9ce4d1so459211a91.2;
        Mon, 16 Jun 2025 07:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750084721; x=1750689521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=brw8vLDxjS0ZYgD0tq8LFEfcB6flBc6Ru7WSQFGwR5U=;
        b=bcogmPrRxnevBvWKvadIdlI3TiJnujmWmg59aHagNGgEc3tvSfPucdjqZnnA2L7Rfx
         zQclsdrMZqh0Ddfwyg6BpwzkimcryVz2Ul24mc3IYlUtXUeMku61qsMRKwuMSkDHEWPl
         6KcgZFGqufWoe3v0qIh8WrXD+8ogWWHlTgBsMM5qL7gjoA7YvkK4zaA6PRHSdSaRBjMN
         y42ky6kl+WvpOfhPcP63k0lH5oTzOQo38SpikPdfSYUgAR42uCu3DfuVPPTjPcpZGUZc
         6lsoOi/Cm05GECuvPV5csv1mOGoUFTc5BsNgSx5An5AH4xI523Z16NBBmcWAJy8T6spk
         ZMOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750084721; x=1750689521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brw8vLDxjS0ZYgD0tq8LFEfcB6flBc6Ru7WSQFGwR5U=;
        b=TndcbY261GroFDca0ecY2ZXuw/zSK4jeLEV7OmVk7VWHHLZ8Zq6tag6AFd3Jrh57iC
         IpDsiUG6miluVbLYvdMlPcm8LhoOhhbifdYeAh7hlfia/HmP6hhMGC8ZWYMyeznC3gf1
         Oq1Cfd9ubb9GwpndUxWzE4Xx/yURtWIEdZy4eQaKqRgiJX693A4CnhULr3pQ/Krp0tu4
         0F0wm6/Mka6QJGahv9myU2axiTGfL+82zySE6g/D8tcCpuS4EqdTx4w0zOU+w2FkG1i3
         UhZ3bIwhuVXtfkYH8MhQqrcTq+x1e7ejvsL7x7FVgTa4qjP6fGojV2ud5R2sEPPs38Ur
         xwZg==
X-Forwarded-Encrypted: i=1; AJvYcCVWLnBJAgMAr5Tjhd9gu7hVtfF4iAZDbqT2w3JCQPhH+nq9e6M5HzM6lqkuX32HWlhwkgAFzJLSVuA08JG4NaU=@vger.kernel.org, AJvYcCX86eC+PZMflXVD2bfcNYa4pOX0+qeH/pHWR/8czzBO5BeP6n8YB0gDLYHYDx2lrtY6Hj1040NLoqpcLWAu@vger.kernel.org
X-Gm-Message-State: AOJu0Yws/nqnxsZM6d0RJWeJ0GlnhribZrSSDnnV2DKkjDNVxSPYsE2U
	/N4CKtqgIWRcz/CJN50cOX6wxNB/7JorU40zTtAim6q4o3ql5YgIiwdW
X-Gm-Gg: ASbGncsgkFOXLPX/ML6O18X1PzwY3PfzT13tY/ZqBR+0RZ8DythESFyvw1ADJIOXCwX
	w6GrMYEcoSrN6U0PfMdfvUmFpgtvSQ2fTCTwY2rTigYwO1YY9MwjnG4sebTpLlpcBgCmY3frVLI
	zVIn5gCCSkxS+pdzOjrs+cmj0i2kwRlVIlfkkz8OVyacJciFJA+BUss6iouQpjG3hFMZY+WVk3i
	fUFXy7bCb8LSapDh1/nGlpatMSFC9tsMoQ/IDHqOkyoJJmcmf+qe+P5YIilKk2yAIl/B+Fmbs04
	wOXlSJEKOOUERJ6zdNgmORt0P8tcw1UIwUIaWkYZti1e/yvRRGLbfzX7G6a6cIktjgGAMT2ASVE
	8bNQqDEk1Ebz6mGyPkTuQZsB8xMwSAWu9IzE=
X-Google-Smtp-Source: AGHT+IH4JKx32xcvkawqbTRj7XMT26PqUuLplt7hpDjxv9zsyYg6lGSR/N2mWsGgMJYuazLBYueVMA==
X-Received: by 2002:a17:90b:2f4e:b0:312:e731:5a66 with SMTP id 98e67ed59e1d1-313f1ca786dmr13650711a91.3.1750084721307;
        Mon, 16 Jun 2025 07:38:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c19b84e5sm9817439a91.2.2025.06.16.07.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 07:38:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a749c234-e4e4-4c89-9f26-7f5aa7129c26@roeck-us.net>
Date: Mon, 16 Jun 2025 07:38:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: clean up Makefile after sbrmi driver movement
To: Lukas Bulwahn <lbulwahn@redhat.com>, Akshay Gupta <akshay.gupta@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lukas Bulwahn <lukas.bulwahn@redhat.com>
References: <20250529033933.281845-1-lukas.bulwahn@redhat.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAmgrMyQFCSbODQkACgkQyx8mb86fmYGcWRAA
 oRwrk7V8fULqnGGpBIjp7pvR187Yzx+lhMGUHuM5H56TFEqeVwCMLWB2x1YRolYbY4MEFlQg
 VUFcfeW0OknSr1s6wtrtQm0gdkolM8OcCL9ptTHOg1mmXa4YpW8QJiL0AVtbpE9BroeWGl9v
 2TGILPm9mVp+GmMQgkNeCS7Jonq5f5pDUGumAMguWzMFEg+Imt9wr2YA7aGen7KPSqJeQPpj
 onPKhu7O/KJKkuC50ylxizHzmGx+IUSmOZxN950pZUFvVZH9CwhAAl+NYUtcF5ry/uSYG2U7
 DCvpzqOryJRemKN63qt1bjF6cltsXwxjKOw6CvdjJYA3n6xCWLuJ6yk6CAy1Ukh545NhgBAs
 rGGVkl6TUBi0ixL3EF3RWLa9IMDcHN32r7OBhw6vbul8HqyTFZWY2ksTvlTl+qG3zV6AJuzT
 WdXmbcKN+TdhO5XlxVlbZoCm7ViBj1+PvIFQZCnLAhqSd/DJlhaq8fFXx1dCUPgQDcD+wo65
 qulV/NijfU8bzFfEPgYP/3LP+BSAyFs33y/mdP8kbMxSCjnLEhimQMrSSo/To1Gxp5C97fw5
 3m1CaMILGKCmfI1B8iA8zd8ib7t1Rg0qCwcAnvsM36SkrID32GfFbv873bNskJCHAISK3Xkz
 qo7IYZmjk/IJGbsiGzxUhvicwkgKE9r7a1rOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAmgrMyQFCSbODQkACgkQyx8mb86fmYHlgg/9
 H5JeDmB4jsreE9Bn621wZk7NMzxy9STxiVKSh8Mq4pb+IDu1RU2iLyetCY1TiJlcxnE362kj
 njrfAdqyPteHM+LU59NtEbGwrfcXdQoh4XdMuPA5ADetPLma3YiRa3VsVkLwpnR7ilgwQw6u
 dycEaOxQ7LUXCs0JaGVVP25Z2hMkHBwx6BlW6EZLNgzGI2rswSZ7SKcsBd1IRHVf0miwIFYy
 j/UEfAFNW+tbtKPNn3xZTLs3quQN7GdYLh+J0XxITpBZaFOpwEKV+VS36pSLnNl0T5wm0E/y
 scPJ0OVY7ly5Vm1nnoH4licaU5Y1nSkFR/j2douI5P7Cj687WuNMC6CcFd6j72kRfxklOqXw
 zvy+2NEcXyziiLXp84130yxAKXfluax9sZhhrhKT6VrD45S6N3HxJpXQ/RY/EX35neH2/F7B
 RgSloce2+zWfpELyS1qRkCUTt1tlGV2p+y2BPfXzrHn2vxvbhEn1QpQ6t+85FKN8YEhJEygJ
 F0WaMvQMNrk9UAUziVcUkLU52NS9SXqpVg8vgrO0JKx97IXFPcNh0DWsSj/0Y8HO/RDkGXYn
 FDMj7fZSPKyPQPmEHg+W/KzxSSfdgWIHF2QaQ0b2q1wOSec4Rti52ohmNSY+KNIW/zODhugJ
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250529033933.281845-1-lukas.bulwahn@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/25 20:39, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit e15658676405 ("hwmon/misc: amd-sbi: Move core sbrmi from hwmon to
> misc") removes the config SENSORS_SBRMI, but misses the reference to that
> config in the Makefile.
> 
> Clean up that obsolete line in the Makefile.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

The hardware monitoring mailing list was not copied, meaning
I almost missed this patch. Since the list wasn't copied, I assume
that someone else is supposed to pick it up. Ok with me.

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>   drivers/hwmon/Makefile | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index 48e5866c0c9a..726ffd9f6a1b 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -196,7 +196,6 @@ obj-$(CONFIG_SENSORS_PWM_FAN)	+= pwm-fan.o
>   obj-$(CONFIG_SENSORS_QNAP_MCU_HWMON)	+= qnap-mcu-hwmon.o
>   obj-$(CONFIG_SENSORS_RASPBERRYPI_HWMON)	+= raspberrypi-hwmon.o
>   obj-$(CONFIG_SENSORS_SBTSI)	+= sbtsi_temp.o
> -obj-$(CONFIG_SENSORS_SBRMI)	+= sbrmi.o
>   obj-$(CONFIG_SENSORS_SCH56XX_COMMON)+= sch56xx-common.o
>   obj-$(CONFIG_SENSORS_SCH5627)	+= sch5627.o
>   obj-$(CONFIG_SENSORS_SCH5636)	+= sch5636.o

