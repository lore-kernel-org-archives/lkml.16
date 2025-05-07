Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F01D4A35
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 00:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746577913; cv=none; b=sSwTZzLaXqP3jA7AWd9VMeCY85CnavmPkYEoLqH6k91RPwe7rFn4khqjA3C6/vlnjZ5Y5QmKprSurtMKcAv+raorDdF6+GX7q31+v2XpbR4ao6deyuzV8lfAHzROocZTR/u0jTYRnikVFCGGqu9+uTkYxZ9fhcD+acPEPvhCzYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746577913; c=relaxed/simple;
	bh=Na1zvEB4/yCToLrhfKE6CTktaT7rJIOS54h8EnWdUcI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=IXhDu96IVFbxyWeo6V74rF6KojhqviIk6KEIpQ5V98+UHUDfUEMUVSWKO/fPnez3LcDsbUglZbryaEySdU9dkTMHOuGIcB1xQMwBBsX+eoTY3W8RfsQszlweAyqVQW4vjhYFQvHVxzUZiZ7Ib+CR9jpr+AJxAIdYkZrdON0iyxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=IQ8faPdP; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="IQ8faPdP"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5470VHpN1147351
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 6 May 2025 17:31:18 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5470VHpN1147351
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746577879;
	bh=08N3/4xh5QuHywf20m2reL9GiDO5cSRrh1H0TLA7Gdw=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=IQ8faPdPIXGgBLq8mxlvhLsLjVKXnl1PA+I3+93Yt4I+fI65Lr3mwTpHTIaUezZv4
	 2AqmVtT6QmVYq47eWTNBEEEsYINZJLGT1woBoa0if6nU2db1/FFxac0dEhDK2irsq/
	 /KvpEum3qAW4KwqC3A4d9KGyx8WqCzwzCxklR3lD44w8336KEWMc+DyI3vyTlbAcuW
	 tviD7rbeysFB1RObzFJ2rk+R2iqObe6sVgZuFWHiAV/Vb4N0DvCV3yuxfSxDI8Jx93
	 NNyGj5Ez+xULx5euKQf0IRUCXo45swgsFqUoIPkxi4GNu8lz/xl/0SK38/BJIg/NdO
	 EcqynMRd+YbHw==
Date: Tue, 06 May 2025 17:31:16 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH -tip 1/3] x86/asm/32: Modernize memset() functions
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=whvLzKeEvw3W0NTJp97jgr0qK=0WGDMgCgvdrbroWq61A@mail.gmail.com>
References: <20250506165227.158932-1-ubizjak@gmail.com> <F66E73EB-7237-439F-8408-C0C39B1CE2D2@zytor.com> <CAHk-=whvLzKeEvw3W0NTJp97jgr0qK=0WGDMgCgvdrbroWq61A@mail.gmail.com>
Message-ID: <FCFB0721-4A4C-47AF-80DA-A514AB3B0502@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 6, 2025 11:22:49 AM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Tue, 6 May 2025 at 10:55, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> Can anyone think of a reason why we don't do:
>>
>> #define auto __auto_type
>>
>> =2E=2E=2E and just start using the modern keyword right away?
>
>Yeah, make it so=2E The original 'auto' was useless as you say, and
>afaik we've never used it in the kernel=2E
>
>And the one advantage of it being that historically useless keyword is
>that we can't have variables called 'auto' anywhere either=2E
>
>So it should be a safe thing to do=2E
>
>              Linus

Ok, I'll cook up a patchset=2E Should be trivial=2E
