Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D668B149C4A;
	Sat, 21 Jun 2025 18:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750531527; cv=none; b=AUXOHnvelg/hg4vuLKsjMCx49AMO9FLDcWL/GXgCLrnzf8CAi+Nix0dA7soX2CLi2qevhrRtx+EMH47LVlhzLVTFIOAOLvezdo4BlrQo6Li7NRyLwzPEyjJHYPzcKmtDee1A2BXX+XhSH1BKGq/iT2Rlvy8bXkwf93O/8nEFCDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750531527; c=relaxed/simple;
	bh=EPH9TacDmE9Fp/+SEdc4uLz1EQ5MU3aIm7LfuPjXPCU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KaY+iSKUl7TeVeTOxF5I6HBiSNcn7W9ZXu/c78faZpmlopE0QRLhhbCJGSMrUOvZP4pZqYsTFDtZQJvhVJ1vEWH9fYq1UCAuNNViKQs2cv7LEG5aqJotB1pGMXTY4Ew7PE8dZbU8w4pYYgr5MS8emrghbzDlXyRXLtMONAwfTiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=CqK2RUoR; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="CqK2RUoR"
Received: from mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:3b23:0:640:a115:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id EBEE560054;
	Sat, 21 Jun 2025 21:45:15 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id uiVAZ68LnCg0-adjaq8xB;
	Sat, 21 Jun 2025 21:45:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750531514;
	bh=FO4/7sIzGFtwBEeczhfkiWra8SPWgfFtZRngsaliNA4=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=CqK2RUoRa5JyLFAnth5xl0wvBV2nzK76louA1K1msprC46CUTgBkSlcUGYz+5X5Yx
	 OxKM51oY3+D0rCNCpdgYQGsWr7rHn77oVu7TYQZ6V6HoOI2aN6foUd0Uu5qI9oRFTi
	 Bqd4ABbcmU0SwDzAp3jXaRbFDat0xPxQWjo2bIuM=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.iva.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	will@kernel.org,
	longman@redhat.com,
	felipe_life@live.com,
	daniel@sedlak.dev,
	bjorn3_gh@protonmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Lyude <thatslyude@gmail.com>
Subject: [PATCH v5 0/3] rust: add `ww_mutex` support
Date: Sat, 21 Jun 2025 21:44:51 +0300
Message-ID: <20250621184454.8354-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch series implements Rust abstractions for kernel's
wound/wait mutex (ww_mutex) implementation.

Changes in v5:
- Addressed documentation review notes.
- Removed `unwrap()`s in examples and KUnit tests.

Suggested-by: Lyude <thatslyude@gmail.com>
Link: https://rust-for-linux.zulipchat.com/#narrow/channel/291566-Library/topic/Writing.20up.20wrappers.20for.20ww_mutex.3F/with/524269974

Onur Özkan (3):
  rust: add C wrappers for `ww_mutex` inline functions
  implement ww_mutex abstraction for the Rust tree
  add KUnit coverage on Rust `ww_mutex` implementation

 rust/helpers/helpers.c            |   3 +-
 rust/helpers/ww_mutex.c           |  39 +++
 rust/kernel/error.rs              |   1 +
 rust/kernel/sync/lock.rs          |   1 +
 rust/kernel/sync/lock/ww_mutex.rs | 541 ++++++++++++++++++++++++++++++
 5 files changed, 584 insertions(+), 1 deletion(-)
 create mode 100644 rust/helpers/ww_mutex.c
 create mode 100644 rust/kernel/sync/lock/ww_mutex.rs

-- 
2.49.0

