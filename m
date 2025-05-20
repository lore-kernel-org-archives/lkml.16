Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B93A25393E
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747776266; cv=none; b=mGKm76f/dH9y54MMFIpPhdNJC55xaCKnIxmkAmCQlGO5OnjDEctQGuhe7byEwDYZavBTblN6VkUTVWb2S+XaYibrBjoBxgh8sGy5TpdjOvcXu6bW8Pg71Ok+obCCpzCmFi6TD2ZX7KsHZ9nc/YwL9FRjqP7oR82pbe7LVZsFTSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747776266; c=relaxed/simple;
	bh=qBAn9K0gwiw7l/PvQKNwTTjTsiS+Ohorv1ckRgbFivc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jR2E8/GctSMlj345KwbUzSsR/Wv5iObfkUZBiv5/EP7nzAIawh7r2CgaaaYyzJcgWQyGeeVjFyfXdXFCYBHe1NrDADoqDiXpDLVuVIo69m9CFZPdAobrThVCTo+f6LYdrZHtvGU4woZ7UJ/eCVxvK/ST1ihrhUsPmqqz3UWjDnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=igkKk+9K; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="igkKk+9K"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a3703c1fe7so1286914f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:24:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747776263; x=1748381063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqxtighEQhFf5QGc5IOw85K4fBlqypHOau9ttcox3Tk=;
        b=igkKk+9KC2Gj7Clnnox3YL3I1fuT4MTXyX0fBkUkh173Zg/NpS439uyL1+YJFxnHXv
         W3VkhE4GLE7yNY4FcvltC5eq+OTFS029YD1a10M4+7RuVuJAxWnCNUEBbDS0eod0asOf
         K79yoF628M6lY1F2FwyxhnuNvZlZCuTf3Y9oicBd2Zm/ymo2GXgDkicnszp1b1eS7WGg
         XiiTFugvppsf6fB5SYXb7MxPfIqiIuAe2VBtsp3OaOfu6Dpmw7oOCFTjagq5MyCVVSsl
         1cOGjUr1AdhmsLl9MZnQx4syp3X/d0zGUg6b/qBa+FOTMwRdD2BHQ7kW6flj5TS8Y3gE
         YVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747776263; x=1748381063;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kqxtighEQhFf5QGc5IOw85K4fBlqypHOau9ttcox3Tk=;
        b=mKGo6W3mFa6HFZaRWE1q424qjxm3avFk4vZywYkLdEyNt3MJ5rCrTUxP+GGeSKFBmB
         /C8+IwcgTFuUu+CmqLwxIV2BW/tg7zaNAZH+jh0slv+Uap3qE/QUMMcQNlLQNwOLPRMk
         1FXNuudHEpqH/tD7LHqX1kgO5kmiK4IAK8NzudRG9f6pRXPSNQ9GY53lpZbel1nU5cle
         5ELpeffBfduN2/b7yERnTVZQFE57PQmLCc7LE44GC9y0F42CNLWFNMpPDaZ5rfhx+xbP
         5hB09aVL1Z31UOmu4oIbzk0Q+X6TxH8BpQ18aDMRNqhIIWdgfAMBH9yU/ieqOI75RUjQ
         /bSA==
X-Forwarded-Encrypted: i=1; AJvYcCUdojwvrOZv/gQeL4S/UdwGAbexnOshImRy6GkRLD9BPKPgvxTP+zjnQVgK39pwnEhkcNpiSMNB/WVXYo0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyFcCdJKDek3kD7YyuHOiVbD5K3mxV4c4YIxHwoRpy6nkNHmNE
	twQhqvSEtnZjDt2/qZphwM/m9TUSZerVANHmNlavDHIDoBvMHakzIF71GQUGovctPbfxZE8k8Uy
	xdpJxjDxDrjPeQZBoag==
