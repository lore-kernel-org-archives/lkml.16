Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DAE220F49
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747426017; cv=none; b=DxLg/jofHCG2l2OUKXXJt45M3by2PS2c0r4nUHR7/jpPNnsaU/cAdQwcuhM+7wJmHBQQV3s8qfvryrtqZ+7lXYEcYLpAURyHMsGSRXKq06LCI4ehrkordOi57WeKSN/dYB3dGAfRfvNTisufdipCTBTT+mfBY4K3ldufqpZFDgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747426017; c=relaxed/simple;
	bh=8sJlOjopH37CLCspJe1X8E44uK2h/yKz2bhbvzOqgrk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=qJjNidTInEpyCTPch0r/6cPAJxnCg6t9cBWMsOEELDymTCGOYUwzRl6BdBABjcaiMJc1mEHJLVWj1DVjiXUBKdP///GCpucrLf5DarV7adY1bS7HU0jFhbRDQu9gej4ve5sC+EVE5/panMEQnDgrj0HOZTQ/pa8nSL1bU+D6jfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=Sh0AieXz; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="Sh0AieXz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dT2PSmPCXs2qnXELa1AqD9yJTmmsT9ZtYgzI249JwoM=; b=Sh0AieXzAvAqWvn0WuRw+T1kbG
	Dv+OpW0PDtFLfFTp7RKuXSp9hHMfzT1wdCKLLjHzYuE0GzaHQEpThshP2+9cVWhFIn1podLdzannI
	ge0El7U9u5OWOAw5jB12meOnGmiLFLW+lWQvrxstENInCuIfzi8MOKqR4NoSMgbYZjt8IH/4kfY8U
	zICZvzTZfC8fIlWO99HELAriFxMPaZG+zHRX/nspFIkKXInLBzqdLgUWhe6VKy45l/qgf4wVsU5+X
	qZ2/QVjFHg6aZ+1GqGqd3pxwYlH+785/OGzpKZiUxoU67zoUVo+lvMKwTlM0jdBeZjvp3GTz7B/7y
	n8S/jqWQ==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uG1Ej-009EMe-Hx; Fri, 16 May 2025 22:06:52 +0200
Message-ID: <a015ea5b-ed1f-46a3-b4db-c448f0279fc2@igalia.com>
Date: Fri, 16 May 2025 17:06:48 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tools headers: Synchronize prctl.h ABI header
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
 <20250516160339.1022507-5-bigeasy@linutronix.de>
 <95608024-1be3-4502-8e41-aba3258010b1@igalia.com>
Content-Language: en-US
In-Reply-To: <95608024-1be3-4502-8e41-aba3258010b1@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Em 16/05/2025 17:03, André Almeida escreveu:
> Hi Sebastian,
> 
> Thank you for incorporating my feedback :)
> 
> Em 16/05/2025 13:03, Sebastian Andrzej Siewior escreveu:
>> The prctl.h ABI header was slightly updated during the development of
>> the interface. In particular the "immutable" parameter became a bit in
>> the option argument.
>>
>> Synchronize prctl.h ABI header again and make use of the definition in
>> the testsuite.
>>
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> ---
>>   tools/include/uapi/linux/prctl.h               |  1 +
>>   .../futex/functional/futex_priv_hash.c         | 18 +++++++++---------
>>   2 files changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/ 
>> linux/prctl.h
>> index 21f30b3ded74b..43dec6eed559a 100644
>> --- a/tools/include/uapi/linux/prctl.h
>> +++ b/tools/include/uapi/linux/prctl.h
>> @@ -367,6 +367,7 @@ struct prctl_mm_map {
>>   /* FUTEX hash management */
>>   #define PR_FUTEX_HASH            78
>>   # define PR_FUTEX_HASH_SET_SLOTS    1
>> +# define FH_FLAG_IMMUTABLE        (1ULL << 0)
>>   # define PR_FUTEX_HASH_GET_SLOTS    2
>>   # define PR_FUTEX_HASH_GET_IMMUTABLE    3
>> diff --git a/tools/testing/selftests/futex/functional/ 
>> futex_priv_hash.c b/tools/testing/selftests/futex/functional/ 
>> futex_priv_hash.c
>> index 72a621d9313f3..32abd9acdf186 100644
>> --- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
>> +++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
>> @@ -30,9 +30,9 @@ static int counter;
>>   # define PR_FUTEX_HASH_GET_IMMUTABLE    3
>>   #endif
>> -static int futex_hash_slots_set(unsigned int slots, int immutable)
>> +static int futex_hash_slots_set(unsigned int slots, int flags)
>>   {
>> -    return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, 
>> immutable);
>> +    return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, flags);
>>   }
>>   static int futex_hash_slots_get(void)
>> @@ -63,11 +63,11 @@ static void futex_hash_slots_set_verify(int slots)
>>       ksft_test_result_pass("SET and GET slots %d passed\n", slots);
>>   }
>> -static void futex_hash_slots_set_must_fail(int slots, int immutable)
>> +static void futex_hash_slots_set_must_fail(int slots, int flags)
>>   {
>>       int ret;
>> -    ret = futex_hash_slots_set(slots, immutable);
>> +    ret = futex_hash_slots_set(slots, flags);
>>       ksft_test_result(ret < 0, "futex_hash_slots_set(%d, %d)\n",
>>                slots, immutable);
> 
> s/immutable/flags
> 
>>   }
>> @@ -254,18 +254,18 @@ int main(int argc, char *argv[])
>>           ret = futex_hash_slots_set(0, 0);
>>           ksft_test_result(ret == 0, "Global hash request\n");
>>       } else {
>> -        ret = futex_hash_slots_set(4, 1);
>> +        ret = futex_hash_slots_set(4, FH_FLAG_IMMUTABLE);
> 
> This breaks the compilation for me.
> 
> So `#include <linux/prctl.h>` is not working for me, it's not using the 
> local copy at tools/include/uapi/linux/prctl.h

Oh, nevermind, I found the issue:

--- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
+++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
@@ -26,6 +26,7 @@ static int counter;
  #ifndef PR_FUTEX_HASH
  #define PR_FUTEX_HASH                  78
  # define PR_FUTEX_HASH_SET_SLOTS       1
+# define FH_FLAG_IMMUTABLE                (1ULL << 0)
  # define PR_FUTEX_HASH_GET_SLOTS       2
  # define PR_FUTEX_HASH_GET_IMMUTABLE   3
  #endif


