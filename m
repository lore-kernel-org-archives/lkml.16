Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0796F26B084;
	Mon, 19 May 2025 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747663402; cv=none; b=ZaHvWSOujL40+ZXODvwchVP9oDeV417tjpe8bKd5uoNJlrPPQeoNSGBbp7t5zTLbdmbTO0Cj3GKBRQD9mLdBqWiUYpq1zBBjSvIQLt2j73Jq0YHF77zMLr8QWbl8YD87YbreFZrx30Ku7fKRPtsFqAd518gxG6EH4xLl0E7oM4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747663402; c=relaxed/simple;
	bh=gz6lnO5b/SQNAFaNqR67QTeiDRoBYS82M7JaQk+ymac=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qO8y3S+5Ekq85Vj3/nfaNcMM2T0BeE+pWBafn6+UJ3NQJ3el9BHYPhHuhPqQZpNbszqnbk2VE95mvBDurgpBbrfxv/soOBWymYUm2pRH91cvqpsBu6wKVY6CdqipDHXCrZtIFfALILTTfi2jh6LPug7yOL3W2R2Emm4QV3t3wvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=i0KQqdk0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="i0KQqdk0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5B8D241086
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747663400; bh=3/ANEdhpRBlbDxeX2qkecX8VQicAn7ny/m7OYoTxulQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i0KQqdk0G+OZINkkORNyUXxGBqTQsNB58G0PjcX6hgGxLm9xVgKiS+SpcZsPYR/Gs
	 QoYJV0l6TJWQwIq2KWLdkhPiseXCknAgOloz7aKD9KG/sAtwq43/lcgBii+5Iqe1cV
	 U+efMBrBBMVHAca/lnpM93YWl9UryUu1++uI6JQVDecWxU2/lH8YDGJmaagm+40wxe
	 4tNUItA+RKGYPW7jygPoZlWwo1RIv9T766cUCM18tc6cfRtlYzFursgpo2JngZEiYX
	 iPnQQ4U+M1v1B/WqnJdiTu0qTTOW0JjIk+qohDKQn78aJAscmCMZgVSE9VRphMcTNv
	 Jo6S0qtoNSj2w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5B8D241086;
	Mon, 19 May 2025 14:03:19 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: conf.py: drop backward support for old Sphinx
 versions
In-Reply-To: <20250507121117.317810-1-mchehab+huawei@kernel.org>
References: <20250507121117.317810-1-mchehab+huawei@kernel.org>
Date: Mon, 19 May 2025 08:03:16 -0600
Message-ID: <8734d0k89n.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Since commit 5e25b972a22b ("docs: changes: update Python minimal version"),
> the minimal Sphinx version is 3.4.3.
>
> Drop support for older versions from the config file.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/conf.py | 162 +++++++++++++++++-------------------------
>  1 file changed, 65 insertions(+), 97 deletions(-)

Applied - nice to see all that old stuff go!

Thanks,

jon
