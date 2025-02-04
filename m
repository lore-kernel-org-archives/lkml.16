Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083A42066F7
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 08:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738658659; cv=none; b=sJpRz/5kXkQC8U3ZCFz+/YmK8lM/yH2O1D5dd94KAh9wfRPPmMqKscZxtqSwt6q+j1153NpnHiQLIttUuRmtsz7MmzXWa7+LFbjFNz09z/v6CoM59QfQJOTu1F6GGIG+a3pMbgs1sgwBQ385lfHEIe1NonHrMNwJjhsxiWCk0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738658659; c=relaxed/simple;
	bh=b2pIQbRJjohjuTQV+woyjDEIYDftcYYChl8DWH4PtMY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qSK+zMGeWGb6h/l507mLxXY2XnhiPxN+fl5flq+xWwloWQQISm/hl5mSw+XiSWV4Ldsd8u0nLkgDNQ8dBITGD8CrwxAlkMJzfqnJJjIwJK/dBZg7lEwiyoHjWNEXHR4zmsIEcqNo9RZx1GGkieipaq+c1a2GKQROEAghfVkiV0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A5FD6442E0;
	Tue,  4 Feb 2025 08:44:14 +0000 (UTC)
Message-ID: <916147db-94a5-46df-8a22-1d301059154c@ghiti.fr>
Date: Tue, 4 Feb 2025 09:44:14 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/futex: sign extend compare value in atomic cmpxchg
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <mvmfrkv2vhz.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmfrkv2vhz.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnheptdfhleefjeegheevgeeljeellefgvefhkeeiffekueejteefvdevhfelvdeggeeinecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgedphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemledvgegumehfheefrgemsgegvdgrmeefrgelgegnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehstghhfigrsgesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrk
 hgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Andreas,

On 03/02/2025 11:06, Andreas Schwab wrote:
> Make sure the compare value in the lr/sc loop is sign extended to match
> what lr.w does.  Fortunately, due to the compiler keeping the register
> contents sign extended anyway the lack of the explicit extension didn't
> result in wrong code so far, but this cannot be relied upon.
>
> Fixes: b90edb33010b ("RISC-V: Add futex support.")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>   arch/riscv/include/asm/futex.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
> index fc8130f995c1..6907c456ac8c 100644
> --- a/arch/riscv/include/asm/futex.h
> +++ b/arch/riscv/include/asm/futex.h
> @@ -93,7 +93,7 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
>   		_ASM_EXTABLE_UACCESS_ERR(1b, 3b, %[r])	\
>   		_ASM_EXTABLE_UACCESS_ERR(2b, 3b, %[r])	\
>   	: [r] "+r" (ret), [v] "=&r" (val), [u] "+m" (*uaddr), [t] "=&r" (tmp)
> -	: [ov] "Jr" (oldval), [nv] "Jr" (newval)
> +	: [ov] "Jr" ((long)(int)oldval), [nv] "Jr" (newval)
>   	: "memory");
>   	__disable_user_access();
>   


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

