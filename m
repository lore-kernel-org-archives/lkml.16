Received: from black.elm.relay.mailchannels.net (black.elm.relay.mailchannels.net [23.83.212.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA771E1035;
	Thu,  6 Feb 2025 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.212.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738877170; cv=pass; b=q66puGk6LQtCs9iwgr3nOCSVlK+WBkJx3asjXhI2uuuId6NldvhqM2rLVa3o9fpsaLgt1fp1+czI8EkoqdwtQW1NZ0pPVACkLXbVA2f6jtW+KVPC0znyOpmJuzn9Q2lQpWUOkIXwM9rB0tKDJGHjEd4oLzzKMsRSjpoCmiv+WiA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738877170; c=relaxed/simple;
	bh=Aoq8DR0tmBwK/2qmp6nHnMm7CfMGYf5gDRatYYdmJS4=;
	h=From:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc:Date; b=uRZLVF70lCLOqiObr74SwW8pq1j+9qQMp9NW6Z3feEVFgZHnlQzgUanM+YOl5cWyGGj1HGhFANLKsNSAIlMN4oxtcyVsPOBpZYtb7x9uEryWdOk6OGcoJGj5VB8zOFPJEWisqkY0SoyzUH8Dsl+njetYx2cuDwiLk5iCf3ocfKU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai; spf=pass smtp.mailfrom=invicto.ai; dkim=fail (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b=UdaOjjry reason="key not found in DNS"; arc=pass smtp.client-ip=23.83.212.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=invicto.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=invicto.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=invicto.ai header.i=@invicto.ai header.b="UdaOjjry"
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 5B209161EA9;
	Thu,  6 Feb 2025 21:07:59 +0000 (UTC)
Received: from fr-int-smtpout8.hostinger.io (trex-3.trex.outbound.svc.cluster.local [100.125.12.218])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 169D9161B25;
	Thu,  6 Feb 2025 21:07:54 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1738876079; a=rsa-sha256;
	cv=none;
	b=SS2OZOpxhGLSWS4WYX3g8CdxQUp/uNdJD6w3hcSK3mf2L3zOlZEUWP4nB7d0DQHz97+iHd
	SbbFLC2/iuehUNzVG5W8qphOeJifufNH/9nEEUkdg8YePQIs5vQoxaKW+n8aJrrb/iku7J
	GFqRLUaLV62F5EoY6bmAxyQXmHPfHOWN7epPNkFWGbgKr2EfGxTqDOaw3g81ZAF5pvV0AQ
	saEnNoZesEizafATZYObRGaA7hUIKakk6uXCvWD+oORiWE12zeTtJkW64yP0R8BT7GGSEq
	4E7I9G2ANrYN+wKIbZ5h78mUhFTRd7cgynGY/hQfyFJxfVYMVjumx2I4YzLkRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1738876079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=QiXyubdeOKIcHLGUBolab2yRgrtdSgwKfCo8KFHBIQ0=;
	b=W535iN4cjuht4mFgWuEjluFesNq+1YAgpndQrsd5cnJegSOLFU9s8E9KGbf0i5PjRzBayi
	SKDMz0HTXalG6aUxRlRCX+2tYkO1se+S/uzZURgg6HCSwwKSr8MfqwFMBuWjIjEwscIIxa
	aNbzXF31wM1j2q/bQBEviZPsRQDwjtJZUT1w7M76DxJ8mCwKUSntEFqe7w6ysil/Jtq1nK
	jsckRKXHHaAGd9MZ3O/PkHzqsK4vQjOpJfm6sj1h+1emHV5MDdrtO9psTsKSdY2gKiT7ku
	1K/NhkS5pA854yfP1MzRuowIjcVUf9J6lz7NjKHeOAJvFosutIZlN3IKhpRYXg==
ARC-Authentication-Results: i=1;
	rspamd-8586946c78-zkzf8;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=kurti@invicto.ai
X-Sender-Id: hostingeremail|x-authuser|kurti@invicto.ai
X-MC-Relay: Neutral
X-MailChannels-SenderId: hostingeremail|x-authuser|kurti@invicto.ai
X-MailChannels-Auth-Id: hostingeremail
X-Keen-Thread: 40f4450b18a3cc77_1738876079201_511394290
X-MC-Loop-Signature: 1738876079201:1092380178
X-MC-Ingress-Time: 1738876079200
Received: from fr-int-smtpout8.hostinger.io (fr-int-smtpout8.hostinger.io
 [89.116.146.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.125.12.218 (trex/7.0.2);
	Thu, 06 Feb 2025 21:07:59 +0000
From: Alban Kurti <kurti@invicto.ai>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=invicto.ai;
	s=hostingermail-a; t=1738876073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QiXyubdeOKIcHLGUBolab2yRgrtdSgwKfCo8KFHBIQ0=;
	b=UdaOjjrygfJ26g/NDouNl3plGw34C+tlqJfFZScsyxIUXmv8sg88ygyK/Okdg33br2P4VX
	LQ6NqGbA55PZdviqc7cWl/ScE62QiXoErvufGRJ0KK79/22aNoQROBKF6xOFl6Nr3rjVe2
	mHvVwT3sN1gV+qCnuPBZ8guI8e3q+aXwQ+ZKcZZeRJ5OotVlb9R1+24rtvQ3DHaA8i9nVO
	b5BmaHz7x/TVH6/Xtq1Rtmdt+di7nDjHZvrcnPA2alEpVzZxe5JxT/DgnNZefVrzOIRWAJ
	JEm9VIt2dHh5CDXO6dvT/vObC+3PcDbrHFKUXqu07LAZDxPm7QXDVDZNBGDFrA==
Subject: [PATCH v3 1/6] rust: docs: add missing newline to printing macro
 examples
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-printing_fix-v3-1-a85273b501ae@invicto.ai>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738876070; l=994;
 i=kurti@invicto.ai; s=20250206; h=from:subject:message-id;
 bh=Aoq8DR0tmBwK/2qmp6nHnMm7CfMGYf5gDRatYYdmJS4=;
 b=Eg90l4a/6yjDvdcx9mylSKH9TwrCcYGbL5wRllwirwpydxVlF+6oOrh2toKrQYqOCfGeYTNDK
 fD5qHTYXdEUDDzYLf/rmLm8HcoHKuAODuKe1m9eJifdWRY0ibabQ93N
X-Developer-Key: i=kurti@invicto.ai; a=ed25519;
 pk=D1lKs+JFapuEVI9zJ2QUTLSf5u4aT12tG0ny6vMMuOc=
Date: Thu, 06 Feb 2025 21:07:52 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=PMNd+uqC c=1 sm=1 tr=0 ts=67a524a9 a=9/DLicljd4JGVkZ5BRdAJQ==:117 a=9/DLicljd4JGVkZ5BRdAJQ==:17 a=IkcTkHD0fZMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=c9EISN1oOV-dU950GokA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfBif+Uu3UMiyyU3J2G4rL9XjRNFgaliUqVvWA+0J0KfByC89iygW/TK7LxcvGtEhR64jjQ/kng2PNfuzzvTZ+KhmSJPXwteMLawGlY0DD1xK005kV+EB aZ+qU8iIURNZz4ohIbaxz/MFrOg/jOdXp0P+zYSBQ6lRRHurwExpxOw3x7h2SicBM18ttiGdmUJRQi+V7zU3l/omDZODpYOxXfDj+OMFwP7brUVUFYDFaXb7 u5dEJ+Wl9/yfGmzhn4/hBeVh/FzpFqq1haYEwI6JvDbVoj5S6R088jYTUpohRw5GQmx3anfX0/yGCz0PKEnUNnNnf3q9944GzVOEpKAJwZz8STjM7qmDWQIj myO/17u+UXeYiFJLwXcIkAELeiYUfOhotSnQVrUCw3VvL9iHWsVWJzPNH3Fk7W2SNiCETWTbL6G6iwiz1FajCu31k/HUxPLhQZ5OlX1cDq1eiQVb0GEtmg7L i2xnGowZkvNgIOAtnzzADarhKZA2XTpMz8VVGJxg0ph83Mp/95vjiIVDkgyDeypCrog7bitWXbU6t45Up9+5Cd0A9+D6e7ZdaV/KdTerNaJNJtRBZJhbRmbE RuDTn8fdxinrdRtVS8VQI1MOh/HwHFTz1qaEqI+YXmyg5RqbredGI1TnV1coW8l5lxdivod0GE1z7nMZPzpRL1qugCN8Le6JTfte1GKsjxHFgIqog+KOIkSk 9sUSqFv6mUKQ0O3CzL2PXQ3kbP46eEMDdjpcgG4q0tT0/qQZMbDTkHVTth2W/UZXwWrGPFGMJ/JpfeTUdS4N6uNyPFjHewO9YLjRQ0FGUOYbhM/11hQPVXMh GfBH6b6pn5GlJuYsxE2rOdFE6U2+tj89REyxi1nHdHOh465Mddf4IcDEMtLCFX6/ZnwpBEo9Ay+5WmiWojoaTNkxNH3hRWB8xUevfH7HS9Xm2VUkmfgqZSGU y96MvbgA8ONk5vq
 3Q48kLNBtX5h5GXJywJXSI+/k/xgsFtGz
X-AuthUser: kurti@invicto.ai

Fix adding a newline at the end of the usage of pr_info! in the
documentation

Fixes: e3c3d34507c7 ("docs: rust: Add description of Rust documentation test as KUnit ones")
Reported-by: Miguel Ojeda <ojeda@kernel.org>
Closes: https://github.com/Rust-for-Linux/linux/issues/1139
Signed-off-by: Alban Kurti <kurti@invicto.ai>
---
 Documentation/rust/testing.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
index 568b71b415a4525772cb77ce76c7f9da32fac1c4..180b886e0f1ee997779f04ce85eba858e64946c0 100644
--- a/Documentation/rust/testing.rst
+++ b/Documentation/rust/testing.rst
@@ -97,7 +97,7 @@ operator are also supported as usual, e.g.:
 
 	/// ```
 	/// # use kernel::{spawn_work_item, workqueue};
-	/// spawn_work_item!(workqueue::system(), || pr_info!("x"))?;
+	/// spawn_work_item!(workqueue::system(), || pr_info!("x\n"))?;
 	/// # Ok::<(), Error>(())
 	/// ```
 

-- 
2.48.1

