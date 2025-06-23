Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E602253EB;
	Mon, 23 Jun 2025 08:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667274; cv=none; b=E69dOlczsFZF3RHePSW/8B3UHse5tqYtxwxewkVLp2IYj97mca19aoyLznCgq8J7fgfxtwSBJZWYn1Bym6OSfrkXLfoGhsV5VOPKluAWMgGoOCVkVo4GVFUTNdl70oM9FMyYTuFsGH9ghZGMjKQfUIWFenENh3Yg0cunP1hLvsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667274; c=relaxed/simple;
	bh=0zLEjCG0VOj06Aau1Hewd6jtAnHMseBvtrc0ZA27foU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WLz1DMDJWlp5dWhekHmN5hEALKDPsNL7NH8LFt2aRRkLVlWLHwfFlKI/G2Qbs4wpSNqf1QnIkdBw5LxfGPph2j/gVmOmlJVkkQ3Gt6B2F3UCQ+7AtXHeRc7Ayw1s1RbPru53QikujY97eDkufsxL06K2Z26HdPU906/0HWkVaLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gqzb4YQI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=sPsnNy/Z; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gqzb4YQI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="sPsnNy/Z"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750667271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5TpW8PdAh4HBq1Z6euH+u8O8gkNmzgjavPMSX1mvmM=;
	b=Gqzb4YQIJi/ozNfATPmKOO1s4Cm32jOsinpVrzvIl46Iyv7j7ljxbrDBjgxGN2/7AZbtVh
	xQILYgDuoY5DQIxxM7rQEAF4nRpa+b6BHGuouppEtAihB4TwgSHucsFz4TccAXITJt9aaX
	flIX/sGnXB4lLwWg+xxmo3WxaOfdT4VXGht46Nk9JZtlLjsm7P1ErDwOsfNqwx8SbFUhC/
	1PWsvVrAp/J0oDQf+4qOmcUj+Ot1/yWDEWUC77CNI30fg16SkWO8zDFpmx1xRXxshJdTOL
	q1lH6a6dKWlwUaQsdyinpLR7L6mr3UOrvDpJdY+2j6OPtmv0KpklSfMSsxacAQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750667271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5TpW8PdAh4HBq1Z6euH+u8O8gkNmzgjavPMSX1mvmM=;
	b=sPsnNy/ZDFHWTgW+kV16G/ml7lo1BrghL4pg1Nvoj0Q8P/EiEChGX8XepEhMKusdmPL+dV
	uDepzEC5+UQtH2Bw==
To: Tianyang Zhang <zhangtianyang@loongson.cn>, chenhuacai@kernel.org,
 kernel@xen0n.name, corbet@lwn.net, alexs@kernel.org, si.yanteng@linux.dev,
 jiaxun.yang@flygoat.com, peterz@infradead.org, wangliupu@loongson.cn,
 lvjianmin@loongson.cn, maobibo@loongson.cn, siyanteng@cqsoftware.com.cn,
 gaosong@loongson.cn, yangtiezhu@loongson.cn
Cc: loongarch@lists.linux.dev, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] irq/irq-loongarch-ir:Add Redirect irqchip support
In-Reply-To: <9c60326b-f7bd-0b36-3bc5-0ad7d19690f1@loongson.cn>
References: <20250610114252.21077-1-zhangtianyang@loongson.cn>
 <20250610114252.21077-3-zhangtianyang@loongson.cn> <87o6uris6p.ffs@tglx>
 <9c60326b-f7bd-0b36-3bc5-0ad7d19690f1@loongson.cn>
Date: Mon, 23 Jun 2025 10:27:51 +0200
Message-ID: <87v7omooag.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23 2025 at 10:45, Tianyang Zhang wrote:
> =E5=9C=A8 2025/6/13 =E4=B8=8B=E5=8D=8811:20, Thomas Gleixner =E5=86=99=E9=
=81=93:
>> On Tue, Jun 10 2025 at 19:42, Tianyang Zhang wrote:
>>
>>> +	tail =3D (tail + 1) % INVALID_QUEUE_SIZE;
>> Why is this before the barrier? The barrier does not do anything about
>> this and you can simplify this. See below.
>>
>> And as there is no rmb() counterpart you want to explain that this is
>> serializing against the hardware.
>>> +	 */
>>> +	wmb();
>>> +
>>> +	write_queue_tail(rqueue->node, tail);
>> 	write_queue_tail(rqueue->node, (tail + 1) & INVALID_QUEUE_MASK);
>>
>> No?
>
> The reason fo coding here is that during testing, it was found that a
> barrier is needed between the update of temporary variable 'tail' and
> the operation of register with 'write_queue_tail' , otherwise
> write_queue_tail will probabilistically fail to obtain the correct
> value.

How so?

tail is the software managed part of the ringbuffer which is shared with
the hardware, right?

So even if the compiler would be allowed to reevalutate tail after the
barrier (it is NOT), then tail would still contain the same value as
before, no?

The wmb() is required to ensure that the hardware can observe the full
write of the command _before_ it can observe the update to the tail
index.

Anything else is voodoo.

Thanks,

        tglx
