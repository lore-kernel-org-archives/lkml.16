Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516B11A2643
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 20:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747425848; cv=none; b=MERJszmdu79DX/35J9e8u6xRh5oB9mvkksPzu0xZEaNy78SANN6/Srg101V1sGDpL348nBJJAwinvVuZXbhtbdJcAwRvXHA3VJpsblbd05eSgF3F6S+a+V4zT0wPr1nYwS3bBpCivb+hUlRwXxioMhMMPSuEMEJvtkwB7Mzbb6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747425848; c=relaxed/simple;
	bh=YVm/1i51P8frg/muEXVAop6FWlxp89M1G7+bCaoxdEE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fuf499NFRewnvFOzxtgXlzmH4Hya03R5aV2h4YsoDtLQAND7Low37LQUTHxYjSovO/HfxLr/+o+NaIc6OQljWnWhNoN0bqcZwqwyLMOeBQoTYfu8KrgOHWB6dKbX8edRQdx4LbpjpPI53iorfG0RCmQnind9Gfa02Bf2FrBz9s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=afpTyXj2; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="afpTyXj2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RbygdZtjyopW+266WCNRU9cWfHSn03XMveg/XxwulOM=; b=afpTyXj2N3Q0Qd3ZA9LV0fT6xF
	Y3mmA9pX9BTC8DdinldHD29ucr/cmTdTrac35ZY+BtUI2xBPwkK+YXLbdOuySBFUs4ZjfVMc+x+ax
	d6/M+PcCvOqvFweMXwA8yrf+wsFFI6vVBesEzny2YHYlXsXwbWbqBxLbp8lHemcATovBiTPAkzkYY
	LVSLQ88KajOr8vtDPvWF+0eoQSJuA09kZAU+vB3cgpGp4Qde8X+lSVO64u4NlcDb+N1afFPaonipH
	zS2Tffvy2NJ/dg1cTCnrsR5T8khcaih+aXBtRHLUeY1zjZ4UF1/ikCC7sqlCMkGKDixnWwBA4rxTM
	mSeRKaPA==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uG1Bx-009EEP-K2; Fri, 16 May 2025 22:04:00 +0200
Message-ID: <95608024-1be3-4502-8e41-aba3258010b1@igalia.com>
Date: Fri, 16 May 2025 17:03:55 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] tools headers: Synchronize prctl.h ABI header
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250516160339.1022507-1-bigeasy@linutronix.de>
 <20250516160339.1022507-5-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250516160339.1022507-5-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sebastian,

Thank you for incorporating my feedback :)

Em 16/05/2025 13:03, Sebastian Andrzej Siewior escreveu:
> The prctl.h ABI header was slightly updated during the development of
> the interface. In particular the "immutable" parameter became a bit in
> the option argument.
> 
> Synchronize prctl.h ABI header again and make use of the definition in
> the testsuite.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   tools/include/uapi/linux/prctl.h               |  1 +
>   .../futex/functional/futex_priv_hash.c         | 18 +++++++++---------
>   2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/include/uapi/linux/prctl.h b/tools/include/uapi/linux/prctl.h
> index 21f30b3ded74b..43dec6eed559a 100644
> --- a/tools/include/uapi/linux/prctl.h
> +++ b/tools/include/uapi/linux/prctl.h
> @@ -367,6 +367,7 @@ struct prctl_mm_map {
>   /* FUTEX hash management */
>   #define PR_FUTEX_HASH			78
>   # define PR_FUTEX_HASH_SET_SLOTS	1
> +# define FH_FLAG_IMMUTABLE		(1ULL << 0)
>   # define PR_FUTEX_HASH_GET_SLOTS	2
>   # define PR_FUTEX_HASH_GET_IMMUTABLE	3
>   
> diff --git a/tools/testing/selftests/futex/functional/futex_priv_hash.c b/tools/testing/selftests/futex/functional/futex_priv_hash.c
> index 72a621d9313f3..32abd9acdf186 100644
> --- a/tools/testing/selftests/futex/functional/futex_priv_hash.c
> +++ b/tools/testing/selftests/futex/functional/futex_priv_hash.c
> @@ -30,9 +30,9 @@ static int counter;
>   # define PR_FUTEX_HASH_GET_IMMUTABLE	3
>   #endif
>   
> -static int futex_hash_slots_set(unsigned int slots, int immutable)
> +static int futex_hash_slots_set(unsigned int slots, int flags)
>   {
> -	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, immutable);
> +	return prctl(PR_FUTEX_HASH, PR_FUTEX_HASH_SET_SLOTS, slots, flags);
>   }
>   
>   static int futex_hash_slots_get(void)
> @@ -63,11 +63,11 @@ static void futex_hash_slots_set_verify(int slots)
>   	ksft_test_result_pass("SET and GET slots %d passed\n", slots);
>   }
>   
> -static void futex_hash_slots_set_must_fail(int slots, int immutable)
> +static void futex_hash_slots_set_must_fail(int slots, int flags)
>   {
>   	int ret;
>   
> -	ret = futex_hash_slots_set(slots, immutable);
> +	ret = futex_hash_slots_set(slots, flags);
>   	ksft_test_result(ret < 0, "futex_hash_slots_set(%d, %d)\n",
>   			 slots, immutable);

s/immutable/flags

>   }
> @@ -254,18 +254,18 @@ int main(int argc, char *argv[])
>   		ret = futex_hash_slots_set(0, 0);
>   		ksft_test_result(ret == 0, "Global hash request\n");
>   	} else {
> -		ret = futex_hash_slots_set(4, 1);
> +		ret = futex_hash_slots_set(4, FH_FLAG_IMMUTABLE);

This breaks the compilation for me.

So `#include <linux/prctl.h>` is not working for me, it's not using the 
local copy at tools/include/uapi/linux/prctl.h


