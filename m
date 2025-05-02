Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D29376
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 21:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746219610; cv=none; b=qU2o4b03IoYl7SHQXVyE+UAfOGTSUjgeIKqVyMC58hNkmv5HH2Sx4ED07GIHS2qw2UrSrYuMXx5MYbWBG5mDAEytsDhIP0EfqZdvjEWKSmWu1bMwDNUU0CthP0wFANP+J4n/cmoZQKu2yHMgOl2TgmOfi1/jLGd7qDZMmcX0/v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746219610; c=relaxed/simple;
	bh=YxnTM7JeQrOkS6HQh6jSfucSjgaZdpxVqr2SngmdD+w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=W++cAIOj41dplr9BSENIQpKZn31G1IJpI8kA6ST0yOltriGxDUcdro3IIbNKJkRUBj9SIwD60PNQ0V+oe82HoYx6ALqPC8NuWKgy3QG2Tg/1rniduoo3oHMJzp/98EilA70Xdrb3ejo5VU7KOO58dVywDJQCmBEGBi7rhO5ni+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=QbngnwCF; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="QbngnwCF"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 542KxVIc2187021
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 2 May 2025 13:59:32 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 542KxVIc2187021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746219572;
	bh=YxnTM7JeQrOkS6HQh6jSfucSjgaZdpxVqr2SngmdD+w=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=QbngnwCFPSxTRFnW0X8pVNAgJDyCHfml+j1WtUg1fzuYDa8gJlrLGZYJDnR38L/Q1
	 trln/4gE+cU0XMuji4wIbGsFa2bf3xgqJw2B2NPB+bnCzxYlGVldWJx70dC88d6zFL
	 OxUByEOFpLQjZPoVUbxQM3081te7CM4C4g1FEITNmrkdI5EXM3asFEaZBDapSrQ8HJ
	 b0TMHH3EHciLnLwpuGAEAuHP8kWND9wXxdjnGbuZdp4XrlgB3jdDJ31dszNJsJn/fn
	 uS98Y6IRgCmFwwnspuNOJFqL4dPTKyZ3Grme4gmQ8RsRNKO1gAYN7cpdZkd+ssi3Av
	 /QQsmNFHQpcqg==
Date: Fri, 02 May 2025 13:59:30 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/1=5D_x86/reboot=3A_KVM=3A_Guard_nm?=
 =?US-ASCII?Q?i=5Fshootdown=5Fcpus=5Fon=5Frestart=28=29_with_ifdeffery?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ba00197d-dc21-47bd-b183-4971038d9a8d@intel.com>
References: <20241008191555.2336659-1-andriy.shevchenko@linux.intel.com> <ZwbazZpTSAn9aAC7@google.com> <ZwcT149jx-iOmEfl@surfacebook.localdomain> <ZykbvVZ32FKCRT_q@smile.fi.intel.com> <Z_UUXOe61BwVkGob@smile.fi.intel.com> <f670905f-f14b-4482-83ee-568234647f46@intel.com> <Z_U0Vn0V18KYGjkP@smile.fi.intel.com> <d40efb68-eb4e-4158-9dc6-5de101adefd1@intel.com> <aBTQ7-L-bUwzYbKM@smile.fi.intel.com> <ba00197d-dc21-47bd-b183-4971038d9a8d@intel.com>
Message-ID: <2F60FA75-E4F4-41F3-BD5D-EAECBE57A3A4@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 2, 2025 7:24:37 AM PDT, Dave Hansen <dave=2Ehansen@intel=2Ecom> wrot=
e:
>On 5/2/25 07:04, Andy Shevchenko wrote:
>> Can it be applied, please? The problem still persists as of today (v6=
=2E15-rc4)=2E
>
>I fundamentally disagree with the idea that the kernel programmer should
>be doing the work of telling the compiler *exactly* when a static inline
>function is unused=2E Compilers are good at that, humans are not=2E
>
>The "fixes" for these issues generally make the code worse, not better=2E
>
>I'd frankly rather have a kernel with some unused 'static inline'
>functions in =2Ec files than one filled with #ifdefs to shut up the compi=
ler=2E
>

__attribute__((unused)) if they don't need to be inlined?
