Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4EB1DD543;
	Mon, 23 Jun 2025 18:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702951; cv=pass; b=kOPqqCjkaNi2po8b5PiCj6n05klQLMBhB8WpFQLMb57/yMKsauhkQafLZd6qbKdXqSdp/bON/8oIXRhjkJtxsLcpJUUXa4Rt3KEfvNL7EsB8gabS9+47OtjK+BrtJsyzJMXrIMCQOByCcOl7sMDfjxUqLGHQSr3LaQOfeTjyuyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702951; c=relaxed/simple;
	bh=78zljtZfCkyV+36EzrE5IHk5HsRoBO7R7AODO3JDmVU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LYjOfoOlIZdBMg/WQZb5RmvMRaO9XEB4/ZWexDwaTVkULvaqsSmZ1f/ngwb2A8o6T+/7a7u/gNLIsp6+EGYdLGwlqCq7MXHXKDbcNRX9eOHpISj2O5BAsLGlTHCn7GsLm+YTEY9CTCkn6E95nhybqYjBpMtR7sW9AgMAFRSViSE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=Rn3STh18; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="Rn3STh18"
ARC-Seal: i=1; a=rsa-sha256; t=1750702930; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=m0wA39mFAG1iGrmISF3974NUUU0ZdkzkUZs1P1TMx9O3zUEfOnqCvYdLbyLErR7hdGJ2GrgWL500dh0hykwrjybhGQql4M7D2utxQN0bpErwn3CaB80QnpeVyjheYZHr+Bgoxs+N7/JiZ9eLb0lPjzwXHAjZ83u9LxDJDqqrnBQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750702930; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cLvpLxc+Dv5n+IXKSFVzsrMUeWJS8k49AoozdkNlWfo=; 
	b=ZLPV7kMq+TWuLDtg7HTfwzMeNT68KyQHVp+k8MKnUbLJq24YmSCQhuH9ssTpbxufmY50OGwMn1uBxUk/njwSg4rf+tspCBfm92nCH3eVhxEjowr0iNBUZiBB2rGLEhK7R4dARzYdCPT2KbqjOnkuIWn8lFtBegQ03EfGCag77kg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750702930;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=cLvpLxc+Dv5n+IXKSFVzsrMUeWJS8k49AoozdkNlWfo=;
	b=Rn3STh18HSPKiogo0W4Hcq/ZaeKHZ8EK4NkE9IiMxt8ZC+FIF5jzhikBWz5phXB6
	GOl7vuG9M0VzodbGYSTO0oFj01cDfCg5YrsOMiRczVqbL2RqZOLMChuXH+l/h9TKY6h
	/y8mDApFrj5lB5AfQ5jsbwavTAFuVxXrvYWRBF3M=
Received: by mx.zohomail.com with SMTPS id 1750702927925790.0062225101886;
	Mon, 23 Jun 2025 11:22:07 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v5 0/2] Add a bare-minimum Regulator abstraction
Date: Mon, 23 Jun 2025 15:21:55 -0300
Message-Id: <20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEObWWgC/4XOTW7DIBCG4atErIvFnzHuqveoshjDECNhE4FrJ
 Yp89+JsLEWNuvwW88z7IAVzwEI+Tw+ScQ0lpLmO9uNE7AjzBWlwdRPBRMuk0HRJ12ALXe6ZZrz
 8RFhSpmiG3nhtNHMdqafXjD7cnuz3uW6f00SXMSMcmOA916LlXSM6I7WgnDqYA8YG4oTBwZdNM
 cKQMjQ2TTs7hlK/3Z+xq9jxf7rWXbUMQYPRfED9Yu5tqzyglss3kKyQslZ0TDmP9k9IHZBm/Rt
 IVWhQ3lnPpWmhe4W2bfsFYSmMNpUBAAA=
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
 rust/kernel/regulator.rs        | 382 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 386 insertions(+)
---
base-commit: edc5e6e019c99b529b3d1f2801d5cce9924ae79b
change-id: 20250326-topics-tyr-regulator-e8b98f6860d7

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

