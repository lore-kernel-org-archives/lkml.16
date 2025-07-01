Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0548F1D07BA
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 19:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751397422; cv=none; b=UKgmX96cD8VRZY2wJ05CVEYwyICZsf2u3dGwK3zBAip2YKblWmk/hfqdKMFQ2xpf6Wya3Y/Orrp+Btnk6EN7icIdcA3PsNQDn5u8e4476Gm+uT1hVSdNZz4BAd0IX1Z+2de5CUGFPwDIgQ4IwF6mpWzu0nMDAoYAP8gDyUU1Li8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751397422; c=relaxed/simple;
	bh=FcYa0P68tMu4irkQQIVFEWw6CjVH7GiWKQ0vAIynfuc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YqfHyXlU8uPTOw9TEGvTWkiQbQOFbwpQziF18HbvxyMUj/EIHNv+0GqBjkMl2eXsuI4q/XBCBxrOQrZBJ7UYsgDYCQTZaENZZiHnO9V9qsAJe0v6xd1OgaDiLJsOjJ/a+esmGCWGvuHUHWlBVwwPhhKeOSFGstADjYFM/1lhScc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Bw5vtEz2; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bw5vtEz2"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8733548c627so207302639f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 12:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1751397419; x=1752002219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9WagJ9l2OBOz2LHi7f/cwLGTFcCqNNX4A8nF5wosIo=;
        b=Bw5vtEz2+uyY5TVm1bEkX1IY7F9mZSZVRq6VRJ6ezFUf1L9yQ8ISH7LViepaaUcAbL
         WhUFf70oFkVQKDr20Qv8PSa3kfApytQL1/4cYXKJyOe5R7CMFYMBs8XHsvifZPDyjZNA
         ZA0tbx0qZ9iYA1k8t04vVJ5hB/eDY8cXoSvQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751397419; x=1752002219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9WagJ9l2OBOz2LHi7f/cwLGTFcCqNNX4A8nF5wosIo=;
        b=TxfXNOHGM/hm4KHHjHpEx6BdrySrx9QOU0Wi+2KBvAYDLE/UieyfpVk6Ar0ASPawYo
         ZLDktdmmxhTqzjKFcWouDuvaXJ0iap48U9zFZJV/Yfbirbhb0JcO/DntWaC+QX1wCvxW
         lQTwYmF3Ajba/Jmrjz2FV/QI39Yy8rOHnyzjXo3jk7PiQel0LRuPzN9KvvE4wzk/pvh4
         Z3tcH1tPMaAxZX7JZXLCw73Lqk5EKBB+VvS+mLvqPLQdeWZL3lvTUVQ50jNMB+gi9QBa
         U3/YaoE736GpD9Z9tl4DOZA1TsJGL0zKx/dw4bYvB5MMiOmiM+8HIUOTUr85mHphiLiC
         epsg==
X-Forwarded-Encrypted: i=1; AJvYcCX/GZbOeaS0+3YNqVfwz0eHZyQg9WBvgkis9xgKsLy1X+zQNShiOX2xqokvvvXI1MEo5qumG2+XOxnbI/0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5NrytkGekYO8VUmiichRdDROGnsnBwdVwc+wot/S/oCbUCl9e
	IWlQQncE/hHQRfwR2wG7Sf2I/ejii8zoHgsiIMoNft/dz46gJaFAPrJ3N+jKtfA8Ecc=
X-Gm-Gg: ASbGncuX956d+B76angGyffZ7r7/ksSO4GEzQ59VV1HUbBwcv+LPFE+pE7oGVqlqQYf
	FQp6JWeuVckdPhIWfvqt4JAtbSJ1is54scccZJ4MxOIdoYxHD4rRhjZ6XXX3DvSulnCWal6xLzL
	vsJjJ4dQOmWUI0C26BUs1Lf/qkxlt1FO6GC8bELlQ3nbw2fLzcQYOIyJ2YySaI96766j5SLa72C
	6458xYPIkcTYdnSHYUjYLpjty5LS1elMoRwWZNKrr7YoW2REmL8gtLgjp4qfQKBxLrfRwQFkXX6
	EAlnBhvN/6H7O4vqg8c0sjk6k7tWbakMq4pBGyHy3v6VIIWU76en8aGWB+S+hQlhngndOaUDNA=
	=
X-Google-Smtp-Source: AGHT+IE44w/SVGV9VP6dFhYt54g3cS7ykKIhCvzjksCEeynlm/mCTHQaDqHedT31nr9Tl1C9TYKb4Q==
X-Received: by 2002:a05:6e02:3108:b0:3d9:6cb6:fa52 with SMTP id e9e14a558f8ab-3e0549ae93emr2275695ab.12.1751397418976;
        Tue, 01 Jul 2025 12:16:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50204aae3ccsm2622022173.116.2025.07.01.12.16.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 12:16:58 -0700 (PDT)
Message-ID: <ebd094e8-2b7c-4267-9a6b-6e2c821988dd@linuxfoundation.org>
Date: Tue, 1 Jul 2025 13:16:57 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: ptrace: add set_syscall_info to .gitignore
To: Moon Hee Lee <moonhee.lee.ca@gmail.com>, shuah@kernel.org
Cc: oleg@redhat.com, ldv@strace.io, akpm@linux-foundation.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250623183405.133434-2-moonhee.lee.ca@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250623183405.133434-2-moonhee.lee.ca@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/23/25 12:34, Moon Hee Lee wrote:
> Add the set_syscall_info test binary to .gitignore to avoid tracking
> build artifacts in the ptrace selftests directory.
> 
> Signed-off-by: Moon Hee Lee <moonhee.lee.ca@gmail.com>
> ---
>   tools/testing/selftests/ptrace/.gitignore | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/testing/selftests/ptrace/.gitignore b/tools/testing/selftests/ptrace/.gitignore
> index b7dde152e75a..f6be8efd57ea 100644
> --- a/tools/testing/selftests/ptrace/.gitignore
> +++ b/tools/testing/selftests/ptrace/.gitignore
> @@ -3,3 +3,4 @@ get_syscall_info
>   get_set_sud
>   peeksiginfo
>   vmaccess
> +set_syscall_info

Applied to linux-kselftest next branch for 6.17-rc1

thanks,
-- Shuah
