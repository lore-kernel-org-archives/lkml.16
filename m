Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F871C27
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 01:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748223964; cv=none; b=jrURJfxREYC4ulLGF06IhkC+XQXJavN3Jojoo7RarX7xiqrG42r9D9MTbXsBhYeAHklG4tq2IDTzcH2w3GU2w6oZIeHoIBFf8DyZOyBteG/FY1eAXFgGdqyykHVAc1So1z88JUG9n0yCEup8w83oaDn2PXZsr3ElC/LTJTaTAh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748223964; c=relaxed/simple;
	bh=avQT8PyI3lebe+jvDhFejRbfs5/P6o/qFy8DbdNBJ7c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OtDzLBYJNi8eDaMT1hsf2pqgpbaq2cl9cdM7xkKy52ko+l+Galf0Drvz9H+QZOVOptxruf3g2lKYRPpLLyr2UyYy00WiBae1Fgxt4TvviUikc1FdKwaQyjoboQpjFZ4eU2W7Teu2i1uQ0jaeiodVX/SgHthJV2Ex3k8DOAxYmoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=D1NqYsc5; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="D1NqYsc5"
Message-ID: <2b8810d1-b312-4ee6-928c-e078b8c52000@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748223959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=E9kj9b7G03RkcCUZzfbgk5ZYXL85YjieEBuLF4BZ1dk=;
	b=D1NqYsc5sCvF5UWehhuKAxPft2KqmSx1u9333NBHR0p0MPpgRd9vUurqLc4wYmU7IaiNuz
	PG3PwwZpIS4yjHEB0A30yrRAwn5QwFscTvrBlPTnPkYopNAPGNQcyyYW8wvHGMhequnDMM
	zQw2QCEKTkfOBSLrX9nn5sJlFmPqb2k=
Date: Mon, 26 May 2025 09:45:47 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/2] Docs/LoongArch: Add Advanced Extended-Redirect IRQ
 model description
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, tglx@linutronix.de,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250523101833.17940-1-zhangtianyang@loongson.cn>
 <20250523101833.17940-2-zhangtianyang@loongson.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20250523101833.17940-2-zhangtianyang@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 5/23/25 6:18 PM, Tianyang Zhang 写道:
> Introduce the redirect interrupt controllers.When the redirect interrupt
> controller is enabled, the routing target of MSI interrupts is no longer a
> specific CPU and vector number, but a specific redirect entry. The actual
> CPU and vector number used are described by the redirect entry.
>
> Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>

Only for Chinese:


Reviewed-by: Yanteng Si <si.yanteng@linux.dev>


Thanks,

Yanteng

> ---
>   .../arch/loongarch/irq-chip-model.rst         | 38 +++++++++++++++++++
>   .../zh_CN/arch/loongarch/irq-chip-model.rst   | 37 ++++++++++++++++++
>   2 files changed, 75 insertions(+)
>
> diff --git a/Documentation/arch/loongarch/irq-chip-model.rst b/Documentation/arch/loongarch/irq-chip-model.rst
> index a7ecce11e445..d9a2e8d7f70e 100644
> --- a/Documentation/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/arch/loongarch/irq-chip-model.rst
> @@ -181,6 +181,44 @@ go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then go to CPUINTC directly::
>                | Devices |
>                +---------+
>   
> +Advanced Extended IRQ model (with redirection)
> +==============================================
> +
> +In this model, IPI (Inter-Processor Interrupt) and CPU Local Timer interrupt go
> +to CPUINTC directly, CPU UARTS interrupts go to LIOINTC, PCH-MSI interrupts go
> +to REDIRECT for remapping it to AVEC, and then go to CPUINTC directly, while all
> +other devices interrupts go to PCH-PIC/PCH-LPC and gathered by EIOINTC, and then
> +go to CPUINTC directly::
> +
> + +-----+     +-----------------------+     +-------+
> + | IPI | --> |        CPUINTC        | <-- | Timer |
> + +-----+     +-----------------------+     +-------+
> +              ^          ^          ^
> +              |          |          |
> +       +---------+ +----------+ +---------+     +-------+
> +       | EIOINTC | | AVECINTC | | LIOINTC | <-- | UARTs |
> +       +---------+ +----------+ +---------+     +-------+
> +            ^            ^
> +            |            |
> +            |      +----------+
> +            |      | REDIRECT |
> +            |      +----------+
> +            |            ^
> +            |            |
> +       +---------+  +---------+
> +       | PCH-PIC |  | PCH-MSI |
> +       +---------+  +---------+
> +         ^     ^           ^
> +         |     |           |
> + +---------+ +---------+ +---------+
> + | Devices | | PCH-LPC | | Devices |
> + +---------+ +---------+ +---------+
> +                  ^
> +                  |
> +             +---------+
> +             | Devices |
> +             +---------+
> +
>   ACPI-related definitions
>   ========================
>   
> diff --git a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> index d4ff80de47b6..7e4e3e55c7ad 100644
> --- a/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> +++ b/Documentation/translations/zh_CN/arch/loongarch/irq-chip-model.rst
> @@ -174,6 +174,43 @@ CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断发送到AVECINTC，
>                | Devices |
>                +---------+
>   
> +高级扩展IRQ模型 (带重定向)
> +==========================
> +
> +在这种模型里面，IPI（Inter-Processor Interrupt）和CPU本地时钟中断直接发送到CPUINTC，
> +CPU串口（UARTs）中断发送到LIOINTC，PCH-MSI中断首先发送到REDIRECT模块,完成重定向后发
> +送到AVECINTC，而后通过AVECINTC直接送达CPUINTC，而其他所有设备的中断则分别发送到所连
> +接的PCH-PIC/PCH-LPC，然后由EIOINTC统一收集，再直接到达CPUINTC::
> +
> + +-----+     +-----------------------+     +-------+
> + | IPI | --> |        CPUINTC        | <-- | Timer |
> + +-----+     +-----------------------+     +-------+
> +              ^          ^          ^
> +              |          |          |
> +       +---------+ +----------+ +---------+     +-------+
> +       | EIOINTC | | AVECINTC | | LIOINTC | <-- | UARTs |
> +       +---------+ +----------+ +---------+     +-------+
> +            ^            ^
> +            |            |
> +            |      +----------+
> +            |      | REDIRECT |
> +            |      +----------+
> +            |            ^
> +            |            |
> +       +---------+  +---------+
> +       | PCH-PIC |  | PCH-MSI |
> +       +---------+  +---------+
> +         ^     ^           ^
> +         |     |           |
> + +---------+ +---------+ +---------+
> + | Devices | | PCH-LPC | | Devices |
> + +---------+ +---------+ +---------+
> +                  ^
> +                  |
> +             +---------+
> +             | Devices |
> +             +---------+
> +
>   ACPI相关的定义
>   ==============
>   
