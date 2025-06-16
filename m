Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A9272607
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750049266; cv=none; b=B/0DLqzswDDb3Y2eX8cQLNtyWrDE3GkoQLj2CW7gSx44RiRxoGhxWUeQFc1q4qr1PwxUs+wrwcJgXBks0f+SDpZ7/8YpcFX4t6SHHv3iyyNzox5waeRLPZbr4BxzlzWtgycSinSPCc1i+DdYm9PwKCfAoiLuaQtvSUDIJz3mPeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750049266; c=relaxed/simple;
	bh=JgKxW0HVXtgKY3WO2AkZ7op8Gjhf3Dn0TTLe2zjmwCs=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=bfWQ+CjdTLgrHp5rM7XGROdqPzYv2fVt8j6LBL4KR6IgwxthWrSY5GXNE2b7HzwUm7rrahM6qKms3XKpz87/BlHqqBI1D/aUOOWP9rFOXRuLfBKoE0uQNQ+D4psDlg1jkERzgu0gluCEGvDE/rA9IrWED7SPaxC1gFBdbZgyqrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=pWA5PiBU; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="pWA5PiBU"
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 547B22540192;
	Mon, 16 Jun 2025 00:47:42 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 16 Jun 2025 00:47:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750049262; x=1750135662; bh=ryeev/K4q5bix4317N1FMPzSBxQmiLFLg/h
	yPT7QCME=; b=pWA5PiBUweIBnsC4DY5zU7E0U5O2cafnX5J7s7E1ndhvwUcQqJv
	VOnOJAoBnsj9yaoIGn90pSgiKisljr8ZCVvBM3vksDLuGVUYxBw7ez678gkODmZv
	FNL5Zj7FYJDY+fJiYJvnk3YNSFor4Cq5sx2d1ZLIrA9Zb3WxmVtIV0sQ1hZ7ANQP
	yVYUi4oou3oMLi4U55bqgpuSGBYKntyGkfl9TUDdtdH/wYYsDJwYM34jc16QeMwF
	2no5ukIRT10zSlvjoLTduQGLM0LSxCRh3IlusX106ntYR+nhO1LcBXqgI3GdAsGV
	jiWymvjRHRLv/OA9KwtH5T9+qgfB3SUKVYA==
X-ME-Sender: <xms:7aFPaOoCke5bmCOYJnENWPPk_fGQ207K9vyz-_oezK_XsHRYQg91vw>
    <xme:7aFPaMqVCsDc8audLbUYHKUGDqBglzK3zFdGBdbvdo-lvEbS7KuFRLRwYPufKfIc6
    88J9tvsKZmoWpIDBig>
X-ME-Received: <xmr:7aFPaDObrYBEjf46_VhqkNYcc7i9GjI2vMvAVayd02YgLw551QtBHXooU5iIWOuOVDJ9dbidOCH6DglevO-poXiGCq72kArwoY0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvheeihecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefujgfkfhggtgesthdtredttddtvden
    ucfhrhhomhephfhinhhnucfvhhgrihhnuceofhhthhgrihhnsehlihhnuhigqdhmieekkh
    drohhrgheqnecuggftrfgrthhtvghrnhepleeuheelheekgfeuvedtveetjeekhfffkeef
    fffftdfgjeevkeegfedvueehueelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepfhhthhgrihhnsehlihhnuhigqdhmieekkhdrohhrghdpnhgs
    pghrtghpthhtohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepuggrnhhivg
    hlsedtgidtfhdrtghomhdprhgtphhtthhopehgvggvrhhtsehlihhnuhigqdhmieekkhdr
    ohhrghdprhgtphhtthhopehlihhnuhigqdhmieekkheslhhishhtshdrlhhinhhugidqmh
    eikehkrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgv
    rhhnvghlrdhorhhg
X-ME-Proxy: <xmx:7aFPaN5SQlWD3-SzMj-oyc9hP9cAlCVJonDNK5O5ipGA_V4tsDOnAg>
    <xmx:7aFPaN6AnAhEQRJLNW05YvO5oZcVoI4USJypF49hzJA2ecM4nx_oUA>
    <xmx:7aFPaNju-Bd6oaVVKVmtFk0_yNoHsYWT1MP_a481nAQuKmzM-a15Vw>
    <xmx:7aFPaH5TUc0H3VF8UeNkBcC-8leSllNS2FAa8QIknA1qwNQDTBSZYw>
    <xmx:7qFPaNXPdT2INA6wHUaNM0aaqlAampDTxuxy6QyLT8Yvg5MQ17Iid1cA>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Jun 2025 00:47:39 -0400 (EDT)
Date: Mon, 16 Jun 2025 14:48:32 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Daniel Palmer <daniel@0x0f.com>
cc: geert@linux-m68k.org, linux-m68k@lists.linux-m68k.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] m68k: Enable dead code elimination
In-Reply-To: <20250416114240.2929832-1-daniel@0x0f.com>
Message-ID: <d75712c5-63a1-896f-7750-0e4f28c77127@linux-m68k.org>
References: <20250416114240.2929832-1-daniel@0x0f.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii


On Wed, 16 Apr 2025, Daniel Palmer wrote:

> Allow the experimental dead code elimination config to be enabled.
> 
> For my 68000 nommu config this frees up a few hundred K of memory
> so seems worth while.
> 
> Boot and build tested on nommu and mmu enabled configs.
> 
> Before:
> Memory: 5388K/8192K available (1986K kernel code, 114K rwdata,
> 244K rodata, 92K init, 41K bss, 2624K reserved, 0K cma-reserved)
> 
> After
> Memory: 5684K/8192K available (1714K kernel code, 112K rwdata,
> 228K rodata, 92K init, 37K bss, 2328K reserved, 0K cma-reserved)
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>

With gcc-13.3, enabling DCE here recovered 0.5 MB of memory. Very nice! I 
saw no regressions in basic functionality. I tested on Aranym, Qemu and 
Quadra 605, including module load & unload.

Tested-by: Finn Thain <fthain@linux-m68k.org>

> ---
>  arch/m68k/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/m68k/Kconfig b/arch/m68k/Kconfig
> index eb5bb6d36899..11835eb59d94 100644
> --- a/arch/m68k/Kconfig
> +++ b/arch/m68k/Kconfig
> @@ -32,6 +32,7 @@ config M68K
>  	select HAVE_ASM_MODVERSIONS
>  	select HAVE_DEBUG_BUGVERBOSE
>  	select HAVE_EFFICIENT_UNALIGNED_ACCESS if !CPU_HAS_NO_UNALIGNED
> +	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_UID16
>  	select MMU_GATHER_NO_RANGE if MMU
> 
