Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7015F28851A;
	Mon, 23 Jun 2025 15:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691701; cv=none; b=F7PlgZhdEKxMk3YRgPMV+gLpbyKgyP6u/d5rqE8Y1aODhzaan+DMP+K3Ifhi2ssCgwAQtJ+Grqm8kytMZoUHoipYbMqr8DZoT0jUMw+zCiBktyVwZcKAgYuOSY6+EQ6fWdkhCjLwNV36EcIqos8O/t5/1m8wgUD67TIB0us4kv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691701; c=relaxed/simple;
	bh=z8eM/QAgo2uBd9U3jxMudtp4sBsBxeD57sJlFKS7yTM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WxlAHvq4OQyAeSQHoLunCZBPeB0/Ln/TWKZQS8D1Olin7sN0Sx0ijMLBUwzgBWRxU4/vfdEJh40E+dRoEyzpeJVZaZIZwsJRwxGrBmlYPAh9FVHirj9+eyHy0bhSW2vzvNlsWNd9MvY6aW+PuBG9KdYzNveoYayrUR5k67yVZlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XbS5fwDH; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XbS5fwDH"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso4535924a91.3;
        Mon, 23 Jun 2025 08:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750691699; x=1751296499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I/UVNNeZTNbbS6EiV9y0jpLo5pQWewIFfPvGVeBsxd0=;
        b=XbS5fwDHrhTF8Ybx8P1pz8KND+eih26FBCeC4Stg3sanLdVUZYagruCCYCsKsJbJti
         uSHXHjBT9YzZzILjMPm8nIlhFFeqamrzKhdCgAyaXsY1HwCzkZ2wY3TaOXR/aI2FOqes
         NViu4mc5HWXfhuUkK/5ePNKdQbhPrTAEQJucVfMzfLdFrNkRlLJnvIcBR9GrID9GsOBV
         FS5YId0IxikyKHyyzA/RV+wX3zhNc3SqX1Bg9iLJ+Ffz0z8zh4g7NayQFvT1I8Qyx/gT
         zYd3op+3RH+ars+fa7XxRN1lFVcdw1cmP8u7PZnqhY4q2PKsK006qARbiwaXDK5QYZvY
         633g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691699; x=1751296499;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I/UVNNeZTNbbS6EiV9y0jpLo5pQWewIFfPvGVeBsxd0=;
        b=cPRROrF5l9MlKX8wXrxImkeZc8kFDuUUPg1wR64uDz6wFJEiSDYHiGxlVWofrGujLQ
         cPJs84pY8sOzp3g5zNXH/W/Xl+Zcv/bAPowz6G55cTsmoDm9FPlxtJhCsZok0C4Og1pc
         jvnMwZ8BqkrqhKNjip2zWGaMKaUx8NYX3Lz+BX6ehczd+PmiDhV3wOIQe4WPO2fywPiS
         ulq4ph2TQEtpq9wRFJ4qFV/OTwpHKdmZbesx4ct21jrwTZ60eektj3hFpvcZ0sEhhjI/
         UzszPrxKzZfvMmuMzcDYZSZRd9lx40QJ9B+T6zrSIr1ZhWAChOFcVIi0GordooO2yAmw
         9ZGA==
X-Forwarded-Encrypted: i=1; AJvYcCUOfjzic6kd4EWsRcvy8g6G7McVF4YPE1u5wPK/W/cP5MPTxTXLulZI0F/WLCTeacqlbtLGqqWBcdtKEn+6BQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2BDnRKFoidofSwSp7TmvwK5gr39RzT4tDs0FtjCCVDMtupuyz
	35GdQizroqIJhVbgeAZaP6r/CL+mfWFM/V9mEBbe+BHz4h4xBCOn7k8x
X-Gm-Gg: ASbGncsWToeH3O1EZLm+a8nX2scFCsZNVZYyAgYOojxmMQ4Amq90/IVK2onxYcVGrSj
	h5dCo7aFBkM6VVnFexZnX+ZNDYkYNnOMgbREDwqD94wGFn1QN37C+t6AuRQ152w+EXJ0NPT0r1w
	aLnl4hlXaEezuDolBBvKuQ/dbTUsb0w9iGq5o26qRNFBtsAbjFYENUZjgnwJH7xBzfMxtvHoPhc
	yS4Qabj9VMoD4fqV40ywmkpALUSIJGIuH/LLsoooOZ3BAZZn45ZQPyeSUBORchYfsuYjU5nlxRu
	+Z9s7Q9wFjNNcCEmp+EvHRzrS0UJcaJqv24IRhNyqBnKAIcv4mZtmYGyR7HA/6UFy1j72BmWRIR
	HigTHikw=
