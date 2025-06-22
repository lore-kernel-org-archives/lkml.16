Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB857201255;
	Sun, 22 Jun 2025 20:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750625735; cv=none; b=TxbdHFz1VVzzMGZwRvRBzibTfE4XMAEZJ9aZflqtUDJmFe5Ssx0dH9AxpYpfoPRdjNw2Hm0L3iF1ljCxJaY5BEcFQtiM+eS+zg+1oObM7uXUPBpPKqoW+VllddGwsuNVU+VlYhoHH4Co5aYiP+2S3bxdmu1ltNmhL68QQ6AbaCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750625735; c=relaxed/simple;
	bh=cUlskOZZ2V3yaqs17+9o3shdtVZ1TSTHvIvCHmB7Z3E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UA/qIbp2exqbv2gC6+wqtvxhngX+rSgHAjo331mFPVjFb96xrVJPywvAlADj87WM6ebInZLEoASPCIcS5t9RtKJCRqyPSk+puA9EvdcNLVgnn6QI97LlfknrkIzv3e3nStw8Nc9va1PCK4SfojfvroRG6cMuE3tSkihnfF8fADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Tfv7RGx3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Tfv7RGx3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2088D40AA9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750625727; bh=Rl+Jgbv6QLfnBpMCWu0zqY2zuTKGvPoSkWwkQcZUwtU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tfv7RGx3INFZPx9oN3SDXRYgkwaUmMRB1QgtzBctw1nxn72C1IvER2LVWw0yQp9hD
	 I3NnCxiEpjhHmpZ/YDWYnUiEBCtlrt7ppoFgvx1JiTiNA9/U3S4UtlcJYBbaLeKvp3
	 2ctXTOTgxnuNAkLLRdQ/HidcT55lqeI2lRBitSz367eWR/WX6mmAFl8c42PT0O4fpy
	 hNQqccxOvBOBcvMrajX9Rw7vOzbHVjWe0sRNDGWeobRtQRcimESjfOjAx/GbC4X/Ad
	 aVRz56HAzKQw74mVkvnRRvJ1hQ9xXyHpsh6KObBxP6KZcm7Dd+Wh8EVBNSeWeCT3E5
	 RaaETm13ojMmQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2088D40AA9;
	Sun, 22 Jun 2025 20:55:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Akira Yokosawa
 <akiyks@gmail.com>, Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] docs: conf.py: several coding style fixes
In-Reply-To: <063c106d96e86ca30c3266f7819f30b7247881ed.1750571906.git.mchehab+huawei@kernel.org>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
 <063c106d96e86ca30c3266f7819f30b7247881ed.1750571906.git.mchehab+huawei@kernel.org>
Date: Sun, 22 Jun 2025 14:55:26 -0600
Message-ID: <87zfdza43l.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> conf.py is missing a SPDX header and doesn't really have
> a proper python coding style. It also has an obsolete
> commented LaTeX syntax that doesn't work anymore.
>
> Clean it up a little bit with some help from autolints
> and manual adjustments.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/conf.py | 351 +++++++++++++++++++++---------------------
>  1 file changed, 172 insertions(+), 179 deletions(-)

This file is definitely getting out of hand...:)

I notice a lot of the changes are just from 'single quotes' to "double
quotes".  That adds a lot of churn; is there a reason for it?

Thanks,

jon
