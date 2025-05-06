Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F04327587A
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526997; cv=none; b=Yi6g08xwkvMkdjnb68u9ysbe/+JfOFEIyAp4Dx7fKbENF2chlrBNQFV13DeP+3Cdtd+TMm+DHfN0EetpEOytXajcPvwMDAzd9mB5FeKqzswLx84sLKQU0KsFsWRRgUpLOxOxJ0ny54HdYzQxovjMG4ciedD7qEeF4uKRl3fLa8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526997; c=relaxed/simple;
	bh=kcdDVmOQtvvmsn3ve4D242yO8qOFVc2H/ZbPdqoarok=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=kWJRN2JoMa+Sc/olK8gKx8A1B/yF07lrgYYz6tU+lrg2JW3dNr52P45JrmnyDId2TAkDRY3Oxl49O6lrMMViayKs2Woa3XhKXPIyN9oIa5/W7DEJNJSaB5v/ZXSbErtCu1aRYZ8GGMffPS44PAbsfNy6PrT1jLY+O5X+kzfcZWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZLVBTvNf; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=tbFQU7Cs; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZLVBTvNf";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="tbFQU7Cs"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746526993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdSnzmRSIMRrJG41fqcaaOo2w9Hy032pYE4C53FeAxs=;
	b=ZLVBTvNfJRqDpSW5AuqMtIdNH3yfH7+OYc9PQXTP0mBoLFMI/oLtwSPe4Naj2I1k1NhXGj
	lopU+UaNOlPSj3q4dYlVLfosgWonIjooDDFvc9yVtmeLcUf2UV0ce9nd+eIDseUJD4pY1m
	yCmgGT+d/e5ng7Rq+Cr3PMmpItaU/9smUrWbwwVWdybhatXI7GVPckm8lwBpy2EITD05w7
	E4yIQJFZBtdFddroz5cnOWaSTWJ0qx4XSMpUehSZsTDnyCjVfPw/y7wqHwQiazqucxsTsw
	3ltWdkjig7bo4mO/YSGtSU4qs1RHn1n6R3KuyTtGSvXHL52Wxn9Jc+t95MeroA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746526993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gdSnzmRSIMRrJG41fqcaaOo2w9Hy032pYE4C53FeAxs=;
	b=tbFQU7Css3rbdpDQJ34WGORxdQwD+mC2pxuPT7mg+DNeGj2CckfeiZc4akapI2VkIVjzjR
	dSj8TG2c8I8mZWDg==
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/5] irqchip: vt8500: Split up ack/mask functions
In-Reply-To: <CABjd4Yx5O-ivpyZ3ewx5dfLPR2q7N9HU5t9-uOoEDZa3y2woFQ@mail.gmail.com>
References: <20250424-vt8500-intc-updates-v1-0-4ab7397155b3@gmail.com>
 <20250424-vt8500-intc-updates-v1-1-4ab7397155b3@gmail.com>
 <87ldranq87.ffs@tglx>
 <CABjd4Yx5O-ivpyZ3ewx5dfLPR2q7N9HU5t9-uOoEDZa3y2woFQ@mail.gmail.com>
Date: Tue, 06 May 2025 12:23:12 +0200
Message-ID: <87bjs6nilr.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 06 2025 at 12:46, Alexey Charkov wrote:
> On Tue, May 6, 2025 at 11:38=E2=80=AFAM Thomas Gleixner <tglx@linutronix.=
de> wrote:
> Looks like the older commits I was relying on for the preferred prefix
> didn't follow the prescribed format themselves - oh well :)
>
> Ref:
> 0953fb263714 ("irq: remove handle_domain_{irq,nmi}()")
> 1a59d1b8e05e ("treewide: Replace GPLv2 boilerplate/reference with SPDX
> - rule 156")
> d17cab4451df ("irqchip: Kill off set_irq_flags usage")

These three are fine because they are touching multiple files.

> d2aa914d27f1 ("irqchip/vt8500: Use irq_set_handler_locked()")

> 41a83e06e2bb ("irqchip: Prepare for local stub header removal")
> 9600973656c6 ("irqchip: Constify irq_domain_ops")

Ditto

> 0beb65041e86 ("irqchip: vt8500: Convert to handle_domain_irq")

This one preceeds the standard format.

Thanks,

        tglx
