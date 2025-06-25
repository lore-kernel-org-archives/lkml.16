Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3995F2E06CE;
	Wed, 25 Jun 2025 18:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750876864; cv=none; b=sw7oHT2kMSQIH2/xXz9swaDKYL38bcqQ5Ain9F/HiBnZmmOWMjDoYNMArNNsSz3qJcvgpflaUsH3wC21GNho1HH5vNInK15mwywq7vnNboOc7pmuBmgJTjcb9ApYT5H/aHPzJ0W0Kf3B+jo0DVXlyAP3ZcFVtxn+LdwRl4eNuAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750876864; c=relaxed/simple;
	bh=N8KAbfRi0RddkxyTLunLtcuV4EjHcAqtD9UrYd82kek=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q73HbrDSZzpm0+I21llTgpz61T9UMPKc53LAtTGcMf/Sew5CmeDSewG11A28sMzB2HLhagmsjk+p6YsMLiNcFaFsTG/txhauXhnID2GvTsTSa5845Bein5xeBEEm7rFEXqIWUx4EuTqheIQcaQec0WFLitdGk/RxP/gp958xm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=OhhgXNji; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="OhhgXNji"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 612AA40AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750876862; bh=x6s2YijYDaBMGstr0IWTtlUcKWkfuU6d/pRw+UB67B4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OhhgXNjiOqKwgTPfRtK54tO6ou/mdMU9uvW3ky0bHXuSdyjigrtGObpW2hvDfk1xX
	 gICjrDf3maIfS+dembgrgZqHhOkXN42nzaQP8hFuCg3QVALYQhXefMMPbnIJ0ujMyX
	 mJNWv5v1O9uTci6IlnT9bn55Gm+VDvzGkQks9hq46rpK3fx0kExHWI737+5GLfPD27
	 vIxIvUXVvBMmoF4WtyHjzfp9eWYrur05TS/MsKpcuKmj5ASuLzINxy6f/bUeuUc+9K
	 iGwkelpRc5AsxlQangtdNZk4B2n9MDyFGKqgpQ6FHpVS4W/fKATsuk3L4xY3nycURT
	 qdr540HZMxs2Q==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 612AA40AB1;
	Wed, 25 Jun 2025 18:41:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Kees Cook
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx: add missing SPDX tags
In-Reply-To: <1a62226c5fe524eb87bdb80b33bc7ec880a68880.1750585188.git.mchehab+huawei@kernel.org>
References: <1a62226c5fe524eb87bdb80b33bc7ec880a68880.1750585188.git.mchehab+huawei@kernel.org>
Date: Wed, 25 Jun 2025 12:41:01 -0600
Message-ID: <871pr7acle.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Several Sphinx extensions and tools are missing SPDX tags.
> Add them.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/cdomain.py           | 1 +
>  Documentation/sphinx/kernel_include.py    | 1 +
>  Documentation/sphinx/kerneldoc.py         | 1 +
>  Documentation/sphinx/kfigure.py           | 1 +
>  Documentation/sphinx/load_config.py       | 1 +
>  Documentation/sphinx/min_requirements.txt | 1 +
>  Documentation/sphinx/parse-headers.pl     | 5 ++++-
>  Documentation/sphinx/requirements.txt     | 1 +
>  Documentation/sphinx/rstFlatTable.py      | 1 +
>  9 files changed, 12 insertions(+), 1 deletion(-)

I've applied this, but the patch led me to wonder...

> diff --git a/Documentation/sphinx/cdomain.py b/Documentation/sphinx/cdomain.py
> index e8ea80d4324c..3dc285dc70f5 100644
> --- a/Documentation/sphinx/cdomain.py
> +++ b/Documentation/sphinx/cdomain.py
> @@ -1,4 +1,5 @@
>  # -*- coding: utf-8; mode: python -*-

Do we really need these lines?  UTF8 should be the default almost
anywhere, and Emacs understands that a .py file will require Python
mode...

Thanks,

jon