X-Google-Smtp-Source: AGHT+IHdZsLaH4YMTbKkOHbc75FpS8Ud5NNvNyYkbiSebSTVtXIoBSnmzbaE7hnjZltAv6BZVc2UFQ==
X-Received: by 2002:a17:90b:1642:b0:313:5d2f:5505 with SMTP id 98e67ed59e1d1-3159d8c143bmr23501595a91.16.1750691698516;
        Mon, 23 Jun 2025 08:14:58 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:58 -0700 (PDT)
From: Jesung Yang <y.j3ms.n@gmail.com>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	Jesung Yang <y.j3ms.n@gmail.com>
Subject: [PATCH 4/4] rust: macros: add derive macro for `FromPrimitive`
Date: Mon, 23 Jun 2025 15:14:30 +0000
Message-Id: <2010f25bb9dbc5eb2e2e009dfc7c1939c6f2e9cb.1750689857.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1750689857.git.y.j3ms.n@gmail.com>
References: <cover.1750689857.git.y.j3ms.n@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a procedural macro `FromPrimitive` to automatically implement
the `FromPrimitive` trait for unit-only enums.

Motivation
==========

This reduces boilerplate in cases where mapping a numeric value to a
corresponding enum variant is needed. A typical example is the `Chipset`
enum in nova-core, where the value read from a GPU register should be
mapped to a corresponding variant.

Design
======

The macro currently rejects generics, zero-variant enums, tuple-like
variants, andstruct-like variants at compile time, as the intended use
case does not require support for those forms for now.

Each method implementation by the macro avoids silent overflows by
using per-variant constants and fallible `try_from` conversions, rather
than `as` casts. This is important for enums with wide representations
such as `#[repr(i128)]`, or enums with negative discriminants.

For example, in the case below, `Foo::from_u8(255)` returns `None`,
which is expected:

    \#[derive(Debug, FromPrimitive)]
    enum Foo {
        A = -1,
    }

    // The result of macro expansion (relevant part only).
    impl FromPrimitive for Foo {
        fn from_u8(n: u8) -> Option<Self> {
            const A: isize = -1;
            if Ok(n) == u8::try_from(A) {
                ::core::option::Option::Some(Self::A)
            } else {
                ::core::option::Option::None
            }
        }
    }

    assert_eq!(Foo::from_u8(255), None);

By contrast, in the following case, `Foo::from_u8(255)` returns
`Some(Foo::A)` due to a silent overflow.

    impl FromPrimitive for Foo {
        fn from_u8(n: u8) -> Option<Self> {
            if n == Self::A as u8 {
                ::core::option::Option::Some(Self::A)
            } else {
                ::core::option::Option::None
            }
        }
    }

    assert_eq!(Foo::from_u8(255), Some(Foo::A));

Parsing
=======

Only minimal token inspection is used for now, since a pending RFC [1]
proposes adding the `syn` crate [2] as a dependency. This macro keeps
its parsing logic narrow until that discussion is settled.

Link: https://lore.kernel.org/rust-for-linux/20250304225536.2033853-1-benno.lossin@proton.me [1]
Link: https://docs.rs/syn/latest/syn [2]
Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
 rust/macros/convert.rs | 217 +++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  71 ++++++++++++++
 2 files changed, 288 insertions(+)
 create mode 100644 rust/macros/convert.rs

