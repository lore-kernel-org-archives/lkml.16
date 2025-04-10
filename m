Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697C1CAA80;
	Thu, 10 Apr 2025 04:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.70.13.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744259896; cv=none; b=R1aOx2JG9RZhc4c1EoN0Jg3fpBQMOS0QPvqN44V+hpU+NPXIdn6aNDb0iT9SbTIQw+oZ9DSmgJL5Ou8oCb6ZtndyX97ZLSQfZ+SLQLjOXRl2jR6JiEY07inA2vejHy4mg1NnLhgFzhQu9deRRneOf/D0Q9kpu8oHIu6s31nFP7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744259896; c=relaxed/simple;
	bh=e6OZ8nRNwUpW2DUV+0A+waBXrMrAowa6q9e8Dc2ViGs=;
	h=From:To:Cc:References:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type:Subject; b=j4B1cOzSCuuWV5FbtI8aXtSaLpsuApD2wpATHnd15aMYe49gUYz88oo/sTZ8IKs7Mx40v/8FJnRXBS2a2YUO5YcHkI8RO8IFJH7RVaefzcIQQ8RevUpRqe0Ff59bBVP5lax7rhE78kbVwyw5BU8vvF3c4aE3Y3Pko2BV34IhxlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com; spf=pass smtp.mailfrom=xmission.com; arc=none smtp.client-ip=166.70.13.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xmission.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xmission.com
Received: from in02.mta.xmission.com ([166.70.13.52]:60664)
	by out01.mta.xmission.com with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1u2jg3-004VR3-Ku; Wed, 09 Apr 2025 22:38:11 -0600
Received: from ip72-198-198-28.om.om.cox.net ([72.198.198.28]:37544 helo=email.froward.int.ebiederm.org.xmission.com)
	by in02.mta.xmission.com with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <ebiederm@xmission.com>)
	id 1u2jg1-00HM8A-RN; Wed, 09 Apr 2025 22:38:11 -0600
From: "Eric W. Biederman" <ebiederm@xmission.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Arnd Bergmann <arnd@arndb.de>,  Linus Torvalds
 <torvalds@linux-foundation.org>,  Richard Henderson
 <richard.henderson@linaro.org>,  Ivan Kokshaysky <ink@unseen.parts>,  Matt
 Turner <mattst88@gmail.com>,  John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>,  Magnus Lindholm <linmag7@gmail.com>,
  "Paul E. McKenney" <paulmck@kernel.org>,  Alexander Viro
 <viro@zeniv.linux.org.uk>,  linux-alpha@vger.kernel.org,
  linux-kernel@vger.kernel.org
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk>
	<CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com>
	<alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk>
	<alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
	<CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com>
	<e1356a60-525b-4405-ad5b-eb6e93de8fef@app.fastmail.com>
	<87v7rd8h99.fsf@email.froward.int.ebiederm.org>
	<alpine.DEB.2.21.2504092019200.18515@angie.orcam.me.uk>
