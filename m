Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6013638F80
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744255789; cv=none; b=IEPfgfIq4vBg+xQGYeuknckLgwERQBpVvPCWTe3NteiQ2fNpG1CMX/tj+/QRiXB7e5OKdjz7Z1BNaTbYo+zLg9QCIpPPWgtdWksVMVzCbZURweMB3uDEUmsnN937WImA+KJtDPnmulWQIS6RYYO0jLAcMjTsB3JupuPhuLzTnC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744255789; c=relaxed/simple;
	bh=2NpHEaLNdtth1Mi0nS15N5j7cpzBfZETBXNOF/u9uEA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gsnaZMXRmCr7cDo1xvGhHEDPKW69gmbn26hgID1HvbjgNgIs3MDs6DhjNQeRtfJ61d4jsBXjJchWUdIUYWuwrdyEDEx88rH/C0XtXtdqEDwnsf/vFltCzzVoxoHHd+JdP3gYphVvs1ScYvKXpyjk+WfuhLgzm8gLBQwszVH1r+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=mWF5Vh3T; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="mWF5Vh3T"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A3TJ593880926
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 9 Apr 2025 20:29:20 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A3TJ593880926
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744255760;
	bh=x91O/a8399AGdLpecJShIVjuwCmnNhTgSTF43PxTOWA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mWF5Vh3TgHYQXjyZgR5qbKKntu+QiK1rsGXWA4tz8+cxYhnAK6bPznYnd+apTngDB
	 KQIbUiUOu2+Gq8Q9FR1iIeZV5/Emw1hZTxBz0gvpqpwmxGWNeKyfj+nwohEhla8Z7c
	 KXVOWtMy2HyJtI+v1z0I1KPkobid9y0NS3VZZOLa++5ChtcY6nR1IG35m7CNYwpC+z
	 ZjCYgpT94gVfcEQObJWwCdvRSsRrFWGVefvkRqfZmYbTcPPoTcHoDA/Co7+Rzw3tuL
	 WpgoZ6WwUsOSyZJyTDpek9ogjLZj5uUTVMUjVkJ6Eun0MdzOY7ZdZ+uDZMePXxQmkX
	 CpE4n+W+KDgOA==
Date: Wed, 09 Apr 2025 20:29:17 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org
CC: Juergen Gross <jgross@suse.com>, Dave Hansen <dave.hansen@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_06/20=5D_x86/msr=3A_Standardiz?=
 =?US-ASCII?Q?e_on_=27u32=27_MSR_indices_in_=3Casm/msr=2Eh=3E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com>
References: <20250409202907.3419480-1-mingo@kernel.org> <20250409202907.3419480-7-mingo@kernel.org> <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com> <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com> <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com>
Message-ID: <3B57B3E5-47C9-4196-AD2B-44916E18B6D0@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 9, 2025 8:18:12 PM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>On 4/9/2025 6:37 PM, H=2E Peter Anvin wrote:
>> On 4/9/25 14:55, Xin Li wrote:
>>>=20
>>> It looks to me that we don't use the "const" qualifier in the code a
>>> lot=2E=C2=A0 However since the MSR index is usually not expected to ch=
ange
>>> inside the MSR API implementations, would it be nicer to add the "cons=
t"
>>> qualifier?
>>>=20
>>> The same to the MSR value of MSR write APIs=2E
>>>=20
>>=20
>> "const" on an automatic variable (including function arguments) is usua=
lly not very meaningful, unless it is manifest as a memory object (see belo=
w=2E)
>>=20
>> Personally I tend to use "const" anyway in more complex functions to ma=
ke it clear that a variable is not expected to change while in scope (and I=
 also prefer to reduce the scope of a variable as much as possible), but fo=
r a simple function like this it is more clutter than anything else=2E
>
>Good point!
>
>A question NOT related to this patch set, the MSR write API prototype
>defined in struct pv_cpu_ops as:
>    void (*write_msr)(unsigned int msr, unsigned low, unsigned high);
>
>Will it be better to add "const" to its arguments?  I=2Ee=2E,
>    void (*write_msr)(const u32 msr, const u32 low, const u32 high);
>
>> Now, "const" on a *memory object* (pointer target) is a very different =
thing and should in general be used where ever writing to an object is not =
going to happen=2E
>>=20
>> An automatic variable becomes manifest as a memory object if its addres=
s is taken anywhere in its scope (using the & operator or an unindexed arra=
y) and the address of that pointer stored=2E The last part means that the c=
ompiler (if it is is smart enough) can take a sequence of operations equiva=
lent to *& and eliminate it=2E
>>=20
>> Keep in mind that, for C (not necessarily C++):
>>=20
>> 1=2E in *all* cases "foo[x]" is exactly equivalent to "*(foo + x)"
>> 2=2E *if* "foo" is declared as an array type, then "foo" is exactly equ=
ivalent to "&foo[0]"=2E
>>=20
>> "const" in C a little less strict than you would like; the only way in =
C before C23 to declare a "true" constant is using enum or a #define macro =
(which of course pollutes the global namespace)=2E In block scope it usuall=
y doesn't matter for scalar types and const or static const will work just =
fine, but it is only in C23 than C imported "constexpr" from C++ (which has=
 had it since C++11=2E)
>Nice to know=2E
>Thanks!
>    Xin

No, that makes no sense (it would have absolutely no effect=2E)
