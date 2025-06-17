Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B601FBCA1;
	Tue, 17 Jun 2025 14:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750171347; cv=none; b=ktD8IYw2t05766lTraLgKGqBRzCwFtWH5I8p+7uaFl2rfHcGsBcz58q+cebN5kK0Cbzmu8xZ8+0L6e4fKYjaOh8mrCz/ryQ0o7CreprJbJhnmGBM+C7oX7LqYoReA4zn5YGlbv3XhOdlQ668h792ZNFGDa0fdzJrT/WmVmJPIk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750171347; c=relaxed/simple;
	bh=fNcSuy6mjod55+BJBgV8ppeEmpno8yVJC+hLbUnEixw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMa5BmQ4e7nA//t8Vr98xKTSdTDldx5zdwbXNB8z5V//MSqk7191g8+KGz2B7sbsE0dk7bQVWARxb+oJ7r2NTy0oUqNM0oXx7nXkZ/Nh4mQPzRyQRKks+c6FmJMiwx1sRgPDKK5k4g84zgA4wc46wQUfZTWpyChH8o3r80+ISAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZOzcn3au; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZOzcn3au"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2351227b098so48299675ad.2;
        Tue, 17 Jun 2025 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750171345; x=1750776145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhitsEOASgGAtxaxB/j5JePPGlaChK9WXa39VI0hE9s=;
        b=ZOzcn3auiGgOjMMffSoUbha+dhOMW6M3w3Tt6U/i6ZNXT/29UDevYFptBQE3JeYt/k
         paTTCNWOtm4BYWw+2ITmUH+4uclFQTlrsbW+wYP6snYi4vE9OrYF1ek9arUi9rNa41Ge
         xnq6kXbanpFq9EIlwHof5hs7RCvpWZI6k7z16ySoiqIu7ZZ9xLjw5USCxSVmIUMeIVhr
         ihFV89xu/UIf0wPGlbqIdawjBGv9kjbHCQ8RffyZ3vdTNEnaayHhLVmsWJODO5o1lqwV
         OHhpfxE6J+u70Imrl4NRKhbVQ7ykE5ZE5CQGIM01+xS6SpGN4gQjb38rz35shSGz1auJ
         Pd4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750171345; x=1750776145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhitsEOASgGAtxaxB/j5JePPGlaChK9WXa39VI0hE9s=;
        b=bWEG2n64GCX6dEAvgv4fneHptdak9rGPIYoujvVUNtYIN3pikIuPUAMnE5oByiGbeN
         w8ZgAHD1JyJfx0nQx7i9UrLGxZTDJ5Tk7DTqaUMaN9T7gLR1PLEiDkY1iT0Nqb4HJJU2
         2G9gEA0ElOF2sGDiZnMNA69vF6STQAddfN8VOG1BuHx/QylRi7aO5nVy6HRPRVsaD73I
         euWXxUqRg9716zcXCAXRI1TdVzZpEtnOJHlLW7tbYeB6V9Ucr1uLegqLnWPqHHb/v69m
         J4DBCmrPOo3rX1gfBOsMIG3zfwqu2LQJOlQhKavxB1wmR442UkJTpSyfou7ezXaEWtau
         oWTw==
X-Forwarded-Encrypted: i=1; AJvYcCWmJqXHcdl7B7U6pmXLqOBCl08/ZhNqC9XgvyIWhb5uXqbYHKdJAVRSL1W2nZQ3mZCGGhUNDhcwNk9tuzfMvTM=@vger.kernel.org, AJvYcCXpzL1+gO6p3iTMbjiNGPu/ia2pOmd5LbM3RMeLAPm0cT2vqean8sGLOhGO23z250s6Q12c4JwIjFaxmp0=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyy8MZ48PKzVFX8AvH6YU+dTjrTfEUIyXRnpPT3ImxAXPOUqVU
	dL33ajFQFcZef3qOixdRwh70+lbwC+WNLFQxUqQCP6BCS9SH5TVmSFiS
