Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7C672144D4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744044749; cv=none; b=oWMfZQIlYtUEUZT29O1rTzuf+5x/Id1z18FTjiVlM8Wif5lWW4TtjtSUjvKGxvyPsPQ2djyfalYbX5QtoyDQlU22rPz1ciTfoHIjMarLlO96QO7at+KDeofpCOBoerACLfhcCMpnCpd6JB2+XXRkDKSoybyWoaDot/9UGa3eluQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744044749; c=relaxed/simple;
	bh=4KR9s7uUKJcKGFJyvUADu4zmdHz9nhZPtGxr/sO1RV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVNQNPczKLX+vpSXqolyfLuQiuEpHBcHCgvAoH1iuH15/7ZPTXSLD78a11eLgS/PUN4ciWmwv8mg8+luAFohkQXnsMffKc4KRjPsp3cz/c7YcEaC+0rUj/HGSgUAWwvC/7mjCEneZQfaiFTB7kNm84g7+My4xOxiFObksvU/T1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nD90KRHc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1iyN8qSd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nD90KRHc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1iyN8qSd"
Date: Mon, 7 Apr 2025 18:52:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744044745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzwpijb79sYpq1atqI9RBSGUCbM1HfouufuYWxLTXUE=;
	b=nD90KRHcFuzeS5e+JuOWcNt3qfcKVda1SimYPETn7r33ANiwyt+OcdR6I1++JupXoFR2hz
	gBb2aVvdfGgnGf8vQRsRxL1ogdl81rNUGOTUjcGvZGRUCM/LhEEtEPf0BnPl0ja2esZVzM
	Jfu38BKflGEZZoenbPB0FqAlxpLvgw4sPKq7v9gRrUfpZmqrobQZ1EUCi8fPGBaSfnzdjm
	mxYqDx9889D5eEDb/JrwTgc7MBqXrOD6gdOjmR9RcnpGLb6RUN5SPkAiVzhHSdE+oKdA3w
	t1SUAwL8i7RDoI7EnMatIj5al66g600XVT/YQk20BIlBEUAgHVdNOMEgbyLLuw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744044745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hzwpijb79sYpq1atqI9RBSGUCbM1HfouufuYWxLTXUE=;
	b=1iyN8qSdOo78iDGWZ6A4AimIgJ6jNmt3A02ZTTCOioU3SD3z9ys9fWd+yR+Iy2ZWoHRfdp
	rtXj+P1mOEBSBZAA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-kernel@vger.kernel.org
Cc: =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v11 15/19] futex: Implement FUTEX2_NUMA
Message-ID: <20250407165224.z0FmVaXX@linutronix.de>
References: <20250407155742.968816-1-bigeasy@linutronix.de>
 <20250407155742.968816-16-bigeasy@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250407155742.968816-16-bigeasy@linutronix.de>

On 2025-04-07 17:57:38 [+0200], To linux-kernel@vger.kernel.org wrote:
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -332,15 +337,35 @@ __futex_hash(union futex_key *key, struct futex_pri=
vate_hash *fph)
=E2=80=A6
> +	if (node =3D=3D FUTEX_NO_NODE) {
> +		/*
> +		 * In case of !FLAGS_NUMA, use some unused hash bits to pick a
> +		 * node -- this ensures regular futexes are interleaved across
> +		 * the nodes and avoids having to allocate multiple
> +		 * hash-tables.
> +		 *
> +		 * NOTE: this isn't perfectly uniform, but it is fast and
> +		 * handles sparse node masks.
> +		 */
> +		node =3D (hash >> futex_hashshift) % nr_node_ids;

forgot to mention earlier: This % nr_node_ids turns into div and it is
visible in perf top while looking at __futex_hash(). We could round it
down to a power-of-two (which should be the case in my 1, 2 and 4 based
NUMA world) and then we could use AND instead.
ARM does not support NUMA or div so it is not a concern.

Maybe a fast path for 1/2/4 would make sense since it is the most common
one. In case you consider it I could run test to see how significant it
is. It might be that it pops up in "perf bench futex hash" but not be
significant in general use case. I had some hacks and those did not
improve the numbers as much as I hoped for.

> +		if (!node_possible(node)) {
> +			node =3D find_next_bit_wrap(node_possible_map.bits,
> +						  nr_node_ids, node);
> +		}
> +	}
> +
> +	return &futex_queues[node][hash & futex_hashmask];
>  }
> =20
>  /**

Sebastian
