Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F16F185935;
	Thu, 17 Apr 2025 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744856502; cv=none; b=bCF/mHm7N7gnIrLtns8+eWbHVbQP0RRVKczinRcMbfKhRznXP/LP9Xf0V017C1dw1XvA0/NESNSjj/inbCHpW3TPKTuLInGKQg8BnBC5j5cyaaeChbJtPBxshWGQK0L4PXRkMF+kWGXWs+hjUQ3Vi3HyyhDgvAufnJb5DseiwRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744856502; c=relaxed/simple;
	bh=V2KrCMHax9m0AVZunKMyeYhMXeu9u8+9Jc67ojto8wo=;
	h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=CxLJJDKLt6vn/PMJf9J+rPOeKOYFukSIhUUXiTG0JdbzEX7i5g2AnUCMih/Uym+zHCE++y9DF6rSufvucqimMiT4wLDQzJEcUX4FMaMBYMgrUaMGJ0O1Aow1ZFoLzcCZ1E/A6O0FhNX3uZcrm2r0//1jAwADMxpy6InHGtM8ioA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [10.20.42.24])
	by gateway (Coremail) with SMTP id _____8CxieCvZQBolqbAAA--.12862S3;
	Thu, 17 Apr 2025 10:21:35 +0800 (CST)
Received: from [10.20.42.24] (unknown [10.20.42.24])
	by front1 (Coremail) with SMTP id qMiowMDxvhurZQBoX0SHAA--.20310S3;
	Thu, 17 Apr 2025 10:21:32 +0800 (CST)
Subject: Re: [PATCH v2 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
To: Huacai Chen <chenhuacai@kernel.org>
Cc: kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org,
 si.yanteng@linux.dev, tglx@linutronix.de, jiaxun.yang@flygoat.com,
 peterz@infradead.org, wangliupu@loongson.cn, lvjianmin@loongson.cn,
 maobibo@loongson.cn, siyanteng@cqsoftware.com.cn, gaosong@loongson.cn,
 yangtiezhu@loongson.cn, loongarch@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250331064116.32540-1-zhangtianyang@loongson.cn>
 <20250331064116.32540-3-zhangtianyang@loongson.cn>
 <CAAhV-H5a_220F2sXYRgZM2BHPMuL=K7TaP3gtPiFnw5m6=Qevw@mail.gmail.com>
From: Tianyang Zhang <zhangtianyang@loongson.cn>
Message-ID: <7502f96f-14b1-deac-bd4e-f2ad6c719465@loongson.cn>
Date: Thu, 17 Apr 2025 10:20:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAAhV-H5a_220F2sXYRgZM2BHPMuL=K7TaP3gtPiFnw5m6=Qevw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CM-TRANSID:qMiowMDxvhurZQBoX0SHAA--.20310S3
X-CM-SenderInfo: x2kd0wxwld05hdqjqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUPKb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAF
	wI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jw0_WrylYx0Ex4A2jsIE
	14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
	AE67vIY487MxAIw28IcxkI7VAKI48JMxAqzxv262kKe7AKxVWUAVWUtwCF54CYxVCY1x02
	62kKe7AKxVWUtVW8ZwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVW8ZVWrXw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVW8JVW5JwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07josjUUUUUU=

Hi, Huacai

在 2025/4/1 下午8:30, Huacai Chen 写道:
> +static const struct irq_domain_ops redirect_domain_ops = {
> +       .alloc          = redirect_alloc,
> +       .free           = redirect_free,
> Since this patch needs a new version, you can rename
> redirect_alloc/redirect_free to
> redirect_domain_alloc/redirect_domain_free as other loongson specific
> drivers.
>
> Huacai

Ok, I got it

