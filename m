Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156420297F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940548; cv=none; b=H1uVkGLoRXb9RqbMuWnaBc5aVIm+4qE6b98j5dDQlJa4tA8yEgbdKnYiDZiAGYV/ChM2Q1zwm8eqej0ha0Yc5A2I8xrENuyQstlFdHxVFh9PF0TiQF7jmjntPX6xagoh+VBfNhiEmsq07WS1SNS0ndmRQ26Kzl5RTitQrUSN0O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940548; c=relaxed/simple;
	bh=OjAsY8Aeq5Ueru5ZAiLzHF/EyHc73z1XNs7APpOHEWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2hhaAH22neGvlOjXbBYNB+kZIuWiT3A28JNVyU1miCXS/yst2ssY7h0tw6sJOkznlqhks+eKdxynkqJhESEtUXvsaAavTsC3B0LPSaQJD/7Zl8VRfMXNEp3YyqDn5z1Hq4AXspUAAgVhz3cs51lEzeRGx59zoqje+NMiwxs2Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=lNSpkuJR; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="lNSpkuJR"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7040ac93c29so14271687b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940545; x=1745545345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACdKqDtHD6BESg+aNrA5JEShMOuHrL3BKvU+zPowCQg=;
        b=lNSpkuJRc6Z1epKiGSFMcxIF8xXhS/B+f7Dys0qh7GDvBwCQGsJjhZt4hEBWq8DM0a
         sXMtpLSbG3mZOSk+MCA3kImFHJH1DFosBiqnY8F+T49Ba4gmTDRZKfmg2bk0FQy/rbYL
         4NOjEdlPGklM0oANxSRewrDs1PyXlmC58ZPg2ypkDmFSIrxlhCNOF4a3Hf6K27tjqOIB
         YqvHl+i3zvtNYbrMof3RGMRC9Wo1fIAY541CKWh3j1C6F2W8cMbaSaK7SWvdZpgOwi/E
         s4jLvUmtNr2EuhIu+1raKQVZ1Pu5Y+e0sXdZAx/OQjGsFWYP7/nQVNlnWV7DzuU96iIR
         IZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940545; x=1745545345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACdKqDtHD6BESg+aNrA5JEShMOuHrL3BKvU+zPowCQg=;
        b=qT14qJ8gSsS4TC662rGKMF27u/VtVlvEPdtJTL0E25Ili5UQd+u9nXRY4JdwwsTQ25
         gMR7FSZ+E889c3juCkei6LltaN8ZjMf3ma9W0QOioJgmHOSBHQUHa4enKw+ghnpjhLtf
         Dj6PMmd66Nltji6uDNz1ZPbZmBSNQTrgWF5LSJBTSeTySDNCdUbj0yQV9VpsjrDXOQmV
         ILHtV5twOYLSCZdseMnUn81NiXCkGKA1EL+d/udAoVsBS5vXMrDeXADPvJcfg9qt7P4S
         tinb0ummdyxiJt8mZUSzKp5USl2PyFblQqnPmYPqmSRr2zkBPBkr3Y5YWKzN63UkcD8b
         PENg==
X-Forwarded-Encrypted: i=1; AJvYcCUoNs87d7+HMxjcG0Q5yCXhEPIQV89i1BZS7MlAtIaBu22r1lxBbEhoQVfhUeM8SpV3a4qhVTscrjEcUNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rwTmwVYybkwOEkQP3CZS0koxBSasZr0WMkwk45hGOnt6AYNn
	SwBg4fdPUCL+YVMrIF5SbNmwumDwjpVzMwVEoFcJ7jccGs1Y3noV4ptkZSUiAiM=
X-Gm-Gg: ASbGncua2sZmFpi/OOH0JobyqY/G6rKRGJZIBOUGhxNxTgSRFoxALFVsmNWLfGrq2h/
	Ja/SZkILnjy7BEGAZddThihu9yPo6YLcbSuemcVZFryDY2cCFgjnxOuxxwivBtH7pZ+U5+XvfNv
	bJGLy3QYVohvt9iCL97hlg+OvtiOHUHeC7Jyr+Dptu5R/wC90Ek6QoFglEPGXJv4laz3MWwWN1N
	jpm6LN4G62LCKRsrmiLKnvsgN/HeizOT36He3Jbf/WhzwHPPTe3ZYCfAu3ebwh4SIdlD10xG+H2
	dADOPlPVrYBAgbFvyFyHQJxvXsZM19PKK2I6i5W1GUkaxT0a65uDjHbUTURge/vC4XdVfhd55UN
	6k6pbscHSYETGrJV2K6BZ6n+55LvDdQ1l0q05
X-Google-Smtp-Source: AGHT+IFFnPj29gWWWt5rHJCynoVqA+g7Bu3K+6B674boBRW55BGIQRBULHvKIBq0w4As+NszEYgvdg==
X-Received: by 2002:a05:690c:3609:b0:6fd:3ff9:ad96 with SMTP id 00721157ae682-706ce084512mr16517447b3.37.1744940545611;
        Thu, 17 Apr 2025 18:42:25 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:25 -0700 (PDT)
From: Antonio Hickey <contact@antoniohickey.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Trevor Gross <tmgross@umich.edu>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Antonio Hickey <contact@antoniohickey.com>,
	netdev@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/18] rust: net: phy: refactor to use `&raw mut`
Date: Thu, 17 Apr 2025 21:41:30 -0400
Message-ID: <20250418014143.888022-10-contact@antoniohickey.com>
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

Replacing all occurrences of `addr_of_mut!(place)` with
`&raw mut place`.

This will allow us to reduce macro complexity, and improve consistency
with existing reference syntax as `&raw mut` is similar to `&mut`
making it fit more naturally with other existing code.

Suggested-by: Benno Lossin <benno.lossin@proton.me>
Link: https://github.com/Rust-for-Linux/linux/issues/1148
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/net/phy.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/net/phy.rs b/rust/kernel/net/phy.rs
index a59469c785e3..757db052cc09 100644
--- a/rust/kernel/net/phy.rs
+++ b/rust/kernel/net/phy.rs
@@ -7,7 +7,7 @@
 //! C headers: [`include/linux/phy.h`](srctree/include/linux/phy.h).
 
 use crate::{error::*, prelude::*, types::Opaque};
-use core::{marker::PhantomData, ptr::addr_of_mut};
+use core::marker::PhantomData;
 
 pub mod reg;
 
@@ -285,7 +285,7 @@ impl AsRef<kernel::device::Device> for Device {
     fn as_ref(&self) -> &kernel::device::Device {
         let phydev = self.0.get();
         // SAFETY: The struct invariant ensures that `mdio.dev` is valid.
-        unsafe { kernel::device::Device::as_ref(addr_of_mut!((*phydev).mdio.dev)) }
+        unsafe { kernel::device::Device::as_ref(&raw mut (*phydev).mdio.dev) }
     }
 }
 
-- 
2.48.1

