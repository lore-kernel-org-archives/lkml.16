Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368E454F81
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 23:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746575124; cv=none; b=Qs1zxFWQgNtGKnr0W80SWG8439X0Wr4OcqaZcaCSUuUZyGfwFqD1kpTOpGCPUmhgM+D7SyceshVAKRVNAA1P00KGc66LjcVbMLEaMovyQY/dtQnDsLfi87mgsskhgu7RtAzoCYZE7qwzMJJt7oih87k08DtJWNRkcI429jPRKIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746575124; c=relaxed/simple;
	bh=zHiUTmLLiz0q8t1kQb1yuEr/uPC2Myjkv9uq+t3B7h4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ccjqk7adWMhgJqDd+NdhOiCaQeVcNq2pfMoLxIYkmIALwEx+i+Z20LqIqYe5y94Utdw8JKzMdYodIwAFjvnbKfz07N3rdSEfaPns8oMPHkB/f1LAklzyoOcTNDNUi1NNrXvts90UxtVewJ5Ul0+1hyBLXM5mRmDJ63qfChMFk70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=UYPRQbx7; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="UYPRQbx7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=20Q8sqhfJirUEAK8dAkIMl6JCoz06DQ0g/rjGFp6HMs=; b=UYPRQbx7MgU7YVcRDlhYAEEOmh
	aJ3sRhx0UbcquZ7SMmI2GusIaW9/5Pydk2yyqR6lkHGgpLqAInap/fs+rPwbXNp3MvkpT2nZvkYLF
	bzVp41lv913GLTLam9+urpb4d6EeTHJ26Ak3hCaw9GRKRlU5gIfs00ZNXT9pbV5dod+tqhjGBnrHJ
	xhmJQB8cQXZU9MRmZcOv5xWvgMTGI882XwmmW/zXev7MdcapRpEGgbM2VRiFj+RLa2HmvbV9MYTLn
	Hjlex+oXohbCYc9srHhDD3lpoEp6nb192o/PGCr9Na595UCnGptLsYs7Egq0NbjJGwa3WQDlUZXkT
	gZ7kqeUg==;
Received: from [191.204.192.64] (helo=[192.168.15.100])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uCRuk-004RhB-Dk; Wed, 07 May 2025 01:45:15 +0200
Message-ID: <4b41236e-b4dc-43e1-922a-4bb9dcc318aa@igalia.com>
Date: Tue, 6 May 2025 20:45:06 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 05/21] futex: Create hb scopes
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org
Cc: Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 Valentin Schneider <vschneid@redhat.com>, Waiman Long <longman@redhat.com>
References: <20250416162921.513656-1-bigeasy@linutronix.de>
 <20250416162921.513656-6-bigeasy@linutronix.de>
Content-Language: en-US
From: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
In-Reply-To: <20250416162921.513656-6-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Em 16/04/2025 13:29, Sebastian Andrzej Siewior escreveu:
> From: Peter Zijlstra <peterz@infradead.org>
> 
> Create explicit scopes for hb variables; almost pure re-indent.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   kernel/futex/core.c     |  81 ++++----
>   kernel/futex/pi.c       | 282 +++++++++++++-------------
>   kernel/futex/requeue.c  | 433 ++++++++++++++++++++--------------------
>   kernel/futex/waitwake.c | 193 +++++++++---------
>   4 files changed, 504 insertions(+), 485 deletions(-)
> 
> diff --git a/kernel/futex/core.c b/kernel/futex/core.c
> index 7adc914878933..e4cb5ce9785b1 100644
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -944,7 +944,6 @@ static void exit_pi_state_list(struct task_struct *curr)
>   {
>   	struct list_head *next, *head = &curr->pi_state_list;
>   	struct futex_pi_state *pi_state;
> -	struct futex_hash_bucket *hb;
>   	union futex_key key = FUTEX_KEY_INIT;
>   
>   	/*
> @@ -957,50 +956,54 @@ static void exit_pi_state_list(struct task_struct *curr)
>   		next = head->next;
>   		pi_state = list_entry(next, struct futex_pi_state, list);
>   		key = pi_state->key;
> -		hb = futex_hash(&key);
> +		if (1) {

Couldn't those explict scopes be achive without the if (1), just {}?

> +			struct futex_hash_bucket *hb;

