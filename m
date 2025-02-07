Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA2623ED79;
	Fri,  7 Feb 2025 14:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738939405; cv=none; b=jmLRJOaky56I4JJaL14HhbsUIv7ptUYdl0KDSCEeylqS2vfHcGDPfsp5myA58bDD+XUEFEKXvp07uwyzAE+V2taSJzl2/U6P9Uqdr5NeVzq/hnOgCPMlJidhajtF1txdsODIwHfuCp/3Mtb1zUtrmIPQXMb5eMfNIqtjr7qMxqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738939405; c=relaxed/simple;
	bh=ZI+9ylEZXPTitkNYUrwF2IsZNh5gUSSBuhfnGhFWoWk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=VM3fndCH+0rVKpmciuBh2dYGe52LfFO206Hpt9ty9+ey29T4aDO25OPYQlqEkF7Wv/PTl8MS0tg3Y90mZwDARsckMN9vCFjkuNZDqxaOm2iCQERTwIx7YNzWJ29lKJEKqmV/aUl0koDUfQw9vrIRDAZS5Ki5z4WIQigOYKKDJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QaIZvves; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QaIZvves"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87039C4CED1;
	Fri,  7 Feb 2025 14:43:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738939404;
	bh=ZI+9ylEZXPTitkNYUrwF2IsZNh5gUSSBuhfnGhFWoWk=;
	h=From:Subject:Date:To:Cc:From;
	b=QaIZvvesP3pW3YK4smb3Ru02kFoOmnAl9sEFy0Uo6jNwL+PW7do6HBN9hmCcMAlb2
	 JWQi7/Srce050rx09wIcfSkVNLTWYujlZl8+NQ9DBQcqAlsbafyMB34KHK+CHiK4gI
	 5Sgv/LPJ5gJMlNL/b4att6trjgP1oOfeOlxRoZ8hRb7HGZeqplcVGTOck8auQksx9O
	 +2H0+mR9EbGD36F+XOaqOoAc1yfoURrHVnnmaFuvI5YSvDYArTeQX/CnCArsyUGweN
	 65e3uAoTReEz77IPSNJGHqujxvgLv0Q2HAQ950zdrngATT4lKBS60c/2qxwATRToxn
	 kPoPHCceNw/vQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Subject: [PATCH v2 0/3] rust: configfs abstractions
Date: Fri, 07 Feb 2025 15:41:19 +0100
Message-Id: <20250207-configfs-v2-0-f7a60b24d38e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI8bpmcC/2WOQW6DMBBFr4JmHUe2MTCw6j2qLIz9AasJJDZFr
 SLuXocsu3yj0Xv/SQkxIFFXPCliCykscwZ9KshNdh4hgs9MWupKqlIJt8xDGIckemZ2nrVnYym
 /3yOG8HOoPi9vjnh8Z+P6PtLdrm7KvqxvKgxgSOayRWmlh2Z4XYM9WPZoucpF8/L2NiFXb7ewd
 sVWn5UR0Sl6JaaQ1iX+HuM3dTT+79yUkIKb1jS1UkYq9/GFOON6XuJIl33f/wD+a6iABAEAAA=
 =
