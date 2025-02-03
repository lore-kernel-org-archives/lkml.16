Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EB92063C4
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738596834; cv=none; b=o/EAElH+eN4i5EO5/MEGEulfasePMihbHoewKZLPEvOI6UFNjffPquQlL5wem/6MBXi+F0tjWGYKije0VXRW8TDw/TYY+vtyIhzBxoTW28JXNNMe9iqZ3j0fIxBSMYDfWCqrA6mFvx7dIIZ/ArCGEVGkURtYj7c4zuBypdl+zJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738596834; c=relaxed/simple;
	bh=1AMEL90TOYAiTq+wyZ9+Tqush4WsmqodawyJnoTLY5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RVHCYj4aRyMg02ew6J/2X/ndbx1ON5/6SDDupyjwhVFrOoYUZ7LoRzTgP3afIOIUU7duCCt9L2kkbgky6rOq+pvCesQWBj3zXyBDtYX94DGTgEhkoge09BAPqQl+w2ky/jcSES+yO+63D3pOTD9gN6n1DXnKe9mPt7Elplsx9po=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=agTwQGhX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="agTwQGhX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9F6C4CED2;
	Mon,  3 Feb 2025 15:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738596834;
	bh=1AMEL90TOYAiTq+wyZ9+Tqush4WsmqodawyJnoTLY5Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=agTwQGhXyE39J4X2qXtC6qzQG0GXRcmfDq7EvYDSRIDLznwnvxI4aubVD0DpFhtSn
	 l7viQmzRItspd+UwHpdIllNI242e7TsPZRu6SVkwAgJJIPRpe5GEajdt+PB0EIHagb
	 P7iHxcitpmN5w/Z4iIIIZIFNZWqpvo+XitifKURkboN0yG2uCHxRBr2IUZgpoiZzqP
	 ZWKQfQJmUEO8VSthBJ2tpyzmzQaEo2Wzy7LdZSEv4teZDFh+2bJSBmk+NoDk0PaJsV
	 laHiei6F+JyPO2CQE3V+3AgjicN39CW1qhxRV/7qxrnikCW/M7iMF5T5tUKkYSis37
	 5mh20xK5N1suA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
In-Reply-To: <mvmfrkv2vhz.fsf@suse.de>
References: <mvmfrkv2vhz.fsf@suse.de>
Date: Mon, 03 Feb 2025 16:33:50 +0100
Message-ID: <87jza7oxep.fsf@all.your.base.are.belong.to.us>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andreas Schwab <schwab@suse.de> writes:

> Make sure the compare value in the lr/sc loop is sign extended to match
> what lr.w does.  Fortunately, due to the compiler keeping the register
> contents sign extended anyway the lack of the explicit extension didn't
> result in wrong code so far, but this cannot be relied upon.
>
> Fixes: b90edb33010b ("RISC-V: Add futex support.")
> Signed-off-by: Andreas Schwab <schwab@suse.de>

Hmm, in this scenario we *can* rely on it, no (inline vs macro)?

Regardless, having an explicit cast there doesn't hurt, and make it more
obvious!

Reviewed-by: Bj=C3=B6rn T=C3=B6pel <bjorn@rivosinc.com>

Let's add a link to Jessica's comment as well:
Link: https://lore.kernel.org/linux-riscv/CC2D9220-F8DE-4CC8-ACAD-7B1A21E27=
6FE@jrtc27.com/

> ---
>  arch/riscv/include/asm/futex.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/fute=
x.h
> index fc8130f995c1..6907c456ac8c 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -93,7 +93,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *ua=
ddr,
>  		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])	\
>  		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])	\
>  	: [r] "+r" (ret), [v] "=3D&r" (val), [u] "+m" (*uaddr), [t] "=3D&r" (tm=
p)
> -	: [ov] "Jr" (oldval), [nv] "Jr" (newval)
> +	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
>  	: "memory");
>  	__disable_user_access();
>=20=20
> --=20
> 2.48.1
>
>
> --=20
> Andreas Schwab, SUSE Labs, schwab@suse.de
> GPG Key fingerprint =3D 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
> "And now for something completely different."
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
