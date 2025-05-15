Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BD9F4ED
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747284901; cv=none; b=RR6HmxHxbvE/5LHKQVwmYkr7d477AixeVmAxHX87JTsMt6HwDPNXhox9oOL3zsRjTLdH1HpiYZ10Uy81EF0cIRAsLuXgLW8AdlIU1UVVRu7s0ie7GZe1N1iC/5l2oP4UdKWV3a7ZYNSYgh5LKS55hWyj2AJ4X1L7b8kZYC+sA1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747284901; c=relaxed/simple;
	bh=CQV/WjAU9kL/UFhY/mEwBBv6K9aVgMG9E+kE0axrO5U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Hj3nAgYBmrFKnOj7a8OUb7Hditm8ukZ/FAZVSTD4xUop/ERt+q6Ksb5KCo57Lp9/mAuz0Ppuvzjqf6FsN3aNTY9muvDeosKghk/gP6RJ8jItaPWUJ03+wdptu0beo3scocUKDq0G+IDouUNnQdl+iwkASsCCCBwVCEbZtCT2Ba4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=P9ten73v; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="P9ten73v"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54F4sPLY3283743
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 14 May 2025 21:54:26 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54F4sPLY3283743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747284866;
	bh=Dt0QE3AMxSwDM7mvQ1bZ2S7nUnc99GV2fqu0I3w/bQU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=P9ten73vQo7fH+yLfG8paPxDS8vlUwwPsn9qiE2OveBwzvItCzEYhtMMKmItGPvrg
	 Bjr8OcFpf90M68/UX2euJY0OczVwd+sWODlmi46LTGFaQ9p5HC4k5ko4WMisN+lZuX
	 O0xvE8M4tnEkcqMYuhMmpm6SqVAADZRzscw2hx8y97lI827LcwFoFiejxrc+AjBHbJ
	 y8iZ7Ylpxa6kpNjAHzU0iWOsERsPxOPV/+AJ/W8IESu7X81KuRc7pCb6weS9tl/lvk
	 wbeB2KsKrwKVN8gO/3S2A1SC9Hg4ld8yRpLXrm7d2kDveb34m5xTu0TN39u7uFrVYq
	 M3UVbKX6x3SxA==
Date: Wed, 14 May 2025 21:54:23 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ruben Wauters <rubenru09@aol.com>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/cpu/intel: replace deprecated strcpy with strscpy
User-Agent: K-9 Mail for Android
In-Reply-To: <098b949b8ddc5b706adb927d04460943c245bef8.camel@aol.com>
References: <20250507185459.8769-1-rubenru09.ref@aol.com> <20250507185459.8769-1-rubenru09@aol.com> <3AFD7702-7D6F-479C-950A-CA439E01838C@zytor.com> <758195078eee66ce97c05091004bca9d5c3b6cd9.camel@aol.com> <098b949b8ddc5b706adb927d04460943c245bef8.camel@aol.com>
Message-ID: <218DE733-6165-45D8-9338-8DB6A96AB66A@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 14, 2025 12:16:20 PM PDT, Ruben Wauters <rubenru09@aol=2Ecom> wrote:
>On Wed, 2025-05-07 at 21:30 +0100, Ruben Wauters wrote:
>> On Wed, 2025-05-07 at 13:14 -0700, H=2E Peter Anvin wrote:
>> > On May 7, 2025 11:51:36 AM PDT, Ruben Wauters <rubenru09@aol=2Ecom>
>> > wrote:
>> > > strcpy is deprecated due to lack of bounds checking=2E
>> > > This patch replaces strcpy with strscpy, the recommended
>> > > alternative for
>> > > null terminated strings, to follow best practices=2E
>> > >=20
>> > > Signed-off-by: Ruben Wauters <rubenru09@aol=2Ecom>
>> > > ---
>> > > arch/x86/kernel/cpu/intel=2Ec | 2 +-
>> > > 1 file changed, 1 insertion(+), 1 deletion(-)
>> > >=20
>> > > diff --git a/arch/x86/kernel/cpu/intel=2Ec
>> > > b/arch/x86/kernel/cpu/intel=2Ec
>> > > index 584dd55bf739=2E=2Eb49bba30434d 100644
>> > > --- a/arch/x86/kernel/cpu/intel=2Ec
>> > > +++ b/arch/x86/kernel/cpu/intel=2Ec
>> > > @@ -607,7 +607,7 @@ static void init_intel(struct cpuinfo_x86 *c)
>> > > 		}
>> > >=20
>> > > 		if (p)
>> > > -			strcpy(c->x86_model_id, p);
>> > > +			strscpy(c->x86_model_id, p);
>> > > 	}
>> > > #endif
>> > >=20
>> >=20
>> > strscpy() needs a buffer length; this patch wouldn't even compile!
>>=20
>> Hi, this is incorrect, strscpy is defined in string=2Eh as
>> #define strscpy(dst, src, =2E=2E=2E)	\
>> 	CONCATENATE(__strscpy, COUNT_ARGS(__VA_ARGS__))(dst, src,
>> __VA_ARGS__)
>>=20
>> the third parameter is optional, and it works perfectly fine with two
>> parameters=2E I have compiled it, and there are no errors=2E
>>=20
>> > Not to mention that the string in question is generated in such a
>> > way
>> > that cannot be unterminated=2E
>>=20
>> I'm not entirely sure what you mean here? The assignments above are
>> null terminated strings, which the two parameter version works fine
>> with=2E
>
>Hello
>
>Just wanted to check that everything was ok with this patch, and that
>any concerns were addressed or explained=2E Please do let me know if
>there is anything I need to do or change to get this patch applied=2E
>
>Ruben Wauters
>

Yes, I stand corrected=2E=20

I still think it is superfluous (or arguably a memcpy would be better, sin=
ce this is a fixed length) but it doesn't hurt enything=2E
