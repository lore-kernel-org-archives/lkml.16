Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058A1DED78
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940524; cv=none; b=OegbemXrQTuNGdVNu9FIIHS1Y+SgG8Gi/2KFZ1BS7utAayKCxoWbgAtp6Shus6B8Rx4ESjtylvxoqvEZAT2jOBvR9tP5ifG98F0SPhjjuy+hlf4wrR+/mFG+/YgBi258hM3FFffQoRAEuj9R1J/rFCS5fN4M+oEjrvsmdgpxamE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940524; c=relaxed/simple;
	bh=vFgDs7+ubz7RHPBpACVH6CG8tZkE7DjyOoCkhUi2Tfs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOcEfbuTqgd3aHTroP95l+GxlbIglcS8gtFZ3b6zZBHFdGqdyQyoYA52r0gLpfZi9ACCRQeUgHao5Q90mXZz1JgeKDdPQoykuk1ubrSEB6LoMQeXFSwC6OAol2ZAbOyWWi7ezJNYRYogC60qFLA5RfEJmz9ZQKetrml4Wfk+b68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=R3NHaDH3; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="R3NHaDH3"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6fedefb1c9cso11156127b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940522; x=1745545322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnG1j5y3hJrieF33Dur9awTBZJ3Ma29cUTD8J733xik=;
        b=R3NHaDH33b0+JR+5T5TlAwycWSnK9T+ql3OLHST/s5wlOrtBBJeIxbsR8yNEw+K69H
         zdW7BE1pQUa+tTzBv8KuwflLP8/8JMczn6bkWw/1G688/O7FP96TxgqJAZu5/NUDOxLZ
         vSqCgSywbchFrLP0O71Nj589iymmqhJZ9wxfh8NRrziXjMsrRO9bD+rsJyQJPAUd0sTv
         s3rtIdRSyWRH4dihPOb2EAnW0Yo8r2BrrTr7OrKmTUspnRwmIQ2RSe2vGMAEuNkjhR0m
         iTnknWuIcKCjHLEdk7rnimo6mUBWRnAElUmAaEZ3LTSQ4CYh10ogY6VFO6HjgTy/D84L
         bHGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940522; x=1745545322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnG1j5y3hJrieF33Dur9awTBZJ3Ma29cUTD8J733xik=;
        b=L8P94PXQeFx4WKrFINRT1RSPe2rLFcI68yR3mGDY0Zuu8WyAB6fEAF1BzjkLppFV/J
         Yp77qElne4uPS5uMt4kSc7Z/WVNRc85wuwrMXH1530gAsim3nYec+PB2VSDMhmXP+2xR
         KpVK+XEJPzMjXhu2dNY+5lBHKY0z+NGHdJnYDIpDjd4iLBAdfB8sOfGQbsWHuOryEZH3
         g44teYo+4n2BZVglOQOIEQgyf4F+JsMkgkP70tbFSxc5k0bh1shxSbLEkRFNQd9HlwWC
         3x7/dhB/Gx7rZWhA+LykUyZ8l4QkbD+a4F1Xq67Lc6fB8b1B1WAXO9X+C8B6TnT4wd5y
         CilA==
X-Forwarded-Encrypted: i=1; AJvYcCXcHp5Q1Cya5nASCQ27ITokmk5HZQrMvFVcscVIDVKAnVn09dPFqq06N1gf5x3155ecD0iYWS2xO84ZCO8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ccgddzrD3aij4AcJX28zdAzS2M1rDJD6wkAPDInOGluIaRFa
	gS/2tC61GVUSDro1oArnhL7dNsGb5xo7BSyhLNQmi00Vx5NOlTq6U7eYjTjfkJg=
