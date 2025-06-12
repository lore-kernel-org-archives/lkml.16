Received: from relay16.mail.gandi.net (relay16.mail.gandi.net [217.70.178.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953302147EA
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 08:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.178.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749717086; cv=none; b=eyHigmLETh1zrOhF60JWlpj6HV1HJQ7fHDbtEWyFNJ9qBDZvuNDjO0rbmTe02qFCiXvfIi9vOsC3B1h7NJtBAS8564KNAqkrV/JtYbUPUdeG7O1qSap3tVIVdjiKo9qbKprdME6Kb8g81r9na125TuTEiMyzu6MX+AIhkhW1rIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749717086; c=relaxed/simple;
	bh=8YlBWnMGJ3Q9AhB2reyZHY0jA5VnuOzF1vFb1u2n7Ks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lNS2l6MZezW30TYMP7gbvKWWizreWDsr6UV/ZI2lpMQjpKkjozYJoumxl/1RBVwpPp+wdQ4KmcIpWSqol+zZToHV+TmM8lWHAOXtvL2Zvp+tnPj/ELam9pP48P2sjlIDHPYlcWWxCXbcWIfmElvcqYioVOQY6oxjWfzCqfuRGsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.178.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 874C9424BB;
	Thu, 12 Jun 2025 08:31:20 +0000 (UTC)
Message-ID: <7ddda233-99f7-468b-842d-8469f0a86e77@ghiti.fr>
Date: Thu, 12 Jun 2025 10:31:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] vdso: Reject absolute relocations during build
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250611-vdso-absolute-reloc-v3-0-47897d73784b@linutronix.de>
 <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250611-vdso-absolute-reloc-v3-3-47897d73784b@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddugeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepveekjeefjefgieekteefffevteeigfdvgfehgfejfeekgedvkedvledvtefggedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhnuhdrohhrghdpghhithhhuhgsrdgtohhmnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsgdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfhduvggsmehfugelrgemrgguudgumeeifhehsggnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepthhhohhmrghsrdifvghishhsshgthhhuhheslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopehpr
 ghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehnihgtkhdruggvshgruhhlnhhivghrshdolhhkmhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhhushhtihhnshhtihhtthesghhoohhglhgvrdgtohhm

Hi Thomas,

On 6/11/25 11:22, Thomas Weißschuh wrote:
> All vDSO code needs to be completely position independent.
> Symbol references are marked as hidden so the compiler emits
> PC-relative relocations. However there are cases where the compiler may
> still emit absolute relocations, as they are valid in regular PIC DSO code.
> These would be resolved by the linker and will break at runtime.
> This has been observed on arm64 under some circumstances, see
> commit 0c314cda9325 ("arm64: vdso: Work around invalid absolute relocations from GCC")
>
> Introduce a build-time check for absolute relocations.
> The check is done on the object files as the relocations will not exist
> anymore in the final DSO. As there is no extension point for the
> compilation of each object file, perform the validation in vdso_check.
>
> Debug information can contain legal absolute relocations and readelf can
> not print relocations from the .text section only. Make use of the fact
> that all global vDSO symbols follow the naming pattern "vdso_u_".
>
> Link: https://lore.kernel.org/lkml/aApGPAoctq_eoE2g@t14ultra/
> Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120002
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>   lib/vdso/Makefile.include | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/lib/vdso/Makefile.include b/lib/vdso/Makefile.include
> index cedbf15f80874d4bb27c097244bc5b11272f261c..04257d0f28c0ed324e31adbb68497181085752f8 100644
> --- a/lib/vdso/Makefile.include
> +++ b/lib/vdso/Makefile.include
> @@ -12,7 +12,13 @@ c-getrandom-$(CONFIG_VDSO_GETRANDOM) := $(addprefix $(GENERIC_VDSO_DIR), getrand
>   #
>   # As a workaround for some GNU ld ports which produce unneeded R_*_NONE
>   # dynamic relocations, ignore R_*_NONE.
> +#
> +# Also validate that no absolute relocations against global symbols are present
> +# in the object files.
>   quiet_cmd_vdso_check = VDSOCHK $@
>         cmd_vdso_check = if $(READELF) -rW $@ | grep -v _NONE | grep -q " R_\w*_"; \
>   		       then (echo >&2 "$@: dynamic relocations are not supported"; \
> +			     rm -f $@; /bin/false); fi && \
> +		       if $(READELF) -rW $(filter %.o, $(real-prereqs)) | grep -q " R_\w*_ABS.*vdso_u_"; \


This only works for arm64 relocations right? I can't find any *ABS* 
relocations in riscv elf abi 
(https://github.com/riscv-non-isa/riscv-elf-psabi-doc/releases/tag/v1.0).

Thanks,

Alex


> +		       then (echo >&2 "$@: absolute relocations are not supported"; \
>   			     rm -f $@; /bin/false); fi
>
