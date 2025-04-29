Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D1929E042
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745969681; cv=none; b=BJ79ER5CBSyzky9ZGAEt5nOoX4c5LFwaG0n3XOn04DavusbF6CtNvMqJBMb2KF2+UbkyvMrj2TLLCINU+5xXUkOTyfyhsrEuDgr8dvtfxOcXFNic1UdA0LzYzCW1w7xdjr3wkNFQM8+VgvspNL12iuqi6k6+jRTAN+2ro8iGZJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745969681; c=relaxed/simple;
	bh=5PpGCLInumY79oCa5QN8pCEtkY3g3aL7RVIL8qW8exs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c3ZSKNPTAMRkbJIfx7p/VJ7OfJhCbmGXsnJmxOX/q+jsH2sjFmBVNtJACzThznuwQbj3vKZAqKIY+dDBAPUff26UYmFrw3Wum4M2BhaLtdW9+bMYmLqUcWdE3ZbpNCT1DuMcP2E6u3OP65DfjGB6rq8hqgPzZKxBBKKiB82LR20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=FIjXBDyF; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="FIjXBDyF"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3d940c7ea71so21770415ab.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1745969678; x=1746574478; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K4gYzRxDTMG8a8m2JVbMN+mLEBXzCwIBH9qxkDPGLkE=;
        b=FIjXBDyFl88sVU3HjaMuUwgelG7rsXRL05jT7yq7qmgYDFCRzIUGkqQBIruLmN2DoF
         agR23e3CeQ8m3xUBTJYcQ55vkNL/QIQcfTR1h7r+Z0zmQrb1hY4wZEeUCoFZwq5S4bEd
         CGoamXcOdUOqGF/Tk7w/hWcnH/lcA6zD11GjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745969678; x=1746574478;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K4gYzRxDTMG8a8m2JVbMN+mLEBXzCwIBH9qxkDPGLkE=;
        b=Psq/UfdqMfyYR+MVPDqD2FotQkK6B0YHwVSL4N8ML7TzgT10Axk67V0cAOqFeYrNRb
         nW+hZRojqUKJc82FaEWK7xOFe0nI6lFSPnMTzaTB1u10fHBEV1w8cK93/5LU62svWVrx
         /NWmVNAs/p6jhZP20F1uHg+zjuTBKPjImTQnECZ2NT9d7U5A86zFGVTwjv3/fSxHbQTP
         uV5Q8KXaMmtlSXGcSRUbwlzSfM932MqfJ5gSKyszQPlTBFIHUdUi6U5/yLk6xOx1LjFS
         letc3Ji0qzx88iHfryD1fPMsZEXdFXKAMRCe6Ox6QiKL13AIEkAkx6AcVuJLjAiEm7qj
         AVcw==
X-Forwarded-Encrypted: i=1; AJvYcCUe1Uq6nBLDySJNAxJ69m62Ay4Ulkk5UuuH4JTs04kS4p9TN3k8rRrH9YVSo6NFfEsVpZzCbaGkkeW/reI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOOZtvjdevjuhBI91MaaVUPyRy50aWk2+SV3cLGTv198C5pZ/9
	sckjoBO1cYx+6nLSkThYjqHoJOJIXn3rFIlSN/bSWz2A9Zr7mlIsIIBOrt0oiI0=
X-Gm-Gg: ASbGncv+6/iGLVstU90yVbQHuo56oZ8FXDNXMlt/+0Z5QQpEEg3+h0QnfHs6DLfTye6
	0rVv1sw3+Y2PJVP5TXqkUytyqN6jkQKmr1DJv+ROXcXYnqXk6+2Dn8wjjgVywMIS/SrjDNcYBth
	S5okTjXswexZGipdDLZBMoNdketH2xfaIPKEaJdJm1RY2nTC4wT41/4G/xLzZ7MyZsiqGH+4HoI
	2VATguBCfoCTQrs8kCyBHTCWiLQ5GZX5weIrMk5th9msKynKwFZP+lYuxNjXJwMXY+htx1/mET0
	FDBuO3LpoT/2I2D/syzHrB3CkabT0I5aClFAOnQ7mqhhIPSK+28=
X-Google-Smtp-Source: AGHT+IGOjy3LeocKf8YYHPxXWO9DsgVyLTc1222evmd5AAMOYmg3KWF6p2nXzH2m9ZsGo+Z4im+xEw==
X-Received: by 2002:a05:6e02:1a0d:b0:3d0:4e57:bbda with SMTP id e9e14a558f8ab-3d967fa17f0mr5478365ab.1.1745969678668;
        Tue, 29 Apr 2025 16:34:38 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f48030asm5366935ab.70.2025.04.29.16.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 16:34:38 -0700 (PDT)
Message-ID: <9477f8e9-b17b-49c3-a957-849198251082@linuxfoundation.org>
Date: Tue, 29 Apr 2025 17:34:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] kunit: add tips to clean source tree to build help
 message
To: Jonathan Corbet <corbet@lwn.net>, brendan.higgins@linux.dev,
 davidgow@google.com, rmoar@google.com
Cc: linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1745965121.git.skhan@linuxfoundation.org>
 <dc8f4035a8d493be9ddc0e868a3ffd67626cca00.1745965121.git.skhan@linuxfoundation.org>
 <87selqlh0q.fsf@trenco.lwn.net>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <87selqlh0q.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/25 16:49, Jonathan Corbet wrote:
> Shuah Khan <skhan@linuxfoundation.org> writes:
> 
>> Add tips to clean source tree to build help message. When user run
>> kunit.py after building another kernel for ARCH=foo, it is necessary
>> to run 'make ARCH=foo mrproper' to remove all build artifacts generated
>> during the build. In such cases, kunit build could fail.
>>
>> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
>> ---
>>   tools/testing/kunit/kunit.py | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/testing/kunit/kunit.py b/tools/testing/kunit/kunit.py
>> index 7f9ae55fd6d5..db86a396ed33 100755
>> --- a/tools/testing/kunit/kunit.py
>> +++ b/tools/testing/kunit/kunit.py
>> @@ -583,7 +583,7 @@ def main(argv: Sequence[str]) -> None:
>>   						'the options in .kunitconfig')
>>   	add_common_opts(config_parser)
>>   
>> -	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests')
>> +	build_parser = subparser.add_parser('build', help='Builds a kernel with KUnit tests. Successful build depends on a clean source tree. Run mrproper to clean generated artifcats for prior ARCH=foo kernel build. Run 'make ARCH=foo mrproper')
>>   	add_common_opts(build_parser)
> 
> Nit: could perhaps that line be broken in a bit more readable way?

> 
>    	build_parser = subparser.add_parser('build',
>          	help='Builds a kernel with KUnit tests. '
>                    'Successful build depends on a clean source tree. '
>                    'Run mrproper to clean generated artifacts for prior '
>                    'ARCH=foo kernel build. '
>                    'Run "make ARCH=foo mrproper"')

It improves readability. Will fix it.
> 
> (fixed "artifacts" while I was in the neighborhood :)

Thanks for catching it.

thanks,
-- Shuah