diff --git a/rust/macros/convert.rs b/rust/macros/convert.rs
new file mode 100644
index 000000000000..99550eb9f841
--- /dev/null
+++ b/rust/macros/convert.rs
@@ -0,0 +1,217 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use proc_macro::{token_stream, Delimiter, Ident, Literal, Span, TokenStream, TokenTree};
+use std::iter::Peekable;
+
+pub(crate) fn derive(input: TokenStream) -> TokenStream {
+    let mut tokens = input.into_iter().peekable();
+
+    // Extract the representation passed by `#[repr(...)]` if present.
+    // If nothing is specified, the default is `Rust` representation,
+    // which uses `isize` for the discriminant type.
+    // See: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
+    let repr_ty_ident =
+        get_repr(&mut tokens).unwrap_or_else(|| Ident::new("isize", Span::mixed_site()));
+
+    // Skip until the `enum` keyword, including the `enum` itself.
+    for tt in tokens.by_ref() {
+        if matches!(tt, TokenTree::Ident(ident) if ident.to_string() == "enum") {
+            break;
+        }
+    }
+
+    let Some(TokenTree::Ident(enum_ident)) = tokens.next() else {
+        return "::core::compile_error!(\"`#[derive(FromPrimitive)]` can only \
+                be applied to an enum\");"
+            .parse::<TokenStream>()
+            .unwrap();
+    };
+
+    let mut errs = TokenStream::new();
+
+    if matches!(tokens.peek(), Some(TokenTree::Punct(p)) if p.as_char() == '<') {
+        errs.extend(
+            "::core::compile_error!(\"`#[derive(FromPrimitive)]` \
+                    does not support enums with generic parameters\");"
+                .parse::<TokenStream>()
+                .unwrap(),
+        );
+    }
+
+    let variants_group = tokens
+        .find_map(|tt| match tt {
+            TokenTree::Group(g) if g.delimiter() == Delimiter::Brace => Some(g),
+            _ => None,
+        })
+        .expect("Missing main body of an enum");
+
+    let zero = Literal::usize_unsuffixed(0);
+    let one = Literal::usize_unsuffixed(1);
+    let mut const_defs = vec![];
+    let mut variant_idents = vec![];
+    let mut variant_tokens = variants_group.stream().into_iter().peekable();
+
+    if variant_tokens.peek().is_none() {
+        return "::core::compile_error!(\"`#[derive(FromPrimitive)]` does not \
+                support zero-variant enums \");"
+            .parse::<TokenStream>()
+            .unwrap();
+    }
+
+    while let Some(tt) = variant_tokens.next() {
+        // Skip attributes like `#[...]` if present.
+        if matches!(&tt, TokenTree::Punct(p) if p.as_char() == '#') {
+            variant_tokens.next();
+            continue;
+        }
+
+        let TokenTree::Ident(ident) = tt else {
+            unreachable!("Missing enum variant identifier");
+        };
+
+        // Reject tuple-like or struct-like variants.
+        if let Some(TokenTree::Group(g)) = variant_tokens.peek() {
+            let variant_kind = match g.delimiter() {
+                Delimiter::Brace => "struct-like",
+                Delimiter::Parenthesis => "tuple-like",
+                _ => unreachable!("Invalid enum variant syntax"),
+            };
+            errs.extend(
+                format!(
+                    "::core::compile_error!(\"`#[derive(FromPrimitive)]` does not \
+                    support {variant_kind} variant `{enum_ident}::{ident}`; \
+                    only unit variants are allowed\");"
+                )
+                .parse::<TokenStream>()
+                .unwrap(),
+            );
+        }
+
+        let const_expr: TokenStream = match variant_tokens.next() {
+            Some(TokenTree::Punct(p)) if p.as_char() == '=' => {
+                // Extract the explicit discriminant, which is a constant expression.
+                // See: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.explicit.intro
+                variant_tokens
+                    .by_ref()
+                    .take_while(|tt| !matches!(&tt, TokenTree::Punct(p) if p.as_char() == ','))
+                    .collect()
+            }
+            _ => {
+                // In this case, we have an implicit discriminant.
+                // Generate constant expression based on the previous identifier.
+                match variant_idents.last() {
+                    Some(prev) => quote! { #prev + #one },
+                    None => quote! { #zero },
+                }
+            }
+        };
+
+        // These constants, named after each variant identifier, help detect overflows.
+        const_defs.push(quote! {
+            #[allow(non_upper_case_globals)]
+            const #ident: #repr_ty_ident = #const_expr;
+        });
+
+        variant_idents.push(ident);
+    }
+
+    if !errs.is_empty() {
+        return errs;
+    }
+
+    // Implement `from_*` methods for these types; other types use default implementations
+    // that delegate to `from_i64` or `from_u64`. While `isize`, `i128`, `usize`, `u128`
+    // also have default implementations, providing explicit ones avoids relying on
+    // `u64::try_from`, which may silently fail (false negative) with `None` if the enum
+    // is marked with a wide representation like `#[repr(i128)]`.
+    let type_names = ["isize", "i64", "i128", "usize", "u64", "u128"];
+    let methods = type_names.into_iter().map(|ty| {
+        impl_method(
+            &Ident::new(ty, Span::mixed_site()),
+            &Ident::new(&format!("from_{ty}"), Span::mixed_site()),
+            &variant_idents,
+            &const_defs,
+        )
+    });
+
+    quote! {
+        #[automatically_derived]
+        impl FromPrimitive for #enum_ident {
+            #(#methods)*
+        }
+    }
+}
+
+fn get_repr(tokens: &mut Peekable<token_stream::IntoIter>) -> Option<Ident> {
+    const PRIM_REPRS: [&str; 12] = [
+        "u8", "u16", "u32", "u64", "u128", "usize", "i8", "i16", "i32", "i64", "i128", "isize",
+    ];
+
+    // Scan only the attributes. As soon as we see a token that is
+    // not `#`, we know we have consumed all attributes.
+    while let TokenTree::Punct(p) = tokens.peek()? {
+        if p.as_char() != '#' {
+            break;
+        }
+        tokens.next();
+
+        // The next token should be a `Group` delimited by brackets.
+        let TokenTree::Group(attr) = tokens.next()? else {
+            break;
+        };
+
+        let mut inner = attr.stream().into_iter();
+
+        // Skip attributes other than `repr`.
+        if !matches!(inner.next()?, TokenTree::Ident(ident) if ident.to_string() == "repr") {
+            continue;
+        }
+
+        // Extract arguments passed to `repr`.
+        let TokenTree::Group(repr_args) = inner.next()? else {
+            break;
+        };
+
+        // Look for any specified primitive representation in `#[repr(...)]` args.
+        for arg in repr_args.stream() {
+            if let TokenTree::Ident(ident) = arg {
+                if PRIM_REPRS.contains(&ident.to_string().as_str()) {
+                    return Some(ident);
+                }
+            }
+        }
+    }
+
+    None
+}
+
+fn impl_method(
+    ty: &Ident,
+    method: &Ident,
+    variants: &[Ident],
+    const_defs: &[TokenStream],
+) -> TokenStream {
+    let param = Ident::new("n", Span::mixed_site());
+
+    // Discriminants can only be cast to integers using `as`, which may silently
+    // overflow. To avoid this, we use `try_from` on the defined constants instead.
+    // A failed conversion indicates an overflow, which means the value doesn't
+    // match the intended discriminant, so we fall through to the next clause.
+    let clauses = variants.iter().map(|ident| {
+        quote! {
+            if Ok(#param) == #ty::try_from(#ident) {
+                ::core::option::Option::Some(Self::#ident)
+            } else
+        }
+    });
+
+    quote! {
+        #[inline]
+        fn #method(#param: #ty) -> ::core::option::Option<Self> {
+            #(#const_defs)*
+            #(#clauses)* {
+                ::core::option::Option::None
+            }
+        }
+    }
+}
diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index fa847cf3a9b5..fe7a261cc078 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -14,6 +14,7 @@
 #[macro_use]
 mod quote;
 mod concat_idents;
