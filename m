Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3E72E62B8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 23:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743723289; cv=none; b=QldeFqlvMnoCGoWTq2NkWxC17Obh1TChhz3EYai+cM3BvvItvz8P5n+ODJkVCB6GWnT1rQy7XX35VHxINQwm5l3L+CwxTLiBpm7rs8Cmkc3ssodV3yLsPOxH1dqRKhDHAYk8FdbFohqrv+KRBYlddHpIzq5a5MyREbdIX0xwcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743723289; c=relaxed/simple;
	bh=0Kbv4kpwPVwQk1EHNve/zA/ml+BS0JZbsxhjWNumtT0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=GWBFHxUjDyMf596wY/WjjGvqneoeQQA9+lGIlm2ffpbWrIcadTk1FNVR19TnRvF6edmBs0NsIO9cXtE4CMNHzNRscCQ6/8NK6wTkVaJ3PwFZTDmvfRwBJ2UcOfbwTprgf0XfjFHOsxKtclOyUMwVPIZQqCUOIZpWkfCwPBgOlSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N758/Alh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N758/Alh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2600CC4CEEA;
	Thu,  3 Apr 2025 23:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743723288;
	bh=0Kbv4kpwPVwQk1EHNve/zA/ml+BS0JZbsxhjWNumtT0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=N758/Alhf0E/X0t9YYuUaWHzckOP2M7HbjD5BPWS1wmfTLXbm3Y9lfG9GwFwqqNse
	 x8wHpuBfO6SOJ+U4UgVpr9cVGMWXA1e7ynqqSDwTHf2DGDr4zM1Q+Kd8EeChwPG5Ni
	 K1/uW30aR0r3xfCIc9I+g0vGR8zN+NsyTakOIrMR6TauZ2rDjXppu5JxN7nyyEhFTz
	 KoXxWFob7zuIGu8yKU62oes/eYLtUHgBXvGroav3HjwaE9UprbHTlFs8Ed6hIl8GIu
	 2NHRnB3lo41aMZEP+eCZsJNuiljB8JlHpFnfsPcH4puIj7M3JF0CSbboVl3SNdx54Y
	 llV6leMhv7QMg==
Date: Fri, 4 Apr 2025 08:34:42 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Qinxin Xia <xiaqinxin@huawei.com>, Mark Rutland <mark.rutland@arm.com>
Cc: <yangyicong@huawei.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <naveen.n.rao@linux.ibm.com>, <anil.s.keshavamurthy@intel.com>,
 <davem@davemloft.net>, <linuxarm@huawei.com>,
 <linux-kernel@vger.kernel.org>, <fanghao11@huawei.com>,
 <prime.zeng@hisilicon.com>, <xuwei5@huawei.com>,
 <jonathan.cameron@huawei.com>
Subject: Re: [PATCH v7] arm64: kprobe: Enable OPTPROBE for arm64
Message-Id: <20250404083442.5317827966254c89382cc3f4@kernel.org>
In-Reply-To: <20250216070044.1792872-1-xiaqinxin@huawei.com>
References: <20250216070044.1792872-1-xiaqinxin@huawei.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 16 Feb 2025 15:00:44 +0800
Qinxin Xia <xiaqinxin@huawei.com> wrote:

> 
> +#define        OPT_SLOT_SIZE   65536
> +
> +	.global optinsn_slot
> +optinsn_slot:
> +	.space  OPT_SLOT_SIZE
> +
> +SYM_CODE_START(optprobe_common)
> +	stp x2, x3, [sp, #S_X2]
> +	stp x4, x5, [sp, #S_X4]
> +	stp x6, x7, [sp, #S_X6]
> +	stp x8, x9, [sp, #S_X8]
> +	stp x10, x11, [sp, #S_X10]
> +	stp x12, x13, [sp, #S_X12]
> +	stp x14, x15, [sp, #S_X14]
> +	stp x16, x17, [sp, #S_X16]
> +	stp x18, x19, [sp, #S_X18]
> +	stp x20, x21, [sp, #S_X20]
> +	stp x22, x23, [sp, #S_X22]
> +	stp x24, x25, [sp, #S_X24]
> +	stp x26, x27, [sp, #S_X26]
> +	stp x28, x29, [sp, #S_X28]
> +	add x2, sp, #PT_REGS_SIZE
> +	str x2, [sp, #S_SP]
> +	/* Construct a useful saved PSTATE */
> +	mrs x2, nzcv
> +	mrs x3, daif
> +	orr x2, x2, x3
> +	mrs x3, CurrentEL
> +	orr x2, x2, x3
> +	mrs x3, SPSel
> +	orr x2, x2, x3
> +	adr x1, 2f
> +	stp x1, x2, [sp, #S_PC]
> +
> +	/* set the pt_regs address to x1 */
> +	mov x1, sp
> +	/* store lr of optprobe_common temporary */
> +	stp x29, x30, [sp, #-16]!
> +	mov x29, sp
> +
> +	bl optprobe_optimized_callback
> +
> +	ldp x29, x30, [sp], #16
> +
> +	ldr x0, [sp, #S_PSTATE]
> +	and x0, x0, #(PSR_N_BIT | PSR_Z_BIT | PSR_C_BIT | PSR_V_BIT)
> +	msr nzcv, x0

BTW, can this code save all registers including flags?
Previously I talked with Mark and he mentioned there is no way to
save pstate register correctly. That is why we could not implement
this feature.


Thank you,


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
