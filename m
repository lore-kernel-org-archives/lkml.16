Received: from slategray.cherry.relay.mailchannels.net (slategray.cherry.relay.mailchannels.net [23.83.223.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB9E15B54A;
	Thu,  6 Feb 2025 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738876561; cv=pass; b=ihTZEuzpfN6eBzTLuoZXBE/7VR+oGSBzKe84twk8cmzhCvMZpzacOsmYcyT+qnEzwTSfx30xglefms80ZDbFCX02Z15WPjtrA1LaCQqNG7OXrpnP/x0fDBmsh8K4xMYqynk3YrE0yVLzXdwYqs7WSbubwg3d8dNz94izR8p37hE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738876561; c=relaxed/simple;
	bh=1lB3R1po6WZgdxaHmY/1OrqiJzK67pHd7MlXm4BGTbs=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=hkrQL5kxT36jxTFWxBd7g2/bf8AQ1w4abFW7wMkRMidCevfumMeZnYqMVTiHca3rGiPrnSMZEv7tKvOlLHUiojThlyEqba8zUuUMsBzjeLtMD53ITIvWB6xCwm7JOC6q5dLG22aqHsIILpwal8glNxIWrc5kDkQCyAqyjYEEnNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=bVvxAaAD reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.223.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="bVvxAaAD"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 358F523E23;
	Thu,  6 Feb 2025 21:08:03 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-0.trex.outbound.svc.cluster.local [100.127.46.110])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 972352365D;
	Thu,  6 Feb 2025 21:07:58 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738876082; a=rsa-sha256;
	cv=none;
	b=1Ro95qpUCKFjFPLJNu8SqmKrowz8ebWLBK0ke4hxfPF7go44Bgl8i1EC+3KuECSPtyVOAm
	Q7MaNFWG8DAJpsHxFK678m7tL76MlHbhD5aV3PVJSOfc1QfAuE3HyNpBNKPF/fpxvvdmgL
	1kBuX1D4eFwY7E3BHy0xJW09EgDH9hYKoLHtVVrRFk/jZZyrCR6S3ZFimNZIIwaUhnqgDu
	8GwHQTq8RznFaNzrmBIWLzoc8iwDacIq4nqYZ2juVsndjpWWdSWydLypR3lSqJEQB8jOZG
	syltYKifmR28IuR34GxD+HN73RqWXJfnxZ4BnJpYDc1vRpbOi2UgyRskOvZStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738876082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ao/6CpQGIug2s3g4qNBT7wztDldQnzKpiipkzTE6D5o=;
	b=5IC4YPNGJIo8Kydl+twjBmAJRqqTcmKAbOJbs1voRM45xPEH+XB+nWW2CBuvF2XIRNM5cL
	tsmrRDjFw01Dr6eeCDwk8ikdRFeG8Noor1f3qDlM2snYDsSLIrRW/ypvSDoq53siy4LaPS
	2VPaB8ARQ97I/BurZW3JZF1rkh9SlfaEatgo/Wa4hzmfWxfWtUPoSkAMSi9W5LGN5pVxXE
	u1T9gsPNggSjf0yr4rJigyz1uyJKyusMmC6OsodPzD4jaaiyaWkFRAjfUcN28o79UCQZFI
	Rd5q18ovfYGJGIGN+qA/XWHeomZqvUYzzHTXNvNWyW3XLQG1voemmPJJWQmqew==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-qtn6w;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Abaft-Thoughtful: 2d3304e215659c98_1738876082965_3725378742
X-MC-Loop-Signature: 1738876082965:1669363260
X-MC-Ingress-Time: 1738876082965
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.127.46.110 (trex/7.0.2);
	Thu, 06 Feb 2025 21:08:02 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738876076;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ao/6CpQGIug2s3g4qNBT7wztDldQnzKpiipkzTE6D5o=;
	b=bVvxAaADvjx5XLZNsFSnJWB7Q5KkJg0iuA88QTQ/4UDAlzQyo9dCwTL07g0XUI727AxmqF
	zF1RPn+3/utlITDKEQlxqb8dZo6+gg4qK4/qbGZT7T8InS3BnC1olO3WzLl0JQNPCFYBAa
	0UMmVPuiMJbNU8lc9tw8wa53kr47Bpt9I8Rqf7BDD6WScFb2v5tBEZVYciNhIJ8zvwNc8H
	KmOeICzsGOvkaLLmJR7TVSN8I7yojm92tvgkWM+lvk1Gh2awrHv8OkPD4CowSiMul88buq
	isNsIMcxVNk72Lc2/vi4K6LVbE8w+EFOtx15QmQkbQtXnEXbnzjL6u2OTuXuqw==
Subject: [PATCH v3 4/6] rust: sync: add missing newline in locked_by log
 example
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-printing_fix-v3-4-a85273b501ae@invicto.ai>
References: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
In-Reply-To: <20250206-printing_fix-v3-0-a85273b501ae@invicto.ai>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
 David Gow <davidgow@google.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
 Asahi Lina <lina@asahilina.net>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Wedson Almeida Filho <walmeida@microsoft.com>, 
 "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>, Tejun Heo <tj@kernel.org>, 
 Fiona Behrens <me@kloenk.dev>, 
 Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, 
 Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alban Kurti <kurti@invicto.ai>, 
 Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
 Fox Chen <foxhlchen@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738876070; l=1151;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=1lB3R1po6WZgdxaHmY/1OrqiJzK67pHd7MlXm4BGTbs=;
 b=T2Q3yA6xogxLqNEE7t5drQ/TCrHRborZiGAai2Ql3KXdyLGKyixlfgH1IPiFUFaAQdR4bEWyB
 BqAoG05NfyrBrI/phI06pVPYyK9VqR6ZMg7WxcRoyolWYcC70lLeki1
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Thu, 06 Feb 2025 21:07:55 +0000 (UTC)
X-CM-Envelope: MS4xfNJAmCzuHi2orbdWWk7lB74rjaapN9N8+53MQ/FHyFECiF7kuvBHA5DfX6TCj3cLKJnUaQhp6fGDmlFoc8aEqqBS8RlwS8Ri+WCX02TcGWCXOgwTyQV/ y5/UaSF75T7oo/FG59DEjnX0++CbmR1c2DebI2VcCjMIYbEwd/TzC012ilfGe4MNso4oaO42VgB7wiuLXuOgm9JOTDWnaLKhanzjzca5Wuxrvd1ZeyvAxUBq DT3U6iKrpY1LVtRg+DQNCx1D2YYb7Gat07FUbZgR78MxZqFCZj3ADVs30yolixQ497I2KaS2YDoJCMjPrcqKWxlvO3FomlUvqUQsxp21qD+PYK+yZowri7Xr sRSeMhM8ptzPDqw/TgzoAQZSauS9td6mP8NZOm0k+SWrhkpLwh367IljKaRI+ZToNDwZ9+G+3RqZxD77YRWsp+Tr4ygwlCVD0Tj9KtRaLAbz8JZMDrhniWmx j4PyPGdke0tbKiUQ5KClZ8zCqRf+YANGBnRh6PFqqBv9mF4nt+czyztiGRWcmZJ0jXk6nP2HTMvI8y7mpOW+F/+uw7Gr4tXDEwFZgzvIsPgskx0dinZiusuy GopnleOgR1jVZbs7ekpSXY7ivmL+gEojPF+k2DdFaVNqTcgUFqZ3MVXcQSEz/26H24AdeqSIO4pQAp6WRI0UDVLhhYoqBbLlobtpTaFT05ZGT+K8l3e1ee47 aIgi3xzatQoUdBRTBtV+xh8+6J7kceEhZo5hhVsO4kby/XDtlHP3fGFMNtgiy8NMLvVbSeT1TEO9k/rKeNdCsPR5C51ffFPxItW5rfO04NcQjoeqvri4wNhv QB0SO7sShKHyijxDCGtmPClTw7OKyaEaQI2Z9Jsg/1kq3FDjpyx16F1dT6oH1uuylG7eppiy+LBjVHLBb/3OHLwdMlFhL39SCmS+9MuXClr3Qy9bUGZZfyZR BNUrKZW5a7BXvi/
 P/ll+xr5V2zC5/Jr1DK3feMCs9P1eRpxS
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a524ac a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=HeOr5W89t27ReWMoupIA:9 a=QEXdDO2ut3YA:10
X-AuthUser: kurti@invicto.ai

The pr_info! example in rust/kernel/sync/locked_by.rs was missing
a newline. This patch appends the missing newline to ensure
that log messages for locked resources display correctly.

Fixes: 7b1f55e3a984 ("rust: sync: introduce `LockedBy`")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 rust/kernel/sync/locked_by.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/sync/locked_by.rs b/rust/kernel/sync/locked_by.rs
index a7b244675c2b96a36a6fe2e3ddd9a68e6ea01cb7..61f100a45b3507c750c1e3c405f9a8f67ced5346 100644
--- a/rust/kernel/sync/locked_by.rs
+++ b/rust/kernel/sync/locked_by.rs
@@ -55,7 +55,7 @@
 /// fn print_bytes_used(dir: &Directory, file: &File) {
 ///     let guard = dir.inner.lock();
 ///     let inner_file = file.inner.access(&guard);
-///     pr_info!("{} {}", guard.bytes_used, inner_file.bytes_used);
+///     pr_info!("{} {}\n", guard.bytes_used, inner_file.bytes_used);
 /// }
 ///
 /// /// Increments `bytes_used` for both the directory and file.

-- 
2.48.1