X-Gm-Gg: ASbGnctjLmH/GUa7FbK89b+RwxVG5qtIYuWOtfjAPpIdlpXYLEQIdIMy1/89hsDYP9+
	WiLy47iaeqFFG4eK0Lz+S2O6G6zy7QbjwSvG0ihl159vZEADMQ6x9mjTS+xWIUMc8Pq4ljYHikI
	Hnsq9h4fQx0NILEV8iUn0SJYjpjHdMBAhjSYY+WvikSGF+/VkaGoRcRc2+VBuIt6BK4i4lMIHh6
	0yE9/X8r5BPpGTBfLbep6W7hITrPblmpXRnTfQbsg6BVeGMRinVc8MuITrmjd5+xWsL4pIeJLTN
	mbFEDyC+R4tSyl7Urez/AUCjai4tW4XNrXZz3prX5swkT7MswDzxs+pS+euoIv4jC1OYz4gKMja
	CfwSCSeNLg47NFm5G3WLVnNw7wze3JMqKmlv2
X-Google-Smtp-Source: AGHT+IEvz+Mx3jUJ1wl3eUSlKxVKhUGwA3+KtvBbpQ8vaWelRCzlqbErvqbmzGUkx/sOEFHgdujGPw==
X-Received: by 2002:a05:690c:3392:b0:6fd:a226:fb50 with SMTP id 00721157ae682-706ccd001d8mr16549567b3.13.1744940521571;
        Thu, 17 Apr 2025 18:42:01 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:01 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 02/18] rust: list: refactor to use `&raw [const|mut]`
Date: Thu, 17 Apr 2025 21:41:23 -0400
Message-ID: <20250418014143.888022-3-contact@antoniohickey.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250418014143.888022-1-contact@antoniohickey.com>
References: <20250418014143.888022-1-contact@antoniohickey.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replacing all occurrences of `addr_of!(place)` and `addr_of_mut!(place)`
with `&raw const place` and `&raw mut place` respectively.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw const`, `&raw mut` are similar
to `&`, `&mut` making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/list.rs                    | 2 +-
 rust/kernel/list/impl_list_item_mod.rs | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/list.rs b/rust/kernel/list.rs
index a335c3b1ff5e..b1f504f6b809 100644
--- a/rust/kernel/list.rs
+++ b/rust/kernel/list.rs
@@ -176,7 +176,7 @@ pub fn new() -> impl PinInit<Self> {
     #[inline]
     unsafe fn fields(me: *mut Self) -> *mut ListLinksFields {
         // SAFETY: The caller promises that the pointer is valid.
-        unsafe { Opaque::raw_get(ptr::addr_of!((*me).inner)) }
+        unsafe { Opaque::raw_get(&raw const (*me).inner) }
     }
 
     /// # Safety
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index a0438537cee1..014b6713d59d 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -49,7 +49,7 @@ macro_rules! impl_has_list_links {
         // SAFETY: The implementation of `raw_get_list_links` only compiles if the field has the
         // right type.
         //
-        // The behavior of `raw_get_list_links` is not changed since the `addr_of_mut!` macro is
+        // The behavior of `raw_get_list_links` is not changed since the `&raw mut` op is
         // equivalent to the pointer offset operation in the trait definition.
         unsafe impl$(<$($implarg),*>)? $crate::list::HasListLinks$(<$id>)? for
             $self $(<$($selfarg),*>)?
@@ -61,7 +61,7 @@ unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$
                 // SAFETY: The caller promises that the pointer is not dangling. We know that this
                 // expression doesn't follow any pointers, as the `offset_of!` invocation above
                 // would otherwise not compile.
-                unsafe { ::core::ptr::addr_of_mut!((*ptr)$(.$field)*) }
+                unsafe { &raw mut (*ptr)$(.$field)* }
             }
         }
     )*};
@@ -103,7 +103,7 @@ macro_rules! impl_has_list_links_self_ptr {
             unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$id>)? {
                 // SAFETY: The caller promises that the pointer is not dangling.
                 let ptr: *mut $crate::list::ListLinksSelfPtr<$item_type $(, $id)?> =
-                    unsafe { ::core::ptr::addr_of_mut!((*ptr).$field) };
+                    unsafe { &raw mut (*ptr).$field };
                 ptr.cast()
             }
         }
-- 
2.48.1

