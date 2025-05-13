Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125EF189912;
	Tue, 13 May 2025 19:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747163189; cv=none; b=iB7HLwOSreA/XJrNNKCS04oAoBNRen0yx6ZMi3vbw+61ypoFJDan4bpIav6U0o7lAutlrd7Z8412wfRNRLFfZMF/G/lu7ttc44XLuliGtVxhn2soumTvXhSzK+LAWI0g1jTkm57qYsxzC93+y97D8JzJCSCRte7Wrxb8K+Dvy6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747163189; c=relaxed/simple;
	bh=64A9hAx5fUS6HZFZ0zh5mm7yxbI6pYTr/KuOjktkkK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKecgrLQ43lXg7p3JGSUHjNaUajmpExppeLF/e/rmfN9qgwi17HcXucyN4d2Ddn6S25XQ7t78vdXR/giSHFTNceAPQvjIwXc/v5G4kjUZMB+mGwYtsirRpozdFK2h6VQUDwdX1nLfQOtvby8QnDN1GHa/IcUUZ2TOvGlxjcz3cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KBuepZeD; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KBuepZeD"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5feb22e7d84so3218505a12.3;
        Tue, 13 May 2025 12:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747163186; x=1747767986; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=co29tc+GT+eqlsOi86yB+IcGvOod/IK2VejV88ys+Dk=;
        b=KBuepZeD+swvg3qXnhkJg0fgEootyNjV8P/opB3cWOS15xlKSHbgFWcBOyxGnIZv7i
         TyteKg4H/fXOu6L7eLAQ7fGVTfCqUTyOCCgUPdiXDq5c2cOpJ2qq+5L0qY1v6tO0hKH6
         eRBI04e7rZujs2DO63EHuN6+EVQUTOToH2BtZxY4sUXNxWaU8RsfXAk4pJWGma9GX1cl
         If2Pa+bWs3u09VpbSZftsbKemvBKVM6ouaDO8x7dQ7eCeDSfgyfrLVxyDr/hldC/eWZ2
         wv1foj2JB1IgAuHiYzQDpeU1CToeQrVjG7CttzeMbs4lBdwCyZ8Q8wxQ2+CaqN1VZ7Ko
         0yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747163186; x=1747767986;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=co29tc+GT+eqlsOi86yB+IcGvOod/IK2VejV88ys+Dk=;
        b=Ca4kHR4uGKMzFuqqlTqm1EkpludVVUx2wDCre6dg+5V5gx9+2KgLVcxwMwxxKTPxKl
         i1UHED7ivDTgiWelE+hwzrOAAwfLYLt+h2csRvGHAR63nykXNf3z0SNacsikuZF2etjJ
         8KDk093ym/a0mCYBOSvnch+U7Id9RZdEmzXpxjMwxuXw3AyG65KDMLXXw7sDkNz2kbwH
         BtFc4isRre+BSdTWFmNA1C0YuTZPYehxfYRNoH98bJjGAiQhEHJ2l3RlT6kDQkkZQJS9
         HF5Wbx3VRypU44mAJHE5kqGdnBOckYoi38vIk4MFLIIHuytMMIcEqQBXbNdf5voITYi4
         vatQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYY97p8pnLoQgw6QxyIT0SP9T6q0QVGgC3CP5XDql3ZoUeTewbjsSKkqcVRVePePNDX/8EfZs89Z5OdgQ=@vger.kernel.org, AJvYcCUZAkaUr9SGxvuqN68QUBQ2IEG5iTSm2qSh297GWhgJHJrQKQuV+8I/ld70sa2ikNbN3Rhn2NO6jR24@vger.kernel.org
X-Gm-Message-State: AOJu0YxX24VBH7Q17ZizVCP/E9rDV2W0lPSuIYck14iPTlWwINYVJyPI
	reCtkiS+Wvhk4QQA2R8zj2kqYTnKfzfYRFZa1stWy60f6WBlfx0=
