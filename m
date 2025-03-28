Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE0A1E8356
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 21:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743195993; cv=none; b=JAvP9GqefpTN7HKoc7pci238qDEPMGmRZ3Ajltk7NhYSqeNMRkoaMg8ltIj7btHuLyknBQZ+KlKNM9XDBQZpO/tsHhOP5mY86MDa5TGbGNxC5cuq/3MvOCmoe32YCaOz7VCYkniOBJq2aj/BkM2aXIws1RZiHZMUwAneOiJ893M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743195993; c=relaxed/simple;
	bh=4MvgCRk8GKUCzZRBR3jsAkV02zjbQDWVsh7de/ESgho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DEE47bShJ9DAgIc2QbtJnl8LdioW4g/0IwAju8qhvCxE4idNwkzFfkIEnUCSmfvjhFjxA5F0a2WmTQK8FIHe6SSdQGK9iuCW1PNzp2BVAmOVrEVHDQN8w/Q6tX6RRv9CmNqmytQWA/SO/VTgw+PUN69kH5vhXw34T7se76WzfZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TTfRqcL9; arc=none smtp.client-ip=209.85.166.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TTfRqcL9"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-85e15dc801aso214372139f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 14:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1743195990; x=1743800790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZjFz2NYE9XublGU59tucHqCizA+dgqB/ZBSarbDyb8U=;
        b=TTfRqcL9HfnHmGM+Pl/0aspJpbs8raJrQy6IXXyfUYlnryDPbUe7Cx95cJ7IAgMhdD
         Ie4PgFxWFFqkbRYwRUn1GDdsI3Z0SxoO3+8SvCvOQq8ZRRXaoV8VFB6kmHT/aP+o/S94
         lnNLmxJYOiRuHM1YBfT3XgaDyiML3uI4cKWT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195990; x=1743800790;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZjFz2NYE9XublGU59tucHqCizA+dgqB/ZBSarbDyb8U=;
        b=rUh2SRvviUOM+JAlQWIIna+7HrRiBf8C07kbAACAyqV6F4E6tqyftMplsBgCKPI0as
         F3UlggrGtUmUG1SPNTykG0ofArlZ2sNFkTiNX7p8k5ef7IXGICHPzEUlNsr8O9kOIfeZ
         WOXJScxg3WWqxpFiZ7VX1EDkh52q0w98iSsLHI67wTMHLoQMkyh7IPJe9DykTVCbvtMR
         rRPeay7gMy2pSZrTIiCF7KjnPp4Axh5a6q8YphzZY3WiDcyNxHCLwiVXNleUuWfklsEG
         lF/iNnGgVXK8IKsT/W4knKugdHjAx+34emmQgNQwK8iGiN4dFVEyTugcxZv4PmRw3dWc
         mm+w==
X-Forwarded-Encrypted: i=1; AJvYcCX4Y4zpBnJzeEUl4fCJNuegjLemc7QMH6zPA1P2/7du4ke2x5CryjL/IMVHCzbbwiy69Hh9dapyyWFTxOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTRgn8bCfzY5FEp9olTn4AxkpXZ4mSbFO4jguNEIvFH3vog8rZ
	Htvp53dfDiYCUtWbNHgrQ3Qx9Smd6GcVncc/ZIz0ThlKZndD8KMZ9A0QiMoB4wI=
X-Gm-Gg: ASbGncs11ssiNnQW6GijCvEV+brUGVY2SL6OmoZzjBPDjW+/96+qQ3UFFv5DW6XuySa
	VDJMuHyJldrn6mETP2tTd2BUWiPyOvZrklR3WNO+B1DKuNMjG61d7D5nIe53lJrohS9mwGxQtoi
	M8FIodWk+gF1wHbelx1WMaeSwPRTpfJFuqAlrZb7kMRS2GzUregULwCyRf4TCRRDchR++fTBFeU
	/QqYL2tIY4PUbkOR3qVj6Oq8aS1WZ2C7N9vHr+DMBZmQ8VyiO7uF81EKztejRviKNmZvAtdPf5x
	/TKtY1+7uOLcSsn4XNLIu5OjB/DQeqWMXFb2wJ9t4akBHljzlBN5KYg=
X-Google-Smtp-Source: AGHT+IFQAA9lc+Ygw2fQ5AmWnDfp7459wtXQIdhZp08jrwKejpiRtTEBUmQY7sGkVk28m2VcnOcD4g==
X-Received: by 2002:a05:6602:3999:b0:85a:ec03:b124 with SMTP id ca18e2360f4ac-85e9e86395cmr140854939f.4.1743195990070;
        Fri, 28 Mar 2025 14:06:30 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4648cc348sm622042173.139.2025.03.28.14.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Mar 2025 14:06:29 -0700 (PDT)
Message-ID: <b26a2a43-3c55-4086-88e2-64e65dcfbeb2@linuxfoundation.org>
Date: Fri, 28 Mar 2025 15:06:28 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/tools: Drop unlikely definition from
 insn_decoder_test
To: Ingo Molnar <mingo@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 David Gow <davidgow@google.com>, Brendan Higgins <brendan.higgins@linux.dev>
Cc: x86@kernel.org, Rae Moar <rmoar@google.com>,
 =?UTF-8?Q?Sergio_Gonz=C3=A1lez_Collado?= <sergio.collado@gmail.com>,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 KUnit Development <kunit-dev@googlegroups.com>,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250318-x86-decoder-test-fix-unlikely-redef-v1-1-74c84a7bf05b@kernel.org>
 <Z9spq9OccwK7vKj7@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <Z9spq9OccwK7vKj7@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/25 14:31, Ingo Molnar wrote:
> 
> * Nathan Chancellor <nathan@kernel.org> wrote:
> 
>> After commit c104c16073b7 ("Kunit to check the longest symbol length"),
>> there is a warning when building with clang because there is now a
>> definition of unlikely from compiler.h in tools/include/linux, which
>> conflicts with the one in the instruction decoder selftest.
>>
>>    arch/x86/tools/insn_decoder_test.c:15:9: warning: 'unlikely' macro redefined [-Wmacro-redefined]
>>       15 | #define unlikely(cond) (cond)
>>          |         ^
>>    tools/include/linux/compiler.h:128:10: note: previous definition is here
>>      128 | # define unlikely(x)            __builtin_expect(!!(x), 0)
>>          |          ^
>>    1 warning generated.
>>
>> Remove the second unlikely definition, as it is no longer necessary,
>> clearing up the warning.
>>
>> Fixes: c104c16073b7 ("Kunit to check the longest symbol length")
>> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
>> ---
>>   arch/x86/tools/insn_decoder_test.c | 2 --
>>   1 file changed, 2 deletions(-)
> 
> I suppose this should be merged into the Kunit tree? The c104c16073b7
> commit is in -next currently.
> 
> Anyway:
> 
>    Acked-by: Ingo Molnar <mingo@kernel.org>
> 

Thanks Ingo.

David/Brendan, Okay to apply this for the next rc?

thanks,
-- Shuah
