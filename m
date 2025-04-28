Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7081513AC1;
	Mon, 28 Apr 2025 23:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883263; cv=none; b=SKtPOmI8JD/BZ18e89bFF8UMvBBflT2/ni3+rUT8mqED2eZ/awaAnu9k/BSsPwsJgCk9Aej/XvonI0hDqFjakCm4Xbv7TgdbT/bKmvO7KgUp6GKulJwOapNoZYUnCkO46kvNn25IKqzFnsFj6PmHTLHHI14gCCm31O1rfvNO8QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883263; c=relaxed/simple;
	bh=AiPcKT9WlAILKA7dkRyOxfiCa+OaYqnNj+CDTi9uSOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IpUlmW/k0JobRkEdS69XQWishR1xmi9V6purlhwU9TwEbROngl/BDvaO3JaHttGgbg0+zRwyChpt+C4eJmlSPXryyO5fESpwBokW0sVMWjZtAseQk3Y+zrv4Iwt450Nrlgfv1XgGjL2oEQDF6gdTTXXNB/cyFUoxZ/8Z2zp3pDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rKaRmt6z; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rKaRmt6z"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9EAFF41060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1745883261; bh=AiPcKT9WlAILKA7dkRyOxfiCa+OaYqnNj+CDTi9uSOc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rKaRmt6zh8+P4juhNAtJq9cQrfxJ9mofzgD0lWE6cl0tl8npDzQFF9ZjNUaBf07Qw
	 kGsD3kbVkj7hc1lHF93goXr/cOayYLFHowSl31uQgCDzecv9CgsHhx+1mbR29ZOo1P
	 K/LSIMDJ7RAGplL9CINkdts7ru/zIaiXROZaZK0N4LC962Ym6yQMhph0rWbkxVXK2V
	 46h7ngoc0ix1Qetf9hD3BDHhHoFdWXAvHCMpM4hDf3reQvVfU3DYruBkg5Xql6Zfm7
	 c+rVGCLhDitxS3r4MDPH2GgF/kdjqgg6ZSKrwj7kD5MvjyS2VslZSOXuS5TL95lPn9
	 hyB3LS1O1MOEw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9EAFF41060;
	Mon, 28 Apr 2025 23:34:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Some small improvements for kernel-doc generation
In-Reply-To: <cover.1745564565.git.mchehab+huawei@kernel.org>
References: <cover.1745564565.git.mchehab+huawei@kernel.org>
Date: Mon, 28 Apr 2025 17:34:20 -0600
Message-ID: <87o6wfrhc3.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Hi Jon,
>
> This series contain 3 patches for kernel-doc:
>
> Patch 1 creates a kernel doc class at the beginning of kerneldoc Sphinx
> module and preserves it. With that, some caching is enabled;
> Patch 2 fixes some permissions;
> Patch 3 is mostly a cleanup patch to simplify a little bit the complex
> parser

Applied, thanks,

jon
