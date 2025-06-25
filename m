Received: from forward103d.mail.yandex.net (forward103d.mail.yandex.net [178.154.239.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F175103F;
	Wed, 25 Jun 2025 04:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750826217; cv=none; b=ToQzKPq+FpTK2YCp723IjQq3HFioaR2mixkR1qWL2yzK2/pqO/WTdDT/pQtUD2Adqs1+Vnfc0VvT6bVXdiarxAdSEziYEQ1LbCl+cWtzQsrVdzMrVgf9FPrJSnmbaJfRaz+ZXgUd/LwxLPY5d5DUml+fYjh1GVgKf6mtd7SgVE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750826217; c=relaxed/simple;
	bh=cCupKY9Hndwkwgmd2K/71AI2364rhm4+f+AMl670xM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u4Qh/9eZ+J/JjloYL1TINJ6gssXxEjHmtbAQPKGJLYl3Zv73IV4Y8hf2ePny50ozAKwMZ1TkOzQexirtP4x6S++hVaUtvyfDqUhd/1mIc+PLPop4eFHNDr/wxBYvdynOlZfR8ZN+r09OhXZE3JbRmeWR3KLiCzFMjkhHyhWNPEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=nC2dcisv; arc=none smtp.client-ip=178.154.239.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="nC2dcisv"
Received: from mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net [IPv6:2a02:6b8:c42:31ca:0:640:ced4:0])
	by forward103d.mail.yandex.net (Yandex) with ESMTPS id F0A6F60058;
	Wed, 25 Jun 2025 07:36:45 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id WaLA94GLnuQ0-LsZqoE3S;
	Wed, 25 Jun 2025 07:36:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=mail; t=1750826205;
	bh=kOV7I3utxcKTGzVyLqwhw09KsqwttzfWXuoRmExx5OM=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=nC2dcisvSrJORapX3rgau3c0XydiNfbUZPupW6xVEUSl+YK95O2UWSiK0/Svj1wrA
	 wPcYSSpvZVE/Kdd8t5tnF8Th4dgkR+XZXbPK41I2d3YFFAVEblFr8GxrNnZC1+ntRv
	 JylT+evZl4k4un+T2jCilolaQHbQy8ras05jz/BM=
Authentication-Results: mail-nwsmtp-smtp-production-main-80.klg.yp-c.yandex.net; dkim=pass header.i=@onurozkan.dev
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: [PATCH] rust: simplify `Adapter::id_info`
Date: Wed, 25 Jun 2025 07:36:30 +0300
Message-ID: <20250625043630.7677-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It was obviously unnecessary to check if `id` is `Some`.

Signed-off-by: Onur Özkan <work@onurozkan.dev>
---
 rust/kernel/driver.rs | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/rust/kernel/driver.rs b/rust/kernel/driver.rs
index ec9166cedfa7..1036755cb27d 100644
--- a/rust/kernel/driver.rs
+++ b/rust/kernel/driver.rs
@@ -178,11 +178,6 @@ fn of_id_info(_dev: &device::Device) -> Option<&'static Self::IdInfo> {
     /// If this returns `None`, it means that there is no match in any of the ID tables directly
     /// associated with a [`device::Device`].
     fn id_info(dev: &device::Device) -> Option<&'static Self::IdInfo> {
-        let id = Self::of_id_info(dev);
-        if id.is_some() {
-            return id;
-        }
-
-        None
+        Self::of_id_info(dev)
     }
 }
--
2.50.0

