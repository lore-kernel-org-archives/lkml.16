Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD5F24166D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746553917; cv=none; b=VB5yWK39CkeNQlvwk7YKQ5DLlMHE91bdsrgycOkx2nFHEXuZkebB93Ta7XKOikv6EOXbjEDTKysElTDMRmEofBjjZODaloXg0nKljFvTal5UTN+4vinckEQhAFA3XCZxwXzIg+YiMxYkkpWwYi3aNn9kpreZDEpQ5JoCWsdpIsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746553917; c=relaxed/simple;
	bh=GKldRn2xakDr5T3hwZ3rii4voq63b7ufXkXqytSV3Zk=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=oHoyWk1xndQaASMJKHH80xjWipEJBVVNKdaVUoKQI6+qOeJidvN45UvP1uKHtNn82oBIweIuRHHfoY8IZsaqoOzxBij5svPeEsn6eC8m0zsOLEdg1Io9Yfr+kVhaQOEzxcnqSD8ct70+kXAMIj66tlIjlTu7/bB8sKnIZbklP6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=ADBymlec; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="ADBymlec"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 546HpI0K1002529
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 6 May 2025 10:51:18 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 546HpI0K1002529
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746553880;
	bh=I4FtJUZzL2DDpohQL/AqtN0MczUVmyJDUXAHTeXU9nM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=ADBymlecnum/6zXL1CFlLedy2hYbNnhUKF+BCStm5R0HNbxCGSzfzHhNWk23qWO9B
	 jLcU4Nz54hD8YUSqz78ph92QjFTyFcTcRfwxG4EPnFCPCdCucuQ51YxVPw6it0ZWkR
	 +DU0BKOPRjZhO80CvCCpjTJXqAoPoCW8+LKXJwuEAb9Qm4SZUWOLVUsapUTGdApz8p
	 F9XKcPOod/Bg76SQo6+59/9aPrQLUD8N642nKElifuI45to/xaVWlwgJSdAUkP+btg
	 xrlwADl2OjCwtymPOXGvz8YrlwB3H6xISs8XYhBtWnQpVIThNtd7g8z/nfcLoEkOJH
	 bPzPeZ7ATo90g==
Date: Tue, 06 May 2025 10:51:16 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: "Maciej W. Rozycki" <macro@orcam.me.uk>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org,
        "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_0/15=5D_x86=3A_Remove_su?=
 =?US-ASCII?Q?pport_for_TSC-less_and_CX8-less_CPUs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wjCiEk-kc-vOug2GKJdhHKce3vWALbqjybLPcKLHNmEbQ@mail.gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <CAHk-=wicfBCyMj_x5BiL32o55jqXfnxgn=X5BZZjA-FFER82Jg@mail.gmail.com> <alpine.DEB.2.21.2505061104490.31828@angie.orcam.me.uk> <A5AC3B8B-335C-4594-B0DC-D9247B286A37@zytor.com> <CAHk-=wjCiEk-kc-vOug2GKJdhHKce3vWALbqjybLPcKLHNmEbQ@mail.gmail.com>
Message-ID: <A50E7745-759B-462D-BA7C-C9F747070F91@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 6, 2025 10:11:04 AM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Tue, 6 May 2025 at 09:44, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> a=2E Someone would have to take it on;
>> b=2E It will need continuous testing;
>> c=2E That someone would *also* have to go through the additional effort=
 of keeping the mainline code clean for the maintainers of the modern hardw=
are=2E
>
>I think the main issue is "when problems happen, people who
>*shouldn't* have to care get reports"=2E
>
>I really think that the way forward is basically what we did for ia64:
>get rid of i486 support in mainline, and people who care about i486
>can maintain a smallish patch that basically keeps it alive for them=2E
>
>Because I suspect that the "patch to keep it working in practice" is
>likely going to remain pretty small: it's the silly cmpxchg helper
>wrappers, it's disabling ARCH_USE_CMPXCHG_LOCKREF, and probably a few
>X86_FEATURE_CX8 tests=2E
>
>And it probably (a) works fine and (b) won't be code that changs very
>much upstream, so maintaining it outside the main tree is likely not a
>lot of work=2E
>
>But because it's outside of the main tree, it won't cause pointless
>noise from 0day bots etc, and won't affect people who care about
>modern machines=2E And it can do various hacky things because the patch
>would *only* be used by people who actually run on an i486-class
>machine=2E
>
>(Ok, if you actually care about the i486SX, the patch will be much
>bigger, because it will have that whole FPU emulation code in it)
>
>             Linus

Yes, the patch will be bigger, but it's just a bunch of highly static code=
 copied straight out of the current kernel with very few touch points to th=
e rest of the kernel (which is why we didn't axe it together with i386 supp=
ort=2E Now that one was ugly, with touch points all over the place=2E)

It is basically the same idea as the arch/i486 I suggested, just in a sepa=
rate git tree (although I guess I don't really see how this is fundamentall=
y different than, say, arch/m68k=2E)

An i486/i586 retroport can presumably also axe a bunch of things like side=
 channel mitigations; most of them aren't applicable to the in-order i486/5=
86 pipelines and the rest =2E=2E=2E well, on a machine that slow, you are u=
nlikely to be running the kind of workloads that care=2E=20

Similarly, you should be able to simply unsupport the things that make the=
 entry/exit code a nightmare, like SYSENTER and fancy NMI hacks (the latter=
 requires an APIC=2E)

As far as I know, Transmeta Crusoe was the only i586-class CPU which suppo=
rted SYSENTER (if that version of the firmware even shipped, I'm not sure),=
 and Crusoe was "almost" i686 class in terms of ISA (mainly lacking PAE and=
 NOPL, and having P5-like flags behavior=2E)

There is a huge gap then to the i686, with the i686 being the direct ances=
tor of the x86-64 systems in terms of systems architecture (APIC, PAE*, etc=
; SYSENTER in the second iteration; a general tightening of the ISA definit=
ion; PCI universal by then=2E=2E=2E)

But again, this is all academic unless someone steps up and wants to take =
on such a project=2E

   -hpa

* =E2=80=93 I believe there was one version of the Pentium M which didn't =
have PAE, at least officially, although I understand that if you flipped th=
e CR4 bit it actually worked=2E I am guessing, without any concrete evidenc=
e, that there was a timing path and that it would fail at the highest opera=
ting temperatures on some subset of chips=2E
