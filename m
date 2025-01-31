Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA451C5F30;
	Fri, 31 Jan 2025 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738339366; cv=none; b=r9rRU6bEzgBswkBozn5e2XVEOwFicDiW/IESXb+/75rVMulqGDiZ64ceC7YvU7RcSQqnwq7Ls/SzsiIWFB73Yy/Wf7bbqBGUITrK+RQP1ZgzIsFCpIGuiKKGZd4biveHzaUH+EnsXRmmCjE0M2tqwjJkoiV4TzxSzyHMxBkofeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738339366; c=relaxed/simple;
	bh=LItYn27Gn5fx1t2g2Jk5KXuGL57fUlUGMyamQKK3fw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKkJkMlV3tQd22nTw8prnrvrFGe4bts3jHHBYIFShy4P/ZUJYD+ehBfC5L70viviV9JBrCrKi87M+LjsyqnTIVzDvXLev2u2/97UJ5KB2cF6zQD6EbL+qKn9tsYi8s4aH+4bhAvpasPYNVBY7SZ/v5GSYuHlABpPrqMcf+PrbCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isllp7Uk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isllp7Uk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-219f8263ae0so41344815ad.0;
        Fri, 31 Jan 2025 08:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738339364; x=1738944164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MgyuVqNeNif0jzGK4cEWcGwaVaukvqMPkaGDhwWTlMc=;
        b=isllp7Uk9OMYpwvFwHLj3OeTXXGYc/kH3B5ucXfVQz65dgr5/ndP2+mSuIHRv18MqJ
         jtqzxBeVN61OJaiD7kz0K76v7ygmMoBfc0JU8AmI/mSmawf/Cg1l2Njz8xK4TbI1R11r
         1RJwJlhGrE7I2deUyYhf1DV6mgU4UXwv1cTw2dNtbWK6G0Ffk0jzLzhouYAKpr7VCF+j
         GNGKQnkqS2EHgSqI0UdKXIveSQCVCmjgiephLSWELhsOZy3VDUX2QcKQXYmGalrQSMa3
         THUVGUrSwA+DMnO/xHT+FrdCxHhMBSHzyrw/Xdh3JIIY/iYRtLJS1UBc5IXXeFJH6hBj
         9zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738339364; x=1738944164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgyuVqNeNif0jzGK4cEWcGwaVaukvqMPkaGDhwWTlMc=;
        b=Amzoi2oPEvOeNnGQp6jOZQLwQgjm5sRi9rn0dSfXcVO9tNPJ4hY6ZAZhxXGygvy2Tr
         tUN1MGdN9Hq8JVIu5M0t/CeCdV8MArPW/gZeXVZyterFUfcf8zPAFRHtgCi+0milTt+7
         34XL/yz7PgY8s4Nt8KX1m2FyjFxCvTHV+UkumgbSJe4yMHCmBSbCapdQ7wtuPkOO9z9V
         P/enOKmC6DEoh+LDcSIWDgULEjvKBgozSjd61QRj1gjYNYEPxPRtctChNIkGc+qR7eiB
         /ns7g5pR5p3uBoE+piNvFI4dnrcaZZdek2glHQgjYJSKeBwje4nWmShcrdKbT2p3lSxH
         3WLA==
X-Forwarded-Encrypted: i=1; AJvYcCUyKUwH637vlZZP2vBp/hotLIFi76x+NFq3/cYAuVs9h30HdKTeULAxEAAeswxy2j2T8dwjBWkhkAbnnGQ=@vger.kernel.org, AJvYcCXr/ulJo3FknRugVh2l3zDRQkPwRABi8dFXQg6fHOv65H3h5+woUvVWrmWU82pb9OmDEjEUQUvHU1tnNnVrA/8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoLyjwL6OdFG/3OG0z8d0QUzQMIebompxZzmuXW1Zv4qEzCer
	VvibpwNiwm9eSKDJUDtGeoAkTwfWYfoxGVf3hmLKK2RT4rfYrfmM
