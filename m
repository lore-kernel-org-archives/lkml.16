Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181604C80
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 13:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748698364; cv=none; b=ovHBndNuT7vcaWPWznfsVuKv11oTwYJoEmZHP4ky7ies3cjojRLTr9eSInSGExpBBfYzIBOFCfGz6QJ9NCssyFx9KypkIdh1U9qQ/DserH8r7ratAqL7CMvoD5Trnpv5cErYGqLHH+D6Vlx+cbiv7u5+C842mQRkE7wivTgSDT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748698364; c=relaxed/simple;
	bh=oloUOBeG/cmfjpJKwirGN+A9VCP2ftNPG2HJGL2IJtY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cdJIssm+ovpxyFprct+9dJLwdIpK3NaUOMFWUQFlNk5pyoNh6rf3lnq/GeRoIrtRMJE22A/3FS7tsWCGCsFNcocWWHuV4Rf1a4hf0eBq3pkZt5Ze0NQvI2DqIue5Z9ff6l24i/P8GkznqVKtkTbIlwuP3fdNmVJJspaMojmiEeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 380464316C;
	Sat, 31 May 2025 13:32:38 +0000 (UTC)
Message-ID: <1aefb8dc-9145-4cee-b262-7d4212159444@ghiti.fr>
Date: Sat, 31 May 2025 15:32:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] riscv: misaligned: fix misaligned accesses handling
 in put/get_user()
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20250530205658.624195-1-cleger@rivosinc.com>
Content-Language: en-US
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250530205658.624195-1-cleger@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefvddtfeculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtkeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepieffvdeiveeuhfegvddvuefhveejhfffudffhfdufeeuudegtdfguddthfetledvnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepvddttddumeekiedumeeffeekvdemvghfledtmegrfedtkeemieelledtmedvjehfsgemlegrtggrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmegrfedtkeemieelledtmedvjehfsgemlegrtggrpdhhvghloheplgfkrfggieemvddttddumeekiedumeeffeekvdemvghfledtmegrfedtkeemieelledtmedvjehfsgemlegrtggrngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtoheptghlvghgvghrsehrihhvohhsihhntgdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfr
 hgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuh
X-GND-Sasl: alex@ghiti.fr

On 5/30/25 22:56, Clément Léger wrote:
> While debugging a few problems with the misaligned access kselftest,
> Alexandre discovered some crash with the current code. Indeed, some
> misaligned access was done by the kernel using put_user(). This
> was resulting in trap and a kernel crash since. The path was the
> following:
> user -> kernel -> access to user memory -> misaligned trap -> trap ->
> kernel -> misaligned handling -> memcpy -> crash due to failed page fault
> while in interrupt disabled section.
>
> Last discussion about kernel misaligned handling and interrupt reenabling
> were actually not to reenable interrupt when handling misaligned access
> being done by kernel. The best solution being not to do any misaligned
> accesses to userspace memory, we considered a few options:
>
> - Remove any call to put/get_user() potientally doing misaligned
>    accesses
> - Do not do any misaligned accesses in put/get_user() itself
>
> The second solution was the one chosen as there are too many callsite to
> put/get_user() that could potentially do misaligned accesses. We tried
> two approaches for that, either split access in two aligned accesses
> (and do RMW for put_user()) or call copy_from/to_user() which does not
> do any misaligned accesses. The later one was the simpler to implement
> (although the performances are probably lower than split aligned
> accesses but still way better than doing misaligned access emulation)
> and allows to support what we wanted.
>
> These commits are based on top of Alex dev/alex/get_user_misaligned_v1
> branch.
>
> Clément Léger (2):
>    riscv: process: use unsigned int instead of unsigned long for
>      put_user()
>    riscv: uaccess: do not do misaligned accesses in get/put_user()
>
>   arch/riscv/include/asm/uaccess.h | 28 ++++++++++++++++++++++------
>   arch/riscv/kernel/process.c      |  2 +-
>   2 files changed, 23 insertions(+), 7 deletions(-)


We also need to prevent unsafe routines to trigger misaligned accesses, 
I have a patch for this here 
https://github.com/linux-riscv/linux/commit/7c172121aeb235dedeb6f5e06740527530edd6af

Clément, can you add this one to the series please?

I have just  triggered a CI with those fixes on top of my sbi 3.0 branch.

Thanks,

Alex


