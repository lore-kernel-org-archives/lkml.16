Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [178.154.239.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B9A288C9B;
	Thu,  3 Jul 2025 17:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751563618; cv=none; b=KKxjPfxGR0iSWIBqRzkiDrdRofrDTzAyleT3qwuysfQq/cxG/1aVaJ1XVJWoeV/r4JFLZkMWvlwXn4awcgBuAR+Tlvur62E3hlr6byCDNsLPe6M27ZcjLCtL1n7ctqkwY+IOQ4/f6EwmMsRXXjNH9BJ6Z+G0VpFVgSkT/uGBDPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751563618; c=relaxed/simple;
	bh=SM8lYkR5HE7giqEtfGgk9mB5gPnaSPRZUMEMtuEWai8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S47UyRBtzCc1Z/ZCF6vmuW6w684q3BTR5kT+P3MJsojlQAIp7r+v8knDR0MUDdONJsHUQjp11bf7CsH+n9784KTLu2QzGTKTUkbJK/TOkkv3+s6Y9GO3yKQWAoeHJu15/IR8yGeOIWjX7yQIv4lkMULTZmEArLvzZTrB9p96qyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=fail (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=D0FlLEef reason="signature verification failed"; arc=none smtp.client-ip=178.154.239.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="D0FlLEef"
Received: from mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net [IPv6:2a02:6b8:c11:1115:0:640:abf2:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id EEF6760927;
	Thu,  3 Jul 2025 20:26:44 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id cQg4EvKL1Sw0-U24gxadN;
	Thu, 03 Jul 2025 20:26:43 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1751563604;
	bh=0nowOd9g3OEwPon5R+zMkJ5oeBWn22IfpORnZmHlNhk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=D0FlLEefKj5VeCMPFWjMqCABhfscXpPvrxLvtTTlGh0AWKfBEmo2TTCT716lJkJRO
	 +B82QmLpgmk7saMe/D0XvEe9YEElgiCywe1f6EhFm8+naHmsAG/bYFkSCL8VqJMPN5
	 xiLYgb25aS70pPhCrSvCeBk2f9MyjX8LmJQgUJFQ=
Authentication-Results: mail-nwsmtp-smtp-production-main-63.sas.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: ojeda@kernel.org, "alex.gaynor@gmail.comboqun.feng"@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, acourbot@nvidia.com, joelagnelf@nvidia.com,
	wedsonaf@gmail.com,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: fix outdated safety note in `Revocable::revoke_internal`
Date: Thu,  3 Jul 2025 20:26:05 +0300
Message-ID: <20250703172605.28891-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The code used to use `compare_exchange` in the initial version
but it was changed to `swap` after a reviewer suggestion (see [1]),
and then the safety comment was not updated and became incorrect.

Link: https://lore.kernel.org/all/20241211104742.533392-1-benoit@dugarreau.fr [1]

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/revocable.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/revocable.rs b/rust/kernel/revocable.rs
index 06a3cdfce344..5c0b7afa76fb 100644
--- a/rust/kernel/revocable.rs
+++ b/rust/kernel/revocable.rs
@@ -163,8 +163,10 @@ unsafe fn revoke_internal<const SYNC: bool>(&self) -> bool {
                 unsafe { bindings::synchronize_rcu() };
             }
 
-            // SAFETY: We know `self.data` is valid because only one CPU can succeed the
-            // `compare_exchange` above that takes `is_available` from `true` to `false`.
+            // SAFETY: We just used an atomic `swap` to check if the data was still marked
+            // as available. If it returns `true`, that means we are the first (and only)
+            // thread to see it as available and mark it as unavailable. So no other thread
+            // can access or drop the data after this. That makes it safe to drop the data here.
             unsafe { drop_in_place(self.data.get()) };
         }
 
-- 
2.50.0

