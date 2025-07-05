Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 168D519B3EC;
	Sat,  5 Jul 2025 16:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751731611; cv=none; b=n+IgzWh3crIjp4gLTo6ZIwWp9y4PYStK2GOKUszkCcWB3OQ99zGDmit9o0c4OmkpYmfm16n14+9sN+h5KtgLHvWl75laFNMNDAinfyyTp+I1IRPooDiLmks9tAZsf0yX01XFGHgGaNCp8VpBwZ8IzM0fCgDgEQkFVFfJy85eKqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751731611; c=relaxed/simple;
	bh=y0H0EANButT4ArqmES/ZfDZCkotgyEGoIYicibOXS0k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1Ts34t6naHsqfcte8IyXe0jrWYphnJsBA7FZJzSRLMbL2R/hpPO4k99H7yrZmr0fprkOuVZ4jXDjYH/L2yMqVPAsroDRY6YIJhRbG0oLCJg6PIaHczcq7n/3BGUWR/u22kerxftDn3uiUTPXEwgfMGrOFISdu0tkdrjHtuFovQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awdESi7J; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awdESi7J"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-70109af5f70so19519476d6.0;
        Sat, 05 Jul 2025 09:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751731609; x=1752336409; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JndDrWnjXQY7ew0Jd3JT3AX10PeT8MFcU5Z1RFxY108=;
        b=awdESi7JMiknr4zLz3uk7M6d2FV1OkG9ER+DPbUnUjTB6SPaJSFRBc2ZC3a0r+7gxb
         oBlO0G+r4DSnwvqe5M9QJK96PSSxueOL94ULtRNwCkwrHvQStrGI92hviUKI/kxNe8jG
         qbySnDhbrbCAZQRNu1RczDukEfcFq7y9C0GwjKIwSism1z1vbdj7DAqbj5e0Z7h+u83h
         SDXmzGdhHaKUZscIy89gAjoovKFmg2kMdXfpnoBux1qtZ/rq2pAnNdgtFQSLf3ZAChTB
         uVnIFdD2Pza22VAZzsIyWm8y9JDCzhkB3WUOTiq0lFhqouaq9GRLQwVbk4RTGL9MVT75
         T8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751731609; x=1752336409;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JndDrWnjXQY7ew0Jd3JT3AX10PeT8MFcU5Z1RFxY108=;
        b=WPYYVFUZNNePYciFdhrmSLm0+bDFBvtlCRt71RXHHIKtFIO0l/Hd+yQaGv5Tvr6nV8
         uuYEAMaZgcz3+inZOp/83YXj1rX8UCaLUL7SmNBrstY38kjvm4qn+rLCv8ZwSHDrmUmD
         aIkGhhIpoR4ljzQ5R77kPNSMAhhBDiVlMCHiOW6JgBl63xU7dYZuSGJ5w//dcgHxiz4Z
         /sKrysJnP8AUkt9IX9rzr5Sg55hdvtv76X0X9WTj8QnJxD11FhPtnSqMLjo/XYPnNsdC
         J1qnAY9fMMZT02x1HVILTja6d5p76cewF11gpm6NdTY79s8dihWSaV8FzIZotU/mScFQ
         HH0w==
X-Forwarded-Encrypted: i=1; AJvYcCUsCMM2tpcPWsqS/sfgspjNQu20L1XFegKirySDSAqe/WtP2GBBY0iGFXNHuQmnCg8od3Dtz5IFyOkqmz4=@vger.kernel.org, AJvYcCX41nrRWlt7rJlu+SJBsB1a/UgFs49rz5uURIqAN5jbJUCU2ygPxRz88XsKS/aBC1kLFeTomFdTVjEA9sHju38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60qOI8L/d+o4Vy0LDKfAxjejEZVudFzbBWRLGYyIHb1mtuD/9
	9cwkuRzucqMnBKSCXo5Z7rk+Mz3FZcI3Ivv2lo6bZDD4YlyjUQRbOMSq
