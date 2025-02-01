Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EDF1C5D5D
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 16:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738427865; cv=none; b=T2ZUSYYvae+Af+waD5pewZBt/7pNHN4Cv4W+EGvHmOQAbWL7r6iewJLtzCUeRoVVMppoMjR2cmh9+/z/LeYGMPc69/hO4hMOFnHdtbivlbQ+HDJJoQ3t7J1KzXohQOKe0vHfC4SoWtAEBp4X60UiV/Nhhq0UaQdTG7PXP5f435U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738427865; c=relaxed/simple;
	bh=Xsx+h7j2fm0O9kznMhuOvfwmOymLnm1uUUsgRlKvkR4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=oW5z+VxErSbKlQy1Idm8NsFbHrqWqmr8Ckr6ZmcKqYH4hrsblX+/rZz0YQt0BApUHoz8/HZ+OTocjFrJeE771CEHOI2G6VxiD8OdehlXeCfy+WGNCwPBamGlF4oNWMSWSmUUOx2OnZW8cYZl65W0KnAUpEEkWjyUiN8tDhi3oWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ofkNjaVK; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ofkNjaVK"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738427859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D5d2J9YxFE/gyu9Udpry9VU9ZuXZmhyr5X6vJaTZwsk=;
	b=ofkNjaVKFNL8YRLeDxfcCc10Ajba5jZEUiwulw30s3g6smGyDTCb9c1enziUyvhWqr0IB2
	c1zgQMOlfl8zNZIt2/pTXtZi3mJVsL+NVk6CsHuVeZh3jUsvC9zgE545hysDOUnpoopBPN
	ybpW+FveVZw/HwU7hFbzQaraRkq4kqc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.1\))
Subject: Re: [PATCH] m68k: sun3: Use str_read_write() helper in
 mmu_emu_handle_fault()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <CAMuHMdXFxSSm6cOkKprFrOcFzb1wZK1t3vRfooRZqEHDtGDb4A@mail.gmail.com>
Date: Sat, 1 Feb 2025 17:37:26 +0100
Cc: Sam Creasey <sammy@sammy.net>,
 linux-m68k@lists.linux-m68k.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <E7F49FB4-6DDF-47EA-97CA-8DFDC0D2F76C@linux.dev>
References: <20250117120605.126941-2-thorsten.blum@linux.dev>
 <CAMuHMdXFxSSm6cOkKprFrOcFzb1wZK1t3vRfooRZqEHDtGDb4A@mail.gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
X-Migadu-Flow: FLOW_OUT

On 20. Jan 2025, at 16:41, Geert Uytterhoeven wrote:
>> --- a/arch/m68k/sun3/mmu_emu.c
>> +++ b/arch/m68k/sun3/mmu_emu.c
>> @@ -371,7 +372,7 @@ int mmu_emu_handle_fault (unsigned long vaddr, =
int read_flag, int kernel_fault)
>>=20
>> #ifdef DEBUG_MMU_EMU
>>        pr_info("%s: vaddr=3D%lx type=3D%s crp=3D%p\n", __func__, =
vaddr,
>> -               read_flag ? "read" : "write", crp);
>> +               str_read_write(read_flag), crp);
>=20
> You haven't really tested this with DEBUG_MMU_EMU enabled, have you?
> Fix sent.

Sorry, I missed this question.

I compile-tested it with DEBUG_MMU_EMU, but ignored the pr_info() error
you fixed in [1].

Thanks,
Thorsten

[1] =
https://lore.kernel.org/linux-kernel/b1d12a1d24b4aea9f98d905383ba932b2dc38=
2e6.1737387419.git.geert@linux-m68k.org/=
