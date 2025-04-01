Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682751E5B6F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 21:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541214; cv=none; b=Qqn6kmnov3TjuZ0ORiImHJgqB1ajotyg/6M3CAPPR5YA7bEzaefus+GuZWNaBfNB0ySt7DS9FLT6MsEeiqpSeLhBkrHxiDg2T1UYm7kuRwZgTm0xwNxFeaplfvVZIYYpJrnokvrZEtyzzr2siuqCOPHqy6qgG/4UdKxjfTxR7zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541214; c=relaxed/simple;
	bh=+XDeYiw/hW44q3jSy7fSTo+J4CILWaW2ndZoO7THvaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7bqU4onprUEmVpMmmb15+xtzx63h8DNOVjTXryCjzYDdDM0va4056Qr/Et+r0R7xK7c9k+ALac+jqUWQ7ZVAO4WJBr91seq3tMAaxLgTFf9RjRE2mbgviudq46Bzmwxq49yRGuHFTLVIh7WLe5UAIcmSKsnpnjCugFL+aap740=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SpLNy51u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SpLNy51u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0EFC4CEE9;
	Tue,  1 Apr 2025 21:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743541213;
	bh=+XDeYiw/hW44q3jSy7fSTo+J4CILWaW2ndZoO7THvaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SpLNy51u15Y/IRsWubP6KHAQ9UbeRUpjQ3ZWj0q6Lc/5hSt/alD2Cp8cpUcd0vhWn
	 fxHUi1fyxJV9D5+ayc71hOZkj0RhMnPxXL1ZgjYNS8EbFmgnf80OJklE4JXkqen6Hn
	 77c4l8S/V3hn2SLszEiQYn0JwLRo9R9vvRPb3Jqi7CaDkTs9I5A3voLj3IqjwV2B/B
	 uhqAle2pPmT5fMA+kUgBS6mnAnutQ1TzVl5qUeHHLBdMIXQDcDUwljsR+2gV7aSD5w
	 O4mV/SV5onmcW70M5fYveKmCYf9TcCQb+tRnR/XuXhT8ltOKGiUMLvSUHHoUIVYPYx
	 wvl/sdYJv3Kvw==
Date: Tue, 1 Apr 2025 23:00:09 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: mingo@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Uros Bizjak <ubizjak@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86: predict __access_ok() returning true
Message-ID: <Z-xT2Td5_8XbSO1t@gmail.com>
References: <20250401203029.1132135-1-mjguzik@gmail.com>
 <Z-xOFuT9Sl6VuFYi@gmail.com>
 <Z-xQAyPxQGvlg_hd@gmail.com>
 <CAGudoHESK=sPyYLjqubjfAy-Un18EML8HX45EgfL+UhiqU8bHA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGudoHESK=sPyYLjqubjfAy-Un18EML8HX45EgfL+UhiqU8bHA@mail.gmail.com>


* Mateusz Guzik <mjguzik@gmail.com> wrote:

> On Tue, Apr 1, 2025 at 10:43 PM Ingo Molnar <mingo@kernel.org> wrote:
> >
> >
> > * Ingo Molnar <mingo@kernel.org> wrote:
> >
> > > It's also the right place to have the hint: that user addresses are
> > > valid is the common case we optimize for.
> > >
> > > Thanks,
> > >
> > >       Ingo
> > >
> > >  arch/x86/include/asm/uaccess_64.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/x86/include/asm/uaccess_64.h b/arch/x86/include/asm/uaccess_64.h
> > > index c52f0133425b..4c13883371aa 100644
> > > --- a/arch/x86/include/asm/uaccess_64.h
> > > +++ b/arch/x86/include/asm/uaccess_64.h
> > > @@ -54,7 +54,7 @@ static inline unsigned long __untagged_addr_remote(struct mm_struct *mm,
> > >  #endif
> > >
> > >  #define valid_user_address(x) \
> > > -     ((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))
> > > +     likely((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX))
> >
> > Should we go this way, this is the safe macro variant:
> >
> >    #define valid_user_address(x) \
> >         (likely((__force unsigned long)(x) <= runtime_const_ptr(USER_PTR_MAX)))
> >
> 
> Note the are 2 tests and the other one does not get covered by *this* likely:
> valid_user_address(sum) && sum >= (__force unsigned long)ptr;
> 
> as in sum >= ptr is left be.
> 
> However, I confirmed that with your patch the issue also goes away so
> I guess it is fine.
> 
> I think it would be the safest to likely within valid_user_address()
> like in your patch, and likely on the entire expression like in mine.
> 
> That said, there will be no hard feelz if you just commit your patch
> and drop mine.

Feel free to turn it into a Co-developed-by patch:

  From: Mateusz Guzik <mjguzik@gmail.com>
  ...

  Co-developed-by: Ingo Molnar <mingo@kernel.org>
  Signed-off-by: Ingo Molnar <mingo@kernel.org>
  Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>

Because all I did was to transform your fix into something a bit more 
maintainable. I didn't even test it.

Thanks,

	Ingo
