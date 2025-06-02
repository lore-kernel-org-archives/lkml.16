Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE7315ECD7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 22:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748904489; cv=none; b=GHIawgj/I2JqSwHv31RzUQ+b7FTIEnzIMca6UQw48KM947JlelAvMLFILF8ogXWm192mmCyExJSk3rylbcmjIy4K52niUvTxD5T9kSWzZXU7jM5YcMo8GWbnV9l+6xI9QFiD2lCheUuRmXfRCAwBsd2hlyvC/j/EN+imMNH4Uq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748904489; c=relaxed/simple;
	bh=dV8jNwoaHn3pYzAQqE0xKwHO/o+oj5FSIrvUimpRDk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pRuA4/Y2dyGi5+4KSXmMitVZ9xWTD7I8wtDGOGBoSbA9paS+L8IZrWnNv3NkWXgzOZHq02XOIOKPJt4ZSp91NWuBJInjylNhMd/HzTv3h885Rsasc63ehM9APsVUyjKHcHJmdDyvCeHrrOhA1ktIo4/FvtlsISbiCwisaQg0HMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AlX5fJuF; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AlX5fJuF"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-86d029e2bdeso109187939f.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 15:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1748904486; x=1749509286; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k0MPRxC3zSKa9lUKC3PPGWxNiqxgy6DGxhs8CNtCqjc=;
        b=AlX5fJuF8oQq+andlgeBt8tco6K++GKywsYfAMFGdEjTcqBFRqqcl9NwheZL20K1rl
         OKiZzVrYlzq096E+6tNrnTDQ4dP52A6bmT2kkAeWTR7JQUHICFNSYxe2ekdcZ17Uh6+N
         A+sK8OY0cWbG+kN4Du++HEpuexgJ8EfyyyuyA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748904486; x=1749509286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0MPRxC3zSKa9lUKC3PPGWxNiqxgy6DGxhs8CNtCqjc=;
        b=N/HdpVy4K8ep7iLfE/mVacGGucpG3TDwk6/VG/DpZsOXQlfR52koAcnwcHK4ACVWod
         SwTqoIWG8zYTYJW87Pm4//yyu/VIg1PFNlbEPRvHr4OyGLBblyVNe3yF26hyWRUaC4+J
         lrXJkLlAieNw/j5CzMowBpYe6EIfenWpOKIglmMMZKkGG8ZmMxsDMTikjxegUp1JlE1k
         z/OrzY81NEmVKfBW3a3i3w5BYsFoQgMoTfuqwnCx+8AcnkGKho4hTz7jBc5Z6VN6L4ls
         U0D3N/wtrLg/y8mIykBEcmWRwMxfbC3HKzrq1o5jGYyQJgF6qRttuQ1kwyQpz60CGTye
         oySg==
X-Forwarded-Encrypted: i=1; AJvYcCXs99BxO3D9njOwNm8Mqwu5d/JlT3VZxJUHJrW6rIoOAikRDrb0sbTtfCGLqkjsZ+XHuaWh6FPB9VkIc1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIKWVITwM0ti8skFgofbVrurJy5dERm47cLxgQuHQmTANykuQo
	U4O2t6kTVbQfxQO2ZfR5m2egyrsveFTOb58R0e2lRYjUnZ56L5KDkhYme/Q4ShzrLWYT2WoCT0j
	XjJhY
X-Gm-Gg: ASbGncvaD3j8l60BnEkvefZanGkojIioyQFqWvevEvtp3L7YOKHudtNxeya0WK+g9vA
	6FxWwxygxo/7IX9vH7IlYKL8qVBeE7kNFSXioQe3KW5YgfzdibWPYoFQtxLzmFNI2MVEYxFdLTj
	Zvq6YhbaXEgzFRnAK+fTDycaSD666W93byHLnc4Nv42KWtwDJL7qByIc7NkvnRQZDeJUqFt7zii
	AS/0muRB1ELyycIvUO8VWOPjo/zA0BqVBE80oCiXSBA3pItlEL1k6KWPAlgNeybQ4V1XUuEu2ud
	2Wg8uR/q40iGlse4wwshU0iEUQVuRCKI7tWCgWMedg/9vO1w1OMQ80Gfe5biQA==
X-Google-Smtp-Source: AGHT+IGcqPQ6Br4YkdnS67IYJqV4bo0xOj2HBlD5gFqWwiSIyNPUyz3F+NvBmsbbGyAdNmOLbKGGBg==
X-Received: by 2002:a92:c26e:0:b0:3d4:2ea4:6b87 with SMTP id e9e14a558f8ab-3ddb79ff68amr2712545ab.11.1748904486155;
        Mon, 02 Jun 2025 15:48:06 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd93546c38sm22951685ab.38.2025.06.02.15.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jun 2025 15:48:05 -0700 (PDT)
Message-ID: <4a28c302-b37e-4963-86c2-87c5793c2661@linuxfoundation.org>
Date: Mon, 2 Jun 2025 16:48:04 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: Add version file to kselftest installation dir
To: Tianyi Cui <1997cui@gmail.com>, shuah@kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250529003417.468478-1-1997cui@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250529003417.468478-1-1997cui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/28/25 18:33, Tianyi Cui wrote:
> As titled, adding version file to kselftest installation dir, so the user
> of the tarball can know which kernel version the tarball belongs to.
> 
> Signed-off-by: Tianyi Cui <1997cui@gmail.com>
> ---
>   tools/testing/selftests/Makefile | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
> index a0a6ba47d600..246e9863b45b 100644
> --- a/tools/testing/selftests/Makefile
> +++ b/tools/testing/selftests/Makefile
> @@ -291,6 +291,12 @@ ifdef INSTALL_PATH
>   		$(MAKE) -s --no-print-directory OUTPUT=$$BUILD_TARGET COLLECTION=$$TARGET \
>   			-C $$TARGET emit_tests >> $(TEST_LIST); \
>   	done;
> +	@if git describe HEAD > /dev/null 2>&1; then \
> +		git describe HEAD > $(INSTALL_PATH)/VERSION; \
> +		printf "Version saved to $(INSTALL_PATH)/VERSION\n"; \
> +	else \
> +		printf "Unable to get version from git describe\n"; \
> +	fi
>   else
>   	$(error Error: set INSTALL_PATH to use install)
>   endif

Why not use "make kernelrelease" to get the version?

thanks,
-- Shuah
