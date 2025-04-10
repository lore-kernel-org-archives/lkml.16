Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F012040A8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744275257; cv=none; b=C0TJnB94XhD1/gGv6na+m1fxZEg9gLLWHS7RGPzCO4YHVBN+9LdjtJokvVDCXzBMNeVoZGMxf3ndP9Sy534FQ8UbHFhEH8rp13MuMVTf1UFHLZPOY9ongp3XGvBCGoQx7xVGFlS8ULAXWxOBDWNSSRurUyFwXyZsHBXIXy6z/Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744275257; c=relaxed/simple;
	bh=fh9nXzNqsLZ5itZc2vqN1xWzGeGVcQuav9iNBjzmXCM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=uBehQrQNrXa773QIMvS4Wg5eFmYtDm1eHGQrZ5BJ3K7MAgFkvTs9xwuSn9KqskrFZw/6zV3wrzth0u3RKnqmlcVH8m5/3EObw0E0l17JeRhhQbY0b1BJqPTU/gSIkYiXaPt+qJNGn0xrUMHoC+pHuGwosZJ+NBHVAnqiPJ++wP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=ZTQ7mYO+; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="ZTQ7mYO+"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53A8rePL4008269
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 10 Apr 2025 01:53:40 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53A8rePL4008269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025032001; t=1744275221;
	bh=fh9nXzNqsLZ5itZc2vqN1xWzGeGVcQuav9iNBjzmXCM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ZTQ7mYO+0O9TDHs0ntT67KJlIzbHPxwIEkRtElmitHILYbZ2oeNRbI4JC3PuRWw2y
	 rjSq3CJbaDQAOhXy6pd+Koi2JTuUEc52dDFVUFN0/8lisAsBG/pYRfa/JbdDIch6NR
	 Ati4eVgNaILqUqNxwyebNyQvZWM3/xKsdpB5J50icfvaKUJBNnwNhAUSOxcqG1iXxW
	 rjT8BAs5lkwInf+98lW+NPu4lAsHAKT6/Xm9NatHuArudC63QdRnNdeBszf6UnATFU
	 7qNPo53HGoVFjhKqajh/1KXZG3LLdyQBsWHi4K6Q7FSVGMQwcmQi2158wF0DWOylXF
	 igXYmUlANM6aw==
Date: Thu, 10 Apr 2025 01:53:38 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Peter Zijlstra <peterz@infradead.org>
CC: Xin Li <xin@zytor.com>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_06/20=5D_x86/msr=3A_Standardiz?=
 =?US-ASCII?Q?e_on_=27u32=27_MSR_indices_in_=3Casm/msr=2Eh=3E?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250410074828.GU9833@noisy.programming.kicks-ass.net>
References: <20250409202907.3419480-1-mingo@kernel.org> <20250409202907.3419480-7-mingo@kernel.org> <aed43a6a-aca9-4c81-af1a-775f5858ebe3@zytor.com> <9c014962-d4cb-4e68-be15-efbe2ea26531@zytor.com> <63ab3ea9-c55d-48d2-8344-fb4314baf240@zytor.com> <3B57B3E5-47C9-4196-AD2B-44916E18B6D0@zytor.com> <3e2a52c5-791a-4e96-a768-8579ec841dd1@zytor.com> <e3d8db6a-dfb9-49d5-8c7f-b4a1d2faf575@zytor.com> <20250410074828.GU9833@noisy.programming.kicks-ass.net>
Message-ID: <027114D4-AA7D-43E5-A8A0-E57121177517@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 10, 2025 12:48:28 AM PDT, Peter Zijlstra <peterz@infradead=2Eorg> =
wrote:
>On Wed, Apr 09, 2025 at 11:14:12PM -0700, H=2E Peter Anvin wrote:
>
>> No, and as you know, I'd like to get rid of the native_ and xen_ functi=
ons
>> entirely anyway=2E
>
>I have vague memories of locations where we *have* to use native_{rd,wr}m=
sr()
>because the paravirt indirections cause problems=2E
>
>I don't clearly recall the reasons, but it could be instrumentation
>related=2E The paravirt muck has tracepoints and other crap included=2E
>

Yes, that's part of what we want to get rid of=2E
