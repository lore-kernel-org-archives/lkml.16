Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A37080D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750262227; cv=none; b=Rq7ua8TVsjIwy0YBYT7Wqnxi1BUN1piDiHphQ80iIejU9SukZ/Djm48x3Ks+WBq+wOL6W0/rxWUEGxCUv9Y7HPehaWlsh9srmNRjUSnmptpcsaZlJS32n9JasxXczMXQYAhI9nD1WApg9I1QzMVE8Nc8KljZersNjuKuTz+GsB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750262227; c=relaxed/simple;
	bh=5Ol34w+EX7bFAAC0ihfTOblLMvz4/xDD3U5Cm33HEqA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RmHW1t1XRQYX6niKWYlOdfeKHFjuTWlxd4siEp8iwyoAJVTv3bzi2EZV5M1dfiMWFLZPX1uLXTynNhtqhNhciFfs/bPEMhho5tqkG70hD+tz4NVdPBokIHFrv/rrc6VofFcOJKHE4XYz7jubQSq9B8O877LtZYst2IiyrOYstnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PYXieR6G; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PYXieR6G"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a5257748e1so5166931f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750262223; x=1750867023; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jy6L8+IqarhEZnw6/XACII/s6h4gpaajSXydb5Dkxug=;
        b=PYXieR6GefUat1kumZ7rc2ZOK+1Ny7ya0gTJFOapm1EdHoLMUHYy9dT5ec3lDzLFam
         5rN7PQs7rVOnffNCg9LqtwiRg3B+0JMK0AeUKctadoRfhygPjATAWHaoN5Z2qfKhPzZI
         N2k35KA9V3mfjA4O0u3gh9MZ/PhO5zApd7D9LPgIoG/nOnFRNWU/Q4peQhZilZbmm/hP
         dcIu+GBLfDOvXYj4SXfFD1dSgx1KTccf8EotzLfU+0B4ZVwNxhK4elKvbPBdZumPFGB4
         dTVdPZYrI2KwtBg8LKnRIwEN3WpXxRzYHnkRO6NUbUnsgtJWYluUmgT5/ORiZ9f+BoeI
         igYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750262223; x=1750867023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jy6L8+IqarhEZnw6/XACII/s6h4gpaajSXydb5Dkxug=;
        b=Xl2SHksrHSV2B93/IfyNDJc5goQlaG5Z43G3ML6pafppraGDSq3vUdya4VBbF1XkR+
         o9Ce9pkomUAeoIFgzLRD0ju6KlneLMCaZuY3nhRAqIflUJFQ3VhppMEATYl044tk/fxB
         D/LtGWQNd0G0ilyCaCpul9jFWMJHhdVRCxZQm+TjfXmzVEmTE4ahV1Gf/yrJdCxIl1M/
         BhGTIzyKXLlJZLEZqqsbFjVxeCXkami5lrrk3wHQn5UZm0K+SLWZahw1upqJBvC4DJRs
         oO4EfT7htZ0bswPanaNzcxzS3EBcDFFC25OwVlIU2Oo+kOttCjJeqiwWzQOcRE5lcFUw
         +nbw==
X-Forwarded-Encrypted: i=1; AJvYcCVf3CKAZDXrk2BM8JrBEtnkoXtplVI8i3hhfwMMaj+FxUp3fJEY097N6rP2ZRoyZ2dp5UXXv3c5mzF51zg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3oel2xmu/RfOTrlK4tlxhdMBV5ykCq2U+hNsjk2CPwOPwoaCd
	LgIaSPtk2644/T2riAYoOOJK6csxyuZnePhwhF87PZCjEzLR6fdfESIHxnBg9JGRXiMFX9pt3Ax
	luhVBHmxblB4fShX/P9Wt1y4OBJroDC31QS9KCBW2
X-Gm-Gg: ASbGnctVemg/Yx87cl2RFCUjx423Zf2QAUjXYgcVCiPPpby/8f0JlCk+wQhwsPKaGXS
	7Gy/vk4lKqU+KRclx4AXLc5OrKnDc+YlI+BAxwJO8aGdbVkgTj6LLotGdwBJ2as5Tg9BH8X642j
	EwWHyqCtUs6qVjzALrVEpVnuKNa1KCqC0d4d78ja20g6ht3uOzKlTKr2Y+Ag22PHEZvAmdfl1GO
	A==
X-Google-Smtp-Source: AGHT+IEJ7F5vqPD1995XVEeNlwQDn1kT4T2sjrBzxP2SNjIQPOVpoD1CGOIJc4ajjNW3i0uj/2GMpOrQIz5EJ+cKc8I=
X-Received: by 2002:a05:6000:2483:b0:3a4:ddd6:427f with SMTP id
 ffacd0b85a97d-3a5723a50dcmr14989937f8f.35.1750262223390; Wed, 18 Jun 2025
 08:57:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250618-debugfs-rust-v6-0-72cae211b133@google.com>
 <20250618-debugfs-rust-v6-2-72cae211b133@google.com> <aFLdmYLyDucTAiZx@pollux>
In-Reply-To: <aFLdmYLyDucTAiZx@pollux>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Jun 2025 17:56:50 +0200
X-Gm-Features: Ac12FXxe0yH-TlWMQeCZhQRqD163wyKjk5nADN-rhtrgFr2hX7BRbBm0weldvWo
Message-ID: <CAH5fLgg=owO8EwdC_tHCdOE1aOghcfcAzrqb5VNExCJTxcmBkw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] rust: debugfs: Bind file creation for long-lived Display
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, 
	Benno Lossin <lossin@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 5:39=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed, Jun 18, 2025 at 02:28:14AM +0000, Matthew Maurer wrote:
> > diff --git a/rust/kernel/debugfs/display_file.rs b/rust/kernel/debugfs/=
display_file.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..65e37e34d7b587482492dc2=
96637a3bc517b9fe3
> > --- /dev/null
> > +++ b/rust/kernel/debugfs/display_file.rs
> > @@ -0,0 +1,60 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +// Copyright (C) 2025 Google LLC.
> > +
> > +use crate::seq_file::SeqFile;
> > +use crate::seq_print;
> > +use core::fmt::Display;
> > +
> > +/// Implements `open` for `file_operations` via `single_open` to fill =
out a `seq_file`.
> > +///
> > +/// # Safety
> > +///
> > +/// * `inode`'s private pointer must point to a value of type `T` whic=
h will outlive the `inode`
> > +///   and will not be mutated during this call.
> > +/// * `file` must point to a live, not-yet-initialized file object.
> > +pub(crate) unsafe extern "C" fn display_open<T: Display>(
> > +    inode: *mut bindings::inode,
> > +    file: *mut bindings::file,
> > +) -> i32 {
>
> Please use kernel::ffi::c_int instead.

And please use it without the fully qualified path. The c_int typedef
is available in the prelude, so if you import kernel::prelude::* it
should be available.

Alice
