Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C76291158;
	Wed,  4 Jun 2025 14:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749047840; cv=none; b=BmbhIWZbR0yrK20ilyqLnit1LHM2t+/yRWKqSo8xIxLhurODveAzd70aVbmBPIkES0mkYs5PwU55AKlnp08apWTra/k7TZb+/4zOJDGzxlX5dv9BkWKX1dWeikeI/nRorli0bCyPPqJUYZ/HtxHklyuEDbYFrre9epbaI1oOgKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749047840; c=relaxed/simple;
	bh=U9UcFZGo4t5LQCr1cPoXo1VfTqtAYWounRfmjXPN8nQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=I+XGxqBUB5whYQERf3zCOiqadB+o6DIKYoUtqbTxwVtVxXYYRDLW3mEK8o6dUBqKL/zJvdp6gkkyHCKjR0uYS6e5DiepHuVFca/XwlbDJpjxyQ/OijmZ2RCX47aNgiX0fjc/PLYj6TiIb9sCSPuaQFmjsNBG+Ydjl2dXVugMp40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tLXp9jny; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tLXp9jny"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8D4BC41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749047837; bh=SukbAVqJ7Y6ZCjVklDhnIprrOusgKb3L2fIJadSLOfc=;
	h=From:To:Cc:Subject:Date:From;
	b=tLXp9jnyeGKNf9MtT9XG0Y5DuI98qyvtHP9J6J5Z5OWK/nCNg4HoURBjx4ADB9gx8
	 ktsY9JUzRzB1qSKLbS2Cb6ONv4MFteHikBYGS7AFp947O1nc8VcJ+OXpujoPfTB3UZ
	 YI1RINsjIyazvOQYapExokKJDo8lSzWQOthmFgMIb6jD2mUD0603cu9olcPFCxs1Nw
	 K7Yh3LnxMyxRTgVLTKe80aPrssjKESLKHsDMkPrmq8+74VCcY09VtaLRJ7pqDNdJEb
	 i7uYvAgZNa0MJGr6jK0HfxJqzVB1dcy4MtiT+bCLkN1e8l8shLrigpLDyeWYFrcjVV
	 3WZr2lPE40DaQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 8D4BC41AA1;
	Wed,  4 Jun 2025 14:37:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 0/3] docs: some automarkup improvements
Date: Wed,  4 Jun 2025 08:36:42 -0600
Message-ID: <20250604143645.78367-1-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A small set of automarkup changes to improve the visual consistency
of the rendered HTML documents.

Jonathan Corbet (3):
  docs: automarkup: Remove some Sphinx 2 holdovers
  docs: automarkup: Mark up undocumented entities too
  docs: CSS: make cross-reference links more evident

 Documentation/sphinx-static/custom.css |  7 +++++++
 Documentation/sphinx/automarkup.py     | 27 +++++++++-----------------
 2 files changed, 16 insertions(+), 18 deletions(-)

-- 
2.49.0

