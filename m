Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E953225413
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669951; cv=none; b=IU6ioiJOalqEPc10XX61QlD1rTdYAyUIS45ZChWXpExeohNBCI9rD8ns9OQ9mF2I/8Vc+AZWA9b551f5u/gIPFClxsbbc/724JC86oTWPJtg9n3ycu6vcrDIYAkr8bt2e0hAXrAAY49T9OMTp8iuCOZlhokQD/d+fFjpW+Oc4Qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669951; c=relaxed/simple;
	bh=Q6mtWCm1v5uFr3b2KUN2li5YOoXLQewKKWyLP3jWxw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R2iZLMpeF9Llov3dLYOawwcsSsOrVPjIOrdfDs4leaKlAw5I+ec2WMBQ14bK7ZzcDaUhVJ9u/+/wVxGGSF8Imvs2VZfF7oWMlYv/bb7OuNHkS7rXMEqcOqYkSu3s2I25V3OjP3BLyh1n1GP9L16lXfdwg/1kGXNPabmbZGKM95o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mzg1Rtyh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mzg1Rtyh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22FCC4CEE3;
	Wed, 11 Jun 2025 19:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749669950;
	bh=Q6mtWCm1v5uFr3b2KUN2li5YOoXLQewKKWyLP3jWxw4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mzg1Rtyh0oR+fi92NHcfD3DwqHvW2dbk33zHDGI2Qtmc13mAGmsMCFGUOGTw5SZ7V
	 KXCSrJHm1l/aF453JnRT+qU37AQui4qTcR/uGtbO7sR6FPkMV/SY214nK9vQtklnL7
	 OoqjatpPfc2ojMZSBZnomkXrDvDlzQLT4cdnjn/hdjm0XRWqA0jekz2PquBbmRzvpq
	 j21j+YDji6tpZQoUGRyCSmInLhnrT9WvsCiIrd6JJq333PFIGeK5UttjpYj0PVOmru
	 4rbOld2N2tcqJ6b18yLHoQuwJ8Gqni74E2fqF2APVW+Ub+nx9ba7zYbsG07jO34AQg
	 uan58obvuxWfg==
Date: Wed, 11 Jun 2025 12:25:48 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Alexandre Chartre <alexandre.chartre@oracle.com>
Cc: Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	mingo@kernel.org
Subject: Re: [RFC 03/13] objtool: Disassemble code with libopcodes instead of
 running objdump
Message-ID: <5daj7e2fvojknehmb4phdnyg63e5oma27jlihq6b5xypgnccwt@kmc4no5gza72>
References: <20250606153440.865808-1-alexandre.chartre@oracle.com>
 <20250606153440.865808-4-alexandre.chartre@oracle.com>
 <20250611122317.GA2278213@noisy.programming.kicks-ass.net>
 <25ae649b-8f0b-447e-8e50-87444c0ea9da@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <25ae649b-8f0b-447e-8e50-87444c0ea9da@oracle.com>

On Wed, Jun 11, 2025 at 03:35:38PM +0200, Alexandre Chartre wrote:
> 
> On 6/11/25 14:23, Peter Zijlstra wrote:
> > On Fri, Jun 06, 2025 at 05:34:30PM +0200, Alexandre Chartre wrote:
> > > objtool executes the objdump command to disassemble code. Use libopcodes
> > > instead to have more control about the disassembly scope and output.
> > > 
> > > Signed-off-by: Alexandre Chartre <alexandre.chartre@oracle.com>
> > > ---
> > >   tools/objtool/Makefile                  |   2 +-
> > >   tools/objtool/arch/loongarch/decode.c   |   6 +
> > >   tools/objtool/arch/powerpc/decode.c     |   6 +
> > >   tools/objtool/arch/x86/decode.c         |   7 +
> > >   tools/objtool/check.c                   |   4 +-
> > >   tools/objtool/disas.c                   | 186 +++++++++++++++---------
> > >   tools/objtool/include/objtool/arch.h    |   5 +
> > >   tools/objtool/include/objtool/check.h   |   5 +
> > >   tools/objtool/include/objtool/objtool.h |   4 +
> > >   9 files changed, 154 insertions(+), 71 deletions(-)
> > > 
> > > diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
> > > index 8c20361dd100..00350fc7c662 100644
> > > --- a/tools/objtool/Makefile
> > > +++ b/tools/objtool/Makefile
> > > @@ -34,7 +34,7 @@ INCLUDES := -I$(srctree)/tools/include \
> > >   # is passed here to match a legacy behavior.
> > >   WARNINGS := $(EXTRA_WARNINGS) -Wno-switch-default -Wno-switch-enum -Wno-packed -Wno-nested-externs
> > >   OBJTOOL_CFLAGS := -Werror $(WARNINGS) $(KBUILD_HOSTCFLAGS) -g $(INCLUDES) $(LIBELF_FLAGS)
> > > -OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS)
> > > +OBJTOOL_LDFLAGS := $(LIBELF_LIBS) $(LIBSUBCMD) $(KBUILD_HOSTLDFLAGS) -lopcodes
> > 
> > Would it be possible to make this optional? Such that when people do not
> > have libopcodes installed they can still build the kernel.
> > 
> > Or is libopcodes a mandatory part of any binutils installation?
> 
> I guess that libopcodes is mandatory because it is used by as (and also objdump).
> But I can check if it is effectively present anyway.

libopcodes should always be present, but compiling/linking against it
shouldn't be possible unless a binutils devel pkg is installed.

So I think Peter's basically asking for what I asked for: make all this
optional depending on whether the binutils devel pkg is installed, and
print a helpful error message if somebody tries to use without.

-- 
Josh
