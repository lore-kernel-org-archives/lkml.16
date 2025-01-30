Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC0BD1BDA95
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738246742; cv=none; b=bBxvKCTDS3dv+7DG/D3uQVgh9My2MFtHFpu9TBwYCFTR8rOs+1UN5Xhk535gAAH7Hmg/uFITXqJIdGOQxJdc/DJnlB/1nwrw4Zj/SNz4QiTQsoofDmyOLC0T/PdFzLlsRdvaIV0OzJ/nlzUHtp7/oF7RX9S79kdYF+qSru5y5Kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738246742; c=relaxed/simple;
	bh=huFJZqVBqMBxZ+Sr0+yAHVKHVLF92iEzvgQ9lCZ3dFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VMXPSEvnhrUKiBlypo3ZCsMoz3/Dr2VfRU8/ZerXw8Dq99BBJFvIt0ftXhnUGwWtDCjWDa3U965EvQsJMkXUwzUYmlJ1Zut3eVKkYCzjz1g771QVtUvbzWtjVcy9v6Unx7WD5TTCdEEHV1y1CY4UxpO2BqgcIxkGP89/6DxXG1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B91E41DF3;
	Thu, 30 Jan 2025 14:18:55 +0000 (UTC)
Message-ID: <c9cbc2be-d1fd-44ef-aa14-fd25a5ff8490@ghiti.fr>
Date: Thu, 30 Jan 2025 15:18:54 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv/atomic: Do proper sign extension also for unsigned
 in arch_cmpxchg
Content-Language: en-US
To: Andreas Schwab <schwab@suse.de>, linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
References: <mvmed0k4prh.fsf@suse.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mvmed0k4prh.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeitdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedvledugfelffetkefgleehtedvuefggfeitdeuteegtdeffeelieelheeikedvudenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtdegmegtvggttdemuddutdejmedvvdduleemiegtuggrmeefudefrgemjeelsgdtmegsuggtvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtgeemtggvtgdtmeduuddtjeemvddvudelmeeitggurgemfedufegrmeejlegstdemsggutgdvpdhhvghloheplgfkrfggieemvdgrtdegmegtvggttdemuddutdejmedvvdduleemiegtuggrmeefudefrgemjeelsgdtmegsuggtvdgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehstghhfigrsgesshhushgvrdguvgdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpt
 hhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
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


That's a nice catch indeed. IIUC, we have the same issue here 
https://elixir.bootlin.com/linux/v6.13/source/arch/riscv/include/asm/futex.h#L89 
right?

hanks,

Alex

