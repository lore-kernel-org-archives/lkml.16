Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DAA1E4AE;
	Sun, 27 Apr 2025 21:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745788806; cv=none; b=GFIEe5q+FKYVsTgCqOKf8CkRWGLqB5Zzjo9QKHGmPuY2+/Sga6zQtkVQq1Bxvfq3HNZ3FK3Nh8QyNyNqK/6TZkofi1ik0hiiKbkG/54Cn9L6aHAqInFUn2ej7qz1u78rty300/209mDmQY+8SY70q+Ff5YgxXJJKC0doIrmpk4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745788806; c=relaxed/simple;
	bh=7HPGcW29OHjJ2rXiW7t9n+8xvIixesAQw811r1yG39o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Uz3rq75jtQG5U+CNm/+EsvCxyaAgQqiIlMaD3s2eQECxAX1lDQYNLGoRmAmt9vX7InwMLACGGZ2iUdezi6B/BIb4PUfviG6RBsPORhOSR+1gqlt0wfiPDSbAfIH+55wX3ApSTe/OKv4gGZGgRq2Twk+e/+pHxjHy6cPmtlswpsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=CPVgZ9eZ; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="CPVgZ9eZ"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53RLJaSs2368625
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 27 Apr 2025 14:19:37 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53RLJaSs2368625
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745788777;
	bh=jBGoJUOMWzuY5QgWi4uKbqGBd8FxyvlhG9helqJnQXQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=CPVgZ9eZ6VLr9mLg7yXPawSxyffaTqKRfDbyJ2OcdcZh85poGMvm7Sf73vFNHvF+J
	 ukVe3Spl/wFBv90IqJc5yQ20TCeH8Sb2OHmRN77xRMgqbWpG/24q4+u8pHlmsaASYB
	 H4emnkZsJInMfgIII7tvINBDAMLbdPW0pEnrZlxEh7xgBeC/WfP7Gy2q8D5N7MEvMQ
	 KfNMjMGorWiVph8nVMXCkbWybiZ9+5YuUKko2pQPIeKIBrbwKXMiKaK+ogpr4S1nZM
	 kzCzasTz0P42aqDY5XC1CAXtcxAgVzPlZc5h2k7+Ed72EHflvpYwBGCQZBY+fcaNqy
	 rfUQOeBO+q9Qg==
Date: Sun, 27 Apr 2025 14:19:35 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Oliver Sang <oliver.sang@intel.com>
CC: Arnd Bergmann <arnd@arndb.de>, oe-lkp@lists.linux.dev,
        kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        Ingo Molnar <mingo@kernel.org>, John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Blinus=3Amaster=5D_=5Bx86/cpu=5D_f388f60ca9=3A_B?=
 =?US-ASCII?Q?UG=3Asoft=5Flockup-CPU=23=23s?=
 =?US-ASCII?Q?tuck=5Ffor=23s!=5Bswapper=3A=23=5D?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wgxD6DPv1H_uZX4MVB5GvFyGduzMFu2qAeb5dBrE=nHog@mail.gmail.com>
References: <202504211553.3ba9400-lkp@intel.com> <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com> <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020> <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com> <aA3FL6e1HVAw1J+w@xsang-OptiPlex-9020> <CAHk-=wgxD6DPv1H_uZX4MVB5GvFyGduzMFu2qAeb5dBrE=nHog@mail.gmail.com>
Message-ID: <ABAE7E79-8198-4D2E-A6BF-EF530914D05E@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 27, 2025 9:39:55 AM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Sat, 26 Apr 2025 at 22:49, Oliver Sang <oliver=2Esang@intel=2Ecom> wro=
te:
>>
>> We reran the tests=2E if only enable X86_TSC, the various issues still
>> exists=2E if only enable X86_CMPXCHG64, various issues gone=2E
>
>Well, that's unexpected=2E I really didn't expect X86_CMPXCHG64 to make
>any difference, since we should still use the cmpxchg64 instruction,
>just with the alternative re-writing instead of directly=2E
>
>Thanks for re-running the tests=2E
>
>All the non-cmpxchg64 code sequences get replaced by the cmpxchg64
>ones dynamically, so it all shouldn't matter one whit=2E
>
>Except for during early boot=2E Because we do default to the old i386
>sequences all the way *until* we do the alternatives replacement with
>the good cmpxchg64 ones=2E
>
>It does change code generation, in that we have to have that
>alternative which now can be a call, so it's not a complete no-op, but
>I'm still surprised=2E
>
>And except for not using CMPXCHG_LOCKREF at all, but that should be
>just a performance thing, and not noticeable during boot=2E
>
>Hmm=2E=2E=2E
>
>I'd love to understand why X86_CMPXCHG64 apparently matters, but I
>can't convince myself that it's worth really pursuing=2E
>
>            Linus

Sounds like the fallback stubs are subtly broken=2E=20

Personally I would have thought cmpxchg64 to be the biggest win in raising=
 the baseline to the i586 ISA=2E
