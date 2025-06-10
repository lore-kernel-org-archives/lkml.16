Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655952367CC
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 17:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749578080; cv=none; b=Yc5x6wMw8Nfymi26nRrewLUN64fLsbtykH+LV0E0gKnepBPQdRO8W9oypXM/9C3XJGzXv2MtbMcfsmasx6x6CYO65VJUuLVzK0ttFZbXUSyK6psKIeb120BbDUZYxmzWVUsmLmHwBgFh8pKjhOobwtn0ASlBa2ATQ66wpgp8fE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749578080; c=relaxed/simple;
	bh=ianbddjc1XphHcmE63ieTxfCE+wZXczp2Z2tA7s+ncI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGe+aD5WSWidmVIQCXENzBaaJ9nWUCBjAAlQZbijG8gHJpV+7ltgzmns20X06/tizD1ASsevRv3n6H9ZxlXcHBxkutasIzrv1Wng2vJyz1E9gAJqhk0Vsaq7zWbIuPQ/JeP3hK9reeqpWKbI5FWbTj5CMvrQzoDuK1Zq9e1J04Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uXURicik; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uXURicik"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-601a67c6e61so1210a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749578077; x=1750182877; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YvAr7sx4/tHhlSv2OBT4UQtf2qLWNKlOCp57zbBnAu4=;
        b=uXURicikAGRGi5ED+h0XUyNe/NN3IGokxjk/fwpqdip/usl9gykAF9RN6bEDYAGCry
         NLGQCpy0h5NiArb1wmP8aD7lMiyIZiu+dxCQIfOZnVHeaf457ySB5Wv8uI4LMWIqOkVM
         6XiGu3ImwXkoyNSa1KRhk8j6EKVW6g94pc9k7iE6fD082zrOqh4hoWa3IpZx0MxTrN4b
         4uSPbO96lbDAxHhL+nePr+HIJNXT7/a3i7/IBGIHD+MV5W1Bs7xrQzWdTKuqaKVdllay
         sEhOlyVlS1TQdynhZuOXp+VZTQRPBTzgKqlCytvfNfXgxOw8tdPUcygXHiUXMNBRr2Hx
         E5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749578077; x=1750182877;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YvAr7sx4/tHhlSv2OBT4UQtf2qLWNKlOCp57zbBnAu4=;
        b=NegicvnipU0f5YHpAIo+epov4q+R2Vmqgli29lTwusq+CB4/VA1iEG9KKeGOViCR+h
         63k2T0QfheH4fCYyeKtLXVumVP1Ssyk6Fc3XZOSX85EKLakm/jcx8Xcpnl1qcPk0dBRR
         0E/ga1GO+OVlWCXoPZN3kCX8Gr46oQ2aWO3oggXRjbGMiZU+jdA1ylpXkagKfOA6gjqB
         HR2NP0nCSGABD8RxI+LC69N4f23TzSCQnPNspxJ6RQFYQPqzYDKNBoZWeB84MJ/7XGTl
         WQq/66YsTOgmeykJ1ZJ1gvnlDn6nZ+LxTqRD1Hu++GiLGhnxV714ow1STbcflghDY+mK
         bCqg==
X-Forwarded-Encrypted: i=1; AJvYcCU97Jts0y5FlsZfGInv/FCb7+ub9a/eLTUdzaHrCYPcDLESeuVxPutaTzxAtBUdUMjNW7V1obgEJuhDj6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzseabH3UDBxEA2+VfZWzKce8IuCe5pXrJQKLHsFOVfIWq2vN2s
	/8wCwzyNQzGKDLDK3dpPKIjMxZZBN5MzxAVHSv2TdFbhrzOIFLontPii0pKiBFZdFdjJTJ/KSJk
	v32ehk+GF1X9CgM04Q1TwVbeA3mpG/Rq9134OmvYC
X-Gm-Gg: ASbGncvciuWAVfXof6pTPK7zbnP7pYwRpVx+BSFomDDU+gDs8rHef8TbbFs+x6xzHO8
	dyMV31YN83Ipq5cf2aIDskJ9W1qWQJl79bzTOX8jA3OOisz8RBvSU2CnGDIIa6ike9xe+xTH6CD
	9fXXQvhyTYjst19saYoIOQ2HvDAWYj2kzz/jhoZmIWObqn8ngiOS7UY9W1qhLlLeIf7qYcWJH/U
	w==
