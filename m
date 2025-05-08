Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B224B1E48
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 09:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746697814; cv=none; b=DvxXki5VIGZ1TUMGP12/3TaXtMlQaTVC8m9d0beX42YWbN303O0qRHOGl6E6KYWWWjeZWH9bozmzh0fBULlk6s9pLccbvAVQlStIS1kYArWaNhsia/kn4JroXBmfhTYwD8QljEPALWPQrt+2s4fO81a7mZ1lOe2SaxsgX3hchYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746697814; c=relaxed/simple;
	bh=00ywMczicjvLslhDXgo4TMUmGZHD8Tveta18brDBikI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=D/ltU+2My7CmXfAGqElBiwnrOCaaPB3ZuXKx/yhpa20zHXbOxVCo16p5hlg2EYkPUHt1GZlhcS/HLZ2f2aGl6YtJKigg+hmP1I3O8xSvgr0QpjvT3aQFvaRjN4hNa7BNrVEK/lpuXmNOl2gkBKtpqy8HRqcCU9TkV5VX3Es57Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wIIKMFKQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wIIKMFKQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so3351895e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 02:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746697811; x=1747302611; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=u/6uHZ3GvAkpHOsls9UjvsdvAaxsnvKcIvywoDvH3W0=;
        b=wIIKMFKQ+J4W5qMMJATbWRhqKd9DbBOCuFzOGtJZbhoGWG6noDQf/8NOk+J7Lw+VB9
         xwrKgnwHtzm2hF9XB09yNh77U1+Mk7MCklCDSpGzBu81hgatG57qVLpqQug78//iQkzY
         U1wxKY+ZGrTupKlWV9b5IpB7UI0FsGQsrbJ4Gtagax2n53K/khp8TT1yxyQGf+evJ5FF
         8aDpLJrBejqDcxNoApRIE471DryrqTkU9E9EKUgIWtwxVotEUBka2KurJS6b30jLLZcc
         i6sbEzy3YD9MlsgCxTJ5zsR/pyai1Ll5/V1iS/Nhx4xYXOhihWUkKvirIrvk9dTNhXBg
         d/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746697811; x=1747302611;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u/6uHZ3GvAkpHOsls9UjvsdvAaxsnvKcIvywoDvH3W0=;
        b=qpJA1fSM7zzzEIZFMP/8p53jqO51QfpdYXzWm/oYgPWX4axO0ASI0tiYomBRi6QohT
         Y7BvVLXfUa2USFdf+2l2jmAFGne1EEJSfDaC8k96HM/7q/ggUK0ykbDikuzev2/9noK5
         /0uViTM1qOK1O5pIU7z4nc7xpt9lPiGBapayj2NKSWIYBSDT/F9HTHB+yEijQVDma9Dt
         /aG1I/8Zwawf4b7/HNTIqbUtak5tfsH5HCGl1wNACzOM/fAyBcaCVsXWWJOBtzw+fovw
         gr1lp75LG7mdOqrzUzZPMZ4DceBBhNras3yRedKI8Z3+aUUZ5SuIEpIVCoMXRGs/3Blf
         zLSw==
X-Forwarded-Encrypted: i=1; AJvYcCWKWd6spAO9PM2NjkXJCtmFgagDE6Y05Wpj4gSbxd0s0tOGkn1V8Kmg2aFGdRg/zGqZiTMhl4W1FESLnMo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDARHcIxXpgMV0j7NAefGCCqGIXPGDuCqCckrKzywaDGFwuQXj
	oNzIYLZrNBMrdiNPhPAk/YYLN/bTgD0mHv53UhavsnhMnQOAbJyyS1xC6Z7gSFdHf3jzklEndeJ
	rWrySJ4ezBrPoiA==
X-Google-Smtp-Source: AGHT+IEPrOFfcaia13QLDulHVL4VMLLoqkhxKC0rPGGEnWlVvGIpNhU24GDrXr7kYP/zkfLYYSYSLZVsywKF6Yk=
X-Received: from wmbep21.prod.google.com ([2002:a05:600c:8415:b0:43d:40ea:764d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e02:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-442d0208645mr23551155e9.0.1746697811013;
 Thu, 08 May 2025 02:50:11 -0700 (PDT)
Date: Thu, 8 May 2025 09:50:09 +0000
In-Reply-To: <D9PWI4JVVMMP.20A1IK9ZVSG3Z@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250502-vec-methods-v5-0-06d20ad9366f@google.com>
 <20250502-vec-methods-v5-6-06d20ad9366f@google.com> <D9PWI4JVVMMP.20A1IK9ZVSG3Z@kernel.org>
Message-ID: <aBx-UTG2ZGErdSHv@google.com>
Subject: Re: [PATCH v5 6/7] rust: alloc: add Vec::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 07, 2025 at 01:44:30PM +0200, Benno Lossin wrote:
> On Fri May 2, 2025 at 3:19 PM CEST, Alice Ryhl wrote:
> > This is needed by Rust Binder in the range allocator, and by upcoming
> > GPU drivers during firmware initialization.
> >
> > Panics in the kernel are best avoided when possible, so an error is
> > returned if the index is out of bounds. An error type is used rather
> > than just returning Option<T> to let callers handle errors with ?.
> >
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> One follow-up comment below. With the `# Panics` section removed:
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>

Thanks!

> > diff --git a/rust/kernel/alloc/kvec/errors.rs b/rust/kernel/alloc/kvec/errors.rs
> > index 84c96ec5007ddc676283cbce07f4d670c3873c1e..06fe696e8bc6612a5e6aa2f6c28b685033acfa2f 100644
> > --- a/rust/kernel/alloc/kvec/errors.rs
> > +++ b/rust/kernel/alloc/kvec/errors.rs
> > @@ -21,3 +21,18 @@ fn from(_: PushError<T>) -> Error {
> >          EINVAL
> >      }
> >  }
> > +
> > +/// Error type for [`Vec::remove`].
> > +pub struct RemoveError;
> 
> Would it make sense as a follow-up to store the index that was accessed?

Usually I think we would only store the information that the caller
doesn't already know?

Alice
