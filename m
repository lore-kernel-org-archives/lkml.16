Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5232B250EC;
	Wed,  9 Apr 2025 16:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744216859; cv=none; b=V9SihzSRkbCzMMiVZ0axqhYyBcFUCY+fjY1kzuBcIn45KbrID0t2KzAvEWkZkI6sBw3dom2Gj7Qw3CjA8FBxW3unb2UuSi4EBi2j4prXWITMrPC8V7BPBmLtSMEFV/IFLxocbFrhdDQJS/tpLGBBPlXgpK1gycKElCZfI9JqSdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744216859; c=relaxed/simple;
	bh=OI5wgGn82uQMPS6lLA25QzrQbaTdxqnp0IH22m1DyYo=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=Nv06vjN3RoMDScrl7dpEEci8iVJkMVXB23gT+ziH1kYPjhYbg2bIzrDliGFH6OBBsDRuiZPlkIVIJeMG7j5YQOPIX1mb1uQxQff8CRwYRw9QydrLSKaZ5Fvv/OhU2vWN6ifJtsFr9i0c8OWq2SR8P0arPTHntFGvdgPZ82peB74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in01.mta.xmission.com ([166.70.13.51]:43496)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1u2XjD-003P6n-CY; Wed, 09 Apr 2025 09:52:39 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:42542 helo=email.froward.int.ebiederm.org.xmission.com)
	by in01.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1u2XjC-005LKU-AL; Wed, 09 Apr 2025 09:52:39 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,  "Maciej W. Rozycki"
 <macro@orcam.me.uk>,  "Richard Henderson" <richard.henderson@linaro.org>,
  "Ivan Kokshaysky" <ink@unseen.parts>,  "Matt Turner"
 <mattst88@gmail.com>,  "John Paul Adrian Glaubitz"
 <glaubitz@physik.fu-berlin.de>,  "Magnus Lindholm" <linmag7@gmail.com>,
  "Paul E. McKenney" <paulmck@kernel.org>,  "Alexander Viro"
 <viro@zeniv.linux.org.uk>,  linux-alpha@vger.kernel.org,
  linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
	<CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com>
	<alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk>
	<alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
	<CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
	<e1356a60-525b-4405-ad5b-eb6e93de8fef@app.fastmail.com>
Date: Wed, 09 Apr 2025 10:52:02 -0500
In-Reply-To: <e1356a60-525b-4405-ad5b-eb6e93de8fef@app.fastmail.com> (Arnd
	Bergmann's message of "Tue, 08 Apr 2025 10:37:49 +0200")
Message-ID: <87v7rd8h99.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1u2XjC-005LKU-AL;;;mid=<87v7rd8h99.fsf@email.froward.int.ebiederm.org>;;;hst=in01.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1+KvPU/sBTkEuKVGsgKzXmasJ0CNfVkiPI=
X-Spam-Level: 
X-Spam-Virus: No
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	* -0.0 BAYES_40 BODY: Bayes spam probability is 20 to 40%
	*      [score: 0.3749]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa02 1397; Body=1 Fuz1=1 Fuz2=1]
	*  1.0 XM_B_Phish_Phrases Commonly used Phishing Phrases
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
X-Spam-DCC: XMission; sa02 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ;"Arnd Bergmann" <arnd@arndb.de>
X-Spam-Relay-Country: 
X-Spam-Timing: total 598 ms - load_scoreonly_sql: 0.03 (0.0%),
	signal_user_changed: 3.7 (0.6%), b_tie_ro: 2.6 (0.4%), parse: 0.99
	(0.2%), extract_message_metadata: 16 (2.6%), get_uri_detail_list: 3.6
	(0.6%), tests_pri_-2000: 10 (1.7%), tests_pri_-1000: 2.2 (0.4%),
	tests_pri_-950: 0.95 (0.2%), tests_pri_-900: 0.84 (0.1%),
	tests_pri_-90: 165 (27.6%), check_bayes: 162 (27.1%), b_tokenize: 8
	(1.4%), b_tok_get_all: 11 (1.8%), b_comp_prob: 2.6 (0.4%),
	b_tok_touch_all: 136 (22.8%), b_finish: 0.90 (0.2%), tests_pri_0: 381
	(63.8%), check_dkim_signature: 0.42 (0.1%), check_dkim_adsp: 4.2
	(0.7%), poll_dns_idle: 4.8 (0.8%), tests_pri_10: 1.77 (0.3%),
	tests_pri_500: 12 (2.1%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
X-SA-Exim-Connect-IP: 166.70.13.51
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, viro@zeniv.linux.org.uk, paulmck@kernel.org, linmag7@gmail.com, glaubitz@physik.fu-berlin.de, mattst88@gmail.com, ink@unseen.parts, richard.henderson@linaro.org, macro@orcam.me.uk, torvalds@linux-foundation.org, arnd@arndb.de
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

"Arnd Bergmann" <arnd@arndb.de> writes:

> On Tue, Apr 8, 2025, at 02:34, Linus Torvalds wrote:
>> On Mon, 7 Apr 2025 at 13:46, Maciej W. Rozycki <macro@orcam.me.uk> wrote:
>>>
>>>  So unless I'm proved otherwise (e.g. that all such code paths are now
>>> gone from networking, which may or may not be the case: I saw IPX go but I
>>> can see AppleTalk still around; or that no sub-longword accesses are ever
>>> used in the relevant networking paths), I'm going to keep kernel emulation
>>> in v2, because what just used to be wrapped in an unaligned LDQ/STQ pair,
>>> which we trapped on and emulated, will now become an LDQ_L/STQ_C loop.
>>>
>>>  Do you happen to know what the situation is here?
>>
>> I think networking ends up using 'get_unaligned()' properly for header
>> accesses these days for any of this.
>>
>> If you don't, some architectures will literally silently give you
>> garbage back and not even fault.
>>
>> Admittedly that's mainly some really broken old 32-bit ARM stuff and
>> hopefully it's all dead by now.
>
> Yes, the last one doing this was EBSA110, which we removed in 2020.
>
>> So unless you actually *see* the unaligned faults, I really think you
>> shouldn't emulate them.
>>
>> And I'd like to know where they are if you do see them

