Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BC0186358
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658043; cv=none; b=gv6Jftgw1gGo3xm6lFXyXYGiOO3wYuqXu4jZDGWX2Hy9ygZNGCEBHjBZrOPgIj3Xf+LljllME0FRGjYuhceAOX6BbRHHptcYhtTuP6hjewRe6xyuXI0dj0+Lr/B4X6Fu/h6kGgBe9gJZsouISdDhzhUo46X/wdiXc1oqt1oL8Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658043; c=relaxed/simple;
	bh=DWXnfyg5VXjjBbAgCAxIoe1qnZh6EZ3xYfN2ZWI9YZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UkwlwxW3p8F4gwDKtg7+gweKtHIIEXZKDR93R4Ob5xRIKTAz3Kduf5tKrB4b5L6RgWTcLzL2sT7TVHSgeL7zq1i1nHq5Po2gt28MZIhfEr9IBhg1OUFKX0N16z36jZETWjRc+ONxDc60sShATZcI7j8aFXGyR+sXccfW4ZLmfQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 961DD4436B;
	Tue,  4 Feb 2025 08:33:50 +0000 (UTC)
Message-ID: <90c95046-4cdd-4830-be39-d734df137fd3@ghiti.fr>
Date: Tue, 4 Feb 2025 09:33:49 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <mvmed0k4prh.fsf@suse.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehstghhfigrsgesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Andreas,

On 30/01/2025 10:25, Andreas Schwab wrote:
> Sign extend also an unsigned compare value to match what lr.w is doing.
> Otherwise try_cmpxchg may spuriously return true when used on a u32 value
> that has the sign bit set, as it happens often in inode_set_ctime_current.
>
> Do this in three conversion steps.  The first conversion to long is needed
> to avoid a -Wpointer-to-int-cast warning when arch_cmpxchg is used with a
> pointer type.  Then convert to int and back to long to always sign extend
> the 32-bit value to 64-bit.
>
> Fixes: 6c58f25e6938 ("riscv/atomic: Fix sign extension for RV64I")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/include/asm/cmpxchg.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
> index 4cadc56220fe..427c41dde643 100644
> --- a/arch/riscv/include/asm/cmpxchg.h
> +++ b/arch/riscv/include/asm/cmpxchg.h
> @@ -231,7 +231,7 @@
>   		__arch_cmpxchg(".w", ".w" sc_sfx, ".w" cas_sfx,		\
>   			       sc_prepend, sc_append,			\
>   			       cas_prepend, cas_append,			\
> -			       __ret, __ptr, (long), __old, __new);	\
> +			       __ret, __ptr, (long)(int)(long), __old, __new);	\
>   		break;							\
>   	case 8:								\
>   		__arch_cmpxchg(".d", ".d" sc_sfx, ".d" cas_sfx,		\


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

