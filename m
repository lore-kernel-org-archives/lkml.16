Received: from gentwo.org (gentwo.org [62.72.0.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AA819AD70;
	Thu,  6 Feb 2025 21:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.72.0.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738877490; cv=none; b=iHgpsMX8hZyqN0MOtKICdvfpBErtDwntmszqDDVtKVaWtsqW3hIAwRZNkqpcRjIT44KGCM3zyrWFzMI1uScxy9//01WHKx+hFw+sHyECaXzcnjvZ6/UD7ZhTfWNotYEP7IxVHtQ4pNAYWbdePwUkYx2Q0Aa442H0zczAUKJM+oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738877490; c=relaxed/simple;
	bh=F2jqlpwTo2MW743dx82l7OJPk/nMa2jFFcu4kDo1YtI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nSbRUK0YsNLmJLpnM/UdRPq83CDd9yQaj1geLi8b8bXsP5RvpQau/V4xRoIv+Vp6gur8s3DdF3ll+80uSQwKowJN81oy7MUyG8MH6ou81gTxmEX4C1acxQ7hCHcuz7Ld7lGE2pkvQqzmwcpqZK927bjVnP6E0wZKhfx1XrFPzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org; spf=pass smtp.mailfrom=gentwo.org; dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b=FYcvTqLE; arc=none smtp.client-ip=62.72.0.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=gentwo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentwo.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gentwo.org header.i=@gentwo.org header.b="FYcvTqLE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gentwo.org;
	s=default; t=1738869076;
	bh=F2jqlpwTo2MW743dx82l7OJPk/nMa2jFFcu4kDo1YtI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FYcvTqLETvIDV898S86+xT9SbePWJllnFgwWELTqoYC+Ih5/O0lacqyjKvIwxKeYl
	 0bRynm64ajsLxhkOs9IC2kkFJOFCeX8dIdo5rb/+Td+a2jaoRxPwY+5pkECXs4UPOq
	 jRDzNL1vUjiJGkL0HmYhRBF7jwa5kXwPsOZoma2c=
Received: by gentwo.org (Postfix, from userid 1003)
	id 257D54028B; Thu,  6 Feb 2025 11:11:16 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by gentwo.org (Postfix) with ESMTP id 215A9400CA;
	Thu,  6 Feb 2025 11:11:16 -0800 (PST)
Date: Thu, 6 Feb 2025 11:11:16 -0800 (PST)
From: "Christoph Lameter (Ampere)" <cl@gentwo.org>
To: Jessica Clarke <jrtc27@jrtc27.com>
cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org, 
    xin@zytor.com, kirill.shutemov@linux.intel.com, palmer@dabbelt.com, 
    tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, ardb@kernel.org, 
    dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org, 
    akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net, 
    dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com, 
    tglx@linutronix.de, hpa@zytor.com, seanjc@google.com, 
    paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com, 
    jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com, 
    jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com, 
    rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com, 
    catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org, 
    ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de, 
    kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com, 
    julian.stecklina@cyberus-technology.de, peterz@infradead.org, 
    kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode
 for x86
In-Reply-To: <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
Message-ID: <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com> <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org> <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com> <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
 <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-815475849-1738869076=:2425008"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-815475849-1738869076=:2425008
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT

On Thu, 6 Feb 2025, Jessica Clarke wrote:

> On 5 Feb 2025, at 18:51, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> > On Ampere Processor hardware there is no penalty since the logic is build
> > into the usual read/write paths. This is by design. There may be on other
> > platforms that cannot do this.
>
> You helpfully cut out all the explanation of where the performance
> penalty comes from. But if it’s as you say I can only assume your
> design chooses to stall all stores until they have actually written, in
> which case you have a performance cost compared with hardware that
> omitted MTE or optimises for non-synchronous MTE. The literature on MTE
> agrees that it is not no penalty (but can be low penalty). I don’t
> really want to have some big debate here about the ins and outs of MTE,
> it’s not the place for it, but I will stand up and point out that
> claiming MTE to be “no performance penalty” is misrepresentative of the
> truth

I cannot share details since this information has not been released to be
public yet. I hear that a whitepaper will be coming soon to explain this
feature. The AmpereOne processors have been released a couple of months
ago.

I also see that KASAN_HW_TAGS exist but this means that the tags can only
be used with CONFIG_KASAN which is a kernel configuration for debug
purposes.

What we are interested in is a *production* implementation with minimal
software overhead that will be the default on ARM64 if the appropriate
hardware is detected. That in turn will hopefully allow other software
instrumentation that is currently used to keep small objects secure and in
turn creates overhead.

--8323329-815475849-1738869076=:2425008--
