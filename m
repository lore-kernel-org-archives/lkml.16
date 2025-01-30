Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 057754A07;
	Thu, 30 Jan 2025 07:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738221605; cv=none; b=BaEhwvnTQ9e1/jz1FelMmOuhiYG8hwyJsOY0/iGGG4iSzJ3zZZSRy4XxFX6HgTUxLYDfh/9wQxXetSXIn7zU9pCUKwXnMPPtv5K+y5dI8fbFukQ9kuYk2mxBQAzrbQ4sC4KeHwe/n7rsZYR9vX23klEth7UXbcmqz0QbzQI29Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738221605; c=relaxed/simple;
	bh=/dz+TL6hOUizao4JeKuqffB+abbHnPib5T4ImH55e4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VoZl78If3spA8de4r1IklC1JGTW9de2NBAvgAYQ7jWxY2XrwwnzzgRxmQV5hI0futKkzVQFWfDPwVvI1yuSq0BUIf4Bl8YoMsUmBOP96OsJAZVmAelKQJGzNm/py08d9n3eFPl4iLEsYVT7BTgUw3ba1uFtHzH2eOgtq5Y9RtEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yk92K2Vgqz9sRr;
	Thu, 30 Jan 2025 08:02:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLkRQEvxfhng; Thu, 30 Jan 2025 08:02:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yk92K1byjz9sRk;
	Thu, 30 Jan 2025 08:02:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24D5E8B774;
	Thu, 30 Jan 2025 08:02:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9ANhva5jAowX; Thu, 30 Jan 2025 08:02:33 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A10E68B763;
	Thu, 30 Jan 2025 08:02:32 +0100 (CET)
Message-ID: <3150e796-9249-4ac1-a91a-7efb7ec4de16@csgroup.eu>
Date: Thu, 30 Jan 2025 08:02:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/vDSO: Fix undefined CLONE_NEWTIME by including
To: Purva Yeshi <purvayeshi550@gmail.com>, skhan@linuxfoundation.org
Cc: shuah@kernel.org, Jason@zx2c4.com, liaoyu15@huawei.com,
 broonie@kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250126105932.63762-1-purvayeshi550@gmail.com>
 <d85f9c94-249a-4847-a323-2f547fe60732@csgroup.eu>
 <171e15dc-b48f-4592-8466-b220185bae78@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <171e15dc-b48f-4592-8466-b220185bae78@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 29/01/2025 à 19:17, Purva Yeshi a écrit :
> 
> On 27/01/25 13:32, Christophe Leroy wrote:
>>
>>
>> Le 26/01/2025 à 11:59, Purva Yeshi a écrit :
>>> [Vous ne recevez pas souvent de courriers de purvayeshi550@gmail.com.
>>> Découvrez pourquoi ceci est important à
>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>
>>> Fix the build failure caused by the undefined `CLONE_NEWTIME`.
>>> Include the `linux/sched.h` header file where the function is defined to
>>> ensure successful compilation of the selftests.
>>
>> This is supposed to be already fixed by commit 34d5b600172b ("selftests:
>> vDSO: Explicitly include sched.h")
>>
>> Can you explain what is the exact problem still ? And why linux/sched.h ?
> 
> Yes, I noticed that sched.h is already included, but I still encountered
> an "undeclared CLONE_NEWTIME" error during compilation.

Must be that your sched.h is not up-to-date I guess. On my side I have:

/usr/include/linux/sched.h:#define CLONE_NEWTIME	0x00000080	/* New time 
namespace */
/usr/include/bits/sched.h:#define CLONE_NEWTIME	0x00000080      /* New 
time namespace */

And

/usr/include/sched.h:#include <bits/sched.h>


> 
> Error I got:
> CC       vdso_test_getrandom
> vdso_test_getrandom.c: In function ‘kselftest’:
> vdso_test_getrandom.c:257:29: error: ‘CLONE_NEWTIME’ undeclared (first
> use in this function); did you mean ‘CLONE_NEWPID’?
>    257 |         ksft_assert(unshare(CLONE_NEWTIME) == 0);
>        |                             ^~~~~
> vdso_test_getrandom.c:47:20: note: in definition of macro ‘ksft_assert’
>     47 |         do { if (!(condition)) ksft_exit_fail_msg("Assertion
> failed: %s\n", #condition); } while (0)
>        |                    ^~~~~
> vdso_test_getrandom.c:257:29: note: each undeclared identifier is
> reported only once for each function it appears in
>    257 |         ksft_assert(unshare(CLONE_NEWTIME) == 0);
>        |                             ^~~~~
> vdso_test_getrandom.c:47:20: note: in definition of macro ‘ksft_assert’
>     47 |         do { if (!(condition)) ksft_exit_fail_msg("Assertion
> failed: %s\n", #condition); } while (0)
>        |                    ^~~~~
> make[1]: * [../lib.mk:222:
> /home/purva/linux/tools/testing/selftests/vDSO/vdso_test_getrandom] Error 1
> make[1]: Leaving directory '/home/purva/linux/tools/testing/selftests/vDSO'
> 
> I found that CLONE_NEWTIME is declared in both sched.h and
> linux/sched.h. Since sched.h was already included, it was surprising
> that the error persisted. Adding linux/sched.h as a header resolved the
> issue, and the selftests compiled successfully after that.

Can you recheck that the sched.h that contains CLONE_NEWTIME is really 
the one used by your compiler ?

> 
>>
>> Did you properly build kernel headers before building selftests ?
> 
> Yes, I ensured that I properly built the kernel headers before building
> the selftests by following the documentation provided here


At the end we should probably wonder if we want selftests to build with 
old libc's that do not include latest defines. If we want to, then you 
should probably replace sched.h by linux/sched.h . I'm not sure about 
what to do really.
