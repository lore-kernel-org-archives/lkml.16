Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD432DA769
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 09:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751621188; cv=none; b=bSztBb+EUZCeDYB2H1fc3chscSHFocUSAdidkeTR0xmXTeE2nOeqHrqvOSWkXrkDljNqGdFeFewrezv+U89T8y6TvlKfd0wmOw6Gyb4Okj85K78gxGQwW3BYdhsAEnNDdGYEmOMZDs2UZB1Hc/GlEqowg78Xa+7wiiO2jkUmbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751621188; c=relaxed/simple;
	bh=B6C5WzpcTdAJyw37W4IFPFFrpl2YdAoUxTO/C6ZYP9Y=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ff26l1XcvcERrHGSQBTirAY4GZqUKFxJLalabb/F00NLX5zd5eV6lFJxlnMeP/OTV47dIQo547BPn9Lrjye3M6vBztpRcSU4cExRFXrj7yq78HqQaOA/cBagPXXF/bKTrQ7iwaCadIknetZKibiY6RapfJB6V+RG0/4cmEYBLPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sx3nXLYo; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sx3nXLYo"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4536962204aso2918355e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 02:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751621184; x=1752225984; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=MR50fO5xmzFDTEg2wlFyTK3zQ7s7ufFg/ixzt4If/Do=;
        b=sx3nXLYoBZfNAEPCoYIDWq+n7l/RTVxcsDICg4dNEcgYaGXnrnMGrEyq6hKsqDQb4B
         0+2PzqAR1rlDJeN90L5f8v3C/OH7gqnaEaz0HMapwUIy6brF1VjLCf0iw0I2Nwz2pkfm
         3xIQVZPOek79rg9MorQ3bVNyDhuUxYIc7lJPMvON0wYIBx4rS8CB3DgHkYcxTchizDct
         yTgEjdK9Kf/aYWB9A90PLRrqljVxYI9dBRMLmaiG1tBTaX0zs3QRJ8AEWhDOLAPBBasa
         C3yQFqPy0u+Ow2O/YtVYJWHfijNb2RzuRk/176kPB0HWgKKunOSMImG2v6L0KPFcAPM4
         MWZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751621184; x=1752225984;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MR50fO5xmzFDTEg2wlFyTK3zQ7s7ufFg/ixzt4If/Do=;
        b=UpBSzf9gbb8EAW0IL5YZ2YyZMP3aGSEmt0/gso2ZAJ/nLV4YavA75r9tU9kJwZD1Qa
         7hynXZkefq2OMhdgah+APdG1rASg4j0WF1GAMQw+sqsJrenE40XdFniR9b7CIdsl547J
         vKvWS5dcmFof/myQCmsMt2PTagwBu4YBUoQmqmMI/qAapGnyg+Xj+TtLDuA/UY/KOR7s
         HZQ1UOlHcNL+Z85txNdHWyXfdh2lEbj0jTvTFlVSPUTioqlw9kvxH0OSMiNH9YvFgrOt
         +G3yNNrEtyO46KaKevxq0oTUm/NDAcYDvocXPQ654r+uYrPmCvSB4clSu11XyzKqzFyL
         kMeg==
X-Forwarded-Encrypted: i=1; AJvYcCVv0wcrS1HsZvVQk8727BZJenmsLiuWgwZPYfJFiL6j96bGGnFmb/V5HiYOH/wG8Vt90MXjbDPDaYbewFw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwNS4QILm6DeM55qPJauEs2hF4++ErvKYtwkF+O5mHxEZ6Js2
	DGFE3rm8Itjg6cgVlHRlK04lsyVze66PFzPK+E5ZftWRvrAiejHSljntBKdbe4z6YyVg7nNLlBj
	9Q9PmOIcU0O5lSDh6/g==
X-Google-Smtp-Source: AGHT+IHCtVdBGP9lMoZ4v6PFIcC0IVtWLebAFehqoiBmYdjoN/h3RTOF4SVckWEkPMd6hopVhYTdXVOoe3EVfQo=
X-Received: from wmbjg20.prod.google.com ([2002:a05:600c:a014:b0:43c:ef7b:ffac])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d0e:0:b0:3a4:f35b:d016 with SMTP id ffacd0b85a97d-3b497011a15mr1205095f8f.11.1751621184627;
 Fri, 04 Jul 2025 02:26:24 -0700 (PDT)