X-Google-Smtp-Source: AGHT+IFvK6lYQvx2L6jINFxQO+gBq2YbD35qhGJkE3BkwWu3QiVTLgX06dnqeiYQgUXgqTMgQIL2MCI9nV8n47k=
X-Received: from wrs11.prod.google.com ([2002:a05:6000:64b:b0:3a0:b572:e1d4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:400f:b0:3a0:aed9:e34 with SMTP id ffacd0b85a97d-3a3601db6c1mr16608989f8f.48.1747776263102;
 Tue, 20 May 2025 14:24:23 -0700 (PDT)
Date: Tue, 20 May 2025 21:24:21 +0000
In-Reply-To: <2025051524-festival-afterglow-8483@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250505-debugfs-rust-v5-0-3e93ce7bb76e@google.com>
 <20250505-debugfs-rust-v5-4-3e93ce7bb76e@google.com> <D9VPA1M45WBK.1TB4KOUXD24BD@kernel.org>
 <aCRdNJ2oq-REBotd@pollux> <CAGSQo0204_Dz65G33pAN3_iY=ejPXJRdAiB4ioM-nvMkAh0YXQ@mail.gmail.com>
 <D9WM0BP5446N.1NVNDCZ4Y2QN1@kernel.org> <2025051524-festival-afterglow-8483@gregkh>
Message-ID: <aCzzBT96ktapP03e@google.com>
Subject: Re: [PATCH v5 4/4] rust: samples: Add debugfs sample
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Benno Lossin <lossin@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 01:43:09PM +0200, Greg Kroah-Hartman wrote:
> On Thu, May 15, 2025 at 10:59:44AM +0200, Benno Lossin wrote:
> > On Wed May 14, 2025 at 11:55 PM CEST, Matthew Maurer wrote:
> > > On Wed, May 14, 2025 at 2:07=E2=80=AFAM Danilo Krummrich <dakr@kernel=
.org> wrote:
> > >> However, I really think we should keep the code as it is in this ver=
sion and
> > >> just don't provide an example that utilizes ManuallyDrop and forget(=
).
> > >>
> > >> I don't see how the idea of "manually dropping" (sub-)directories an=
d files
> > >> provides any real value compared to just storing their instance in a=
 driver
> > >> structure as long as they should stay alive, which is much more intu=
itive
> > >> anyways.
> > >
> > > We can't easily do this, because dropping a root directory recursivel=
y
> > > drops everything underneath it. This means that if I have
> > >
> > > foo/
> > >   - bar/
> > >   - baz/
> > >
> > > Then my directory handle for `bar` have to be guaranteed to outlive m=
y
> > > directory handle for `foo` so that I know it's didn't get deleted
> > > under me. This is why they have a borrow onto their parent directory.
> > > This borrow means that you can't (without `unsafe`, or something like
> > > `yoke`) keep handles to `foo` and `bar` in the same struct.
> >=20
> > Is there no refcount that we can use instead of borrowing? I guess not,
> > since one can call `debugfs_remove`. What about a refcount on the rust
> > side? or is debugfs not used for "debugging" and needs to have the
> > performance of no refcount?
>=20
> debugfs should never have any performance issues (i.e. you don't use it
> for performant things.)
>=20
> So refcount away!  That should never be an issue.

What I imagine would be the ideal API for Rust is the following:

* For each file / dir you create, you get a Rust object that owns it.

* When you destroy one of these Rust objects, it disappears from the
  file system. I.e., dropping a directory removes things recursively.

* If you remove a directory before the removing objects inside it, then
  the Rust objects become "ghost" objects that are still usable, but not
  visible in the file system anywhere. I.e. calling methods on them
  succeed but are no-ops.

* Possibly we have a way to drop a Rust object without removing it from
  the file system. In this case, it can never be accessed from Rust
  again, and the only way to remove it is to drop its parent directory.

This way, you can drop foo/ before dropping bar/ and baz/ without that
having to be unsafe.

Whether that's best implemented by calling dget/dput on the dentry or by
having Rust keep track of a separate Rust-only refcount, I don't know.
But I think this is the API we want.

Thoughts?

Alice
