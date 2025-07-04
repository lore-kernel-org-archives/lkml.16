Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47302DEA62;
	Fri,  4 Jul 2025 18:44:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654668; cv=pass; b=jB/nO44FQOvkoibCvM0Ra3eMCCb9yylq1JK2zAxA497xXE/R/lHTyY7atPTaDX1mgYo4TQ/+zpMqDNH63XhpotmJKF1M1cqhJzCopQ+iPBuKNIB6fmmhGx08PGWdLWH/JMmbbLXYiQlyu/OPBXdFlP1oqR4c9WYqnN74UdxqQJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654668; c=relaxed/simple;
	bh=kyDLnOCjoGfz+6q9I1eudUn2Cey2irvZ9KMtRJostUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bCyTnLCcyAM1Sez5X74eVSwjMK2FTfeUjTq8fdoR+KGh4n1vNrfMCop7P1se09ZP3UMvwJkLwkTCwDqn/AAQTDayM+KjaRMDZzY92zBNADKHazKGzj2n7xGd9avLr+TqB50Kh0VbPGiQ2r0WJCMREG10GtkO4GgL1d7UXYbcpRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=EBNYr5Xt; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EBNYr5Xt"
ARC-Seal: i=1; a=rsa-sha256; t=1751654651; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LWB0fHDsGvtlkfM3G5eATt7/VzN/i8dbK8+tFFsJp5mFqjktdzsysYbSp/hF7kBFTaYj8PZg8v+eVIhvrV/N8hvYQxJFOWW1wwHe/ytcypQr6XcF/kPgx/eif3k5xK7mjksfcjF4UeqarhcwNKwjtcJq78hENKJ0zIAr5CWIxFQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751654651; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=q4JIOgJrl40/4y9+wXMYM2pa0x8adsGNIe4PvYtRgKw=; 
	b=SU7C+HDVFXyz4O8vVv7s3fXF/CjltvW2ARqR3y1PJTt9hAW4QYJWlAyPqevQVHK7iAUqX5voWFspqY0My7dAevGwqdSxBzvTotWYBAAkpIPbK3DS0bXx49WWEMxLLyxtCwVIgQSc1c/qixkK7hDV5oUzpLBo6UZkCDMsCopEDxI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751654651;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=q4JIOgJrl40/4y9+wXMYM2pa0x8adsGNIe4PvYtRgKw=;
	b=EBNYr5XtXysMWGvyD9ASeoiabz7aPU9XNXsV/uEYUAtKLNBQ2ZbI813mt2WrCg2q
	5aKR5l7y+TEE4jAMVh/ZSCSxflLUT3Qbj8dBbTTChm2ScKJgD+/v3jPqVHIuzeakkDS
	gnvGYN6Ghfhb3u5yPl6d5f2q73vykgkJ5cdbcpq4=
Received: by mx.zohomail.com with SMTPS id 175165464944647.05484131175058;
	Fri, 4 Jul 2025 11:44:09 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 04 Jul 2025 15:43:41 -0300
Subject: [PATCH v7 2/2] MAINAINTERS: add regulator.rs to the regulator API
 entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-topics-tyr-regulator-v7-2-77bfca2e22dc@collabora.com>
References: <20250704-topics-tyr-regulator-v7-0-77bfca2e22dc@collabora.com>
In-Reply-To: <20250704-topics-tyr-regulator-v7-0-77bfca2e22dc@collabora.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Benno Lossin <lossin@kernel.org>
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
index c3f7fbd0d67afe8376ea84bc17d70e9fa4b89bf6..235a33b013473b6ff83c4fbd67c0b635c2ed2366 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26522,6 +26522,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
 F:	Documentation/devicetree/bindings/regulator/
 F:	Documentation/power/regulator/
 F:	drivers/regulator/
+F:	rust/kernel/regulator.rs
 F:	include/dt-bindings/regulator/
 F:	include/linux/regulator/
 K:	regulator_get_optional

-- 
2.50.0

