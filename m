Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7961B292910
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 13:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750427671; cv=none; b=WnVgqUieAx6JGzPmF09G0BPPoKk14mUK72neuMC4pFt6YluF9yj0HXbt7HTPplDo3ghXLpPkMLgikuQ7RWHGixYaCjmubL1mEmM9xn5l8Nzl98F4Fyw17VgAlhw62i94PNnESy4Qoof9BokWocdCW8fCvc+wIkMr/u5Uo0N+djg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750427671; c=relaxed/simple;
	bh=GjWW+UAOEI1Y8xJ4s0fuw1gUr0BfGUhdvPuHSNg1Pg0=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=istJBcpK+eMmc1g3/l+JltrLm8+Mxn8ICmZS8cV30j0mpnzkQyJMtkmdBtknjXshZPVJhxwbOE+RV2Bk/ERAbRl/BWII1VglegdVVAxbkyyfNfBEIW0YLWvL0A3vSyah9sD7uPXNkNCkfl9PzA/V7oIrgjXpiwAKh0Jy8QAmOcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sJ1ND8Md; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IGhPCBbz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sJ1ND8Md";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IGhPCBbz"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750427668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+/d3Ltn6EAjzIfsp2dWcTTas6TSWctHfNuxn8agZc0=;
	b=sJ1ND8MdOAL+iaDpYM+71KYRhwYMzE6ktsDTDk6ggLvH24V5zIoNLZzGGyUFTYsBnXgjX9
	eISBDVzGghCJHZEEArImiLDr0X1k6GQBmwXEql2SZL+iPCndtm9RmDtUEd28m14TmNKA2i
	ZdZUwteOPtgknsfoyqHQnoHj4ERM/N1qDs/O1CoDy9UN97qznpg+BDKRLAMg6IZ/1ghpAB
	FT9Dy/w+Z6DyfaOvK0tAIAYlP4TQR5bJSB0cT5b6ioORjVGabpPwTstgbVJfX33h68KcbN
	sFKD3t/hwrfveji4Zk16x324Y10yqwoEE+8yMdSggMgN0nZvhWt7wIRZeDjMHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750427668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+/d3Ltn6EAjzIfsp2dWcTTas6TSWctHfNuxn8agZc0=;
	b=IGhPCBbzcuPD78o2UNkelSdm0MCWXp6j5mxsJmvLTu27aOpr2w5P/E5FoG0LfUhLMpUR+K
	21NXXdk28aydhkCQ==
To: Li Chen <me@linux.beauty>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86
 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH RESEND] x86/smpboot: avoid SMT domain attach/destroy if
 SMT is not enabled
In-Reply-To: <1965cae22a0.12ab5a70c833868.7155412488566097801@linux.beauty>
References: <1965cae22a0.12ab5a70c833868.7155412488566097801@linux.beauty>
Date: Fri, 20 Jun 2025 15:54:27 +0200
Message-ID: <87msa2r018.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 22 2025 at 16:47, Li Chen wrote:
> Currently, the SMT domain is added into sched_domain_topology
> by default if CONFIG_SCHED_SMT is enabled.
>
> If cpu_attach_domain finds that the CPU SMT domain=E2=80=99s cpumask_weig=
ht
> is just 1, it will destroy_sched_domain it.

If cpu_attach_domain() ..., it will destroy it.

> On a large machine, such as one with 512 cores, this results in
> 512 redundant domain attach/destroy operations.
>
> We can avoid these unnecessary operations by simply checking

s/We can avoid/Avoid/

> cpu_smt_num_threads and not inserting SMT domain into x86_topology if SMT

the SMT domain=20

> is not enabled.
>
> #ifdef CONFIG_SCHED_SMT
> -    x86_topology[i++] =3D (struct sched_domain_topology_level){
> -        cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
> -    };
> +    if (cpu_smt_num_threads > 1) {
> +        x86_topology[i++] =3D (struct sched_domain_topology_level){
> +            cpu_smt_mask, cpu_smt_flags, SD_INIT_NAME(SMT)
> +        };
> +    }

Looks about right, though I really detest this coding style. I'm not
blaming you, as you just followed the already existing bad taste...

Thanks,

        tglx
