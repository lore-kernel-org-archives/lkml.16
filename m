Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B8B186A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 10:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743072643; cv=none; b=BP0rltzE9Q7UnsgBPt1EIDDS7igIuVWIgMUShwJGxKOrPeFAyGg7OvsiN396empiNH3ybwSbzPl0AUrdJx1U7kN6BFbkqiLg37REZDtC8Wi11NM8KVjA4YQDCaqPbA+afAr/vwIKbfR7vjmlzsESLG16/p0lf1YeAjrFFW7kyfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743072643; c=relaxed/simple;
	bh=3Etc1v+1FBkcRxvZPkphDU3F4+CcdfbDM4ayDQNk2eo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Rvj//j1QrFM4OdMNkazf371B7CqTOu0aQ3m2GjlObzl8p7avLLSNnjnzlNZSNc2EoBmSTcgkQCUK2rzTDMBPWFFGYq1wqXNe08InEYiePlC416tc1n1m+CeqpEAFBMdOiY1FUw/0z1hTC2eQm8RIUCavB24ijtdgelmf6SyDa7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=w5QiF+Ng; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=9RvaO81X; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="w5QiF+Ng";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="9RvaO81X"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1743072640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxd4yTts96xS4GTnalhKXjJPbRhBVTSe9+YNtPsK7NE=;
	b=w5QiF+Ngffpgf36o1pU6RNt8SH5GShe/6UvoslaoRqJ3YOiJgb3fzhGXaUZIOt21iZ/mUy
	IwkLXhvtrt3eNirx779+wjfj1pQoy+aMjzYC01ZQLwLFgs7UA4WSUk3gX0I0S1a+putC19
	oLq+ThDRxdtmi4JeBikSNNc4z+zSnfWsXeveDlvSDp4IYMM7X0MvOOlURwQr+oA3JuSQdL
	32P5aXr+4NOhcUAT566ki7nNcsc84+gCeR7tCq3Q+iXuVvX2ONC81L19ZVVgHiWa0Ml2jp
	9TRB/ini6yu5DGJ145H3IkIab2hnla8y139FNmi+/W1jxvWUfQZHxtKfJ19Www==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1743072640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vxd4yTts96xS4GTnalhKXjJPbRhBVTSe9+YNtPsK7NE=;
	b=9RvaO81XiM7kp71d0A/ICh/OJWIY/ydsI5428sujXgQaIP5LZFXb6ZtchYZjhY1OfkRgHb
	/PfqT0hN/+JlksBg==
To: Eric Dumazet <edumazet@google.com>
Cc: Mateusz Guzik <mjguzik@gmail.com>, kernel test robot
 <oliver.sang@intel.com>, oe-lkp@lists.linux.dev, lkp@intel.com,
 linux-kernel@vger.kernel.org, x86@kernel.org, Benjamin Segall
 <bsegall@google.com>, Frederic Weisbecker <frederic@kernel.org>
Subject: Re: [tip:timers/core] [posix] 1535cb8028:
 stress-ng.epoll.ops_per_sec 36.2% regression
In-Reply-To: <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
References: <202503241406.5c9cb80a-lkp@intel.com> <87pli4z02w.ffs@tglx>
 <6sn76aya225pqikijue5uv5h3lyqk262hc6ru3vemn7xofdftd@sw7gith52xh7>
 <CANn89iKjCgmxtiLeVAiXODHbbR7=gYYi5cfAS1hS5qn+z=-o1Q@mail.gmail.com>
 <877c4azyez.ffs@tglx>
 <CANn89iKAkio9wm73RNi9+KngNaS+Au2oaf0Tz9xOd+QEhFSkyw@mail.gmail.com>
 <CANn89i+nAN+p-qRypKxB4ESohXkKVPmHuV_m86j3DPv6_+C=oQ@mail.gmail.com>
Date: Thu, 27 Mar 2025 11:50:40 +0100
Message-ID: <87v7ruycfz.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27 2025 at 10:11, Eric Dumazet wrote:
> On Thu, Mar 27, 2025 at 9:26=E2=80=AFAM Eric Dumazet <edumazet@google.com=
> wrote:
>
>> We could place all these atomic fields in separate cache lines,
>> to keep read-only fields shared as much as possible.
>>
>
> Following one-liner seems good enough to separate the 4 atomics used
> to control/limit
>
> UCOUNT_RLIMIT_NPROC, UCOUNT_RLIMIT_MSGQUEUE, UCOUNT_RLIMIT_SIGPENDING,
> UCOUNT_RLIMIT_MEMLOCK,
>
>
> diff --git a/include/linux/user_namespace.h b/include/linux/user_namespac=
e.h
> index 7183e5aca282..6cc3fbec3632 100644
> --- a/include/linux/user_namespace.h
> +++ b/include/linux/user_namespace.h
> @@ -120,7 +120,7 @@ struct ucounts {
>         kuid_t uid;
>         atomic_t count;
>         atomic_long_t ucount[UCOUNT_COUNTS];
> -       atomic_long_t rlimit[UCOUNT_RLIMIT_COUNTS];
> +       atomic_long_t ____cacheline_aligned_in_smp rlimit[UCOUNT_RLIMIT_C=
OUNTS];
>  };

Cute. How much bloat does it cause?
