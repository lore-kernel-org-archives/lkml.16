Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A12E23BF9C;
	Mon, 23 Jun 2025 18:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750702961; cv=pass; b=uDkhH6/BPxGPr7LG625sHsukf9ptuGU+V7iSQyOUUq062IZnqRWeVBUhTEw+O6kW8TeXHpvUnKo6r1uVll0I6s/HcM5hWVf07XC9qGvfDoxT6EBYGDlh15HjbwL0OAetBcFmOgcv10+rIgcGZ3T3+8lVGfuOd+fmqYAzec9zCU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750702961; c=relaxed/simple;
	bh=RwoRcHWDmW5lO9K/eY7uDdT6v2aQQ/7BovT376pu97c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUqcIDvnoncYJ2/81Xdso1a427MrUcdid9BLAo8ON+Gy0Uf48wRYRxbYw1AUPF0baH3sZV63elAfVoPuSGb/6qU2rkqpNYFzYxJTN7VqoJ+YKqgtTr+mJQgk4UXhIR9yx/aw5oZ1UnWWZR7VMOz7KuB7fMMSHRwxF3tY1NyyJrY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=PS9tr2nl; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="PS9tr2nl"
ARC-Seal: i=1; a=rsa-sha256; t=1750702938; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HrSC20sJmvZQBYQ9Q/9gGl75gtFpPd0IDbAkxWeyqbsUTcHtmM3lCFXXUZ2CZipJj2kTsv1mR3qnGNvu8cE0aZCsPCJL/3wlgyYx4SJjy9Wz3lviRf9Aj6EsIhVDQyTrwKmzlrdnFfDMwZibO4fAOfTDGd3umPGp0BvrTyWBNF8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1750702938; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ltud50zXVm/VnFS3H1Mc4ylkqPvYha8A8uS3TwkRbpw=; 
	b=XOMHrKJlrtGZ/95nev2owwhakaIPbXJv3zTkRsKTYG6lbd5x8HAam0YpGqcdcFslyWj7vMyN0CN59cbIgnPZKElEn1lj38sS3+kvfr2JGKtb9VhIX/SM7VV6IGtO2VYx0wys7Xvaf1c+xp87GAT4J1d2yND+TmOS4QpmT6ZFnYA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1750702938;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Ltud50zXVm/VnFS3H1Mc4ylkqPvYha8A8uS3TwkRbpw=;
	b=PS9tr2nlXR3tixE+lKqoL5HFZ9GE4hjlWslksdJpYTkoRjgVrMQOR1RtzLGQ2FIC
	X783sfNY94u7apFKN8kAd1V2996hdBOkIwVT9T9XXiII2kJs+3GkTN3AFikqU30Px9u
	MtsbHYyrm01MsoVV8SmtX4s/BwAot70YtOldhVOw=
Received: by mx.zohomail.com with SMTPS id 1750702936841546.525323120832;
	Mon, 23 Jun 2025 11:22:16 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Mon, 23 Jun 2025 15:21:57 -0300
Subject: [PATCH v5 2/2] MAINAINTERS: add regulator.rs to the regulator API
 entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-topics-tyr-regulator-v5-2-99069658cb54@collabora.com>
References: <20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com>
In-Reply-To: <20250623-topics-tyr-regulator-v5-0-99069658cb54@collabora.com>
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

Add this file to the regulator API entry as requested by Mark Brown.

Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f21f1dabb5fe1d31fca1a558473d92b90027088c..f8f9f571c19c8bc174eb8ac380de048dab9ecb99 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26000,6 +26000,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
 F:	Documentation/devicetree/bindings/regulator/
 F:	Documentation/power/regulator/
 F:	drivers/regulator/
+F:	rust/kernel/regulator.rs
 F:	include/dt-bindings/regulator/
 F:	include/linux/regulator/
 K:	regulator_get_optional

-- 
2.50.0

