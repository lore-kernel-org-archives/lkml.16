Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 532FD1E7C2E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940544; cv=none; b=q6vEkpYiBdvTS5gVhfaIVwZGTPZMsuJcD7m2IxJzoHtEfdAyFQFwza6kIrq/6mmOfjDYyqlO0kiNO2PEUan3Wtc7MaDXLEIJChSayeqFYTTNvoIqaGquO8eUXrBVfqWnV9BcnjZVBqtP16SBuezUZ0JOU+gc4+aDrdhV5DVCNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940544; c=relaxed/simple;
	bh=tMcIRwiOND2LkFh2ta+lL6MRxkp883Z5u7gsfs1JO5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KVjzgRRkyGrC0T4uAQF0bX+mskj9Dd+3lxWpijQddHDSfLM2hLcTt6lMSnkLZQD/Z7TOyFVr0P/8aduK+8ayhHpXuvMn8g9XaG/to5wOqX7s+pC4O5p1re7UoIZDnFxTkhsdCuz8EZNnEd/goiVj9ExGsN0u/ziOaycfEDMZWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com; spf=pass smtp.mailfrom=byte-forge.io; dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b=Rv9a8fo0; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=antoniohickey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=byte-forge.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=byte-forge-io.20230601.gappssmtp.com header.i=@byte-forge-io.20230601.gappssmtp.com header.b="Rv9a8fo0"
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e6df1419f94so1170232276.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=byte-forge-io.20230601.gappssmtp.com; s=20230601; t=1744940542; x=1745545342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FhrJCHjOUAPpl8pOKLpx97O3fapOOv9377RmQCvweOo=;
        b=Rv9a8fo08tVACpRDd331s7f4rx32nZXqWJozG7lnl5bvwJYOZGn/6Z7eENfCA9a4Sl
         TIQ0PDPWBfdVbAzqvpMdTKH2SHQ5+d4rhaEoCxuI9k1TmSUIOCZ5FcocZpZ7Xv7EYqO7
         u+p1oxBrabrycG30JQjFxCre4t1uwYR1vxC05ZRA4MrKw1u9SFr5tGlOzfyyVTmtqc7c
         anaLvbCH/8pOODLTc4Xbhdz1mvMCPFmoiTZq08v6H/jNs0AdSTI9qLP9P6iFxTvPUXmQ
         oJd+IMNCCZlqySZTBW6MFkPwD6Wbl2nWPZXOUunJIWkcXpIiLPziC0gb0mxolwENtCdf
         ADQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940542; x=1745545342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FhrJCHjOUAPpl8pOKLpx97O3fapOOv9377RmQCvweOo=;
        b=f9P4sNg6gPsu0Z/jurlK2mIuWdrXvJdqz5D82WTNxVd5VVo6mDIs5necQ0r2wSlsse
         wU5a9FtbgoeEr4xd6VxRwCESOoD2SZApl4Cr6Tks9u029pjuxnZxlR3rx4k27LIxp0RD
         U8Ye6p/bDgaSO1YvWhpRwQ8C8TIKs1xk3GiHW/jBh8eGOWwqJh7oCx/Ad1PCOXsyIMv/
         Snr8Oh7DLG4yis+UdgavaZP3OetRfDt/Xk5AnGhzvWxfJdxkBTGB2LBq6tUUqNukdFTy
         e/81eT/IYCVDUuVk3FoFHCtPh2cFqpi6Eb9Prd4zvtS4Gajx7LJ0/FUbEswE3PGk1mmU
         Lz3A==
X-Forwarded-Encrypted: i=1; AJvYcCW+yzXlHto1NWfB/N/e21kzmuwF+j/CjsovhS1i4/tvZuPFyYa8ml2GnfjS8BG5K0ycpRueU7Cmnf8BSJo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx63zhDpp64KjmAdxQ5hG8SQa/3mf/bLxoMgEJXuWVAMS8oOMrC
	kNisCj5igFtb7Xc5MB+LH3VQB50NLpTHtESc1d52DqxMTNK6RP2wzdVC5tMgvVU=
X-Gm-Gg: ASbGncsd9SOnHQ2SO5fxalqBiRc4eoSX/vZ0YR/2iuJgdywCOLKJq0yuZeizMGyYEf3
	tnK879P/vueBjyfXSCNYo5abNHrPFSo+eQjBohD78lU/L2JsGfuzW8xUQNYKndxUb9pvmyP8m4/
	ksO140i+GMMqBB8S8NDbAvWibiptY3eyt5ZCl7/1ur3rbVz7qbpthYb2MTVHLdnAP6p2sXfCxAD
	MpsBd4V0nwZ241/iF+kOBwVywA/icszbVIAUcaOVZCCX6xVIhIl52EdXyMXE3AqsiaFkATbjrEy
	CE4s3lU4bPBcQH0DPWIqSWY8KhawlSNzAKrAmaUDaSGprEgCnctKtGs/sWVWjPoDckl/eU5hjnU
	FrGT7VpKIIUnGKekiKgcPlYc3ipu8MvaaucpR
X-Google-Smtp-Source: AGHT+IFJ7xF+dYjlJXmNKGmA+1knxcpHOEgB8ON1tlYplySG+tkiaUTxJnupU3OtBJxR+cTdYbbaqA==
X-Received: by 2002:a05:6902:1b09:b0:e60:8a06:1ddd with SMTP id 3f1490d57ef6-e7297e9a9afmr1489461276.36.1744940542126;
        Thu, 17 Apr 2025 18:42:22 -0700 (PDT)
Received: from Machine.localdomain (107-219-75-226.lightspeed.wepbfl.sbcglobal.net. [107.219.75.226])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-706ca44fd13sm2804597b3.20.2025.04.17.18.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:42:21 -0700 (PDT)
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
Subject: [PATCH v6 07/18] rust: workqueue: replace `raw_get` with pointer cast
Date: Thu, 17 Apr 2025 21:41:28 -0400
Message-ID: <20250418014143.888022-8-contact@antoniohickey.com>
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

Now that `Work` is initialized via `pin-init`, the `work` field
is always used. This allows us to replace the use of unsafe
`Opaque::raw_get` with direct pointer casting.

Suggested-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/all/20250316061429.817126-1-contact@antoniohickey.com/T/#mc7a4757e8c132f84228b728c7d123d73841501d6
Signed-off-by: Antonio Hickey <contact@antoniohickey.com>
---
 rust/kernel/workqueue.rs | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 3a8e05ac6bd5..c5f09b0682bb 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -399,12 +399,8 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
     /// need not be initialized.)
     #[inline]
     pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
-        // SAFETY: The caller promises that the pointer is aligned and not dangling.
-        //
-        // A pointer cast would also be ok due to `#[repr(transparent)]`. We use
-        // `&raw const (*ptr).work` so that the compiler does not complain that the
-        // `work` field is unused.
-        unsafe { Opaque::raw_get(&raw const (*ptr).work) }
+        // CAST: `Work` is transparent to `bindings::work_struct`.
+        ptr.cast_mut().cast()
     }
 }
 
-- 
2.48.1

