Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D74A2AD32
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 09:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746090737; cv=none; b=YnO534lrxiJ1yxaC0rv7XGK1AS8nXT18yiDmwmL7K6FsTHcrNpOTJrMbm1qU4eHCbgfy+Vulp8WRUsxmKy46SviV88ipx0iJb60az3Eb5gCNOxB+BxoESaYzJOagV0PX5jB4FaNqjLw4sve8UgcYgC95JOiYNkDBEGkt5pb/2j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746090737; c=relaxed/simple;
	bh=2tD5Jux73LwaSNt2LjgT4rosrxpF3w/3rSr37uqz3iI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OkGvlmMsqJmbT4j/j9jWR5uQl367/rdOlyAShWUEEzOr/dK1sxujhYohJHKqFSwty8NLnPREz6/3AUvi17X2ZGy6pdzD0oN1qw1Qo+uo8b/TP+KijhsyvJpHu25bHv6+ZtkSTI0vQLKJeUJwgUO6u12zwcW4rojGKJboj+ry4hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id CFC85439EA;
	Thu,  1 May 2025 09:12:03 +0000 (UTC)
Message-ID: <6826b6a1-8eb6-403e-b118-c1ebd5fdc2d3@ghiti.fr>
Date: Thu, 1 May 2025 11:12:03 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: next-20250422: arch/riscv/kernel/vdso/vdso.so.dbg: dynamic
 relocations are not supported
To: Nathan Chancellor <nathan@kernel.org>, Miguel Ojeda <ojeda@kernel.org>
Cc: naresh.kamboju@linaro.org, anders.roxell@linaro.org,
 aou@eecs.berkeley.edu, arnd@arndb.de, dan.carpenter@linaro.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 lkft-triage@lists.linaro.org, llvm@lists.linux.dev, masahiroy@kernel.org,
 namcao@linutronix.de, palmer@dabbelt.com, regressions@lists.linux.dev
References: <CA+G9fYtN2ie+YtK3H9mrQ5QqrSCFGGjVbtJcfiYX0oHMVWMn9w@mail.gmail.com>
 <20250430154845.795993-1-ojeda@kernel.org> <20250501004434.GA3762678@ax162>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250501004434.GA3762678@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeludelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpeejkeeugfdthefhveelffdvgeetgeelteeijeekheehfeevtdduvdfgteevgfehffenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdhinhhfrhgruggvrggurdhorhhgnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemfedvgegumegrtdegjeemfeejjedumedufegvfhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemfeefkedvmegvfheltdemfedvgegumegrtdegjeemfeejjedumedufegvfhdphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemfedvgegumegrtdegjeemfeejjedumedufegvfhgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepudehpdhrtghpthhtohepnhgrthhhrghnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehnrghrvghshhdrkhgrmhgsohhjuheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnuggvrhhsrdhrohigvghllheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

On 01/05/2025 02:44, Nathan Chancellor wrote:
> On Wed, Apr 30, 2025 at 05:48:45PM +0200, Miguel Ojeda wrote:
>> On Wed, 23 Apr 2025 20:15:45 +0530 Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>>> build errors with clang
>>> ld.lld: error: version script assignment of 'LINUX_4.15' to symbol
>>> '__vdso_getrandom' failed: symbol not defined
>>> llvm-nm: error: arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg: No
>>> such file or directory
>> I have also been seeing this too in my Rust-enabled builds for a few
>> days at least.
> I forgot to follow up here and say that I sent a patch for this, it just
> needs to be applied by the RISC-V folks.
>
> https://lore.kernel.org/20250423-riscv-fix-compat_vdso-lld-v2-1-b7bbbc244501@kernel.org/


Yes, we will, I just want to review the assembly part of the original 
patchset before!

Thanks for the heads-up,

Alex


>
> Cheers,
> Nathan
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
