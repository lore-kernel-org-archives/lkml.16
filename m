Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8878F29CE6
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746109514; cv=none; b=dUhHo659fAuMJ/TfX9avDHW4UOmv7Ck8G18TEb8DeHssdLp/r5mX0zsQKoHicYuh2xASsWELqVkTXclOG9NaIl3lpcvxjS9NSWCisDywmKk9PKhMM5zYI4SPN9ZQNnK2NjU2B6os2v51Ingsz1mLJqTwLWLfkpr+S5LovOX/vDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746109514; c=relaxed/simple;
	bh=Z3MXZ47iTUaCEEBH3kXl1vNor6FTtX2MJHwMmEwV0YQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=EWT7EN44gFZlx0JySsXGFUAnG/C3gsx0vd1//6lmu2ZojDNnm0Z0coZv5WMNIFxHFAy3PvZ9p3tAsdKbR4pn6peNT/8oe3dy4yesNhaJ8wkIFH8tzL8IvTq4DIlrhzifOmNd6rvyjrI+3QtE6eYHHpR+jelMx4IYWBniDi6WgTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zhIn9OR1; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zhIn9OR1"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43cfda30a3cso4048385e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746109511; x=1746714311; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N2RQ2LdBVcdrE0vuwfhvFz9qDBhNFqeO1bJGiEFox7o=;
        b=zhIn9OR1LmYfLKfOB5eZ4UuIbuCOjRvA8teL/jxhWj0HyiGyGV9d18+vc9hadkT51a
         dIKegCUCh7lNyYu/sOF7kEPRi7ttSyucHvgr1WujtJexf+/NF9Hu2D0hilSrhhqVS0T4
         aLH/jLaZzUKT/5E0dezVIo8YcCHT5bALAccgTcwtwxF99lrg+qg4IoOFSpJclsdZfqj6
         ktBNZnAB21KojiXkqW/DvtH9y6FWShXYbmJTTmQ6QCyGyTjFftV0j8uwLVUC7cGMPgH3
         +xP4bu/HRpjDfjNsCqVqfIO/6JhgUKo9wP4dkewQnkX8dX5E5hIvkx3NMfajhO5LJpxP
         vIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746109511; x=1746714311;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N2RQ2LdBVcdrE0vuwfhvFz9qDBhNFqeO1bJGiEFox7o=;
        b=gRWUv5PBnc7wTETwgiiAwmQSu+Y+HgiAiRlhMB6jzFdOEyq39ApvtIsPqa9EgjP3ZH
         A3mH8UMG5D9UJpND0nQzMa7IA8HSZ+CSLDAorUFiM0nO0IktXuBvF+hHGyEGRbOvvLw5
         z1wg90+MvoTDBkvrtXiCjZXB2/Gfog4Uy7BIdto7sbC3jNAf/UJoYLTgpE9S4l9Mr2gy
         c8p7yrKlzOVJMz8VtQmt0ctdi2rCYtqZYxDbBOuG2ch6L+6eXNCKGSPMmXQTEGpTDaTK
         CUQs9VENqrgGeh3vmM+fDYbbyGwUaHPC4YAwL0dErpoNbPODD3ODRqOuoEvLeQSKHw+B
         PR+g==
X-Forwarded-Encrypted: i=1; AJvYcCVDPMivGd5zKt33tE0QDbzqkJ/VHOhXWy7P5nxqVq2+QcKu1TKCnFwlL2UDWKFP6JV+i8420Q6hYfMF7IE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFMeNfb++nr2vHDdKridOyVEyzHrSWTpM8JSyf9hNxvk7uSz8M
	RJ3hUrQO2iBZpdTZoj7GVc1unHAe4OTwxTIJ0duMOBIHKvfEbwYHmGiI17uHWv6FG7HZLCqOl5+
	1qJdGd3ZhNLA5NA==
X-Google-Smtp-Source: AGHT+IF1lcudR9XYxdP1+RKvpPDZ0RMQCEUNJVd2gkpIMFGfhav4W3z0iTjIYv3FPyy13Zt6NYgSdQf8uHQ0/dM=
X-Received: from wmbet10.prod.google.com ([2002:a05:600c:818a:b0:440:5d62:5112])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b08:b0:43c:efed:732c with SMTP id 5b1f17b1804b1-441b653c5f4mr16966775e9.28.1746109510977;
 Thu, 01 May 2025 07:25:10 -0700 (PDT)
Date: Thu, 1 May 2025 14:25:08 +0000
In-Reply-To: <aBNdtMAYvsZ8moRq@pollux>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-6-dad4436ff82d@google.com> <aBJPwKeJy1ixtwg2@pollux>
 <aBNWts7wijlN8FGy@google.com> <aBNdtMAYvsZ8moRq@pollux>
Message-ID: <aBOERFGx-kwWpo30@google.com>
Subject: Re: [PATCH v4 6/7] rust: alloc: add Vec::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, May 01, 2025 at 01:40:36PM +0200, Danilo Krummrich wrote:
> On Thu, May 01, 2025 at 11:10:46AM +0000, Alice Ryhl wrote:
> > On Wed, Apr 30, 2025 at 06:28:48PM +0200, Danilo Krummrich wrote:
> > > On Tue, Apr 29, 2025 at 02:44:26PM +0000, Alice Ryhl wrote:
> > > > This is needed by Rust Binder in the range allocator, and by upcoming
> > > > GPU drivers during firmware initialization.
> > > > 
> > > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > > ---
> > > >  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
> > > >  1 file changed, 36 insertions(+)
> > > > 
> > > > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > > > index 357f5a37c7b1d15b709a10c162292841eed0e376..0682108951675cbee05faa130e5a9ce72fc343ba 100644
> > > > --- a/rust/kernel/alloc/kvec.rs
> > > > +++ b/rust/kernel/alloc/kvec.rs
> > > > @@ -386,6 +386,42 @@ pub fn pop(&mut self) -> Option<T> {
> > > >          Some(unsafe { removed.read() })
> > > >      }
> > > >  
> > > > +    /// Removes the element at the given index.
> > > > +    ///
> > > > +    /// # Panics
> > > > +    ///
> > > > +    /// Panics if the index is out of bounds.
> > > 
> > > Let's check for the index and return an error instead. I know we also can't
> > > prevent OOB index access panics for e.g. slices, but here we can control it.
> > 
> > Okay, I will return an `Option<T>`.
> 
> Hm...to me this looks like it is a real error condition rather than something
> optional.
> 
> What does it mean if remove() returns None? It really means that the given index
> is out of bounds, which is never correct behavior for the caller of the API.
> 
> So, I'd argue that None is an unexpected return value for a caller and needs to
> be handled in an error path, for which returning a Result is much more
> ergonomic and correct, since Result can describe the reason, i.e. EINVAL,
> whereas with Option a caller would need to pick an error code itself.

Fair enough. I think a dedicated error type is probably reasonable here,
but sure.

Alice