X-Change-ID: 20250131-configfs-b888cd82d84a
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Joel Becker <jlbec@evilplan.org>, 
 Christoph Hellwig <hch@lst.de>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
 Waiman Long <longman@redhat.com>, Fiona Behrens <me@kloenk.dev>, 
 Charalampos Mitrodimas <charmitro@posteo.net>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2413; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=ZI+9ylEZXPTitkNYUrwF2IsZNh5gUSSBuhfnGhFWoWk=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnphvBf84hAbwy1D82ITiAyAEqcZxxG0MqDF4Hg
 +fNBosTINiJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6YbwQAKCRDhuBo+eShj
 dxbFD/49dQlM3kJA3UYbLfg4Gf7mdSZV+d5BNmxPtT1URhoURsNHXT7E4HUm+FqAsqy2JH26jt1
 JAiiixSQufGRSCbDPcdNOIEzgEwvU0SyMB/6RzbgYD0/dVG+Uk7EDxV5BmSVq+m4NUaIUhOoMZ1
 tBBQyrC0tQhUYmi00+c1UVwh/MVnF2mGL//0LFCW5KfS3e4fFaddw6tgRkVsu5J5X6v2VcXlsXq
 8shRHfSXJhg0MpH29w0ZWl9cvA876Atpd77WC8247NeAfb2SkpaYrrxR9kbfNCoX/CT6MxXR2AW
 dmpeoWsq0g/6lm+wHsmKzg5R6mUrU0N9+zfcoGw58yDWbx/cwu8sfk735dPO37vkMtvzsslnSHQ
 azhDarNgNfrHlQsELDp/l3HVqwCqmZc6Bbu1LWKAwoj45oHiAXZB1m5Y4hpbEqZQgYRRaaYs2e5
 1lHZJLBIo4Vfl+RNowRZ51+3EQB5uMQIv80ZPdV3XADptBCSNWHIBcF0W2QvYQfGfOi4V3xAwDH
 PcxAp8Cbr8iYE1Jtuuxxbgx2Oi0H5EYm4eqP5g63rrNiCCRy0b0xhsp5tkYpEYKz00ith7AbSEc
 a5JbGjwSB/uqr9fgx6SDcES8lMEbcnCEAzRU9V70Ed1SCExHYEg/ZTbI53uMzMGMxEA2nXeFaJi
 Zgcg1wPIltxlh4g==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

This series adds a safe Rust API that allows Rust modules to interface
the `configfs` machinery.

The series contains an example for the samples folder to demonstrate
usage of the API. As such, there is no inline example in the
documentation.

The last patch adds a maintainer entry for the Rust configfs
abstractions, to make it absolutely clear that I will commit to maintain
these abstractions, if required. Feel free to drop this patch if this is
not required.

The series is a dependency of `rnull`, the Rust null block driver.
Please see [1] for initial `configfs` support in `rnull`.

[1] https://github.com/metaspace/linux/tree/9ac53130f5fb05b9b3074fa261b445b8fde547dd/drivers/block/rnull

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
Changes in v2:
- Remove generalization over pointer type and enforce use of `Arc`.
- Use type system to enforce connection between `ItemType` and
  `Subsystem` or `Group`. Differentiate construction of vtables on this
  type difference.
- Move drop logic of child nodes from parent to child.
- Pick `ForeignOwnable::PointedTo` patch as dependency instead of
  including it here.
- Fix some rustdoc warnings.
- Use CamelCase for generic type parameter declaration.
- Destroy mutex in `Subsystem::drop`.
- Move `GroupOperationsVTable` struct definition next to implementation.
- Rebase on v6.14-rc1.
- Link to v1: https://lore.kernel.org/r/20250131-configfs-v1-0-87947611401c@kernel.org

---
Andreas Hindborg (3):
      rust: sync: change `<Arc<T> as ForeignOwnable>::PointedTo` to `T`
      rust: configfs: introduce rust support for configfs
      MAINTAINERS: add entry for configfs Rust abstractions

 MAINTAINERS                     |   7 +
 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/mutex.c            |   5 +
 rust/kernel/configfs.rs         | 860 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   2 +
 rust/kernel/sync/arc.rs         |  21 +-
 samples/rust/Kconfig            |  11 +
 samples/rust/Makefile           |   1 +
 samples/rust/rust_configfs.rs   | 186 +++++++++
 9 files changed, 1089 insertions(+), 5 deletions(-)
---
base-commit: 379487e17ca406b47392e7ab6cf35d1c3bacb371
change-id: 20250131-configfs-b888cd82d84a
prerequisite-patch-id: 275efe8e08839e3a0de28ed26e8de80be9852024

Best regards,
-- 
Andreas Hindborg <a.hindborg@kernel.org>