X-Gm-Gg: ASbGnct5OJoWU+OeyAgV76Pe9Pc9gsSugO4l3q8B4rIVMDiVeW354FoP7XnLDCe3f3q
	vYvEkbQoItv13g1o23MbfNoGDLNe0A1xMyJi+JCikvDjbD2LZ+wBoEsW2gKIOaVOPth9QCAVGUD
	zZCWBTx1omLxUG8xS+M7XEivJU0RpGymk52UoGmjpberK5QSBKqltnAQMN9uXleFLUYSeSQURKU
	r6lCEwppYiccBu+fXllL3iKgFkjCMmMOP7V2c+aGYRWfcHiIa3uqb8gaZ/7CeheORB707JuyQaU
	cPiRX6BOnsFUSEHiwxj+N1LW
X-Google-Smtp-Source: AGHT+IEuoqwi98xpQFdlqgVQHussREEh0sVSmumXnnfCrHun85rth16LhQvg3maNZqDd4uUMiGcWfg==
X-Received: by 2002:a17:902:ce8f:b0:215:9d29:9724 with SMTP id d9443c01a7336-21dd7ddfdc9mr182585155ad.38.1738339363722;
        Fri, 31 Jan 2025 08:02:43 -0800 (PST)
Received: from linuxsimoes.. ([187.120.154.251])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21ee2bae0a5sm5656905ad.19.2025.01.31.08.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 08:02:43 -0800 (PST)
From: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
To: boqun.feng@gmail.com
Cc: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	aliceryhl@google.com,
	benno.lossin@proton.me,
	bjorn3_gh@protonmail.com,
	gary@garyguo.net,
	linux-kernel@vger.kernel.org,
	longman@redhat.com,
	mingo@redhat.com,
	ojeda@kernel.org,
	peterz@infradead.org,
	rust-for-linux@vger.kernel.org,
	tmgross@umich.edu,
	trintaeoitogc@gmail.com,
	will@kernel.org
Subject: Re: [PATCH] rust: sync: create the `get_mut()` function
Date: Fri, 31 Jan 2025 13:02:35 -0300
Message-Id: <20250131160235.305557-1-trintaeoitogc@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Z5vrhpp9Idc3tiUy@boqun-archlinux>
References: <Z5vrhpp9Idc3tiUy@boqun-archlinux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Boqun Feng <boqun.feng@gmail.com> wrotes:
> Hi Guilherme,
> 
> Thanks for the patch. First I would prefer the title being:
> 
> 	rust: sync: lock: Add Lock::get_mut()
> 
> "create" is not a good word to use here, and the parentheses after
> "get_mut" already says it's a function.
> 
> On Thu, Jan 30, 2025 at 03:51:38PM -0300, Guilherme Giacomo Simoes wrote:
> > Create a `get_mut()` function that receive a mutable instance of Lock,
> > and return a mutable reference to data because if the instance is
> > mutable, the rust compiler guarantee the access control.
> > 
> 
> This commit log doesn't include "why we need this", so please add the
> reason or the usage of this function, maybe you or someone need it
> because of some initialization/setup code after creating a lock
> protected object? Moreover...
> 
> > Suggested-by: Björn Roy Baron <bjorn3_gh@protonmail.com>
> > Signed-off-by: Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
> > ---
> >  rust/kernel/sync/lock.rs | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > index eb80048e0110..3f9d78bcb37c 100644
> > --- a/rust/kernel/sync/lock.rs
> > +++ b/rust/kernel/sync/lock.rs
> > @@ -140,6 +140,12 @@ pub fn new(t: T, name: &'static CStr, key: &'static LockClassKey) -> impl PinIni
> >              }),
> >          })
> >      }
> > +
> > +    /// Get a mutable reference to data
> 
> ... please provide an example of the usage in the doc.
> 
> > +    pub fn get_mut(&mut self) -> &mut T {
> > +        // SAFETY: the caller must guarantee that the instance is only used in one place
> 
> SAFETY comments should explain why it's safe, here it's phrased like a
> requirement, maybe something like:
> 
>     // SAFETY: `&mut self` guarantees the exclusive access to the
>     // underlying data, therefore it's safe to reborrow the inner data.
> 
> Regards,
> Boqun

Ok, I make this changes and sent a new patch:

https://lore.kernel.org/all/20250131155940.305403-1-trintaeoitogc@gmail.com

Thanks,
Guilherme
