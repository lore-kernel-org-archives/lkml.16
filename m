Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27877202F89
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744268446; cv=none; b=PLAjcGo8q6HwH19pcXqC7PzwWwUKyJI15dn19HkeWLbzl1C4N1gpWLL7zIlLljfZoSgOy9eIPGmYgcx2erVbI1B4wMXJBnIJSIKao+zUe2epAnfaGVJVK5g8HVTyhnyoXHYZAnsQd5zwuWmOhgx+q2tyZsJGZW7E6kyO5WyeASo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744268446; c=relaxed/simple;
	bh=Zo3qD+qta1T2dwFQVn7L5W48yX0v0nSWrnDGjD04Xn0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PncmoenNQ5T2Im1wWwG44/RjScAICzA3iAISPS93cCZpYUxdxrrKcYJomMT3Eoyk5QiLBVwh/YoNgkxxrCFSF2/X2WK7WPoJqma2vaWl0XMxEVrUnlwKmbZdKfmcfZIrVPNdukeCn5ODqrtR3k9mEsAI+33r8Os40mRBZvXhbJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=mr6Cb+z9; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="mr6Cb+z9"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A70F143960254
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Apr 2025 00:00:16 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A70F143960254
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744268417;
	bh=0vf1sggFwT7+P8+/iv0LlDIZHwukQCnr9JbP8I4T4rs=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=mr6Cb+z9wZ+uYYLt/K2oPKXfU7ERRwU3OKks/kc85Tl9NfhIUCySjI4aw5Lj1gT0P
	 D+1W+yvwFpo8Ez/DImuLrP0EfTSqV1LuG64BhwOhk6kSKZKClqSaNaDMZ3I/NrExxF
	 M3+APsgwfy4U4QYwJnzkQs9bm5PW0rOR399yUfWdDFmI1knKmDS8tN/lrxCdsmPY1/
	 /0EfzvpNNqkTbGEE9luHdTH0855kxyknvTWH70FfPQwtbwgYaC4Sap5bpHrpD6p0k9
	 ky5Q9uN9o8Ac5z0bwjEJiAk+3zYX8Pe8SeppTtDSnbW8fPlEPy8bN9VB7ZRQ6Kv6hp
	 x8lmI8hu57cWA==
Date: Thu, 10 Apr 2025 00:00:13 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, Xin Li <xin@zytor.com>
CC: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_06/20=5D_x86/msr=3A_Standardiz?=
 =?US-ASCII?Q?e_on_=27u32=27_MSR_indices_in_=3Casm/msr=2Eh=3E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <Z_dnraUGp0Vbzk6k@gmail.com>
References: <20250409202907.3419480-1-mingo@kernel.org> <20250409202907.3419480-7-mingo@kernel.org> <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com> <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com> <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com> <3B57B3E5-47C9-4196-AD2B-44916E18B6D0@zytor.com> <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com> <Z_dnraUGp0Vbzk6k@gmail.com>
Message-ID: <F6B09DEB-8DC6-4B78-B35F-8A88F847702C@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 9, 2025 11:39:41 PM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Xin Li <xin@zytor=2Ecom> wrote:
>
>> On 4/9/2025 8:29 PM, H=2E Peter Anvin wrote:
>> > On April 9, 2025 8:18:12 PM PDT, Xin Li <xin@zytor=2Ecom> wrote:
>> > > A question NOT related to this patch set, the MSR write API prototy=
pe
>> > > defined in struct pv_cpu_ops as:
>> > >     void (*write_msr)(unsigned int msr, unsigned low, unsigned high=
);
>> > >=20
>> > > Will it be better to add "const" to its arguments?  I=2Ee=2E,
>> > >     void (*write_msr)(const u32 msr, const u32 low, const u32 high)=
;
>> > >=20
>> >=20
>> > No, that makes no sense (it would have absolutely no effect=2E)
>> >=20
>>=20
>> For the API definition, yes, it has no effect=2E
>>=20
>> While it makes the API definition more explicit, and its implementation=
s
>> for native and Xen would be:
>>=20
>> void {native,xen}_write_msr(const u32 msr, const u32 low, const u32 hig=
h)
>> {
>>     =2E=2E=2E=2E
>> }
>>=20
>> not worth it at all?
>
>No:
>
> - Using 'const' for input parameter pointers makes sense because it's=20
>   easy to have a bug like this in a utility function:
>
>	obj_ptr->val =3D foo;
>
>   this has a side effect on the calling context, spreading the local=20
>   rot, so to speak, corrupting the object not owned by this function=2E
>
> - Using 'const' for non-pointer input parameters makes little sense,=20
>   because the worst a function can do is to corrupt it locally:
>
>	val_high =3D foo;
>
>   =2E=2E=2E but this bug won't be able to spread via corrupting objects=
=20
>   through a pointer, any bug will be limited to that function=2E
>
>So neither the kernel, nor any of the major libraries such as glibc=20
>will typically use const for non-pointer function parameters, outside=20
>of very specific exceptions that strengthen the rule=2E
>
>Thanks,
>
>	Ingo

And even so, there is no need to put the const in the prototype=2E
