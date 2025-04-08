Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD761D61A2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 16:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130815; cv=none; b=htZlYjeY2tYhrUIJZcCawhRNlTPXe+mp5cG3qomRia4Fuab/GhX0fk+Jphb+FexkcFCObr4rWcpSoKVzTnqg4og5PlIQ94dAoYBPiduhXP/EO1CmwM0A1C6wfWai8+bsV4VMLFQtyUKFenklwgLXcbnMqRQY0qi8cJRhz3CCD8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130815; c=relaxed/simple;
	bh=kib4hu2h+hnDSTmXNmw0tHEBiLvGQJXXHt/NICG3OQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KOYjxP3FZipUcrBg1K3xt7ZWlrvsDjkORxFZBHn495qra5qIEdSPit6GiOpJx0c52FI9wyDNBXCO5Z/3BQ5sdnN8ZsjxMOrOs4X2PfCQARtd0oQHx7bBdq+IDE4OCe4Mv/7St/0MoMqaWe3Mh2EBiGzdBfD0TlAC58PxQM/uvgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OTbcpQvM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OTbcpQvM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FE0C4CEE5;
	Tue,  8 Apr 2025 16:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744130814;
	bh=kib4hu2h+hnDSTmXNmw0tHEBiLvGQJXXHt/NICG3OQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OTbcpQvMhiTXk6giO3MMk7yMnsC+hIBU0+7BKR5zfdyRk3N26womBY3+usb030fEA
	 0jNq6SCzYOrSugg9QojweBCssw1xzd/XJyoVm9UdmmOfRsgc2QHZjKQcsB7+D+IrZm
	 gArJ8jcSQQr601lLN5Kz7O0K/MQQjgzXz/EHiOx4w6YuV3yTeDefQimjh+W96dWtmh
	 iHDxg6gv92BTy+vxKmTQtspFVjjcO+kq1JRDGlv2LC4XkCEZMijv74twZxPXGTrtzd
	 H4czUbAQyGs/lpkTdAP9w56dBX5SYV6moIthmw3dRCYKDavVpnjMaBzRaeAFbiQMPl
	 Ka3eHTal/0zfg==
Date: Tue, 8 Apr 2025 09:46:52 -0700
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH RFC 3/5] noinstr: Use asm_inline() in
 instrumentation_{begin,end}()
Message-ID: <zjmiiapcr2zvie2iw4s72g27bzwadrzxkoawv2klqxiq6kofsx@352hdmgvcozt>
References: <cover.1744098446.git.jpoimboe@kernel.org>
 <7cb41fe7e87a003fc925164d5cc18efd8e95fcc0.1744098446.git.jpoimboe@kernel.org>
 <Z_TeoLQfZA858jk-@gmail.com>
 <CAFULd4ao0jmxR7fzbpFsb43E+qAeGSqoWGeV47i7gKMV8chOGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFULd4ao0jmxR7fzbpFsb43E+qAeGSqoWGeV47i7gKMV8chOGg@mail.gmail.com>

On Tue, Apr 08, 2025 at 01:10:14PM +0200, Uros Bizjak wrote:
> On Tue, Apr 8, 2025 at 10:30 AM Ingo Molnar <mingo@kernel.org> wrote:
> > * Josh Poimboeuf <jpoimboe@kernel.org> wrote:
> >
> > > Use asm_inline() to prevent the compiler from making poor inlining
> > > decisions based on the length of the objtool annotations.
> > >
> > > For a defconfig kernel built with GCC 14.2.1, bloat-o-meter reports a
> > > 0.18% text size increase:
> > >
> > >   add/remove: 88/433 grow/shrink: 967/487 up/down: 87579/-52630 (34949)
> > >   Total: Before=19448407, After=19483356, chg +0.18%
> > >
> > > Presumably the text growth is due to increased inlining.  A net total of
> > > 345 functions were removed.
> >
> > Since +0.18% puts this into the 'significant' category of .text size
> > increases, it would be nice to see a bit more details about the nature
> > of these function calls removed: were they really explicit calls to
> > __instrumentation_begin()/end(), or somehow tail-call optimized out, or
> > something else?

The instrumentation macros are used by WARN*() and lockdep, so this can
affect a lot of functions.

BTW, without the objtool annotations, each of those macros resolves to a
single NOP.  So using inline_asm() seems obviously correct here as it
accurately communicates the code size to the compiler.  I'm not sure if
that was clear from the description.

> > Also, I'm wondering where the 34,949 bytes bloat comes from: with 345
> > functions removed that's 100 bytes per function? Doesn't sound right.
> 
> Please note that removed functions can be inlined at several places. E.g.:
> 
> $ grep "<encode_string>"  objdump.old
> 
> 00000000004506e0 <encode_string>:
>  45113c:       e8 9f f5 ff ff          call   4506e0 <encode_string>
>  452bcb:       e9 10 db ff ff          jmp    4506e0 <encode_string>
>  453d33:       e8 a8 c9 ff ff          call   4506e0 <encode_string>
>  453ef7:       e8 e4 c7 ff ff          call   4506e0 <encode_string>
>  45549f:       e8 3c b2 ff ff          call   4506e0 <encode_string>
>  455843:       e8 98 ae ff ff          call   4506e0 <encode_string>
>  455b37:       e8 a4 ab ff ff          call   4506e0 <encode_string>
>  455b47:       e8 94 ab ff ff          call   4506e0 <encode_string>
>  4564fa:       e8 e1 a1 ff ff          call   4506e0 <encode_string>
>  456669:       e8 72 a0 ff ff          call   4506e0 <encode_string>
>  456691:       e8 4a a0 ff ff          call   4506e0 <encode_string>
>  4566a0:       e8 3b a0 ff ff          call   4506e0 <encode_string>
>  4569aa:       e8 31 9d ff ff          call   4506e0 <encode_string>
>  456e79:       e9 62 98 ff ff          jmp    4506e0 <encode_string>
>  456efe:       e9 dd 97 ff ff          jmp    4506e0 <encode_string>
> 
> all these calls now inline:
> 
> encode_string                                 58       -     -58
> 
> where for example encode_putfh() grows by:
> 
> encode_putfh                                  70     118     +48

Thanks for looking!  That makes sense: encode_string() uses
WARN_ON_ONCE() which uses instrumentation_begin()/end().
encode_string() is getting inlined now that GCC has more accurate
information about its size.

> > Also, is the bloat-o-meter output limited to the .text section, or does
> > it include growth in out-of-line sections too?
>
> bloat-o-meter by default looks at all sybol types ("tTdDbBrRvVwW" as
> returned by nm). Adding "-c" option will categorize the output by
> symbol type (this is x86_64 defconfig change with gcc-4.2.1):
> 
> add/remove: 72/350 grow/shrink: 918/348 up/down: 80532/-46857 (33675)
> Function                                     old     new   delta
> ...
> Total: Before=16685068, After=16718743, chg +0.20%
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Data                                         old     new   delta
> Total: Before=4471889, After=4471889, chg +0.00%
> add/remove: 0/1 grow/shrink: 0/0 up/down: 0/-12 (-12)
> RO Data                                      old     new   delta
> icl_voltage_level_max_cdclk                   12       -     -12
> Total: Before=1783310, After=1783298, chg -0.00%

Right.  That means that bloat-o-meter's results include any
text.unlikely growth/shrinkage, because that code is contained by
symbols (typically .cold subfunctons).

I suppose it would be more helpful if .text.unlikely were excluded or
separated out.  .text.unlikely code growth is always a good thing, as
opposed to .text for which growth can be good or bad.

-- 
Josh
