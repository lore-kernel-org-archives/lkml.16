Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1A06F073
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 21:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745876388; cv=none; b=hE88lDR5b1W4dnzcsh5ZXmmt8NdV+9znKGmiwgGqgbJwkTpFWA3Oy/gcTXHBTyqi+eAZ6TvdLDMcgJzsZhQOW9ATAMi1DBgxlcLeXIlH68B6CLmQgArY0hR5wPLy18ji6fMYiuFc18Iqd0OrgfQacrN9Cy7uUUgXkFHK2KSUBIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745876388; c=relaxed/simple;
	bh=IxZEGj0md+cpM4u952HviqymNhiVqc1HFmg2g9y45Xw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=LqBdTBlGOsifHUrI8ZW5T7svGAE8HQjxkhqNb9JoMslNXgsVT2OBDCaZwpG+XPfqcI0Sf7PQD8mAPAm3hO+dKeK0G7+4wFfIPA/1E47P6oDymgBWSq9kRLSwYNAMEwmAXWyri2kZnARumfhI7xSJWTA6+9cwhn2VX8zVBnWBfSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Y6dnSHnX; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Y6dnSHnX"
Received: from [IPv6:::1] ([172.59.161.110])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53SLcqMl4064505
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 28 Apr 2025 14:38:53 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53SLcqMl4064505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745876335;
	bh=sQ20RzlhTI2OdKKrz143XBlONGa/0jFWo7zJXCXWAL0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Y6dnSHnXkUStIgQVLFjFl/WxtubC4hEnVTp85eiu8hU/NXH7XMpJhcipi75ddaUXx
	 /NgJZdBwG4YGgALW2ZBuc2ItVhSmmt6hLAaLrXrgK/va0SIroYA/dZXlbfOC88E16n
	 ZH57S0ih6uCYhIIjqdhcg+zm2QALg0xS6Kn/ggUeXIpGMR1N1n6nxRZAXeLwRcS2PU
	 +3eg0CL929Iy9x67h00wm229TzSUPUuBOjliEmd4xzgnb3s0obM8+coBaCMVyUcIqF
	 bFChKrimnVYWirmjS9R+wtq1Tvf6r8kViKzsT3/5clVBlgSfFshY1zVI64ghckqW/p
	 qvLCC7ylrKxUw==
Date: Mon, 28 Apr 2025 14:38:46 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>,
        Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_bitops/32=3A_Convert_variable?=
 =?US-ASCII?Q?=5Fffs=28=29_and_fls=28=29_zero-case_handling_to_C?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com>
Message-ID: <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 28, 2025 9:14:45 AM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Mon, 28 Apr 2025 at 00:05, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>>
>> And once we remove 486, I think we can do the optimization below to
>> just assume the output doesn't get clobbered by BS*L in the zero-case,
>> right?
>
>We probably can't, because who knows what "Pentium" CPU's are out there=
=2E
>
>Or even if Pentium really does get it right=2E I doubt we have any
>developers with an original Pentium around=2E
>
>So just leave the "we don't know what the CPU result is for zero"
>unless we get some kind of official confirmation=2E
>
>          Linus

If anyone knows for sure, it is probably Christian Ludloff=2E However, the=
re was a *huge* tightening of the formal ISA when the i686 was introduced (=
family=3D6) and I really believe this was part of it=2E

I also really don't trust that family=3D5 really means conforms to undocum=
ented P5 behavior, e=2Eg=2E for Quark=2E
