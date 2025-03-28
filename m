Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEDE1EF1D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166464; cv=none; b=H76jkiYanbfD6ypHhpsbKVtOQBB8aEr8DcYNR2d2H3a1lsfvi/6MTk/EOMwC8hY+vEtLqPtY2OQKxXYzoTep5AtGuVO9kbuFpRG71HEwJcMaEpmid+kzofbDFrZsIq2ndUmZnhMCYCi9dZ/1QMONdPPmFgSELABsJyIyju9jhnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166464; c=relaxed/simple;
	bh=evJFnI7UHfzD/tkLPZ5hOgejOMXT6euXKzsMssE4rH4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RAs7mXgpI0YfkoG/lTfsvIhpI+jWdmobVFx2G00K1hQWtUq7/UgI22HK3ogWThEntfn6f38DUmYFL9bVv3+2Goe1GPCU6u/uaVgURAm/nv87ZG6AjFKtNw4UChkUUrC5wId0I6gEh0B96My2skmbfcBmvl4ZZTxiebReY7200eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id 879F4443E1;
	Fri, 28 Mar 2025 12:54:18 +0000 (UTC)
Message-ID: <c68ce83f-557e-4cf0-b72b-4424098e4afc@ghiti.fr>
Date: Fri, 28 Mar 2025 13:54:17 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fixes] riscv/purgatory: 4B align purgatory_start
Content-Language: en-US
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Daniel Maslowski <cyrevolt@googlemail.com>,
 Li Zhengyu <lizhengyu3@huawei.com>, linux-kernel@vger.kernel.org
References: <20250328085313.1193815-1-bjorn@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250328085313.1193815-1-bjorn@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujedufeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpefhhfdtfeejtefgvdfhheeghfetkeekveffheehgeettdeiudehledtgeehueelffenucffohhmrghinhepvghnthhrhidrshgsnecukfhppeefuddrfedvrdekuddrudekjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeefuddrfedvrdekuddrudekjedphhgvlhhopegludelvddrudeikedrvddurdefudgnpdhmrghilhhfrhhomheprghlvgigsehghhhithhirdhfrhdpnhgspghrtghpthhtohepkedprhgtphhtthhopegsjhhorhhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehprghulhdrfigrlhhmshhlvgihsehsihhfihhvvgdrtghomhdprhgtphhtthhopehprghlmhgvrhesuggrsggsvghlthdrtghomhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepsghjohhrnhesrhhivhhoshhinhgtrdgtohhmpdhrtghpt
 hhtoheptgihrhgvvhholhhtsehgohhoghhlvghmrghilhdrtghomhdprhgtphhtthhopehlihiihhgvnhhghihufeeshhhurgifvghirdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

Hi Björn,

On 28/03/2025 09:53, Björn Töpel wrote:
> From: Björn Töpel <bjorn@rivosinc.com>
>
> When a crashkernel is launched on RISC-V, the entry to purgatory is
> done by trapping via the stvec CSR. From riscv_kexec_norelocate():
>
>    |  ...
>    |  /*
>    |   * Switch to physical addressing
>    |   * This will also trigger a jump to CSR_STVEC
>    |   * which in this case is the address of the new
>    |   * kernel.
>    |   */
>    |  csrw    CSR_STVEC, a2
>    |  csrw    CSR_SATP, zero
>
> stvec requires that the address is 4B aligned, which was not the case,
> e.g.:
>
>    | Loaded purgatory at 0xffffc000
>    | kexec_file: kexec_file_load: type:1, start:0xffffd232 head:0x4 flags:0x6
>
> The address 0xffffd232 not 4B aligned.
>
> Correct by adding proper function alignment.
>
> With this change, crashkernels loaded with kexec-file will be able to
> properly enter the purgatory.
>
> Fixes: 736e30af583fb ("RISC-V: Add purgatory")
> Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
> ---
>   arch/riscv/purgatory/entry.S | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
> index 0e6ca6d5ae4b..c5db2f072c34 100644
> --- a/arch/riscv/purgatory/entry.S
> +++ b/arch/riscv/purgatory/entry.S
> @@ -12,6 +12,7 @@
>   
>   .text
>   
> +.align	2
>   SYM_CODE_START(purgatory_start)
>   
>   	lla	sp, .Lstack
>
> base-commit: acb4f33713b9f6cadb6143f211714c343465411c


Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks,

Alex

