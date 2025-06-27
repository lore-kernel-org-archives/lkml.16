Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063342EAD19;
	Fri, 27 Jun 2025 17:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751044331; cv=pass; b=Ait3mrdDw2jfNfN0oHsSNQVcFlG/wImK9MUeeT6JyDH377y7H1P+tItwS4bjZoE7kFAEtlJy13iIqec+gieMaD+xOXc/KL3Z6RfBEQhfbrqAWREqfxYTkx1UUf0S4n8zQd5SqMkhHbsPI876p5bqPsFZy6NS+2f9DA4gJo59KQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751044331; c=relaxed/simple;
	bh=RwoRcHWDmW5lO9K/eY7uDdT6v2aQQ/7BovT376pu97c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QMQ7osmqCsIrB1TZw2zskQbRsDgFJb0fbNlbOzXQ1EGsfsLTwK3bbTeI32Iwb+7zSgLNAvmfi65FqdbzLNN970o1tZw5oRrpsALv+MXBo4Ma94JROxyAX6byZFLPqbcP70e0rViT7SU6KFPsR4I0IpVKAM0d9FQQkYfV0KijyBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=BD05dI0R; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="BD05dI0R"
ARC-Seal: i=1; a=rsa-sha256; t=1751044311; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lxfiUR9HFOA6xEYlEi8E2lGt9J7HxnlpBbC1PTiHGpdla2fUT6znHZPBqUDHJGfl2VFOcQrp5MhDUgFHI41XWzlG94TbycyyLJiWl5j3VbG+po37BM5z/ZksQWMkNfUlFKo3S3eXiT0YaKhowq5n9PaMj5DWIoyUETjUXwTpKeQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751044311; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ltud50zXVm/VnFS3H1Mc4ylkqPvYha8A8uS3TwkRbpw=; 
	b=FzjtkvJ9BG6SMJRyMFHcXSuWK/EhEK8nexto6sFC+AA8fhjbNzq/MG4UOjwR6LRd4lCFgZ6rvj9nOymqJ8jgGe1SrGP3PjyrOATXpx1nFy9pseAhVY6K8aT/sUFZWkJmspijIR6aRkoK45Id9A9xuPu33pH7stRupElVTIeaTnM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751044311;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Ltud50zXVm/VnFS3H1Mc4ylkqPvYha8A8uS3TwkRbpw=;
	b=BD05dI0Rhlq0bWzKPsEYhdaC+tTgbzk/vwzT/elUNqfdT/XFfb0IFmGo6Sg75+ns
	9FJSVhuolLi0u5Hu1qHMSXf/t4/f4gf7FzrgQ1/WfLpBHpexabbgKCfz/0nuEeGu0i+
	pgRKjgixfCiPTO//C7uAImpn+SJzrSM0tyyNkZng=
Received: by mx.zohomail.com with SMTPS id 1751044309600115.10124187190593;
	Fri, 27 Jun 2025 10:11:49 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Fri, 27 Jun 2025 14:11:26 -0300
Subject: [PATCH v6 2/2] MAINAINTERS: add regulator.rs to the regulator API
 entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-topics-tyr-regulator-v6-2-1d015219b454@collabora.com>
References: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
In-Reply-To: <20250627-topics-tyr-regulator-v6-0-1d015219b454@collabora.com>
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

