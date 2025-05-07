Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F6F28A735
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 18:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746641296; cv=none; b=XhHZNAxHHpIVYSYXQZqhzaGrFAIUJNrfE4b8vG/0H3N465cjbhzlPn8iN2th9BLYMtDPDAPv2TUVOniAfBaolGCmBQm2agbPUUqTfqotN9IA8LgKXphU9Qt2+g2ybNX2TEXhkX29golaPgN4IVgGwn/BScZhcSaIfNh0Jc3U3X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746641296; c=relaxed/simple;
	bh=wRQLOMHvI3HTlxm/v0c41P++YaXv1tUvC0wnbd8NO3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EERNWj+j7JeMICllSwwaQFVqoTl0otoyNzyKT7RlmTH7eJ1L8ZmgVY/rlgu/sM6CEAU6n/gRRpw6qrfeJPNYgGhom5jq6OMQAuWIKcGD4hrVSQVbXgdjHp8aAe8b+1M5ZKwPN3slms1gdiQ8vDu+f3otM7wthhjw8HFGEkgEOP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=C3lCFW7F; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=O1Js2jKz; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="C3lCFW7F";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="O1Js2jKz"
Date: Wed, 7 May 2025 20:08:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746641293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=046JvbO+j9BtoKAJSoDIsiIXK6l6NTZ81ksrHjX94XY=;
	b=C3lCFW7FfOmH4YVfXqFdPHKNWW6aZZK88v6VrdCN6kzQH4hPFfMQRPyb6kSNCHyhyc6vcJ
	QDxDoQ7iLfQteen3DmbfzDzcGE/+IZGWtHYCG3x2KQrYo2dw36C1H+8CckAbCsuVt3QqM6
	PAcz7vh6wein51dhvQ0m9sZ5zFeL603wuiHptz0pHW4kwH3u90UYg2/DwsKYSSyfZd0esn
	lNAnzNGOpYaZ+L4FclJagrVAjf8IbU5ewRIGdHEDjqeQDZvuUyt9S/tY4kqjg3ToXqiKBD
	eGTo7ImIrLN49UoRujKnyy34FezQm2ntnF6Ulj3Ifvl1lrMaoCup3hUHM5ogZg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746641293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=046JvbO+j9BtoKAJSoDIsiIXK6l6NTZ81ksrHjX94XY=;
	b=O1Js2jKziji+AksK0dDKujzUoUIR96jF4j/DOEJurZSdWCb2FRM2DGp0NYNGhD+HfXUsSv
	ZRjWjQKo4PsggYBg==
From: Nam Cao <namcao@linutronix.de>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Bill O'Donnell <bodonnel@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Joel Granados <joel.granados@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Disallow PR_GET_TAGGED_ADDR_CTRL without Supm
Message-ID: <20250507180811.3CKhxtu0@linutronix.de>
References: <20250507145230.2272871-1-samuel.holland@sifive.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507145230.2272871-1-samuel.holland@sifive.com>

On Wed, May 07, 2025 at 07:52:18AM -0700, Samuel Holland wrote:
> When the prctl() interface for pointer masking was added, it did not
> check that the pointer masking ISA extension was supported, only the
> individual submodes. Userspace could still attempt to disable pointer
> masking and query the pointer masking state. commit 81de1afb2dd1
> ("riscv: Fix kernel crash due to PR_SET_TAGGED_ADDR_CTRL") disallowed
> the former, as the senvcfg write could crash on older systems.
> PR_GET_TAGGED_ADDR_CTRL state does not crash, because it reads only
> kernel-internal state and not senvcfg, but it should still be disallowed
> for consistency.
> 
> Fixes: 09d6775f503b ("riscv: Add support for userspace pointer masking")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kernel/process.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
> index 7c244de77180..f7a1a887ae68 100644
> --- a/arch/riscv/kernel/process.c
> +++ b/arch/riscv/kernel/process.c
> @@ -330,6 +330,9 @@ long get_tagged_addr_ctrl(struct task_struct *task)
>  	struct thread_info *ti = task_thread_info(task);
>  	long ret = 0;
>  
> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SUPM))
> +		return -EINVAL;
> +
>  	if (is_compat_thread(ti))
>  		return -EINVAL;

I think this matches what the man page says:

"If the arguments are invalid or this feature is disabled or unsupported by
the kernel, the call fails with EINVAL"

Reviewed-by: Nam Cao <namcao@linutronix.de>