I was nerd sniped by this so I took a look.

I have a distinct memory that even the ipv4 stack can generate unaligned
loads.  Looking at the code in net/ipv4/ip_input.c:ip_rcv_finish_core
there are several unprotected accesses to iph->daddr.

Which means that if the lower layers ever give something that is not 4
byte aligned for ipv4 just reading the destination address will be an
unaligned read.

There are similar unprotected accesses to the ipv6 destination address
but it is declared as an array of bytes.  So that address can not
be misaligned.

There is a theoretical path through 802.2 that adds a 3 byte sap
header that could cause problems.  We have LLC_SAP_IP defined
but I don't see anything calling register_8022_client that would
be needed to hook that up to the ipv4 stack.

As long as the individual ethernet drivers have the hardware deliver
packets 2 bytes into an aligned packet buffer the 14 byte ethernet
header will end on a 16 byte aligned location, I don't think there
is a way to trigger unaligned behavior with ipv4 or ipv6.

Hmm.  Looking appletalk appears to be built on top of SNAP.
So after the ethernet header processing the code goes through
net/llc/llc_input.c:llc_rcv and then net/802/snap_rcv before
reaching any of the appletalk protocols.

I think the common case for llc would be 3 bytes + 5 bytes for snap,
for 8 bytes in the common case.  But the code seems to be reading
4 or 5 bytes for llc so I am confused.  In either case it definitely
appears there are cases where the ethernet headers before appletalk
can be an odd number of bytes which has the possibility of unaligning
everything.

Both of the appletalk protocols appear to make unguarded 16bit reads
from their headers.  So having a buffer that is only 1 byte aligned
looks like it will definitely be a problem.

> FWIW, all the major architectures that have variants without
> unaligned load/store (arm32, mips, ppc, riscv) trap and emulate
> them for both user and kernel access for normal memory, but
> they don't emulate it for atomic ll/sc type instructions.
> These instructions also trap and kill the task on the
> architectures that can do hardware unaligned access (x86
> cmpxchg8b being a notable exception).

I don't see anything that would get atomics involved in the networking
stack.  No READ_ONCE on packet data or anything like that.  I believe
that is fairly fundamental as well.  Whatever is processing a packet is
the only code processing that packet.

So I would be very surprised if the kernel needed emulation of any
atomics, just emulation of normal unaligned reads.  I haven't looked to
see if the transmission paths do things that will result in unaligned
writes.

Eric