Date: Wed, 09 Apr 2025 23:37:34 -0500
In-Reply-To: <alpine.DEB.2.21.2504092019200.18515@angie.orcam.me.uk> (Maciej
	W. Rozycki's message of "Wed, 9 Apr 2025 21:59:59 +0100 (BST)")
Message-ID: <874iywtywh.fsf@email.froward.int.ebiederm.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1u2jg1-00HM8A-RN;;;mid=<874iywtywh.fsf@email.froward.int.ebiederm.org>;;;hst=in02.mta.xmission.com;;;ip=72.198.198.28;;;frm=ebiederm@xmission.com;;;spf=pass
X-XM-AID: U2FsdGVkX1/GoNFovwIcM2Zdgo1m/B2ORp5naRtBXAg=
X-Spam-Level: ***
X-Spam-Report: 
	* -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
	*  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
	*      [score: 0.5000]
	*  0.7 XMSubLong Long Subject
	*  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
	* -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
	*      [sa07 1397; Body=1 Fuz1=1 Fuz2=1]
	*  1.0 XM_B_Phish_Phrases Commonly used Phishing Phrases
	*  0.2 XM_B_SpammyWords One or more commonly used spammy words
	*  0.0 XM_B_AI_SPAM_COMBINATION Email matches multiple AI-related
	*      patterns
	*  0.0 T_TooManySym_01 4+ unique symbols in subject
	*  1.5 TR_AI_Phishing Email matches multiple AI-related patterns
X-Spam-DCC: XMission; sa07 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;"Maciej W. Rozycki" <macro@orcam.me.uk>
X-Spam-Relay-Country: 
X-Spam-Timing: total 1198 ms - load_scoreonly_sql: 0.05 (0.0%),
	signal_user_changed: 11 (0.9%), b_tie_ro: 10 (0.8%), parse: 1.50
	(0.1%), extract_message_metadata: 17 (1.4%), get_uri_detail_list: 5
	(0.4%), tests_pri_-2000: 5 (0.4%), tests_pri_-1000: 2.9 (0.2%),
	tests_pri_-950: 1.26 (0.1%), tests_pri_-900: 1.05 (0.1%),
	tests_pri_-90: 402 (33.6%), check_bayes: 396 (33.1%), b_tokenize: 17
	(1.4%), b_tok_get_all: 277 (23.1%), b_comp_prob: 7 (0.6%),
	b_tok_touch_all: 92 (7.7%), b_finish: 0.98 (0.1%), tests_pri_0: 741
	(61.9%), check_dkim_signature: 0.70 (0.1%), check_dkim_adsp: 2.9
	(0.2%), poll_dns_idle: 0.80 (0.1%), tests_pri_10: 2.5 (0.2%),
	tests_pri_500: 8 (0.7%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data consistency
X-SA-Exim-Connect-IP: 166.70.13.52
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, viro@zeniv.linux.org.uk, paulmck@kernel.org, linmag7@gmail.com, glaubitz@physik.fu-berlin.de, mattst88@gmail.com, ink@unseen.parts, richard.henderson@linaro.org, torvalds@linux-foundation.org, arnd@arndb.de, macro@orcam.me.uk
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-SA-Exim-Scanned: No (on out01.mta.xmission.com); SAEximRunCond expanded to false

"Maciej W. Rozycki" <macro@orcam.me.uk> writes:

> On Wed, 9 Apr 2025, Eric W. Biederman wrote:
>
>> >> So unless you actually *see* the unaligned faults, I really think you
>> >> shouldn't emulate them.
>> >>
>> >> And I'd like to know where they are if you do see them
>> 
>> I was nerd sniped by this so I took a look.
>> 
>> I have a distinct memory that even the ipv4 stack can generate unaligned
>> loads.  Looking at the code in net/ipv4/ip_input.c:ip_rcv_finish_core
>> there are several unprotected accesses to iph->daddr.
>> 
>> Which means that if the lower layers ever give something that is not 4
>> byte aligned for ipv4 just reading the destination address will be an
>> unaligned read.
>> 
>> There are similar unprotected accesses to the ipv6 destination address
>> but it is declared as an array of bytes.  So that address can not
>> be misaligned.
>> 
>> There is a theoretical path through 802.2 that adds a 3 byte sap
>> header that could cause problems.  We have LLC_SAP_IP defined
>> but I don't see anything calling register_8022_client that would
>> be needed to hook that up to the ipv4 stack.
>> 
>> As long as the individual ethernet drivers have the hardware deliver
>> packets 2 bytes into an aligned packet buffer the 14 byte ethernet
>> header will end on a 16 byte aligned location, I don't think there
>> is a way to trigger unaligned behavior with ipv4 or ipv6.
>> 
>> Hmm.  Looking appletalk appears to be built on top of SNAP.
>> So after the ethernet header processing the code goes through
>> net/llc/llc_input.c:llc_rcv and then net/802/snap_rcv before
>> reaching any of the appletalk protocols.
>> 
>> I think the common case for llc would be 3 bytes + 5 bytes for snap,
>> for 8 bytes in the common case.  But the code seems to be reading
>> 4 or 5 bytes for llc so I am confused.  In either case it definitely
>> appears there are cases where the ethernet headers before appletalk
>> can be an odd number of bytes which has the possibility of unaligning
>> everything.
>> 
>> Both of the appletalk protocols appear to make unguarded 16bit reads
>> from their headers.  So having a buffer that is only 1 byte aligned
>> looks like it will definitely be a problem.
>
>  Thank you for your analysis, really insightful.
>
>> > FWIW, all the major architectures that have variants without
>> > unaligned load/store (arm32, mips, ppc, riscv) trap and emulate
>> > them for both user and kernel access for normal memory, but
>> > they don't emulate it for atomic ll/sc type instructions.
>> > These instructions also trap and kill the task on the
>> > architectures that can do hardware unaligned access (x86
>> > cmpxchg8b being a notable exception).
>
>  But all those architectures have 1-byte and 2-byte memory access machine 
> instructions as well, and consequently none requires an RMW sequence to 
> update such data quantities that implies the data consistency issue that 
> we have on non-BWX Alpha.
>
>> I don't see anything that would get atomics involved in the networking
>> stack.  No READ_ONCE on packet data or anything like that.  I believe
>> that is fairly fundamental as well.  Whatever is processing a packet is
>> the only code processing that packet.
>> 
>> So I would be very surprised if the kernel needed emulation of any
>> atomics, just emulation of normal unaligned reads.  I haven't looked to
>> see if the transmission paths do things that will result in unaligned
>> writes.
>
>  The problem we have on the non-BWX Alpha target is that hardware has no 
> memory access instructions narrower than 4 bytes.  Consequently to write a 
> 1- or 2-byte quantity an RMW instruction sequence is required, in the way 
> of reading the whole 4-byte quantity, inserting the bytes to be modified, 
> and writing the whole 4-byte quantity back to memory.  However such a 
> sequence is not safe for concurrent writes, as described below.
>
>  A pair of concurrent RMW sequences targetting the same part of an aligned 
> 4-byte data quantity is not an issue: it's just an execution race and 
> software may be prepared for it (or otherwise either prevent the race via 
> a mutex or alternatively use an atomic data type along with the associated 
> accessors, which will move data locations in memory suitably apart).
>
>  The issue is a pair of concurrent RMW sequences targetting different 
> parts of the same aligned 4-byte data quantity: software can legitimately 
> expect that writes to disjoint memory locations (e.g. adjacent struct 
> members, except for bit-fields) won't affect each other.  But here where a 
> pair of such RMW sequences runs interleaved, the later write to one 
> location will clobber the value written previously to the other.  So we 
> have a data race.  Note that no atomicity is concerned here, we are 
> talking plain memory writes, such as with ordinary assignments to regular 
> variables in C code.
>
>  So I have come up with a solution where such RMW sequences are actually 
> emitted by GCC as an LDL_L/STL_C atomic access loop which ensures that no 
> intervening write has changed the aligned 4-byte data quantity containing 
> the 1- or 2-byte quantity accessed.  This guarantees consistency of the 
> part(s) of the aligned 4-byte data quantity *outside* the 1- or 2-byte 
> quantity written.  Atomicity is guaranteed by hardware as a side effect, 
> but not a part of this Alpha/Linux psABI extension (i.e. not in our 
> contract).
>
>  For known-unaligned 2-byte quantities (such as packed structure members) 
> the compiler knows that they may span 2 aligned 4-byte data quantities and 
> produces two LDL_L/STL_C loops with suitable address adjustments and data 
> masking.  This still guarantess consistency of data *outside* the 2-byte 
> quantity written.  No atomicity is guaranteed, because parts of the 2-byte 
> quantity may be stored by pieces (if the 2-byte quantity is in the middle 
> of an aligned 4-byte quantity, then it'll be written twice).
>
>  The problem is with the case where the compiler has been told to produce 
> code to write an aligned 2-byte quantity, but at run time it turns out 
> unaligned.  Now we have to emulate the LDL_L and STL_C instructions of the 
> atomic access loop or otherwise the code will crash.
>
>  My approach for this scenario is simple: LDL_L emulation remembers the 
> address accessed and data present in the 2 aligned 4-byte data quantities 
> spanned, and STL_C emulation returns failure in the case of an address 
> mismatch and otherwise uses two LDL_L/STL_C loops to load the the 2 
> aligned 4-byte data quantities by piece, compare each with data retrieved 
> previously at LDL_L emulation time, returning failure in the case of a 
> mismatch, insert the requested value and then store the resulting 
> quantity.  Again this guarantees consistency of the parts of the 2 aligned 
> 4-byte data quantities *outside* the unaligned 2-byte quantity written.  
> And again, no atomicity is guaranteed.
>
>  So while there are no atomic operations in our code at the C language 
> level, we get them sneaked in by the compiler under our feet to solve the 
> data consistency issue.  Now if we can ascertain the code paths concerned 
> won't ever exercise concurrency, we could tell the compiler not to produce 
> these atomics for 1-byte and 2-byte accesses, on a file-by-file or even 
> function-by-function basis, but it seems to me like the very maintenance 
> effort we want to avoid for a legacy platform.  Whereas if we build the 
> kernel with the atomics enabled universally, we won't have to be bothered 
> with analysing individual cases (at performance cost, but that's assumed).
>
>  I've left 8-byte data quantities out for clarity from the consideration 
> above; they're used by the compiler as suitable and handled accordingly.
>
>  Let me know if you find anything here unclear.

The emulation you are doing makes sense.

Just a few more points.  I am not current but I have never seen
concurrency (inside of a packet) at the network layer.

I don't recall ever hearing the write paths in the network stack
were ever a problem.

I suspect the write side you can verify fairly easily by simply
compiling in appletalk and opening a PF_APPLETALK socket, and sending a
message.  If that doesn't trigger emulation I can't image any other
write path in the kernel will.

Eric
