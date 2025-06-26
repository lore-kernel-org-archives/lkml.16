Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EE12EE988;
	Thu, 26 Jun 2025 18:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750963833; cv=none; b=WVxn5WIxgMtY0Q+pAelINEXTbONY+6foj8uiyc0KSggDLXzKk18ZNQdu49hT/uDf/GHXSxtmpYCQGZFWGQgIKmQK6BSBsuE69BXhxoAZXgcGtCqaomyKbyacmZ6N0zDLDx1IF5+t0IYSSsXE0AmWovCE3CF88TT/drshnNPsV0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750963833; c=relaxed/simple;
	bh=B8jELx8h+z45gMAddPWraepqUp+huui0e6LNh0/0M1k=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IbLJIj8Ch8t8C0VXzM2TSX1uHy/IjyNFHzeJXimfFijdmsHZdKFSsI3QZcZAD6W5lvctkGFjU4JD3+jM7is9KyQdxfGV9YCQkUt103OX8KKPTGh1WidUmAaUm15YRTqPhNokHqWzycSob9fm5Ghav7VUtItUUpJzV2xQUfi8NEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/MOAbfL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/MOAbfL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b31e0ead80eso1260715a12.0;
        Thu, 26 Jun 2025 11:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750963832; x=1751568632; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tT/zYKlN6ZjN3xYYT5+Jz2nPYygKr3Y4QXZEyrym/qA=;
        b=D/MOAbfLaTfCyxvfhWEQbxlfZhPgfvoz2Uq5a6RlQC2WFuDH+j6aCG/Pq2Pdq+8t9i
         LkXY4nKaWDgFTCHlf099T9NsSJmhUJgEsX+hIyKdsktcrhNg8II2wNtEmdiVVdkVZi6m
         0x+V3o3FPxaHTc9dlnnj6U4SnJHQiexpWu0/Kn/c8aKn31VzGCsd6/33bii6/zswDOVt
         1xjl6kkqMU1XvpcGQeBufhjAfy+PqP6+e3WIWgW7v9FDtsOqakLbsLLYdVE/ffYkrbgV
         q5yN1LI9pSUNCEZaNiszF8JbcjNDOr6EoY2wID3TZ7uEKISSlGLWanr8gQybiXWzLADc
         DAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750963832; x=1751568632;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tT/zYKlN6ZjN3xYYT5+Jz2nPYygKr3Y4QXZEyrym/qA=;
        b=f4Kvg9bjxVMCUcDXeDlPH+hrSlShonmgGadBFaSkY5grS2a5k4qQat+QKnLpio1ZbM
         oBF1igdcgeXSlLM89USGBp0MG6mZZEwi0uB57NlFkTtHGWYrgN9Gs6Eq2x+drvmALxbK
         t9W4k5G3/wG/wyGuu4zuVHERJkcL2j23SPYmLK0q0vRIM09GjuW9Ci9SXPwRgfzG+QaP
         H0FRwhFtMBoDVTdhjZUnma233Tn2VLo/n9CgT8EKXRZk28jQMZI9lDyPT4IyP0tLgW0r
         iNGIi46ekdTQZ7x3H07J+V8oG9860MmQpteiEAQ1IZwc79PVGMDmgciSwuPva3th9WZL
         zWpg==
X-Forwarded-Encrypted: i=1; AJvYcCXPGFzGWW1or2k4o8/D18rNouRBI7JFdLiENueozDpIyTfhdDT0k6cv4i2jGytZi86DXoUkvSEonBB+qGs=@vger.kernel.org, AJvYcCXddlzf5lCB/CM5rIAYk35prPemA0aXQHXPwi4FlbQiWwyhiKci1BGPW8jno7PovkPLbBf2TOkSHTUBdJtOnwU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHYwzMV4tzEwqNJPOlt7NhM/QO+ySCkNlme3VdQZZ6uiRzNnCo
	SPmVv2EyvJhW9z/vjz+vWlfzv31ROg4UeX4JCdotqkq9UtvNOqys7Zbl
