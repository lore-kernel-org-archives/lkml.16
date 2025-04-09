Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB7B2116F1;
	Wed,  9 Apr 2025 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232411; cv=none; b=UiHemmyoO726BwWaNhTj3VJ8Ssl4r685JUGTpcAXk1bui2QObghxBUAYiN93yrVZcQrZPpgsWynuCSEktAndZseky1RMjOFkQNTnC0PjW0Q5TTyICP2pab73gIZgcsH2CV17JexvxhgkbMdNSaYP5eq+SVRKa145ap7owbPhwmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232411; c=relaxed/simple;
	bh=pslv7qHnpWWSRmp/rvaXp+wXQ6pjICYbC6fyVrMo6QY=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lHjvXblVl+VnnYle+ZPBP1oKrwMOnmqeVJAFp3qPuC7vT35/fPvqec3fMIe2UtRvGtgp0LcW5srEsEQ2XemRjtr6E5YuEilIWWNY9og7Ob/Ashsinf2XQqwJqf/PDgwuico/efut67RqfZQDAwwDWMEkMqFnUfYhJuQVrF15bn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 962DB92009C; Wed,  9 Apr 2025 22:59:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 8EF1392009B;
	Wed,  9 Apr 2025 21:59:59 +0100 (BST)
Date: Wed, 9 Apr 2025 21:59:59 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: "Eric W. Biederman" <ebiederm@xmission.com>
cc: Arnd Bergmann <arnd@arndb.de>, 
    Linus Torvalds <torvalds@linux-foundation.org>, 
    Richard Henderson <richard.henderson@linaro.org>, 
    Ivan Kokshaysky <ink@unseen.parts>, Matt Turner <mattst88@gmail.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    Magnus Lindholm <linmag7@gmail.com>, 
    "Paul E. McKenney" <paulmck@kernel.org>, 
    Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Alpha: Emulate unaligned LDx_L/STx_C for data
 consistency
In-Reply-To: <87v7rd8h99.fsf@email.froward.int.ebiederm.org>
Message-ID: <alpine.DEB.2.21.2504092019200.18515@angie.orcam.me.uk>
References: <alpine.DEB.2.21.2502181912230.65342@angie.orcam.me.uk> <CAHk-=wgBZk1FFOyiTKLnz4jNe-eZtYsrztcYRRXZZxF8evk1Rw@mail.gmail.com> <alpine.DEB.2.21.2502202106200.65342@angie.orcam.me.uk> <alpine.DEB.2.21.2504072042350.29566@angie.orcam.me.uk>
 <CAHk-=whKa0-myNkpq2aMCQ=o7S+Sqj--TQEM8wfC9b2C04jidA@mail.gmail.com> <e1356a60-525b-4405-ad5b-eb6e93de8fef@app.fastmail.com> <87v7rd8h99.fsf@email.froward.int.ebiederm.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Apr 2025, Eric W. Biederman wrote:

> >> So unless you actually *see* the unaligned faults, I really think you
> >> shouldn't emulate them.
> >>
> >> And I'd like to know where they are if you do see them
> 
> I was nerd sniped by this so I took a look.
> 
> I have a distinct memory that even the ipv4 stack can generate unaligned
> loads.  Looking at the code in net/ipv4/ip_input.c:ip_rcv_finish_core
> there are several unprotected accesses to iph->daddr.
> 
> Which means that if the lower layers ever give something that is not 4
> byte aligned for ipv4 just reading the destination address will be an
> unaligned read.
> 
> There are similar unprotected accesses to the ipv6 destination address
> but it is declared as an array of bytes.  So that address can not
> be misaligned.
> 
> There is a theoretical path through 802.2 that adds a 3 byte sap
> header that could cause problems.  We have LLC_SAP_IP defined
> but I don't see anything calling register_8022_client that would
> be needed to hook that up to the ipv4 stack.
> 
> As long as the individual ethernet drivers have the hardware deliver
> packets 2 bytes into an aligned packet buffer the 14 byte ethernet
> header will end on a 16 byte aligned location, I don't think there
> is a way to trigger unaligned behavior with ipv4 or ipv6.
> 
> Hmm.  Looking appletalk appears to be built on top of SNAP.
> So after the ethernet header processing the code goes through
> net/llc/llc_input.c:llc_rcv and then net/802/snap_rcv before
> reaching any of the appletalk protocols.
> 
> I think the common case for llc would be 3 bytes + 5 bytes for snap,
> for 8 bytes in the common case.  But the code seems to be reading
> 4 or 5 bytes for llc so I am confused.  In either case it definitely
> appears there are cases where the ethernet headers before appletalk
> can be an odd number of bytes which has the possibility of unaligning
> everything.
> 
> Both of the appletalk protocols appear to make unguarded 16bit reads
> from their headers.  So having a buffer that is only 1 byte aligned
> looks like it will definitely be a problem.

 Thank you for your analysis, really insightful.

