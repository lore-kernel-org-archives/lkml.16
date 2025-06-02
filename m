Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07A2FEAF9
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887768; cv=none; b=PCazrA6kMYv9isGN9nu2RONXZDqEgFNIiKcJH138O0uVduxB5UMEmdAYGC1Ujs6p6GKMsrDAQr889BRsi8O6IVI6qWLFkYI+xAMr7E4vm/vWq7THlXYzrfDq/K15H/IDDaan5X5+mmHb1uL54jG81tintMIau7p15/Vz+7QHOsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887768; c=relaxed/simple;
	bh=R4huI9YhzRYV6l9hXbf1bkpkoOYrrLConoapW1TatdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MG756A7PY/Ics4ObTk042QQUn8Rc+89QaC5FqEZZIB2pH6x4Tas29PSpavcnm1LJN1IxMH3DnYmSl/xUNrvEM2xdUWXJMiBxnBDQMBhvHupQJoRCjlO10XhEPlVTiR2NTvW4q+fh+biArqow9e8s/peIAj1WXbCX29j+sJB2IjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ksbTMqqF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ksbTMqqF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/CeTN9qoB9VDEULndhX8XfgE8uSQLSml3yML+oB/U+A=; b=ksbTMqqFE3uUvuhEMWkEpEHzGi
	yGeRq411F828OLgts/9Mi9vAMf+bFsZCSI03FP0lS3Dxclijsuns7OBxlAEEETByPMPROpSV4ya/M
	Nok4GgeONsxWzL8pl8BGwVcNruJLCXphSFo7BEY3XipxY/glgHXFHWQ8swJ9tqKSGt8vfmXENWUyw
	Jvmk/WMYUfEEieZXcH1nUPM/HisAOvM+LIjeM1o+tVhO3XpjlFE3E7Bk1+IvzYbU2JVMKaWtO61O6
	panbyW86LFvEh76COB38XF2HDdIkVpEqL2qqD3zC20wg4kyAzTmzYwAT7SPADeZjar37bez9QW/Ix
	kYWq6yBA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9b9-00000000ept-0lkb;
	Mon, 02 Jun 2025 18:09:23 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 100CE300787; Mon,  2 Jun 2025 20:09:22 +0200 (CEST)
Date: Mon, 2 Jun 2025 20:09:22 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org,
	acarmina@redhat.com, jpoimboe@kernel.org, mark.rutland@arm.com
Subject: Re: [RFC 6/8] x86_64/bug: Implement __WARN_printf()
Message-ID: <20250602180922.GC30486@noisy.programming.kicks-ass.net>
References: <20250602144201.301974933@infradead.org>
 <20250602144755.928750774@infradead.org>
 <CAHk-=whkD=pveK6X_5gtVbJ62+86oBOr9JokneYpSJyxjHFBpQ@mail.gmail.com>
 <20250602154943.GB30486@noisy.programming.kicks-ass.net>
 <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wiYHv2duN1Aj3E5UD3zH=z6A9YpGJ1Mxj_CWL7_FRMKgw@mail.gmail.com>

On Mon, Jun 02, 2025 at 09:38:09AM -0700, Linus Torvalds wrote:
> On Mon, 2 Jun 2025 at 08:50, Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > Yes, it absolutely builds with clang. The inline asm isn't something we
> > don't already do elsewhere :-) *cough* extable *cough*
> 
> Eww. I hadn't looked at that (or repressed it if I did). *Shudder*.
> 
> But looking around, I don't think any of the normal code I ever look
> at actually *generate* that disgusting thing.
> 
> I had to search for it, and looked at the absolute horror it generates
> in the futex code, and honestly, if I ever have to look at that
> garbage, I would throw up.
> 
> And WARN_ONCE() is in stuff I *do* look at.
> 
> So no. I'm NAK'ing it just because it makes the asm look entirely unreadable.
> 
> And no, I'm not ok with only using 'objdump' and friends to look at
> assembly generation. I want to be able to do
> 
>    make xyz.s
> 
> and look at code generation without throwing up.
> 
> The fact that we have this disgusting thing elsewhere in places that
> I've not looked at does *not* excuse adding it to other places.

Right. So the problem is using asm macros in inline-asm. We've tried
adding those macros to a global asm, but IIRC that had trouble.

So yeah, now we do the macro definition and purge right around the
inline asm and then you get this horror show :-(

Anyway, I'll try and come up with something else.
