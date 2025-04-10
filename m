Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFADF1E5B62
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744319915; cv=none; b=u9tMpMmhjcTKozV6KQVgflzsfsy3kIWsjIjLHyXR+xWCa46efVXIInLlb+CEjQAh4jrckTt/L6gCYIAubcTjUsRnwnuJNjxkEBUjgeGtlE/JpQlt9JH0MtxE2J3dXMiezyaANzRiFnsNruUa3T6FwF0QM0tnEK3rwbnaFqZxXYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744319915; c=relaxed/simple;
	bh=YKNFggaR1ZMvkMTXhXeeRDb38Sfc/Sn5tqmp3CK2E78=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SdzM7zMccwhXVobN9IhejdIjX6zp4yjT25F4Twxjs8rqBtFEzdwJGja+0x/3qzJd8yi3zCe4XfXFYfpf0DfLi2OAtjCIY/1rKDg8+kw1QCOA2OFQOXt3X3XjevBwW2TwX0fKor5A+s1kKAosoXBwXiIIuf4+c3yG6xXy5m1lXe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WwYuBYkB; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WwYuBYkB"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86142446f3fso33814239f.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744319912; x=1744924712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=adSqw3HdcFFNDx2+sCAYDOyTUvs5yDs7TA17K1T1eZk=;
        b=WwYuBYkBPiClVFLJ7XaH+L3zCUjwGvYsKiMfYStY+GpjxNoL2pNzJWdY+ePJjqWrGh
         Mc/TxJRu4Yz5bQY11EI2w3RVTXaRTcFS3EY/LnHIr6WOAyEmZjSwfUcTBMJYTimzATEO
         irvhyEI3qTK8K0awUFwSTyFQUglZkYEhQq0Kw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744319912; x=1744924712;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adSqw3HdcFFNDx2+sCAYDOyTUvs5yDs7TA17K1T1eZk=;
        b=MksKSX8E22ELc1KTpQQ3XxrTN7HH5B9pbaPKX5FAvlI3Ca4PL9Z2ioM76iaaWL7Etx
         KH3ncOOaLVjk9M/fCb+JhvoNEfU4ylhHiKxeGNCLehWq/ekq/moR6v6ke/qJybpzJh2n
         8fCEoPmKZl3lu7yFdoGfTdZ1A1q10DwtdIoDib3FF/ulqZ4t4ppsSnW4dRQyOBJFIcSH
         CZAhP9k9fPBvjkpRNBq+9Ssiw3Rg3nsCEFJi/HXSdHhwrqdRwO+yW69Oof979o7SP0vl
         SH9QbQKrqPhtv3JlPM15yMe6s4XUDe9dv33xhmmY6j6tIiA5f+ydPvuIeQgaT+i7XaEU
         sv7w==
X-Forwarded-Encrypted: i=1; AJvYcCUzW912k6QeI1gVevrPJWG8NgVlL47ZnBXMRZW+S84i9chsRFQghccUyDqGmrS4O0udBGbokV7r5Iif1IU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa5jUuzEJu/AY7s4RYxm8LDIr8ft+zmhm89K4IJ0IgU7Zhlc2K
	1lVQSXHK1ZXa67L/+OH7cC68dz6j1snssme2Px/gFz2afHBioRPnlsnHrCLyLBQ=
X-Gm-Gg: ASbGnctCqbAEYrokYvR6+0i54Kl1reD/THaSU4IBhOuFg5zesbJ1I16dopA3mCCTHqi
	rGa/aGG8rcz0q9iolFIdeIcYz/j1256XDP9ymEEJhleuhBqnxNpA1CQ0nn0FRSJo0DcTrqjdaLp
	85Y+/wacVpwLdQM19rvCwqDttmYkPaHZhEAtaFwSBSKjPcGkezp6k97E0ZvOII3jEloG6awzMWH
	LcPyEWUnpKWJzWosiiWSSJU2eh36uMj7GABD/q9zQAmuKzlGlkKWKwvmlumdA3ulbCCbXwBMoiI
	PmjuxPebwK4iL39CkxFW+bGTEirHGzAn/IQf2UfjNp7R+tq4aKiY9uA4ZtMZHQ==
X-Google-Smtp-Source: AGHT+IEgQ9CdPwLPCcLUafb8F8oBKqVspD8nw9QY0OWd/7jsrJuByd1qeuLV3QE7MhdOaPfdmHVE5Q==
X-Received: by 2002:a05:6602:26d6:b0:85b:4484:182c with SMTP id ca18e2360f4ac-8617cc17004mr43119939f.11.1744319911857;
        Thu, 10 Apr 2025 14:18:31 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505cf84dcsm921959173.20.2025.04.10.14.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 14:18:31 -0700 (PDT)
Message-ID: <a874a35f-b63a-4e7b-8d5a-3696b7f39b74@linuxfoundation.org>
Date: Thu, 10 Apr 2025 15:18:30 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/Kconfig: Fix dependency for X86_DEBUG_FPU
To: Ingo Molnar <mingo@kernel.org>
Cc: tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 hpa@zytor.com, Shuah Khan <skhan@linuxfoundation.org>
References: <20250407231057.328010-1-skhan@linuxfoundation.org>
 <Z_TIMh7UsWQiSkqg@gmail.com>
 <f9642a9f-27d4-4f84-818c-390194b898bf@linuxfoundation.org>
 <Z_bnzs3IPyhVIYaT@gmail.com>
 <e0842dd0-71d3-4de0-a2ee-e83493df890b@linuxfoundation.org>
 <Z_dl0HhwMOBkVTFH@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Z_dl0HhwMOBkVTFH@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/10/25 00:31, Ingo Molnar wrote:
> 
> * Shuah Khan <skhan@linuxfoundation.org> wrote:
> 
>> Yes it is vanilla
> 
> Thx.
> 
>>> More importantly, X86_REQUIRED_FEATURE_FPU *does not exist* in the
>>> vanilla v6.14 kernel, it's a new v6.15 feature. So this part of
>>> your changelog totally doesn't apply to a v6.14 kernel:
>>
>> I started with vanilla 6.14 kernel running oldconfig on it. In this
>> case if X86_DEBUG_FPU is enabled in the oldconfig, should the config
>> generated for 6.15 add X86_REQUIRED_FEATURE_FPU.
>>
>> It appears there is a dependency between X86_DEBUG_FPU and the newly
>> added X86_REQUIRED_FEATURE_FPU
> 
> Could you send the v6.15-rc1 config that has this missing dependency?
> 
> Because if I put the config you sent through 'make oldconfig' and
> accept all default suggestions, the X86_REQUIRED_FEATURE_FPU dependency
> is present:
> 
>   starship:~/tip> grep _FPU .config
>   CONFIG_X86_REQUIRED_FEATURE_FPU=y
>   CONFIG_ARCH_HAS_KERNEL_FPU_SUPPORT=y
>   CONFIG_X86_DEBUG_FPU=y
>   # CONFIG_TEST_FPU is not set
> 
> ... and the build succeeds:
> 
>      OBJCOPY arch/x86/boot/setup.bin
>      BUILD   arch/x86/boot/bzImage
>    Kernel: arch/x86/boot/bzImage is ready  (#4)
> 
> Ie. I cannot reproduce the build failure with the config you provided.
> 

Okay. I ran a few more experiments with a fresh repo. I can't reproduce
the problem.

The only thing I can think of is somehow make didn't run oldconfig or
if it did didn't pick up the right the first time around ... Not sure.

You can ignore this patch. Sorry for the noise.

thanks,
-- Shuah


