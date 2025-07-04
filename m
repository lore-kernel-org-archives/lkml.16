Received: from forward202d.mail.yandex.net (forward202d.mail.yandex.net [178.154.239.219])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8631120E005;
	Fri,  4 Jul 2025 05:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.219
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608339; cv=none; b=c9fP9PU9ZWE3o+OJ5Arz5kFEHRaBHWNut16i2bH+fPUmPEk1BwdJWa+6JBa0vAGOiNp2MnTMM62k5GB51OG9tHCPiREpBU2LaOzHlJIVvIiI1spUGizYAgG8gvkfFi5G35eaAmA2EUOaeKGMy8NxYbqR0zwz6SdRxUWN8CzdlfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608339; c=relaxed/simple;
	bh=E6svKm+Qv+ZXCWMqasvSRlkJ1IQ9meRTlpMu7mgHXYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IwtNYv77vJ44sarRVz/lGMUqbIAvpfce9GQRQIglJ3iR9TiyyiqmsOskjq+U5xirOZTldY25/0pkt4jQ2ZePlGGJuFo09+1H20cCAFHE4oNcH8RtedOslUt0b5Bs76ialUCWgOQI0Ce58azbo9P8UG0IZTTE702+DIL1dlYDUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=FetE71AY; arc=none smtp.client-ip=178.154.239.219
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="FetE71AY"
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [IPv6:2a02:6b8:c41:1300:1:45:d181:d101])
	by forward202d.mail.yandex.net (Yandex) with ESMTPS id E4ACB65FFF;
	Fri,  4 Jul 2025 08:46:01 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:2f26:0:640:90f6:0])
	by forward101d.mail.yandex.net (Yandex) with ESMTPS id C4C9760021;
	Fri,  4 Jul 2025 08:45:52 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id ejVF7TEL2uQ0-QF09MHxa;
	Fri, 04 Jul 2025 08:45:52 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1751607952;
	bh=7pgV02ZJczYf5f5e5DwWjzRTxSRKgprRp4L6AbFTIGU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=FetE71AYojF99W3Hu4Xn4HWi/I552o16HJP1eRnSG2xfkKS0/exNh7rLlfRaSvezZ
	 IG0PYGyVFw9yXBH2XKlQpCnjhYZZjFP4bP4Pdl4m2e0N/kQ/5AuIFNrzV/DuM4VJ4I
	 BsQDKGcdDmfufkwy9SNXtzmhjk1xFPZJ2p2Yg86A=
Authentication-Results: mail-nwsmtp-smtp-production-main-52.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	dakr@kernel.org,
	mattgilbride@google.com,
	wedsonaf@gmail.com,
	daniel@sedlak.dev,
	tamird@gmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: rbtree: simplify finding `current` in `remove_current`
Date: Fri,  4 Jul 2025 08:45:39 +0300
Message-ID: <20250704054539.7715-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The previous version used a verbose `match` to get
`current`, which may be slightly confusing at first
glance.

This change makes it shorter and more clearly expresses
the intent: prefer `next` if available, otherwise fall
back to `prev`.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/rbtree.rs | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/rbtree.rs b/rust/kernel/rbtree.rs
index 8d978c896747..8f1052552132 100644
--- a/rust/kernel/rbtree.rs
+++ b/rust/kernel/rbtree.rs
@@ -769,18 +769,10 @@ pub fn remove_current(self) -> (Option<Self>, RBTreeNode<K, V>) {
         // the tree cannot change. By the tree invariant, all nodes are valid.
         unsafe { bindings::rb_erase(&mut (*this).links, addr_of_mut!(self.tree.root)) };

-        let current = match (prev, next) {
-            (_, Some(next)) => next,
-            (Some(prev), None) => prev,
-            (None, None) => {
-                return (None, node);
-            }
-        };
-
         (
-            // INVARIANT:
-            // - `current` is a valid node in the [`RBTree`] pointed to by `self.tree`.
-            Some(Self {
+            next.or(prev).map(|current| Self {
+                // INVARIANT:
+                // - `current` is a valid node in the [`RBTree`] pointed to by `self.tree`.
                 current,
                 tree: self.tree,
             }),
--
2.50.0