Date: Fri, 04 Jul 2025 09:26:03 +0000
In-Reply-To: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250704-iov-iter-v2-0-e69aa7c1f40e@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3201; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=lnWi4k7yTJFShSQzujr6zKgF9AzbaeRzmZc5IbQPUys=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBoZ546x2nNNNI31RVo/3/nAvI07XvY6uZrR0AxL
 VuwkRR6JduJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaGeeOgAKCRAEWL7uWMY5
 RmmSD/oCj8we4NB4Br74fhQcwI6/Q7B6YSt9lyg7Bq8bUnb1yJc2DmgKoD2hxu0/rxd7qL9+3yp
 s7MCzn1J4gZx4QoJLByBslv9HgH6MoxvRQOL/piP2i6n/dXVht6CfM1nSdvIk4nJrKwMLVp4KCK
 1cbXLgGH6k+TObbYDLkB8ljEZ303zhoz0u2yI8US0jmsz9yOWZPI8kOg/nZIyNa6CY05rfYjMLZ
 mqxdsGFpGr4nXTeiL+Ls2pXsBjzMsIIPGk7siuzjGaMnWqAq7JljVDzocwjS4VKrxVEk4zMf+A9
 F6ao0AfGtT2m/w7ZP7+5E7PH5xiL8mA6EpGmzZ7HrAW9iljqfaNBomKn/ZQSyXJK24QVl04ffIj
 3rR5OCQ2OgFNMT6IhNq2Fd/2jCtrdsZXOBpij+ZjwKu8MCPZQp5kFqQNPUi6rEaKYJt9PaYQ1WX
 vx0y8r9hXxZkURpjcG4mRtqGjux8/omosacaTSsLA7DEGgOTin/aAvfS7u8uskIEzsRzaE3RlVQ
 u4TvFUTxTA5TZfEc0zYAyvvG0HPs4I9s6pOdJKGbMUctRWsxTrbKszVypAfjtK+7+UuoNm51uok
 ACgZokoeMgjsh08LHiwwHQmFNaBmn1FxnbABmSiWxN5M3MqtJ7PaBtMZeEyibuIFETxIlII09ml Ste6eUfYmRBVM5w==
X-Mailer: b4 0.14.2
Message-ID: <20250704-iov-iter-v2-4-e69aa7c1f40e@google.com>
Subject: [PATCH v2 4/4] samples: rust_misc_device: Expand the sample to
 support read()ing from userspace
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	Benno Lossin <lossin@kernel.org>
Content-Type: text/plain; charset="utf-8"

From: Lee Jones <lee@kernel.org>

A userland application can now operate on the char device with read() in
order to consume a locally held buffer.  Memory for the buffer is to be
provisioned and the buffer populated in its subsequently provided
write() counterpart.

Signed-off-by: Lee Jones <lee@kernel.org>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 samples/rust/rust_misc_device.rs | 36 ++++++++++++++++++++++++++++++++++--
 1 file changed, 34 insertions(+), 2 deletions(-)

diff --git a/samples/rust/rust_misc_device.rs b/samples/rust/rust_misc_device.rs
index c881fd6dbd08cf4308fe1bd37d11d28374c1f034..595411f92679b5a25bd81b032d639d1332156a14 100644
--- a/samples/rust/rust_misc_device.rs
+++ b/samples/rust/rust_misc_device.rs
@@ -102,7 +102,8 @@
     device::Device,
     fs::File,
     ioctl::{_IO, _IOC_SIZE, _IOR, _IOW},
-    miscdevice::{MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
+    iov::{IovIterDest, IovIterSource},
+    miscdevice::{Kiocb, MiscDevice, MiscDeviceOptions, MiscDeviceRegistration},
     new_mutex,
     prelude::*,
     sync::Mutex,
@@ -144,6 +145,7 @@ fn init(_module: &'static ThisModule) -> impl PinInit<Self, Error> {
 
 struct Inner {
     value: i32,
+    buffer: KVVec<u8>,
 }
 
 #[pin_data(PinnedDrop)]
@@ -165,7 +167,10 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         KBox::try_pin_init(
             try_pin_init! {
                 RustMiscDevice {
-                    inner <- new_mutex!( Inner{ value: 0_i32 } ),
+                    inner <- new_mutex!(Inner {
+                        value: 0_i32,
+                        buffer: KVVec::new(),
+                    }),
                     dev: dev,
                 }
             },
@@ -173,6 +178,33 @@ fn open(_file: &File, misc: &MiscDeviceRegistration<Self>) -> Result<Pin<KBox<Se
         )
     }
 
+    fn read_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterDest<'_>) -> Result<usize> {
+        let me = kiocb.device();
+        dev_info!(me.dev, "Reading from Rust Misc Device Sample\n");
+
+        let inner = me.inner.lock();
+        // Read the buffer contents, taking the file position into account.
+        let read = iov.simple_read_from_buffer(kiocb.ki_pos_mut(), &inner.buffer)?;
+
+        Ok(read)
+    }
+
+    fn write_iter(mut kiocb: Kiocb<'_, Self::Ptr>, iov: &mut IovIterSource<'_>) -> Result<usize> {
+        let me = kiocb.device();
+        dev_info!(me.dev, "Writing to Rust Misc Device Sample\n");
+
+        let mut inner = me.inner.lock();
+
+        // Replace buffer contents.
+        inner.buffer.clear();
+        let len = iov.copy_from_iter_vec(&mut inner.buffer, GFP_KERNEL)?;
+
+        // Set position to zero so that future `read` calls will see the new contents.
+        *kiocb.ki_pos_mut() = 0;
+
+        Ok(len)
+    }
+
     fn ioctl(me: Pin<&RustMiscDevice>, _file: &File, cmd: u32, arg: usize) -> Result<isize> {
         dev_info!(me.dev, "IOCTLing Rust Misc Device Sample\n");
 

-- 
2.50.0.727.gbf7dc18ff4-goog

