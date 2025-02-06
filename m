Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EEF237700
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738882324; cv=none; b=FOoWNVXP1k43XHEl2bf8qR7ti29p/ismQbrnk7LCj5Yb/VrmkovEoZ/xF2ncKdQx08g5FXgO6qd0l6FAHPCxwcnGodCJO4cQEJI+mp5Axa0vWNhQ3Tv/4x0HtwuakRF45QPeQYsHYKYyilbHQ+Ygc5CMM4ZOO7yuRbbWX4LNMUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738882324; c=relaxed/simple;
	bh=gZwyvnaE83RnPxzME6WQ0AqqeH0dCTIoFtgKqN7Fsl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KSldGiHxH/C+Rc09TQ6d2bP/IT8WvPtVpGdkmWy+5QKdNKX4cHCGC9VcDR3FMQvCmSbMFhn0D4aP0OhdMQDLsWbJKnL6lPQ5pNAII8FmrA4kyMfJXdr/2yHgAeADoYX+4PP5veqVX9xh/evy9iXO2qxbiNv06UGHwkYAwS1Mayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKIv30zK; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKIv30zK"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21f2f386cbeso25588845ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:52:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738882321; x=1739487121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=chotAJoqbGv9XtIVzbYuRYug+J3xbKbWX7SmfZzVoUw=;
        b=MKIv30zKzoQerHzHKDAghTGCPHgCJ+twir1vTQbo5y9m+Ibi3IyulNu6Pm9F/FqPGs
         Mni4+/KrTOIbKXl6XOijxy6BlRT4GjxgFCvrhDEdZif0AJwqBJUMj+flNVsid2IGYyxA
         5zRV7L1maNbRAx6g8j5FZdw0o9fGaG4HPK6ewq8eG8eiB8ExxkIMbAdEEpq5P/D54Hnc
         vlQW6VHSdPng4EROgr4lA64/2BoL+fw0G6BNUcGDNj+5edCQijsZBlnjRFjnPeHR3UJu
         eNsz6Q9uY0Rkkmj0XwrbnGchhsGNaXPaVN/tnfqdjiHLbflNv/sLho3YBxuGsritgnYh
         NKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738882321; x=1739487121;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chotAJoqbGv9XtIVzbYuRYug+J3xbKbWX7SmfZzVoUw=;
        b=lD9AHLYX1ldsck2wHnzJf7tLKVvzedF46+Qwj318vOX9W3iahtJXyL+U21wewu+qdd
         LGbAryyAqr4Oa9kSnGYZ4EASrVGzR1fXWUOtrErAMSIIBpYlBGljFtegm4Jk2NPnaYkk
         w9F7DOEwUx8NkcWdFeJY4edtV1s1+WrLUiE1vMR5MOAVce2KJBiJiJOWgGLH2L66w+PS
         3nqJM72kLErBx1n7Z4WBvj9yDziiCeuMVtVrRd4kHy3zdoC5s/fkbLNIUSVZpLATnvFR
         AzuEjpUjMFOOOTLhtJtmRShqhvdYDZC84CnpQi7y0W2I6YQPqeU+deIpkkw0AbCN6Npn
         BrSg==
X-Forwarded-Encrypted: i=1; AJvYcCVhCRNbCesQ0kn3NTz/7bWjsb+AJeyq/nD1g+K0YfylAToHtiLT62q2+fp5UX+HBCFtOTAoHu3AyOJa1Nk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy565umXHsKesG/flviPMeGSW3Ck/CjpA5HFkPBJvHt7aPdBbpw
	XvG3nPfkKT4wHK6Gz6AHMRfwVKFubTuA2VOIuv4aagSHG0HDO46sEk8YVw==
X-Gm-Gg: ASbGncsXBJ9WbjhBJcfCfaBn3Lcm/eC4CpPiLttRY8AzKqNVPePz2NGqxbFfphBrVs0
	Bcmg4lKjE1WC5a7yzTpnNDr2OE2suikxLI283acrUJq8tp4Qu81CucNXjTKwezt1ztfvZWwGKmA
	4iUxZuKRLG0iqdOzmn33uIQzKIYZ8Kj5y2ieZpa/r/u5U4CUF1kJUTKG2/DBvVveIy/CARIL5C6
	dwey+CTSbpk8tyALE0AvkU6TAecExs0eExFH5iDjB5K9T7eYVp5L9IJ4srIAT9gBccCzxOsMXjq
	4TVHoqdFTBrcNmXSq/e7VSHmvTSsOgb7vgtgt6k7Hl/A8S0OJjyacCqH9zdn3kuf
X-Google-Smtp-Source: AGHT+IHyUZr+LSDpuqX3N+1QJROwnGFbrtTzVrH8VZYSefFIT7bQdRw4RHqxzmp5T0z5W45rgTqUFg==
X-Received: by 2002:a05:6a20:ce4f:b0:1e1:afa9:d397 with SMTP id adf61e73a8af0-1ee03a45df6mr2231155637.15.1738882321288;
        Thu, 06 Feb 2025 14:52:01 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ad51af649d2sm1854994a12.56.2025.02.06.14.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 14:52:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9f0cdbde-957c-44a6-a7ce-d3d412ecfbb4@roeck-us.net>
Date: Thu, 6 Feb 2025 14:51:59 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 29/33] hwmon: (it87) Check the it87_lock() return
 value
To: Bart Van Assche <bvanassche@acm.org>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Frank Crawford <frank@crawford.emu.id.au>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-30-bvanassche@acm.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250206175114.1974171-30-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/25 09:51, Bart Van Assche wrote:
> Return early in it87_resume() if it87_lock() fails instead of ignoring the
> return value of that function. This patch suppresses a Clang thread-safety
> warning.
> 
> Cc: Frank Crawford <frank@crawford.emu.id.au>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Fixes: 376e1a937b30 ("hwmon: (it87) Add calls to smbus_enable/smbus_disable as required")
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>   drivers/hwmon/it87.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e233aafa8856..8e3935089fca 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -3593,7 +3593,9 @@ static int it87_resume(struct device *dev)
>   
>   	it87_resume_sio(pdev);
>   
> -	it87_lock(data);
> +	int err = it87_lock(data);

I am not going to accept patches with inline variable declarations
if the patch is fixing an earlier problem, sorry. This only results
in unnecessary backport failures.

Guenter

