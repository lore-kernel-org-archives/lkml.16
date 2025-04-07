Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3ABB1F3FD7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036677; cv=none; b=tBRqO9Zjgu0T+thRor6rbkBZcX1xY7D+SdkAfXqKByZxHKt99I1+MYoaMRcW5fRz9Pi73Ay914+Ej2mOukR/npW6XWURN7pnX7BODaFqPGS5FWAI59pH5UeoWI+/IXEsP/NPhGTdvrSbFyzrsKi4A5CnqjOYuKEEmbJ4LYLZddk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036677; c=relaxed/simple;
	bh=Viw1/vsSFS4tMVWbylAf/FSdtFupU6TLICH4UYgv6oQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=n4VHGbl4pvZ0JV0rsf0tJK3hc9oj49up01VE7ZAUKdvuDYC5dvuLPYLtXLUf2s77SoozPtO2+BxwYsYdfvKt0kNIatqFVOYSY2BdMQGAD6GGlnt9B8U8Vfi/p/Q1tVLHAlk/Uh93yButD7qlobE702x2HYUgc+OfrRAw0LPAY/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Bo4Kqmz4; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Bo4Kqmz4"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 537Eb2ho2459979
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 7 Apr 2025 07:37:03 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 537Eb2ho2459979
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744036623;
	bh=NW/RA2m+4jZ+WDc7pzOzngjZEMupvmS2HpHLLeRZwOU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Bo4Kqmz4xmBpjfn6AclxpXLoGKX7GZytoJf9v0fO9FtRQomshL/0HUl1XZUAWZvxu
	 H00dPU+Tg9BMh1yC7qomWAzWCuCGNddcRde5F5vxduzNZ9I0PTiqigKVHnMJsQAJgP
	 j2dSMoq8/+kWwtS556NjBKEqi7HF8Yzs+NHhZ4LqCD5tLH8wlhHtkLe2jCy4zcXQWi
	 O1Csj4B6WY9cHrbudSpwmv+f2entNokdUO5wN7vyDFfR0HftdZLpKx15X7nMAj2ZyP
	 hC2ot7uBoDPiqunH35+BR9R1KkQa11DHTUq+18Fr8QWwI78Ry+4+MKQjJu/OYaeyi1
	 GI1HvbegOZxWg==
Date: Mon, 07 Apr 2025 07:36:59 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Borislav Petkov <bp@alien8.de>, Kevin Koster <lkml@ombertech.com>
CC: Thomas Gleixner <tglx@linutronix.de>, Oerg866 <oerg866@googlemail.com>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_x86/microcode=3A_Fix_crashes_o?=
 =?US-ASCII?Q?n_early_486_CPUs_due_to_usage_of_=27cpuid=27=2E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com> <20250405130306.ca9822c1f27db119cc973603@ombertech.com> <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local> <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com> <20250406174633.2c581923c145687476191753@ombertech.com> <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local> <20250407095848.7933a358c9f450fe03fb8234@ombertech.com> <20250407102927.GAZ_OpBw5hJ2QTFsKz@fat_crate.local>
Message-ID: <8E818E60-B112-429F-8537-6313258CFCF9@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 7, 2025 3:29:27 AM PDT, Borislav Petkov <bp@alien8=2Ede> wrote:
>On Mon, Apr 07, 2025 at 09:58:48AM +1000, Kevin Koster wrote:
>> But I like to know Linux really works on the hardware it's built for,
>
>I don't know what that means=2E
>
>> and I'm not much better, writing this now on a Pentium 1=2E
>
>Lemme guess: this is your main machine you use for daily work?
>
>:-\
>
>> > -	if (dis_ucode_ldr || c->x86_vendor !=3D X86_VENDOR_AMD || c->x86 < =
0x10)
>> > +	if (microcode_loader_disabled() || c->x86_vendor !=3D X86_VENDOR_AM=
D || c->x86 < 0x10)
>> 		return 0;
>>=20
>> Still fails unless the native_cpuid_eax(1) call is moved under here=2E =
After that
>> change, it boots fine=2E
>
>Please show me with a diff what you're doing because I don't know what yo=
u
>mean=2E
>
>I did this:
>
>bool have_cpuid_p(void)
>{
>        return false;
>}
>
>in order to simulate no CPUID support but my 32-bit guest boots fine=2E
>
>Also, send a full dmesg from that machine so that I can try to reproduce =
here=2E
>
>Thx=2E
>

Well, Linus' original box was a 386 (SX, I think?) so that ship sailed alr=
eady=2E