> > FWIW, all the major architectures that have variants without
> > unaligned load/store (arm32, mips, ppc, riscv) trap and emulate
> > them for both user and kernel access for normal memory, but
> > they don't emulate it for atomic ll/sc type instructions.
> > These instructions also trap and kill the task on the
> > architectures that can do hardware unaligned access (x86
> > cmpxchg8b being a notable exception).

 But all those architectures have 1-byte and 2-byte memory access machine 
instructions as well, and consequently none requires an RMW sequence to 
update such data quantities that implies the data consistency issue that 
we have on non-BWX Alpha.

> I don't see anything that would get atomics involved in the networking
> stack.  No READ_ONCE on packet data or anything like that.  I believe
> that is fairly fundamental as well.  Whatever is processing a packet is
> the only code processing that packet.
> 
> So I would be very surprised if the kernel needed emulation of any
> atomics, just emulation of normal unaligned reads.  I haven't looked to
> see if the transmission paths do things that will result in unaligned
> writes.

 The problem we have on the non-BWX Alpha target is that hardware has no 
memory access instructions narrower than 4 bytes.  Consequently to write a 
1- or 2-byte quantity an RMW instruction sequence is required, in the way 
of reading the whole 4-byte quantity, inserting the bytes to be modified, 
and writing the whole 4-byte quantity back to memory.  However such a 
sequence is not safe for concurrent writes, as described below.

 A pair of concurrent RMW sequences targetting the same part of an aligned 
4-byte data quantity is not an issue: it's just an execution race and 
software may be prepared for it (or otherwise either prevent the race via 
a mutex or alternatively use an atomic data type along with the associated 
accessors, which will move data locations in memory suitably apart).

 The issue is a pair of concurrent RMW sequences targetting different 
parts of the same aligned 4-byte data quantity: software can legitimately 
expect that writes to disjoint memory locations (e.g. adjacent struct 
members, except for bit-fields) won't affect each other.  But here where a 
pair of such RMW sequences runs interleaved, the later write to one 
location will clobber the value written previously to the other.  So we 
have a data race.  Note that no atomicity is concerned here, we are 
talking plain memory writes, such as with ordinary assignments to regular 
variables in C code.

 So I have come up with a solution where such RMW sequences are actually 
emitted by GCC as an LDL_L/STL_C atomic access loop which ensures that no 
intervening write has changed the aligned 4-byte data quantity containing 
the 1- or 2-byte quantity accessed.  This guarantees consistency of the 
part(s) of the aligned 4-byte data quantity *outside* the 1- or 2-byte 
quantity written.  Atomicity is guaranteed by hardware as a side effect, 
but not a part of this Alpha/Linux psABI extension (i.e. not in our 
contract).

 For known-unaligned 2-byte quantities (such as packed structure members) 
the compiler knows that they may span 2 aligned 4-byte data quantities and 
produces two LDL_L/STL_C loops with suitable address adjustments and data 
masking.  This still guarantess consistency of data *outside* the 2-byte 
quantity written.  No atomicity is guaranteed, because parts of the 2-byte 
quantity may be stored by pieces (if the 2-byte quantity is in the middle 
of an aligned 4-byte quantity, then it'll be written twice).

 The problem is with the case where the compiler has been told to produce 
code to write an aligned 2-byte quantity, but at run time it turns out 
unaligned.  Now we have to emulate the LDL_L and STL_C instructions of the 
atomic access loop or otherwise the code will crash.

 My approach for this scenario is simple: LDL_L emulation remembers the 
address accessed and data present in the 2 aligned 4-byte data quantities 
spanned, and STL_C emulation returns failure in the case of an address 
mismatch and otherwise uses two LDL_L/STL_C loops to load the the 2 
aligned 4-byte data quantities by piece, compare each with data retrieved 
previously at LDL_L emulation time, returning failure in the case of a 
mismatch, insert the requested value and then store the resulting 
quantity.  Again this guarantees consistency of the parts of the 2 aligned 
4-byte data quantities *outside* the unaligned 2-byte quantity written.  
And again, no atomicity is guaranteed.

 So while there are no atomic operations in our code at the C language 
level, we get them sneaked in by the compiler under our feet to solve the 
data consistency issue.  Now if we can ascertain the code paths concerned 
won't ever exercise concurrency, we could tell the compiler not to produce 
these atomics for 1-byte and 2-byte accesses, on a file-by-file or even 
function-by-function basis, but it seems to me like the very maintenance 
effort we want to avoid for a legacy platform.  Whereas if we build the 
kernel with the atomics enabled universally, we won't have to be bothered 
with analysing individual cases (at performance cost, but that's assumed).

 I've left 8-byte data quantities out for clarity from the consideration 
above; they're used by the compiler as suitable and handled accordingly.

 Let me know if you find anything here unclear.

  Maciej
