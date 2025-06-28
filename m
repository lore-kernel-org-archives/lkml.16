Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2ED71747;
	Sat, 28 Jun 2025 11:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751110583; cv=none; b=n6CvCYlo7QUChZBXD2gVCo+cmvKp8+mCXHbbPgpZza4BS1hVqE3/hhQhBum1wmDwi5WswEk9E1cLa6cmvg6UlnU1slvyj1LldaJKxwcryvUa8MvYp51eaI3L9MKVV81FxUTDGfLWtOeKPfnytaxckb4mNm8OG7nwL5+wlIHsq44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751110583; c=relaxed/simple;
	bh=KVvJQ6vo+0jqitEC9XZaCIDhRLTchNDRpm0e3ef7WKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=r9ONWAeLEhLUAsgjA7gZK2b53Kir3QX/s5d5n/YbClIGwrqfeEtc2dPFyEOCMPCemsGqqmNPx1q/ePgzZUdaHTs7rxngEU8EjlgVEmv/z5zx7A0OruREE42ppcBnIZ5GFolDhNu+4TA7WVwTPEuEUFrwphEEaxV4Q1a8AiUxrV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fqlZS9r+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fqlZS9r+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09CC8C4CEEA;
	Sat, 28 Jun 2025 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751110583;
	bh=KVvJQ6vo+0jqitEC9XZaCIDhRLTchNDRpm0e3ef7WKk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=fqlZS9r+MGGsayQlCDIkarIgn1kBfncqJnx4V7afXZrPP3T4uEQw0kHiXuGkNKBZp
	 Unfq3hhxTKznio3RBKLbgQ3gMPjVqkPIPPeb8abfCQp1dBGoW+y+1MfcPqRNe31+lb
	 LnnqyNlvesaJdbzFO8VMwq0hGNZ9GkMR9LWgLY92CWwLnPxUEDIbwWs39dSNCqZpGh
	 lEnR9lu6yWYFgEHQerHxUD+MHg01rjiJVebdfrw8VLuddcyekRQZY9WSjxgnylkv0Z
	 iYxSn8oTTWyimXpr87m67rciBRDnu9O6/s6N8mNbVb/zVYT9srsLFHDVYoAjKozfeJ
	 zoJ2jrYGPsPYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA202C7EE32;
	Sat, 28 Jun 2025 11:36:22 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Sat, 28 Jun 2025 13:36:00 +0200
Subject: [PATCH] rust: init: Fix generics in *_init! macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-rust_init_trailing_comma-v1-1-2d162ae1a757@jannau.net>
X-B4-Tracking: v=1; b=H4sIAJ/TX2gC/x3MQQqDMBBG4avIrBvQYILtVUoJIY76g8YySYsgu
 bvB5bd476TEAk70ak4S/iNhjxXdo6Gw+DizwlhNutWmtXpQ8kvZISK7LB4r4uzCvm1ecT914Tk
 Y01tNNf8KTzju9ftTygUsesLIagAAAA==
X-Change-ID: 20250628-rust_init_trailing_comma-e4f1c9855462
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2610; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=7atD46KJRl40fGYVlD5kwQ0vw0wyITw/tnQszJMm3g8=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhoz4y1sb472uKUWHfsi06d7q9OLYmrlCtWIxXGKFa69ef
 /zRNEWqo5SFQYyLQVZMkSVJ+2UHw+oaxZjaB2Ewc1iZQIYwcHEKwEROvWJkeDlZyXrKCe55EoXH
 H7sIVsffV5m61YnZvEUtloHzVlWPEcP/6D4/oYbH7baCz+8fte1YeqBrT6SVSVNS3I4yJdvsDBl
 GAA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
Reply-To: j@jannau.net

From: Janne Grunau <j@jannau.net>

The match pattern for a optional trailing comma in the list of generics
is erroneously repeated in the code block resulting in following error:

| error: attempted to repeat an expression containing no syntax variables matched as repeating at this depth
|    --> rust/kernel/init.rs:301:73
|     |
| 301 |         ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),* $(,)?>)? {
|     |                                                                         ^^^

Remove "$(,)?" from all code blocks in the try_init! and try_pin_init!
definitions.

Fixes: 578eb8b6db13 ("rust: pin-init: move the default error behavior of `try_[pin_]init`")
Signed-off-by: Janne Grunau <j@jannau.net>
---
 rust/kernel/init.rs | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/init.rs b/rust/kernel/init.rs
index 8d228c23795445e379b40f662e1c355a934cbd13..21ef202ab0dbfa3cb28cd20d29d9bfdba4f1f97f 100644
--- a/rust/kernel/init.rs
+++ b/rust/kernel/init.rs
@@ -231,14 +231,14 @@ macro_rules! try_init {
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }) => {
-        ::pin_init::try_init!($(&$this in)? $t $(::<$($generics),* $(,)?>)? {
+        ::pin_init::try_init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $crate::error::Error)
     };
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }? $err:ty) => {
-        ::pin_init::try_init!($(&$this in)? $t $(::<$($generics),* $(,)?>)? {
+        ::pin_init::try_init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $err)
     };
@@ -291,14 +291,14 @@ macro_rules! try_pin_init {
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }) => {
-        ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),* $(,)?>)? {
+        ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $crate::error::Error)
     };
     ($(&$this:ident in)? $t:ident $(::<$($generics:ty),* $(,)?>)? {
         $($fields:tt)*
     }? $err:ty) => {
-        ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),* $(,)?>)? {
+        ::pin_init::try_pin_init!($(&$this in)? $t $(::<$($generics),*>)? {
             $($fields)*
         }? $err)
     };

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250628-rust_init_trailing_comma-e4f1c9855462

Best regards,
-- 
Janne Grunau <j@jannau.net>


