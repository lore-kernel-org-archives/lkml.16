Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9A11D514F;
	Sat, 26 Apr 2025 04:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745640457; cv=none; b=Po7alpEMsFm+huPq46Hf0Und6MBvy4vmEDMVmMRYvcGSqimf44WmQvvT4d0/7Ismcm+T2EKNdjUuW53/7pt1y682prknIDS+cW3XJHCmdLZZ7aILOJ8BOILVibMO48KhCrpNgTlO8q2NP/XPVqUjW6QbjuvnKf2Jtj2KNu9ljDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745640457; c=relaxed/simple;
	bh=bvZTb4A8ZeRpGi8n3Mi6IcgP1UF8axUgHWthR55RjRU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=PGnixKMbn+O0SXGLdLcQIV6lolIfXg4uKZVOX8cApI6DVl/NwgzxR03QtRCtmJ+WBRjgfO2vbd6PV1loy7EbOKSyPoYLHz7PA+coMaz2aHyEDPXDmitUaR4scy12vs0Cg2Edo6kkZC4w4+0iQzx+OZmNqGnC6E9cFfXWLeiBpRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=d6HNLXY0; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="d6HNLXY0"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53Q46rA63834692
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 25 Apr 2025 21:06:53 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53Q46rA63834692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745640415;
	bh=eUtkfRrt/kZPiXPpcYPo5bw7Q8Aflz/KWe0BSAuir1Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=d6HNLXY0c08krUXtedWXoRD/twh6jElJ5k6IdQwTpXIO/BTYVBFnBzPGtKeR6+J7T
	 QWr9v1axgK4SRmf+XCQjZ5yumrfBkzahqouLx4zQ44a4jh/O+LQyN4S3ZHDCGZCB9P
	 EpvS4TNXzVXqIYXoT+U/Pfx5exTiMeLZWd7jsZI5zNuv8V6dXSHTlkLzcfKevGrQL9
	 09y1C3efjWOnaMXkjy3mG/jNKx1KtUKSvXQQWWYVBxKlrpr5iHfUFgJ7qg2hoHm6g+
	 EV6HYJWHIgPBzUKd+ZymhdpjsQMDK1Cuh4/9BKdxZ/5kRBRVPtVeVKbeXQtxQojKR9
	 L90UpCUNi8Pag==
Date: Fri, 25 Apr 2025 21:06:52 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC: kernel test robot <oliver.sang@intel.com>, oe-lkp@lists.linux.dev,
        kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
        Ingo Molnar <mingo@kernel.org>, John Stultz <jstultz@google.com>,
        Thomas Gleixner <tglx@linutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5Blinus=3Amaster=5D_=5Bx86/cpu=5D_f388f60ca9=3A_B?=
 =?US-ASCII?Q?UG=3Asoft=5Flockup-CPU=23=23s?=
 =?US-ASCII?Q?tuck=5Ffor=23s!=5Bswapper=3A=23=5D?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
References: <202504211553.3ba9400-lkp@intel.com> <59198081-15e2-4b02-934f-c34dd1a0ac93@app.fastmail.com> <aAmeJmL0hUx2kcXC@xsang-OptiPlex-9020> <f1ccb8b4-bbe2-42bc-bb86-c2bf3f9c557d@app.fastmail.com> <CAHk-=wi6k0wk89u+8vmOhcLHPmapK13DDsL2m+xeqEwR9iTd9A@mail.gmail.com>
Message-ID: <0976966F-F706-4EE3-B43E-D76958059E3F@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 24, 2025 9:07:50 AM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Thu, 24 Apr 2025 at 01:01, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>>
>> Thanks for confirming=2E So a 486-targeted kernel still passes
>> your tests on modern hardware if we force TSC and CX8 to
>> be enabled, but the boot fails if the options are turned
>> off in Kconfig (though available in emulated hardware)=2E
>
>I wouldn't expect CX8 to really matter - it causes us to generate
>extra code to pick one over the other, but on modern hardware we'll
>still always then dynamically pick the cmpxchg8b instruction=2E
>
>Could it trigger bugs in our alternatives, or some miscompilation due
>to the extra complexity? Sure=2E But it does sound unlikely=2E
>
>> To be completely sure, you could re-run the same test with
>> just one of these enabled, but I'm rather sure that the TSC
>> is the root cause=2E
>
>Agreed=2E
>
>Particularly when the lockup is then in timekeeping_notify() during
>the initial initcalls -> clocksource_select(), I'm pretty sure this is
>purely about TSC=2E
>
>That said, maybe the problem is in the watchdog logic, because
>clocksource_done_booting() is what starts the watchdog thread =2E
>
>So it might be the watchdog code itself that then gets confused
>(because of some "don't use tsc" case that never gets any testing in
>real life) and triggers immediately - and then points the finger at
>the clocksource code only because that's what is still running=2E
>
>Because CONFIG_X86_TSC does cause some oddities: we end up still
>*using* the TSC for many things if the hardware supports it (which
>modern hardware obviously does), but then other things get disabled
>entirely=2E
>
>For example, this:
>
>  /*
>   * Boot-time check whether the TSCs are synchronized across
>   * all CPUs/cores:
>   */
>  #ifdef CONFIG_X86_TSC
>  extern bool tsc_store_and_check_tsc_adjust(bool bootcpu);
>  extern void tsc_verify_tsc_adjust(bool resume);
>  extern void check_tsc_sync_target(void);
>  #else
>  static inline bool tsc_store_and_check_tsc_adjust(bool bootcpu) {
>return false; }
>  static inline void tsc_verify_tsc_adjust(bool resume) { }
>  static inline void check_tsc_sync_target(void) { }
>  #endif
>
>So that tsc_store_and_check_tsc_adjust() thing etc never gets run,
>even though we actually *do* use TSC for get_cycles() and friends,
>because *that* code checks the runtime status too:
>
>Now, none of that should matter - because all *those* things are about
>details that simply aren't relevant for any of this case - but maybe
>there is some other situation that has similar "I'm actually using the
>TSC through get_cycles(), but I didn't do some setup because X86_TSC
>wasn't on=2E=2E"
>
>I really get the feeling that it's time to leave i486 support behind=2E
>There's zero real reason for anybody to waste one second of
>development effort on this kind of issue=2E
>
>                   Linus

Well, isn't the whole point that his patches remove the cx8 fallback code?
