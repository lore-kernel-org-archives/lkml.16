Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0046F1FCFFC
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 09:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747302831; cv=none; b=swzq0S9ZoC1udL6aAsj/BrZcgs6gNLACgTnGqUQQL+pFT41N9byfpW4q6gzS6Am/a5QcptEG7kx3P7OaoDWbSSR4o4KQNtcv+Ud8jNLM3t1UPuLvgPoEo+UfgxaslXfTYdHZdoorswPq3QpePuRqesiz5ssr31qSBdGB2GUDUz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747302831; c=relaxed/simple;
	bh=OOuyM83QpN2htjseoOE9nFNLKlAlSzaXZCcOII9iD3w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sR9AIayzEwywElnrGc5QFl56i4k4o10JAiN6F6N2B1QLszva+rjXiEGHzsQSidf3twkDjTX6gWdLBwtWkx1Tig2CmPLtYPCtj34bJYcgTv6Wk6wNkzTvjlYzHfTAjHRxj2z6/rXiPaY4KpE/iI8qojZgAOIn+GL4sNQUJCMwK4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=b2dpOv0T; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="b2dpOv0T"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5AA6B41080
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1747302827; bh=1o3Z8xzygjoHuYHV4Xt/PBG4ols/dH3jjJ22lPDzkss=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b2dpOv0TOk2T766HA5PIXVdltoJR2B/drCf0YLoinDlvE/ATQo9oOk9vwviDfRqTw
	 x4DWIrgrvepb7rKOxvfrmQ30tKibG+kzR6fA2Crurf9pNc+zmzdzfoV5DwBhGlmZJO
	 nmoGFO7ktbxy6mxqXTaxLwbZVRYJRbtaMlmIHpVKNoR8vqVxVu/lqR9bk+AtHEB2gX
	 3U56Nrx2sMnphDOEI45wbLhDM2npG6n9vzL1wKQ+Iik+70bCdAlmtbZkQw4I059nuL
	 FfW7Iw1ADnedRcyC1jiWYPxGz3faMq/fDFy7l9FFpVBdGPESg4s2tni54NJc6aUkml
	 RAcge1OB6Ib/g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5AA6B41080;
	Thu, 15 May 2025 09:53:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: alexs@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Shi <alexs@kernel.org>
Subject: Re: [GIT PULL] Chinese-doc changes for v6.16-rc1
In-Reply-To: <20250514050954.56918-1-alexs@kernel.org>
References: <20250514050954.56918-1-alexs@kernel.org>
Date: Thu, 15 May 2025 03:53:42 -0600
Message-ID: <87msbemc7t.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

alexs@kernel.org writes:

> The following changes since commit 9f488ccd0f567ca66a146bc31e6578cba3b5abee:
>
>   Merge branch 'mauro' into docs-mw (2025-04-09 12:24:51 -0600)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git tags/Chinese-doc-6.16-rc1
>
> for you to fetch changes up to 794056966da84f46679c970133f358733ea6d847:

Pulled - thanks!

jon
