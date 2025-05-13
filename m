Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DFF74C14
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 22:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174018; cv=none; b=etB6GPbVZGCrjFtuFOq1TFvwHgGygTtSCLaCgxwAvPcQCXyXF7is2H2VfDT2bUhVBPen0HZrgOUH8bpbqm7TYPPgH5DSa4WxgJtXNq+1CnoMbOcXelV3Ug5O2ghKQTjRMNweAikdN/Ibcr2i0goZZaWmDKxVUu8ZjrwNLcPKhMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174018; c=relaxed/simple;
	bh=HJUbc8XFSo4inTWDWL2BbRGsV67lAcWx6XLDZ8xVz3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=COud6MuHoMKlQgxzq2vAiQhqFMrrR4k7DlshkWPHApXqf2wCVmAJKrU0J0KCHEmkrgD42rbPID00r6CAA49KGXi+rmM/yNHeY5QraTT5QQLZFb1Rvj90kPsZYz4Q1kcg3PSXpl0q0yHK+W7s4ra4Ar8mQEGjQiDPx2xV1vYr9r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=bAtjNIDV; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="bAtjNIDV"
Received: from [IPV6:2601:646:8081:9485:bead:f147:c6d9:7c6c] ([IPv6:2601:646:8081:9485:bead:f147:c6d9:7c6c])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54DM6LEK2620903
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 13 May 2025 15:06:21 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54DM6LEK2620903
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747173983;
	bh=pVJey196wmXfz/Fc7Q8KpALZShnAXjVdqGYKSki2z/4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bAtjNIDVkVdBhO05i7E8ssdB5BubxzM1D21/L9ZhJE/juGyluK1WeQSy54XMCBnoB
	 kEBliOBns9ZwlK9p6fJwqBUxXJRA6IK4WDZ2pUen2iZ/1thRsdhhhTvIBJFalywAww
	 TbDDNhNdDK9hJfNPHW0ATOELTxiyCfH+FoIgwN2CjYDzVHAtMzbACmL43dfxuiqk2Z
	 QolWGWIwDaMN2TqnevTUFBjO9kccOoYIugO42WoXdSPdy/+1oD6yEgTdxeqHZWYuZo
	 att3/m888qcoWEhLOQ4TppQkZZFHoggam1n8YpylS4Q8ynFD49Hlt/Ftca+ekLSL/R
	 NFGdRyuKV9RsA==
Message-ID: <9995c81d-1366-445d-8232-bede33ce68af@zytor.com>
Date: Tue, 13 May 2025 15:06:16 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
To: Linus Torvalds <torvalds@linux-foundation.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org,
        "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
 <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
 <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk>
 <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
 <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>
 <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
 <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>
 <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>
 <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk>
 <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com>
 <a719b6ec1ccba2ecad7421a2cdf1660d1be16888.camel@physik.fu-berlin.de>
 <alpine.DEB.2.21.2505131735170.46553@angie.orcam.me.uk>
 <CAHk-=wi3kX2BHU7ABRRE=8-XYYXe8+ZffoxycHYT4TNQee0nBg@mail.gmail.com>
Content-Language: en-US
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <CAHk-=wi3kX2BHU7ABRRE=8-XYYXe8+ZffoxycHYT4TNQee0nBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/13/25 15:02, Linus Torvalds wrote:
> On Tue, 13 May 2025 at 14:55, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>>
>>   Hmm, a .mailmap artifact perhaps
> 
> Ahh, indeed. I was looking at commit feea1db26e5b ("[PATCH] defxx: Use
> irqreturn_t for the interrupt handler") from 2005, but yes, the raw
> commit information has your linux-mips address, and it's just that
> "git log" will translate it to something much newer...
> 
> But I really don't think we've ever been *so* strict about pgp keys
> having all the proper pgp key signature chains. Yes, it's the normal
> rule and the regular way people identify themselves, but nothing
> should ever be mindlessly black-and-white.

Having the discussion with Maciej offlist.

The issue here is obviously not that Maciej is qualified to have a 
kernel.org account (I consider that to be a given), but that we need to 
avoid a "Jia Tan" incident.

	-hpa