X-Gm-Gg: ASbGncusSmEBYZTTfRPjposJgTBpHP4VgliAebqSAF8mwYVN1eRt0gH2zdS8mjjo07o
	zANrq1jkvKBjXYMYK/Yus6Zq3D2AyFT7fs4HI1EMOy+krlmBbmf3cFWCZbX4RiFpAuWcDoOlOth
	cFI43sJMX8FE2qe9cr+ftrnNuxVZNyCOIPH8TcxJ4wGrTd8DkXN8IDkjqlOhFWQZzuxtY+lf644
	TWbWRv12GeRAY1qMOx+JgyHg8fUe9QpkyltHzX+RtwwJcuq79R/RxTI7nDyt5amHdhUwHxp7eji
	JHIrkJ05KEf/7ML4G9QsKiJQZ3178s872YwlXTa1QzA1Dlb3dGXNALGUA691B6YYJZlYqtIk/HO
	aJyhthLOqDVnPM1v1hS3wWLkIV59pGPSl6fOT9WcuYa3GSyn6LA+W
X-Google-Smtp-Source: AGHT+IHmGtbwgOINKEFc2iSz5jAdVM05XP8L3ppMnBGLyWKx9PVq6Ymj169aF98C3t+PIOh7z0cgjA==
X-Received: by 2002:a05:6214:1252:b0:6fa:ac51:bbda with SMTP id 6a1803df08f44-702d171dcb4mr46950256d6.26.1751731608693;
        Sat, 05 Jul 2025 09:06:48 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d60549sm30439386d6.115.2025.07.05.09.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 09:06:48 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id DFF92F40068;
	Sat,  5 Jul 2025 12:06:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Sat, 05 Jul 2025 12:06:47 -0400
X-ME-Sender: <xms:l01paNVgIvbB7-wbZdTQMeaR4CtoyZLaTII7WNSnIQg5m5VX2scXVQ>
    <xme:l01paNm09PFlo0JcnSlmzQNbW8LiZVujVmg2EDP5rYuNWlydMlNPXO7ftH0nQM1U2
    5rGZWsCDPQ4O61qrw>
X-ME-Received: <xmr:l01paJZOGL3FOXudjp0biue09NVHojf-5udoW0MSI0NliGodDW1ilUpg9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegurghkrheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepthgrmhhirhgusehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    ghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepoh
    hjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhes
    ghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprh
    gtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphht
    thhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusg
    horhhgsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:l01paAWmHyVO4xEwOjg-TZ-J_jU2AAAUW1z4WNPi7AUbOjDR1Nbkxg>
    <xmx:l01paHnygdyZJTW4gh1EHcASHirOFJa3e3Ir3mjHF6kXCK4ZA35q-A>
    <xmx:l01paNePn5njldJEmaDi3GfHihYWP6JB1pCRjuKnPyQjTLdRFrAUtg>
    <xmx:l01paBH6_EKIfuMxOicA7eQCYDHqtHWzCd3HVVH4Dgaf1x0TuJiCoQ>
    <xmx:l01paBmMvhwVFmrBXU_NfI_1U4jWwXmgN7VXOLR93PGSpMBD5nAS7eLf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 5 Jul 2025 12:06:47 -0400 (EDT)
Date: Sat, 5 Jul 2025 09:06:46 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: add miscdevice Rust abstractions
Message-ID: <aGlNlmOsLNcew0QD@Mac.home>
References: <20250705-miscdevice-maintainers-v1-1-9a6b67f7602f@gmail.com>
 <990fcbf1-e067-474c-a0e8-0efc245d152b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <990fcbf1-e067-474c-a0e8-0efc245d152b@kernel.org>

On Sat, Jul 05, 2025 at 05:54:27PM +0200, Danilo Krummrich wrote:
> On 7/5/25 5:45 PM, Tamir Duberstein wrote:
> > Add rust abstractions to miscdevice MAINTAINERS entry.
> > 
> > Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Acked-by: Boqun Feng <boqun.feng@gmail.com>

Thanks!

Regards,
Boqun

> 
> You should send this to Greg. :)
> 
> > ---
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index c3f7fbd0d67a..a9a094e2c914 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -5568,6 +5568,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
> >   F:	drivers/char/
> >   F:	drivers/misc/
> >   F:	include/linux/miscdevice.h
> > +F:	rust/kernel/miscdevice.rs
> >   F:	samples/rust/rust_misc_device.rs
> >   X:	drivers/char/agp/
> >   X:	drivers/char/hw_random/
> > 
> > ---
> > base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
> > change-id: 20250705-miscdevice-maintainers-2aca6f19fa0a
> > 
> > Best regards,
> > --
> > Tamir Duberstein <tamird@gmail.com>
> > 
> 
