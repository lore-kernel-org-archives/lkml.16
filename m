Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD3E528DF06;
	Wed, 14 May 2025 19:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747250519; cv=pass; b=dB7adRCawNz3niZOSaWmZSzeJyATLVcNokheEmPiGnMpapdTX+venpdr33NOb/I0gYspoL5DfQARFSreBCqwAR1TE4evazK+06338p9K/tStKrY23NpY9xmY2m2/QrRlqdI6uD9O1IhW4motE3F39QzEOJvVeMNanj/fy8fZ3aU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747250519; c=relaxed/simple;
	bh=oQQtLGpaLQeTz3MBR+hp0bvhk8AGqQPKXrLnOeR+ATM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=izv/p9BiCON2wCfNEqksUyZqpD+C+4mhkGy77R5xbUva5t1DUzNaVYr0LUbKEnAP1H5j91P6JQqR1i7YE6IvyBffm9J92SDELbF/q5a7bQPT+cynUdxECmRwAx67kJb+6fmTP/0s/jvcl46bK7uu207OEcOCxYKfYrDT2PpEf50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=dfyo+wf5; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="dfyo+wf5"
ARC-Seal: i=1; a=rsa-sha256; t=1747250485; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Wfdv1B8T83o9DZh8SpH3dWjoG+NTYUUTDN3N6T04dqDdUySysMaEQtwSuiXpMoZO47Bdx40Rae5NeKPqLtLejgZg+US1VWSxMMSbnwQIcS6OvjejyXLK9YZT6/mrc4Lbh98vPRPP2N2ZWPZCZnuQF8ihwHsd6HQzfEXwEGTdhXA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1747250485; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yP+1ifj6zxHBL7CjkL5Fc2BNoyCt8ujOfFQ4GKtCvSY=; 
	b=LQ0vpiNJ08nH9SBAY+1izlBcuL5Czk9B0Zujtgr2iyWFo+8rhncS2DLh1PuOmYVHs+s6Dz6GDxuA0VwtExrAS/W6zQpM5Cqwe5/x5xIAmFIL2gYRNIQASM84/3Ws92JmtlsiOtZRTwTkJfiwoNhrqkwZ7x53JFckQgy+rpYzw8g=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747250485;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=yP+1ifj6zxHBL7CjkL5Fc2BNoyCt8ujOfFQ4GKtCvSY=;
	b=dfyo+wf5Y1K1R0eLQZvMOeyDt/NWY+npmbKxge28jKcjKUDKZsieiq+zHs2hhPKh
	G7vci3Vlal6iJZP8DWNw4dHJ5z87kVIm34ddK2ji8/wxdS6IlnlJ1SlcigokxHjXrXh
	PFKyv6XbVuzlxEXV6LCZSMh4etRYjtBi6SjrHOPA=
Received: by mx.zohomail.com with SMTPS id 1747250482588551.1658179621887;
	Wed, 14 May 2025 12:21:22 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH v3 0/2] rust: add support for request_irq
Date: Wed, 14 May 2025 16:20:50 -0300
Message-Id: <20250514-topics-tyr-request_irq-v3-0-d6fcc2591a88@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABLtJGgC/52NQQ6CMBBFr0K6toS2UNCV9zDG1DLIJEBhWomEc
 HcL3sDl+8l7f2UeCMGzS7Iyghk9uiGCOiXMtmZ4Acc6MpOZLLJC5Dy4Ea3nYSFOML3BhwfSxPN
 GG5VVqgRTsSiPBA1+jvDtHrlFHxwtx88s9vWXFFIKrc5KprnW55ILXpsBoUtN1wPW5mpd15mnI
 5Na17M9Ncv/9W3bvgK1QL7zAAAA
X-Change-ID: 20250514-topics-tyr-request_irq-4f6a30837ea8
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External


---
Changes in v3:
- Rebased on driver-core-next
- Added patch to get the irq numbers from a platform device (thanks,
  Christian!)
- Split flags into its own file.
- Change iff to "if and only if"
- Implement PartialEq and Eq for Flags
- Fix some broken docs/markdown
- Reexport most things so users can elide ::request from the path
- Add a blanket implementation of ThreadedHandler and Handler for
  Arc/Box<T: Handler> that just forwards the call to the T. This lets us
  have Arc<Foo> and Box<Foo> as handlers if Foo: Handler.
- Rework the examples a bit.
- Remove "as _" casts in favor of "as u64" for flags. This is needed to
  cast the individual flags into u64.
- Use #[repr(u32)] for ThreadedIrqReturn and IrqReturn.
- Wrapped commit messages to < 75 characters

- Link to v2: https://lore.kernel.org/r/20250122163932.46697-1-daniel.almeida@collabora.com

Changes in v2:
- Added Co-developed-by tag to account for the work that Alice did in order to
figure out how to do this without Opaque<T> (Thanks!)
- Removed Opaque<T> in favor of plain T
- Fixed the examples
- Made sure that the invariants sections are the last entry in the docs
- Switched to slot.cast() where applicable,
- Mentioned in the safety comments that we require that T: Sync,
- Removed ThreadedFnReturn in favor of IrqReturn,
- Improved the commit message

Link to v1: https://lore.kernel.org/rust-for-linux/20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com/

---
Daniel Almeida (2):
      rust: irq: add support for request_irq()
      rust: platform: add irq accessors

 rust/bindings/bindings_helper.h |   1 +
 rust/helpers/helpers.c          |   1 +
 rust/helpers/irq.c              |   9 +
 rust/kernel/irq.rs              |  24 +++
 rust/kernel/irq/flags.rs        | 102 +++++++++
 rust/kernel/irq/request.rs      | 455 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs              |   1 +
 rust/kernel/platform.rs         |  52 +++++
 8 files changed, 645 insertions(+)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250514-topics-tyr-request_irq-4f6a30837ea8

Best regards,
-- 
Daniel Almeida <daniel.almeida@collabora.com>

