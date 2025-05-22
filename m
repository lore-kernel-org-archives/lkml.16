Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C19025523F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 21:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747949257; cv=none; b=iBz2hSwcEL6MpSFe0aGS1uQzt1x3D5BahT8FqkLB7meGYlt5qrAXSKnAORf/qaTRE3RpcI2vIGpfHJg7Fz+7GsCsVwttjbcniSP5Ui6S9uj/0x8370qoJIhS8xxydCqLgAaqu92eWT5JWdwpgV5y1OkRkva0UlN/o9hEk8OFUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747949257; c=relaxed/simple;
	bh=mnpr6INuI/cGWSdGC0aPhOUbXzMBiTFczrqe4wiWxDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcoyMcFWmUOgxiHc9Swod4pPtid1OKdZTSiMQfkrjqZtifK5cSMwxR+GPSFeVkFrHe5odFB6QBG+XWgdWCLAtWpe8sQYtaQAhvKyrCe3lLMCSsb5W0s68CdzorRptfU/sFR3dC/dT/kJJZA5Ze4ZDxHDljAtrIm4yrSF2qiIuPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZVcyd9o4; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZVcyd9o4"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-864a22fcdf2so13095539f.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 14:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747949254; x=1748554054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C5LAw2cg//rNcmP3BjiXQppUkP46hdY49wjLPrnMOFU=;
        b=ZVcyd9o4rXsBCWzfxIWo0jHd8OC9aCQ3XF/uA8OpLewZImPlxuggSyAgWjSPjtE6zd
         xszFDhUsVIX+4NyZdonZD2tx0aSfegmZrL+rThj5FKgReeY3ER5cL1jHyVGd790kNSW9
         Zfshxbxd7Y0eQ36Bm9TXAM+QGplPGTVJ04Acs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747949254; x=1748554054;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5LAw2cg//rNcmP3BjiXQppUkP46hdY49wjLPrnMOFU=;
        b=S0UqQA89I65z11GtSjH93wzgxnY7ZInf47zeqIgyiFJeJU8t/ZL/yJF1uFwOpcBZnS
         kdBAe41EcRaux4wrKpVHdNtaXs64do1O/zFrEHVwKxv/9xiNzwEkUQMfgOrhXocBFFKT
         RvdEoi2Xr5q/rt+3HxQjPu/1UVEbsd1juOUWRsnhYo1FU5/5FodjX+PLzYKqwO5XVWAr
         W6t84vBJQZ2gno1vR/KLJ3WNXKq4sGkP96zoB9YjI+8S2Zhm10MSWpdb50cgcE252KLg
         3sCuxMPrAou9ur4KYFjgybI/1yfdDIi4rK+nsA/lakaVZQAvdVjFYikY4aJ8zX8ysILY
         Daig==
X-Forwarded-Encrypted: i=1; AJvYcCVtoxk4Jn+jTONjTxXeDE4XwJoi7TUDJIV5tnrsEDWOB5m+FyIBUUGsWDGG4k06FRKGfeIAwUYHQGAvMqU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzplKjU8sUOgj8zeBgsm5XgRBnl/39ewOZXsr4X+y8u1tTMYelT
	3KKSG9xay7foCIa374i0BFByfNIoM4EKk4h6rR9JkpFP70icmrHkVtU3K7qw5/mHH7hHV9gb7pO
	8H1mz
X-Gm-Gg: ASbGncuf/fAJoiG3aQx5isXUsV5Vxmo42tNGkit/OR3xbVa2YhtDQKEKGZSGDbH+zVY
	VKd99UF4WPSP8+DWDhiP/+csMPHIFQfDu5zX3aOJGfyVsXG3QI0jHTLsSd12ub5Xlcz7yeJaHo6
	GS1iOKW9HsYL3GEenkgfd26EWSu8Xr0CitmC716VVxV7MuPTIUhE2XvewoC0eTNa0u2kJDNfZbR
	xTIpv120wQXzJ5zVk13k7KNM7UO7SMKkwnGMXjOZ4dFnxJ1tk/Lq/HaVMv3QFSvnfziGKGV1L27
	hGIQOU4NFYPV/3MnYkN2Jky1EW9Y0LYSb6qg33ClVhHbtQS9We/h/+fMaUu9Ww==
X-Google-Smtp-Source: AGHT+IGYqTZwAOxSAwQ4MLoRuJW2OgxBpFdPfc1Yu/NwmS2TEYIdKzXmQezEmiO33MvZvH+Dx3+K+g==
X-Received: by 2002:a05:6602:2351:b0:85e:dbe3:137f with SMTP id ca18e2360f4ac-86cad951849mr123626439f.0.1747949254440;
        Thu, 22 May 2025 14:27:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fbcc38a5a0sm3313676173.25.2025.05.22.14.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 14:27:34 -0700 (PDT)
Message-ID: <3a73cef3-83f0-4e26-b8ff-3c289a7cd52f@linuxfoundation.org>
Date: Thu, 22 May 2025 15:27:33 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: size: fix grammar and align output formatting
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>, shauh@Kernel.org
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, Shuah Khan <skhan@linuxfoundation.org>
References: <20250513214438.300430-1-Abdelrahmanfekry375@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250513214438.300430-1-Abdelrahmanfekry375@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 15:44, Abdelrahman Fekry wrote:
> Improve the grammar in the test name by changing "get runtime memory use"
> to "get runtime memory usage". Also adjust spacing in output lines
> ("Total:", "Free:", etc.) to ensure consistent alignment and readability.
> 
> Signed-off-by: Abdelrahman Fekry <AbdelrahmanFekry375@gmail.com>

Did you run checkpatch on this patch? I am seeing

CHECK: From:/Signed-off-by: email comments mismatch: 'From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>' != 'Signed-off-by: Abdelrahman Fekry <Abdelrahmanfekry375@gmail.com>'

Please fix it and send v2.

thanks,
-- Shuah
