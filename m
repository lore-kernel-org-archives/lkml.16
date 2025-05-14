Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A606D20766C
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 08:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747209950; cv=none; b=H3M6krShhDBgHMuN2RVA4ETIvuRNYl7Xb6a27tUBTEBbWYjIe59BlV18GziRtUaFFVATx3AbMSIrDzTyOAdTdgRqkAQqtXltjcj3Lkzc0/QyZ20VvO0akZPsNxpIdViz8k9Xipj8W5ji6sBq5rzH1qKdqmqi+9TdoGVAAZIGqdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747209950; c=relaxed/simple;
	bh=G0c+KGYpHX/ne7L89YowgrFkCDaeF++7GiTizaweXDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SDDdo1GvH4xnaFoQ0oemcdyHcnYe9hDvxEFZBOrZJKffDrBuBH5XIwao2mBA3gFJsUO4ti8LTvJLzYk1FamNqUs+6grxK9g9sPosFZDrCXeYSrBylEUSkR2Zq2S/kM2ZNz4hm3GVioVgQax72LXnAgtzlNW5nOvBsWNgEo+mWak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr; spf=pass smtp.mailfrom=ghiti.fr; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ghiti.fr
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1D3243A88;
	Wed, 14 May 2025 08:05:38 +0000 (UTC)
Message-ID: <7dfa540b-c6c5-46bf-ac78-acd405608afb@ghiti.fr>
Date: Wed, 14 May 2025 10:05:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] riscv: kprobes: Clean up instruction simulation
Content-Language: en-US
To: Nam Cao <namcao@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <cover.1746997351.git.namcao@linutronix.de>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <cover.1746997351.git.namcao@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdeigeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtvdejnecuhfhrohhmpeetlhgvgigrnhgurhgvucfihhhithhiuceorghlvgigsehghhhithhirdhfrheqnecuggftrfgrthhtvghrnhepueefgeehheegtddvgeelgeejjeefudekgeetffeijefgveejudehfffftdelhffhnecukfhppedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeekiedumeeffeekvdemvghfledtmedvrgekvdemvgegsgemudehvgegmeduvgejledphhgvlhhopeglkffrggeimedvtddtudemkeeiudemfeefkedvmegvfheltdemvdgrkedvmegvgegsmeduhegvgeemudgvjeelngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeeipdhrtghpthhtohepnhgrmhgtrghosehlihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpt
 hhtoheprghouhesvggvtghsrdgsvghrkhgvlhgvhidrvgguuhdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-GND-Sasl: alex@ghiti.fr

On 11/05/2025 23:17, Nam Cao wrote:
> Hi,
>
> There is some instruction-processing code in kprobes simulate code. These
> code should be insn.h. In fact, most of them is duplicating insn.h.
>
> This series remove the duplicated bits and make use of macros already
> defined in insn.h. The non-duplicated bits are moved into insn.h.
>
> Nam Cao (11):
>    riscv: kprobes: Move branch_rs2_idx to insn.h
>    riscv: kprobes: Move branch_funct3 to insn.h
>    riscv: kprobes: Remove duplication of RV_EXTRACT_JTYPE_IMM
>    riscv: kprobes: Remove duplication of RV_EXTRACT_RS1_REG
>    riscv: kprobes: Remove duplication of RV_EXTRACT_BTYPE_IMM
>    riscv: kproves: Remove duplication of RVC_EXTRACT_JTYPE_IMM
>    riscv: kprobes: Remove duplication of RVC_EXTRACT_C2_RS1_REG
>    riscv: kprobes: Remove duplication of RVC_EXTRACT_BTYPE_IMM
>    riscv: kprobes: Remove duplication of RV_EXTRACT_RD_REG
>    riscv: kprobes: Remove duplication of RV_EXTRACT_UTYPE_IMM
>    riscv: kprobes: Remove duplication of RV_EXTRACT_ITYPE_IMM
>
>   arch/riscv/include/asm/insn.h            |  9 +++
>   arch/riscv/kernel/probes/simulate-insn.c | 94 +++++-------------------
>   2 files changed, 28 insertions(+), 75 deletions(-)


So for the whole series, you can add:

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks, that's a nice cleanup!

Alex


>