X-Gm-Gg: ASbGncsmle0ZMEmrw7UTaCoZhgJr52r21Dc3wOJmOAlLWT29H5ikTV6OR6pbC+frTHx
	k59Mt2w+AOfNqhwnzdxKnP9zpFKjcy3LvauYZv98v+TUPu6eTDzN6HaKSAyXJN2YFDf2b5zIJls
	Y5r8mSP8BM30CuhWce61t2u7sujGbqaEF5Xw8BdLZ4Aja646jrmFeKsBd7cj8Whb812U4qho2Da
	kngszpiY3MS5mZMoHa+rubDy0KTFk3QBC3/x5AvwU82zoVM25ddhn0k19USp73OLyb2rKtKPfa/
	Rxk4Xqa3z8YS7VA99u8qbdUK4VTICuTBBvh1pekdT+PbBJ9I
X-Google-Smtp-Source: AGHT+IEAn4zNilh9gtCGy25sS+3wVKgKgkJ+RRlZbOxvWHIc4BOunvjks1MPZx1ngt4l/sYvgNDyOw==
X-Received: by 2002:a05:6402:440b:b0:5ec:fb3d:f51f with SMTP id 4fb4d7f45d1cf-5ff988a5e8fmr266242a12.10.1747163186103;
        Tue, 13 May 2025 12:06:26 -0700 (PDT)
Received: from p183 ([46.53.251.33])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cbe5542sm7615052a12.5.2025.05.13.12.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 12:06:25 -0700 (PDT)
Date: Tue, 13 May 2025 22:06:23 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 9/9] CodingStyle: flip the rule about curlies
Message-ID: <d21af9bc-baec-4b13-b0e0-d02829822682@p183>
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-9-adobriyan@gmail.com>
 <2025051001-undertow-unsolved-3aee@gregkh>
 <433d5f82-3ca9-40b8-82e8-acd647f55d67@oss.qualcomm.com>
 <2025051204-runt-mobility-6fbc@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2025051204-runt-mobility-6fbc@gregkh>

On Mon, May 12, 2025 at 06:56:56PM +0200, Greg KH wrote:
> On Mon, May 12, 2025 at 09:43:10AM -0700, Jeff Johnson wrote:
> > On 5/9/2025 11:18 PM, Greg KH wrote:
> > > On Fri, May 09, 2025 at 11:34:30PM +0300, Alexey Dobriyan wrote:
> > >> Require set of curlies {} in all if/else branches and all loops
> > >> not matter how simple.
> > > 
> > > Sorry, but no, we are not going to change this long-term coding style
> > > rule for no real reason at this point in time.
> > 
> > Is the infamous Apple SSL bug (CVE-2014-1266) a good reason?

Indeed.

Thanks, curlies were inspired by this CVE but I forgot to mention it.

> One bug in 2014 will require us to touch 30+ million lines of code?

Nobody is proposing to reformat 30 mil lines at one commit
(as much as I'd like it).

Old code will stay old, new code will be formatted per new rules.

> Please be reasonable.

I'm very reasonable. Each patch details rationale why specific style is
better.

> And everyone, remember _why_ we have a coding style.  It's not so much
> the specifics of _what_ the coding style is,

What? When was the last time you read it? It is very much about specifics:
8 spaces, opening curly on the same line except at function scope,
80 columns, recent rule about to format function attributes.

It could have even more specific if there is pre-commit hook forcing
formatting like commercial companies do.

> one at all.  Don't argue the specifics of the coding style without a
> really really good reason why, with real details and proof.

What is "really really good"?

How do you know when it is good reason or not?

I think I have good reason: I programmed a little in another languages
where some of the rules don't apply. In particular C++/Rust don't have
a rule about declaring variables upfront. Nor does any popular programming
language designed in the last 35 years (?).

Such experience made me realize that linux-kernel CodingStyle in this
regard is pointless at best and counter-productive. It was so obvious.

> It took us a long time to increase the default line length, and that too
> is still argued about for very good and valid reasons.

It still 80 columns in CodingStyle.

> That was discussed in detail, not just thrown at us like this patch series was.

Oh come on. In Russia we say "not my first year of marriage".

One of the unwritten rules of linux-kernel is to NEVER post [RFC]
as it will be ignored, but to post a [PATCH] and Cc specific people
to force a discussion.

I don't want to look like a thief who sneaks in occasional declaration
in the middle of a function or set of curlies and get yelled by compilers
or maintainers (especially those armed with checkpatch.pl).

I'll codify this first in CodingStyle, then delete relevant checks from
checkpatch.pl (citing CodingStyle of course).
