Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DAE2135B9;
	Fri,  4 Jul 2025 18:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654665; cv=pass; b=BBtwpPgETawP8xViVOhcsuV9HuniDep+OrrC3Mhj9h0M30/AIKVuCBk4G8aeF9dIjeE/sy7G5WT4tkZBowroZHbWSC96ery2OjKmi+aIqjAMzuRnZC1w0zawwgyCZKqg6GK0SI4TduGjZItEzqJCKw+RVb7YkUigPFuN/PdSXWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654665; c=relaxed/simple;
	bh=VTHUtvFLxY6BmGTmSNb+JXyRbJJXMjfPaMoilQy4NhE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WZUp2GC5gmjOwNOBa4fRVwh+MLFPntUNoazRNY9orbvmkO0n7dlhKo9hH8BaW4688qh3s8WifzjBsgwOmfk08vV8qfqGD8uCXr8EsEYXI0yipTosylOTUjUiTxRvL2h4IwIERjzVc+8OJCmZYvF4YWEdhwA5M71kTuJ/r55o91w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=IMYw4p3w; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="IMYw4p3w"
ARC-Seal: i=1; a=rsa-sha256; t=1751654643; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q+VX7PQujLdSm/iis1sJKIMWJOD/5JUrzhvTqt/us3a7c0yudOjwBs9ePrYXLNewelpTl6RgXIiJl8c+sXjNR4g0bFaHn9bWQsFS7obiJ31MD3lQDj19MpiRhpIs3f+KIGfVgaLoH6UVw0ICjDp9ge1MGl7VAErXjwocISsjtLI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751654643; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=xoECd6irBAIaTfEnYo5ihOBWdJbbqiv4pWhWp0ojpNc=; 
	b=MXcBtA7fpc8mYNvzYhYwqNuxvIwX+9dDekq6CwA1VKc9cB9uCbCQ3fX4W69KQAk0jUjoxhk+UC+jP2sLze5Wo0eZZFxFR/9/d44K0qa4W/reiPBCCApgUD0mylOTqucJan7doVTlvtrzh57hjddEUU3uwwqh2w9YhGb9DNw0QmY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751654643;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=xoECd6irBAIaTfEnYo5ihOBWdJbbqiv4pWhWp0ojpNc=;
	b=IMYw4p3wPAmhKaLMxln4UV/OemyseKq3hLwMn3JkYjo+hWceCGGsi8a667FrWVD5
	PaL2Cz+yuOSEH+xnvor251ynWoLemj6owgtkC7H1oEQIpuBtC11qkzc6fsvdpRgo36f
	HqVa8wqIcWlKx1QQCkf8WNdNMsYW4o2NWAL91m/4=
Received: by mx.zohomail.com with SMTPS id 1751654641536743.9368091788047;
	Fri, 4 Jul 2025 11:44:01 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v7 0/2] Add a bare-minimum Regulator abstraction
Date: Fri, 04 Jul 2025 15:43:39 -0300
Message-Id: <20250704-topics-tyr-regulator-v7-0-77bfca2e22dc@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANsgaGgC/4XRTW7DIBCG4atErIsFGAacVe9RdcHPOEayQ4Rdq
 1Hkuxdn46i11eW34JlX4kFGzBFHcj49SMY5jjFdy9BvJ+I7e70gjaFsIphQrBZAp3SLfqTTPdO
 Ml6/eTilTNK4xLRhgQZPy9Jaxjd9P9uOz7DangU5dRrthgjcchOK6EtrUICinwV4j9pXtB4zBv
 vvU99albCufhpXt4liu3Z+xs1jxf7rmVfUMLVgD3CH8Mte2ud4gxesDqC6Q9F5oJkOLfheSGwS
 sOYBkgZxsg295bZTVe5B6gcRRkaKMNg2DBpTxTsk9CF4hfQBBgXhgXJUfcfIvtCzLDwk5laMnA
 gAA
X-Change-ID: 20250326-topics-tyr-regulator-e8b98f6860d7
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External


---
Changes in v7:
- Add RegulatorState::DISABLE_ON_DROP (Alice)
- Remove #[cfg(CONFIG_REGULATOR)] in lib.rs (if this is N we will use
  the stubs)
- Add the bound on 'static directly on RegulatorState to avoid
  repetition
- Removed the `data` member on the example (Alice)
- Removed the `mut` token from try_into_enabled() and
  try_into_disabled() (Miguel & Intel bot)
- Link to v6: https://lore.kernel.org/r/20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com

Changes in v6:
- Use ManuallyDrop<T> to avoid running the destructor in
  try_into_enabled() and try_into_disabled(). This is the same strategy
  that was being used successfully in the pre-typestate version of this
  patch
- Link to v5: https://lore.kernel.org/r/20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com

Changes in v5:
- Remove TryIntoEnabled and TryIntoDisabled traits (they were only
  implemented for a single type anyways)
- Added regulator.rs to VOLTAGE AND CURRENT REGULATOR FRAMEWORK
- Applied the diff from Miguel Ojeda to format the docs
- Link to v4: https://lore.kernel.org/r/20250609-topics-tyr-regulator-v4-1-b4fdcf1385a7@collabora.com

Changes in v4:
- Rewrote the abstraction to use typestates as per the suggestions by
  Benno and Alex.
- Introduced the `Dynamic` state.
- Added more examples.
- Fixed some broken docs.
- Link to v3: https://lore.kernel.org/r/20250513-topics-tyr-regulator-v3-1-4cc2704dfec6@collabora.com

Changes in v3:
- Rebased on rust-next
- Added examples to showcase the API
- Fixed some rendering issues in the docs
- Exposed {get|set}_voltage for both Regulator and EnabledRegulator
- Derived Clone, Copy, PartialEq and Eq for Microvolt
- Link to v2: https://lore.kernel.org/r/20250326-topics-tyr-regulator-v2-1-c0ea6a861be6@collabora.com

Resend v2:
  - cc Regulator maintainers
Changes from v1:
  - Rebased on rust-next
  - Split the design into two types as suggested by Alice Ryhl.
  - Modify the docs to highlight how users can use kernel::types::Either
    or an enum to enable and disable the regulator at runtime.
  - Link to v1: https://lore.kernel.org/rust-for-linux/20250219162517.278362-1-daniel.almeida@collabora.com/

---
Daniel Almeida (2):
      rust: regulator: add a bare minimum regulator abstraction
      MAINAINTERS: add regulator.rs to the regulator API entry

 MAINTAINERS                     |   1 +
 rust/bindings/bindings_helper.h |   1 +
 rust/kernel/lib.rs              |   1 +
 rust/kernel/regulator.rs        | 403 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 406 insertions(+)
---
base-commit: 2009a2d5696944d85c34d75e691a6f3884e787c0
change-id: 20250326-topics-tyr-regulator-e8b98f6860d7

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