X-Gm-Gg: ASbGnct4L5QhF9xMhecL97k0nQjxo67maz9vhHC4FKTp094A89SzHsmJ/cuzZIsiEy6
	x2Vrp8NM+1/keA7yLfSkWx/0fBn2kGFncZ5OzZ0/GsUMFwh/+qP6dsTDyiL/jr5ugVypT7JJbW1
	GjmLsCBXdNBItA3eMPPoF6ObjWhp499SAGZHiGmg9Mq9pV7n6Z9gj0fJYeBW5WueQ8x5kOKmiXL
	qMKWZ3RYVPBSiEoaQmwwdUzCh4NY82+RXRwA80HRDfWfnWF+70F4qD/9tjyrNjGCy3eEEt641DI
	kxKznMWgKHHNi79oYZq+b0DZ3k12MTG30e47+dH42gcuaurWeaXfRsnze44Ls8jWA1gC7FvMIB2
	lJw==
X-Google-Smtp-Source: AGHT+IFvF6jP6PBP3u85jsm2DJZo1+ExfXSmCRGLdvtkh10ZkCMNcJx1NbgwU+/1tKNLMQUEkVD7yw==
X-Received: by 2002:a17:902:d58f:b0:235:2e0:ab8 with SMTP id d9443c01a7336-23ac3cf54a7mr4504725ad.6.1750963831745;
        Thu, 26 Jun 2025 11:50:31 -0700 (PDT)
Received: from Cyndaquil. ([174.127.224.194])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23abe426d82sm3689475ad.219.2025.06.26.11.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 11:50:31 -0700 (PDT)
Message-ID: <685d9677.170a0220.3b599c.7713@mx.google.com>
X-Google-Original-Message-ID: <aF2Wd6wHcK5ePpen@Cyndaquil.>
Date: Thu, 26 Jun 2025 11:50:31 -0700
From: Mitchell Levy <levymitchell0@gmail.com>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 4/5] rust: percpu: Add pin-hole optimizations for numerics
References: <20250624-rust-percpu-v1-0-9c59b07d2a9c@gmail.com>
 <20250624-rust-percpu-v1-4-9c59b07d2a9c@gmail.com>
 <cd3a600c-a4ee-4034-f605-ad9bac5c7655@gentwo.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cd3a600c-a4ee-4034-f605-ad9bac5c7655@gentwo.org>

On Wed, Jun 25, 2025 at 10:21:17AM -0700, Christoph Lameter (Ampere) wrote:
> On Tue, 24 Jun 2025, Mitchell Levy wrote:
> 
> > The C implementations of `this_cpu_add`, `this_cpu_sub`, etc., are
> > optimized to save an instruction by avoiding having to compute
> > `this_cpu_ptr(&x)` for some per-CPU variable `x`. For example, rather
> > than
> 
> Cool. Great progress for Rust support. Maybe we can switch the SLUB
> allocator over or come up with SLRB for the Slab Rust allocator ;-)

Thank you!

I'm certainly very excited about the prospect of more Rust :)

> 
> > +        impl PerCpuNumeric<'_, $ty> {
> > +            /// Adds `rhs` to the per-CPU variable.
> > +            pub fn add(&mut self, rhs: $ty) {
> > +                // SAFETY: `self.ptr.0` is a valid offset into the per-CPU area (i.e., valid as a
> > +                // pointer relative to the `gs` segment register) by the invariants of PerCpu.
> > +                unsafe {
> > +                    asm!(
> > +                        concat!("add gs:[{off}], {val}"),
> > +                        off = in(reg) self.ptr.0 as *mut $ty,
> > +                        val = in(reg_byte) rhs,
> 
> That looks arch specific to x86? What about ARM and other platforms?

Yes; pretty much everything added by this series is x86_64 specific. In
`rust/kernel/lib.rs` the whole percpu module is gated behind
`#[cfg(CONFIG_X86_64)]`. 

I'm certainly interested in adding support for ARM and other
architectures. That said, x86 is where I started, and since it's in a
workable state, I wanted to get some input from the list.