+mod convert;
 mod export;
 mod helpers;
 mod kunit;
@@ -425,3 +426,73 @@ pub fn paste(input: TokenStream) -> TokenStream {
 pub fn kunit_tests(attr: TokenStream, ts: TokenStream) -> TokenStream {
     kunit::kunit_tests(attr, ts)
 }
+
+/// A derive macro for generating an impl of the trait [`FromPrimitive`].
+///
+/// This macro automatically derives [`FromPrimitive`] trait for a given enum. Currently,
+/// it only supports [unit-only enum]s without generic parameters.
+///
+/// [unit-only enum]: https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.unit-only
+///
+/// # Notes
+///
+/// When you manually implement [`FromPrimitive`], only `from_i64` and `from_u64` are
+/// required since the other `from_*` methods delegate to those two defaults. However,
+/// an enum may be marked with `#[repr(i128)]` or `#[repr(u128)]`, which means discriminants
+/// outside the 64-bit range would never be matched by the defaults. To avoid this silent
+/// failure, this macro also generates explicit `from_i128` and `from_u128` implementations.
+/// As a side note, `from_isize` and `from_usize` are also explicitly implemented, since
+/// converting from 64-bit integers to pointer-sized integers involves `Result`.
+///
+/// [`FromPrimitive`]: ../kernel/convert/trait.FromPrimitive.html
+///
+/// # Examples
+///
+/// You may give each variant an explicit discriminant; the macro uses those values during
+/// expansion.
+///
+/// ```rust
+/// use kernel::convert::FromPrimitive;
+/// use kernel::macros::FromPrimitive;
+///
+/// #[derive(Default, FromPrimitive)]
+/// #[repr(u8)]
+/// enum Foo {
+///     #[default]
+///     A,
+///     B = 0x17,
+/// }
+///
+/// assert_eq!(Foo::from_u8(0), Some(Foo::A));
+/// assert_eq!(Foo::from_u8(0x17), Some(Foo::B));
+/// assert_eq!(Foo::from_u8(0x19), None);
+/// ```
+///
+/// The following examples do not compile.
+///
+/// ```compile_fail
+/// # use kernel::convert::FromPrimitive;
+/// # use kernel::macros::FromPrimitive;
+/// // Generic parameters are not allowed.
+/// #[derive(FromPrimitive)]
+/// enum Foo<T> {
+///     A,
+/// }
+///
+/// // Tuple-like enums or struct-like enums are not allowed.
+/// #[derive(FromPrimitive)]
+/// enum Bar {
+///     A(u8),
+///     B {
+///         inner: u8,
+///     },
+/// }
+///
+/// // Structs are not allowed.
+/// #[derive(FromPrimitive)]
+/// struct Baz(u8);
+/// ```
+#[proc_macro_derive(FromPrimitive)]
+pub fn derive_from_primitive(input: TokenStream) -> TokenStream {
+    convert::derive(input)
+}
-- 
2.39.5

