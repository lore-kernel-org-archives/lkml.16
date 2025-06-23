Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D9C2417F2;
	Mon, 23 Jun 2025 15:14:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691683; cv=none; b=avYAQGcj+GL4S6OzjSF06z2I4HplH4OzRvQqMN/v1TOqGHXTV/0WD2qiWyRzBF+MDi2dUsi1coygZFLjdsdj7YRY+oOp7rQTOaDXzkEhYf0BuR+tnmVsJwB1zftNXbVzeM/FvWiwm8tCYfJsszCzs4T2fHisGIfkoPDa9o4BHVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691683; c=relaxed/simple;
	bh=H4OXV6xVIEzOfTYcR2qXyIESfMeFmsULCzausGED3rA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F12qqs7BHRG4SseCPwSCtH8DbjmT1C0ORcp4Z61fxEA+obgAAZR560MPUyV62eJ3nbsF7RFmWsvY+RVPBbf4yWHeKIx/4HkmCyTqHwB5eZaXyXrYgnRFqZIKEnZh1ix5DS2Lf+IwioJ00QoUpsEqEHaykH5Q6lXAmJFtG0Sqb/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngGdxyJL; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ngGdxyJL"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b31fc7c27abso2722289a12.3;
        Mon, 23 Jun 2025 08:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750691681; x=1751296481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJl0bofvsCNb/IhdYpO8yEuEs+fLAbcokn6DAhbWI2Y=;
        b=ngGdxyJLkZdUk5uQrnMHjpVXUVzIlzIGAb/XOJ07ztICxzHbcCzW3gt/9V1M20zadL
         kyB6pW9lKwVt8fW07PN1PiyeL6CGrJtdUBT+nUwKTMYh9T5MNihky9ocAzi7OfUhnzhQ
         Do+g9x8tEJTHMMZ2PDaKcfaq4pq47bIn2MsP2dcuTxmsW+ME/elBLua2KYhSEN48gzUk
         wWvlYt8hGyqEfChknvu/J5X1I/yL6OjBX5JCcyMzFJRvwdXjreORotydfwwlIrhhZh+K
         W/Cp67pMsJmEosHBFv1TJqVhjq+hwJEgv15Hm9YheDeLbAlRA/O2VgSdQAWsBTphE8PC
         CVKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691681; x=1751296481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJl0bofvsCNb/IhdYpO8yEuEs+fLAbcokn6DAhbWI2Y=;
        b=PbMn8IjdYXuyvzs6veRqhuwbNVNaMfvSlhYsiLcN8IoZLEWTMURovjdZfMBBjI8y45
         BBBMPI2S6O42o2yn9GTVyNP7L8QgmnvBcWL9ePh/5YLsUX8SmTqwMbVYaGT8VgC4drdH
         SlJY1JiW+drxfWPtPL0/ueoWJtqDm52cx/XhyZg0xbxGJjZMyz1La+KFsTikvuv3e6OZ
         AuItNZvog3o15cH+WpmdB1tAdSMr+ebTvfYpUwTYUWrDb5sZ/67pvRYfAvYEklFdr0oQ
         9ytbzaulmXBPOIcbs2jph9WzIBNe7FKkTtVTSIYrVZ18EJXfWYmupzzTKpXE+crHyONk
         FiWw==
X-Forwarded-Encrypted: i=1; AJvYcCVE8LjyfgOB/fdVb+kETn8RejbXYehf9rL7Z68zh9o4wv49TgWNV+8+6/PWWwVYs1iBZOKsNfoX7x3+SkUlyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsEnSrDhurqON5YUYyFxRLj+h96GMztl4Y8V0dPHjUh7cZBA+A
	VXyTK/UfMN6S03EzWzPDpF1uJw0TSIZR7ia0ghDUBttNsxqnNDxNo8ZE
X-Gm-Gg: ASbGncusyPwZPQlFgbKJ2I719gOijvVUX2lHaPSeoux7tx+Lh+wpbsPMUrfpdMi0d1F
	aUj2rUlKGZhnc+6W9siQ+n6TXhMsBxCs8SFi7bm7n4NB89MYmgk12fsevRvQhfp+N3N1Qvhj8xV
	4ll49Ld1B3uUNjyndYwtrH0ysJmQB96kJ9bHL0RMH0ZbrwegRXfDn6+7/35XyB/bmWqxn+KmNkh
	DFcmdc1jUGMVTc491S/6zDFJAmqCrl7OCT9ufJ07sdE6VDs0zkFSvr+7QooafDNQdx0BMv4PNzs
	qIMGIYUITNKmTdEFPWqM14a65RMqzb/faUDbrRL2qQrTB6vVFWS28zm1eAv/sLBH0aLFIQVxm3U
	WBK0zklE=
X-Google-Smtp-Source: AGHT+IGKsva6kVgzg4Cok11z5b+GUl9qeuWFMNPVQGJXb1rtZHDejue9tGLjW0VLzgTh0jN+h79VWQ==
X-Received: by 2002:a17:90b:3d50:b0:311:a314:c2cf with SMTP id 98e67ed59e1d1-3159d8f7de2mr17582857a91.30.1750691681066;
        Mon, 23 Jun 2025 08:14:41 -0700 (PDT)
Received: from localhost.localdomain ([112.149.32.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71cd6sm8338512a91.4.2025.06.23.08.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 08:14:40 -0700 (PDT)
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
Subject: [PATCH 0/4] rust: add `FromPrimitive` support
Date: Mon, 23 Jun 2025 15:14:26 +0000
Message-Id: <cover.1750689857.git.y.j3ms.n@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series introduces a new `FromPrimitive` trait along with its
corresponding derive macro.

A few enhancements were made to the custom `quote!` macro to write the
derive macro. These include support for additional punctuation tokens
and a fix for an unused variable warning when quoting simple forms.
Detailed information about these enhancements is provided in the
relevant patches.

While cleaning up the implementations, I came across an alternative
form of the `FromPrimitive` trait that might better suit the current
use case. Since types that implement this trait may often rely on just
one `from_*` method, the following design could be a simpler fit:

    trait FromPrimitive: Sized {
        type Primitive;

        fn from_bool(b: bool) -> Option<Self>
        where
            <Self as FromPrimitive>::Primitive: From<bool>,
        {
            Self::from_primitive(b.into())
        }

        fn from_primitive(n: Self::Primitive) -> Option<Self>;
    }

This is just a thought and not something I feel strongly about, but I
wanted to share it in case others find the idea useful. Feedback or
suggestions are very welcome.

The original discussion of FromPrimitive can be found on Zulip [1].

[1] https://rust-for-linux.zulipchat.com/#narrow/channel/288089/topic/x/near/524427350

Jesung Yang (4):
  rust: introduce `FromPrimitive` trait
  rust: macros: extend custom `quote!` macro
  rust: macros: prefix variable `span` with underscore
  rust: macros: add derive macro for `FromPrimitive`

 rust/kernel/convert.rs | 154 +++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 rust/macros/convert.rs | 217 +++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  71 ++++++++++++++
 rust/macros/quote.rs   |  46 ++++++++-
 5 files changed, 487 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/convert.rs
 create mode 100644 rust/macros/convert.rs


base-commit: dc35ddcf97e99b18559d0855071030e664aae44d
-- 
2.39.5