X-Gm-Gg: ASbGnctbiRWc4bgjrzjFt3jv81rfncLZdntoWG9g0CZfYryvgsBfvnvXcLWzrZRc27S
	PwM7Afk5qJHliK/zJTO+VHeSCdYsE0Eo+7ANdzUrWlTGiEGzzcs80kVJ5ad23i6VSyl+yxr75BY
	1DaZHSKM/ipR0bHsxP/nV/6wBRW7mJqa9Y3+pD3rEUXYOqA10Qdyw+0wwg1AJ4oFSdC0Qeo42s4
	hIEjM2tSV3OIBsqak4r9C7Ia5AMnIjLpxXZeqpRnpqEauydGYU/nhMfKSchQqJ4LaZX3bB6Boj9
	V9IzvRyBw9hOt8vylQt3DHCjMxsoMqUubpK68Q/saoGSf1RjS9GwBD8NZzMEdXkPb2kBAdjQclT
	o10Dj63Uq1jKptRYUN8/r8b7WePYfW2YzUoU=
X-Google-Smtp-Source: AGHT+IGTbuCPn1famd0j2uz2PSBkfgzFkuhoMqWl+yapHxOEbK6XV8oILDvGW8DFNl8vtFwg9p9kTQ==
X-Received: by 2002:a17:90b:4cce:b0:312:639:a058 with SMTP id 98e67ed59e1d1-313f1d96ee5mr21003436a91.27.1750171344684;
        Tue, 17 Jun 2025 07:42:24 -0700 (PDT)
Received: from bee.. (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1c5feebsm12029828a91.41.2025.06.17.07.42.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 07:42:24 -0700 (PDT)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: a.hindborg@kernel.org,
	alex.gaynor@gmail.com,
	ojeda@kernel.org
Cc: aliceryhl@google.com,
	anna-maria@linutronix.de,
	bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com,
	dakr@kernel.org,
	frederic@kernel.org,
	gary@garyguo.net,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	lossin@kernel.org,
	lyude@redhat.com,
	rust-for-linux@vger.kernel.org,
	sboyd@kernel.org,
	tglx@linutronix.de,
	tmgross@umich.edu
Subject: [PATCH v1 0/2] rust: time: Add fsleep()
Date: Tue, 17 Jun 2025 23:41:53 +0900
Message-ID: <20250617144155.3903431-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add wrapper for fsleep() function.

The first patch renames from the Delta's methods as_micros_ceil() and
as_millis() to into_micros_ceil() and into_millis() respectively to
maintain consistency with the other function names. I think that the
commit 2ed94606a0fe ("rust: time: Rename Delta's methods from as_* to
into_*"), wasn't applied as expected, due to the conflict with the
commit 1b7bbd597527 ("rust: time: Avoid 64-bit integer division on
32-bit architectures").

The second patch is effectively a resend of a previous patch in the
iopoll patchset. The last post was:

[PATCH v15 5/6] rust: time: Add wrapper for fsleep() function

https://lore.kernel.org/lkml/20250423192857.199712-6-fujita.tomonori@gmail.com/

This patch has already been reviewed by many developers. It was not
merged previously due to issues with 64-bit division on 32-bit
architectures. A patch addressing the division issue has already been
merged, so this patch can now be merged as well.


FUJITA Tomonori (2):
  rust: time: Rename Delta's as_micros_ceil and as_millis
  rust: time: Add wrapper for fsleep() function

 rust/helpers/time.c       |  6 +++++
 rust/kernel/time.rs       |  5 ++--
 rust/kernel/time/delay.rs | 49 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 58 insertions(+), 2 deletions(-)
 create mode 100644 rust/kernel/time/delay.rs


base-commit: 994393295c89711531583f6de8f296a30b0d944a
-- 
2.43.0