X-Google-Smtp-Source: AGHT+IGK1Te+JNjSV+u4fxDZ3o1EB1kPJBHXmCjp5m53KFUwoTCOg7xxR8lGIvrTaVAiwmQuC+BOHR7+06qqyjZG0jU=
X-Received: by 2002:a05:6402:b9c:b0:607:efee:369a with SMTP id
 4fb4d7f45d1cf-6084442442bmr15031a12.4.1749578076490; Tue, 10 Jun 2025
 10:54:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aC5XDi7SaDJeUaAC@google.com> <aC7DVewqqWIKetmk@pollux>
 <aC8uNmrLUSS8sxHU@google.com> <2025052201-return-reprogram-add9@gregkh>
 <aC9krUYJmJqu0xVR@cassiopeiae> <2025052330-reverence-slideshow-d498@gregkh>
 <aDBC__rflS8625Vb@cassiopeiae> <aDCrufEjtJeGjO6z@google.com>
 <aDG6t-HdZSuWyPGo@pollux.localdomain> <aDWkGmcUBVHl7QmM@google.com> <aDWnCsVvlnpmYxUz@cassiopeiae>
In-Reply-To: <aDWnCsVvlnpmYxUz@cassiopeiae>
From: Matthew Maurer <mmaurer@google.com>
Date: Tue, 10 Jun 2025 10:54:24 -0700
X-Gm-Features: AX0GCFsWyX3EaA5GxRfrgpq61a-WCT0s04HVyWUG5Kb_ijfZycvo0GUAd9G8RlQ
Message-ID: <CAGSQo02XEuHGJ8YMvBp=S=3sWt=0R-wEkdkTp7aEsnaCBEB1wg@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I'm going to try to rework the patch based on the feedback here, and
have a few things I want to check on to reduce cycling:

1. Every approach described in this thread will result in the creation
APIs (create a root dir, create a subdir, create a file) being
fallible (returns `Result<>`) because they use `Arc` in the
implementation which fundamentally allocates. I previously got the
feedback that the debugfs API should have no possibility of handleable
errors. This would *not* mean that we were signaling the errors out of
the raw debugfs bindings into Rust, but Rust would be able to detect
`Arc` allocation failures unless you really want me to be hiding
allocation failures (I could theoretically do this by generating a
dummy object on allocation failure, but this would add complexity and
seems questionable).
2. If we're not using borrowing to statically prevent entries from
outliving their parents, there are two possible semantics for what to
do when an entry *does* outlive its parent:
  a. The parent doesn't actually get `debugfs_remove` called until all
its child objects have left scope too. This can be accomplished by
just having a `_parent: Option<Arc<Entry>>` in each `Entry` structure.
  b. We get ghost objects, e.g. the child object is still around, but
it is somehow able to discover that its `dentry` pointer is no longer
valid and avoids trying to use it. The best solution I have to this is
to again maintain an optional parent `Arc`, but also have `Entry` hold
an additional refcount member. When you want to create a subdir, a
file in a directory, or delete any of those, you'd walk the spine of
parents, trying to claim the extra refcount on everything. Once you've
got it, you can safely delete yourself or create a subdirectory or
file. Then, whoever is last out of the extra refcount (either the
owning object or someone holding a reference while they perform an
operation on themselves) can try to clean up, again by claiming the
spine above them.
3. If we're not supporting `leak` or lifetime-based `File` anymore,
then I don't think my method of attaching data is needed anymore. It
was complex primarily in order to support statically enforced
lifetimes on dirs/subdirs/files, and several of the tricks I was using
don't work without a lifetime on the `File` type. Instead, I'll make
it so that `File` objects can attach a `ForeignOwnable`, with the
expected common cases being either `&'static MyData` or `Arc<MyData>`.

Unless I get additional feedback, I'm currently implementing 2-a,
using `ForeignOwnable` based attachments of data to files, and
returning `Result` where the only actual failure possibility is
allocation failure.
