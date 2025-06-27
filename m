Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65262EA72C;
	Fri, 27 Jun 2025 17:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044326; cv=pass; b=sBIyJiF2WcJG20LjmQmUeNFX5sfyvOaLSZIUjU4Vv0JqCLce4ck2I+z3S/2V8pSm2/AqCW3oRzEtorPXgPKCkxvbUWLonNy2NRpe5Et0fIWUm8+hNvzm5kzIROfdlAUKWwP+SOt3FbYz8tyqXzyKQDwH7z2hn8WHNXRUyxXoT0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044326; c=relaxed/simple;
	bh=rmQNRXGcEs6iuzwUsh7n1pk6hlI7jX/SGLkCQvNAm78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=iE4cC2Kt54kDmVfrSw+BrG27u0K4Z/csExPAYjof9vz34GIB3I9vJesoUQ6kMB9hNGXJXh9gDpFTzZhQbWvoapgIdExMOPthzx78aCBLQkmRQHcBziOj7uyFNIy8/ZFL78UlaNaLaWVXSAam/nly9NqcHM6sD4Xuj9lBgwZ8D3s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=ZhXHPPkn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="ZhXHPPkn"
ARC-Seal: i=1; a=rsa-sha256; t=1751044303; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jCJDb90Wi/bVkjyEJwOeSTXyFOpZMGNmQpVBAekPjsYqiFIE8TDaJ4+KHW4THS2oIbztVxSfbGOy6FWoc3WnZMCFpliTv94ahK4z0JDRkkNtutNgPP+EroBq8OMYml/mTwJ+3/ljiyTwFxvPM3j0fX9kKO783BxRdNPDp6ePMr8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751044303; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I3Y8qNqFKjUao4azMXFiBlA+D16Sd0e8MnTU/tga/xU=; 
	b=WhU7NkEnhqddb04xHDPQkDqez240cXdWCReq+JAbdZFuyXo/s34NQxguIzIYrMYIvOCLahA+QCRVtuOZj2QeDz8Aay85Pq9eqneGrGneDhgMSmJmch3SysRDrSfXxr8QFj5B1ylEM6XMRCoZ20A4Jm/58ahZ33LeoRZlhrumc88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751044303;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=I3Y8qNqFKjUao4azMXFiBlA+D16Sd0e8MnTU/tga/xU=;
	b=ZhXHPPknqJUjG0YXCDJsbQ2eNeKjshS3Gcm7jKji9DLUQLDOiJFk1ZhyCx2Sc2GM
	ciMTAxiPP/xFy3j625QsU7B3t632eosj6q4hDs8bbQTzCervONoOz7d1B5YdpOcp119
	soLGr/0iW9N15FKUNMws4JxyMSQmI/5r1Xz0jeRs=
Received: by mx.zohomail.com with SMTPS id 1751044301615796.9063406131982;
	Fri, 27 Jun 2025 10:11:41 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v6 0/2] Add a bare-minimum Regulator abstraction
Date: Fri, 27 Jun 2025 14:11:24 -0300
Message-Id: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALzQXmgC/4XOTW6DMBCG4atEXtfIv4PdVe9RdWHscbAEcWQoa
 hRx95psqKKgLr/FPPPeyYQl4UTeT3dScElTypc64O1EfO8uZ6Qp1E0EE5pJAXTO1+QnOt8KLXj
 +HtycC0XTWRPBAAstqafXgjH9PNjPr7pjySOd+4JuxwS3HITmbSNaI0FQToO7JBwaN4yYgvvwe
 Rhcl4trfB43tk9T/XZ7xC5iw//pWjbVM3TgDPAO4cnc2ha5Q5rLA0hWSHkvWqZCRP8SUjsEzB5
 AqkKdisFHLo127StI/4HEUZGmjFrLwII2vtPqGVrX9RcYJU1I3gEAAA==
X-Change-ID: 20250326-topics-tyr-regulator-e8b98f6860d7
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External


---
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
 rust/kernel/lib.rs              |   2 +
 rust/kernel/regulator.rs        | 392 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 396 insertions(+)
---
base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
change-id: 20250326-topics-tyr-regulator-e8b98f6860d7

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

