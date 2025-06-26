Received: from forward100d.mail.yandex.net (forward100d.mail.yandex.net [178.154.239.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34E625CC5B;
	Thu, 26 Jun 2025 08:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750925468; cv=none; b=tmIaZerFdsKkRZDGElNMOM2W54DIfqUpUEGSzPOj2pcq8lnRs5HTEhLgxzGLIMOAZtEq/+5MCX/d3wzY9nZl85s5qF3TuiBHDsZXTJX4nQ9Ss4ayCiDLyO7Wo9h6edVxix7zF80DU3DDUoqyIlgMDS9HTiZBg2N1qOCSdOsWsUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750925468; c=relaxed/simple;
	bh=0qK7pgJcflU2S/1gkTA6x7GaoJekdCBu3N/L20K2kYw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U8E238ukfHzp+ZkgN5XpYSSMaidGOviDRHUtLXizcqMN6gvYW0w5L2CUIFbioeVrUZ3673cYiJpcPhAFbVtMcUdzLVzrKWhkUO3jujwIVPnCm5alyHgrP817WiMZvWR5pD+QiufNFCLVoX93GjvR79s5JP95VFq6iijeeZmwuS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=gtJ+GglQ; arc=none smtp.client-ip=178.154.239.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="gtJ+GglQ"
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:c90:0:640:54cb:0])
	by forward100d.mail.yandex.net (Yandex) with ESMTPS id 06E806090C;
	Thu, 26 Jun 2025 11:10:54 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id jAQpStTLmmI0-m7OVeu3S;
	Thu, 26 Jun 2025 11:10:53 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750925453;
	bh=Yinnm7E77h8mES7qlr1gkasOuZ5UvgTpmubeiNbiEMA=;
	h=Cc:Message-ID:Subject:Date:References:To:From:In-Reply-To;
	b=gtJ+GglQyobmFoiJoNhUHjIv789LxN8GxgZLLUOxlaFuh3WE1Mzucb2qbRx1DxrDh
	 L1ed7Gjw1SV0VbZw30sNXf9MvEJaaFcWFfsyUhiT7xU6aiJdYXArKEQNSyF/8vvx02
	 V15mhCKiD7TY/rUEzlL7Mf8rEEVWvhhp4/eksNWs=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
Date: Thu, 26 Jun 2025 11:10:45 +0300
From: Onur <work@onurozkan.dev>
To: Danilo Krummrich <dakr@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH] rust: simplify `Adapter::id_info`
Message-ID: <20250626111045.2c90a402@nimda>
In-Reply-To: <aFu10-dGkoyi0I2T@cassiopeiae>
References: <20250625043630.7677-1-work@onurozkan.dev>
	<aFux2MUDAGEYY49I@pollux>
	<20250625113604.21a6ec4a@nimda>
	<aFu10-dGkoyi0I2T@cassiopeiae>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Jun 2025 10:39:47 +0200
Danilo Krummrich <dakr@kernel.org> wrote:

> On Wed, Jun 25, 2025 at 11:36:04AM +0300, Onur wrote:
> > Even with that, it can be something like this:
> > 
> > fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
> >     let id = Self::acpi_id_info(dev);
> >     if id.is_some() {
> >         return id;
> >     }
> > 
> >     Self::of_id_info(dev)
> > }
> > 
> > or maybe even this:
> > 
> > fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
> >     Self::acpi_id_info(dev).or_else(|| Self::of_id_info(dev))
> > }
> 
> That's fair, can you please rebase your patch onto [1]?
> 
> [1]
> https://lore.kernel.org/lkml/20250620153914.295679-1-igor.korotin.linux@gmail.com/

HEAD: e0b49ca268d4a0d2b97d5820420d5a78b67d2537 currently doesn't pass
clippy. Should I send an additional change for the clippy fix or would
you prefer to fix it yourself first?

Here is the output of `make LLVM=1 -j $(nproc) CLIPPY=1`:

```
  DESCEND objtool
  CALL    scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
  CLIPPY L rust/kernel.o
error: unneeded `return` statement
   --> rust/kernel/driver.rs:188:13
    |
188 |             return None;
    |             ^^^^^^^^^^^
    |
    = help: for further information visit
https://rust-lang.github.io/rust-clippy/master/index.html#needless_return
= note: `-D clippy::needless-return` implied by `-D warnings` = help:
to override `-D warnings` add `#[allow(clippy::needless_return)]` help:
remove `return` |
188 -             return None;
188 +             None
    |

error: aborting due to 1 previous error

make[2]: *** [rust/Makefile:538: rust/kernel.o] Error 1
make[1]: *** [/home/nimda/devspace/onur-ozkan/linux/Makefile:1280:
prepare] Error 2 make: *** [Makefile:248: __sub-make] Error 2
```
