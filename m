Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE95F2DFA2A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744727114; cv=none; b=P08zU5fM3NS35eT4XyvqMNLfm6J8jnlRH90983ZQB63moqHxJvDXu1Mwj+0kEArFX0K5zP9Qzt8tGkQ735KQREY05Zi0cYCGjDUlVN0WdtdqTYikj44PYNOTZKEs3Scmoweh8PQMT3V3s7AlJXN6bYKOrVch3AHNQ8QKsVvs2aU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744727114; c=relaxed/simple;
	bh=TX1inBWH3yiZd419UeHulF2D7bWnBwwL2AiJ0toiJTs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dYbZGAWTZC/JxiIsnPOGAGosr+zmR1QxA/1Z2pmOa/SlVfDYAMjO6hMvCl5F5va7td0oFKP3xTEj7dRTTi5i7EwipRC9SPtSUFcEhb/ywpGiGX6CoIhiJMlhKByNAIbL9fa8lvriH7WTbaL2WnKJcisVSXt4h1n7xZU7H4o0DGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ODBCg7vl; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ODBCg7vl"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-85b5e49615aso520808839f.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744727111; x=1745331911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZwxfWLKsKtEVH/Ebayy1y8ELH1yO/XRoAusiLVSBzp0=;
        b=ODBCg7vlTERpXDFadQofbbXP8TBQq5TLFxk6HAzxhD87VZ63CP+aT/oNVQXe2wtpQh
         CgRO5ZP2yUJ+Q45JZwrhzDXxc/R7WgGGlEg8YqhZa2PFNVvrWois0D3ESqT6fE1kLjgx
         0TAIXnOSB++hPg9TOABlGWBzfVIQnVJCY2Y3M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744727111; x=1745331911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwxfWLKsKtEVH/Ebayy1y8ELH1yO/XRoAusiLVSBzp0=;
        b=w+11/9h2gpylRcrwTOgzUhoeSVB5jO4X24vTiBpOXtMVU4iNdJ2PLTigCq0DbFiv8j
         LiYu/F4Uk6eSNSWaPteSITRh0+CTlpe554TIIxBrPEuFuz1k92AfkPRXFaUkSDpvLrM7
         YL7oKimsJFghFHV8BN5nA8JE9GliPna9C/6KEn9SCGOY6hAI0iktTFNaJnCKEJC4HQs5
         fTAs2ISmot87A2EmTLpiHggVL/VD38S/u0+xPPNSb3lbEEglqLk7LXndH1aMPiO3LxZq
         7Lpz/jCkTY+esiiDwS/5UUx9/phoT4Bz132iMF9NOp1mbTGZc+JYEQYdRTFe1SZwzkWQ
         VwBg==
X-Forwarded-Encrypted: i=1; AJvYcCWfjRqsR9jFvdLowj39OnSOVdUlYZZYvdIVf3Jt7E0KueiZqywXNs6KdP9xlwCjAlH8t5YC5tlgGOxp3qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwEGeGpibhbPUW36EwXyTBoRdDa3COPQmWQSBH1KWV1OeXuL2V
	lRNn+l2igNehY63AIOaSpCWFtTRQQyG13tsk57eYO+RtvVIMi7hqYUicohFGFOU=
X-Gm-Gg: ASbGncsEKINtGC/gcxwENwhtgvMcaT2AlRJ8gcZpUPAb1lObjXGkY3Sx9RwVuH+a8dO
	llEuGrMXsZlPGeHNxxItkrnSqM5R0AVwxhs3ZT28d1jk3qB2jlU6/KRdMLzGDRERQ6bajZteadY
	sSwhyVX7KTrGAzxs42G+ZedDJV8Fc1Svu//YOSBeDGoFHcQvS4zlvfeaRaYZFouELRQDdFkD8zp
	jFTTS16gGpisfAiNTYq3b4OmhJnKzU+DH0TLxEVpGluSTQuJAgcJXLKMQv4ehTyeUjBRBzUkjK1
	8bXmDdXS7fYTw+vT1rWZ+8eV3ocID9+lLcJYct1ZnY3hNtqCNjc=
X-Google-Smtp-Source: AGHT+IGldLbsquoOOC412l6V3jh2NG00rYgHrMmWTM8P6sdURVFqzoQ2xcYm7C/syt+zCw9/aHXfzA==
X-Received: by 2002:a05:6602:3a0f:b0:85d:f316:fabc with SMTP id ca18e2360f4ac-8617cb528d6mr1867715639f.8.1744727110731;
        Tue, 15 Apr 2025 07:25:10 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e2e755sm3159823173.112.2025.04.15.07.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:25:10 -0700 (PDT)
Message-ID: <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
Date: Tue, 15 Apr 2025 08:25:09 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors during
 kunit run
To: Borislav Petkov <bp@alien8.de>
Cc: thomas.lendacky@amd.com, David Gow <davidgow@google.com>,
 "x86@kernel.org" <x86@kernel.org>,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/14/25 17:00, Borislav Petkov wrote:
> On Mon, Apr 14, 2025 at 04:28:44PM -0600, Shuah Khan wrote:
>> Hi Tom,
>>
>> I have been seeing sev_es_trampoline_start undefined symbol referenced errors
>> during the following kunit test runs.
>>
>> ./tools/testing/kunit/kunit.py run --arch x86_64
>> ./tools/testing/kunit/kunit.py run --alltests --arch x86_64
>>
>> The error is here:
>>
>> ERROR:root:ld:arch/x86/realmode/rm/realmode.lds:236: undefined symbol `sev_es_trampoline_start' referenced in expression
>> make[6]: *** [../arch/x86/realmode/rm/Makefile:49: arch/x86/realmode/rm/realmode.elf] Error 1
>> make[5]: *** [../arch/x86/realmode/Makefile:22: arch/x86/realmode/rm/realmode.bin] Error 2
>> make[4]: *** [../scripts/Makefile.build:461: arch/x86/realmode] Error 2
>>
>
> 
> The real problem looks like that pasyms.h thing which gets included at the end
> of realmode.lds and which contains that symbol.
> 
> How exactly can this be reproduced? Exact steps please.

Run these kunit tests - not out of tree. Tree has to be
clean to run these tests. Otherwise you are prompted to
run mrproper.

./tools/testing/kunit/kunit.py run --arch x86_64
or
./tools/testing/kunit/kunit.py run --alltests --arch x86_64

The tree I see this every single time I do my tree testing.

thanks,
-- Shuah


