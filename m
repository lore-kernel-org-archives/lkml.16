Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D1221516C;
	Tue,  4 Feb 2025 17:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738689553; cv=none; b=n/BGsZ83jQA9m1HCNO07e72frQP5EPYNEEX6ytpfWDIk8t2eWqCeC9sspFwQmzRqPLDwiTs2YzdXjc0wFo5KnInQW0DfVjnT1085esYwXgqFYNXaAzlCUlGAaNYQNx3r08PGuk6Rr03GiM54fyW5JyG0RfEHb//unmF0lFpJQLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738689553; c=relaxed/simple;
	bh=J86YdbKK8Qv/d40JzMIQMPYunfy8ubwmWUHUH3csaTQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bT2Dwijjo831xa47N8rBpv7Golnk4cOvX+HrvvAcuP6rRRzhq4ylv2Y1n4cNYHcvj7I8ltvv+CRdZ2oBha8NvHqDzQhdvSSkGikvXR8Mjt+imXIL2SozUhdXRUDnVSb5vcmqT9OiAV8Aam4YP8/bwotHpANz97PRnL2W9YowW/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=g13Czhk+; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="g13Czhk+"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4130A404FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1738689551; bh=UH7wV2+0vr/I7llWl2n8WcfYM0VnMgjFIAs4Eni4cPw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g13Czhk+wcRFO7u1OfFvD0QSdYlcKK8oVb5zm2bckJTrrS2On6x+MBJkk/DdNdaER
	 VCbyDoh8cG20iNILXoHa1HpFeQMTa7B9goC9Jf7+prP1PZ83x6f3LPRbPeQcmBjFN5
	 s7ImcHjJO2ApvKp4YCBp4jofrHNS0wBvYP6oOJrjwDanxhGYRR9HCVwi7cMGOlk7RK
	 UeBTh1vw2zk3GefR91WDfZair4yksGYhMaEta1ZAnIuZC5zFr8e9NXhENOOnIuYRha
	 idB/hLLKG9bj5lL4OZYQjU2S58DOfqvVDOgadrQyvHQ9T4vhgDaxLw2rDmjPYOJLzm
	 IxlP9qvcjcrFw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4130A404FA;
	Tue,  4 Feb 2025 17:19:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [RFC v2 05/38] docs: sphinx/kernel_abi: adjust coding style
In-Reply-To: <259b07bffa7907ab8e73939dd5d9f025b2f694a8.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
 <259b07bffa7907ab8e73939dd5d9f025b2f694a8.1738020236.git.mchehab+huawei@kernel.org>
Date: Tue, 04 Feb 2025 10:19:10 -0700
Message-ID: <87zfj1eigh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

So I was looking at applying the obvious fixes from this series, but ...

> Make pylint and flake8 happier with this module's coding style
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/sphinx/kernel_abi.py | 28 +++++++++++++---------------
>  1 file changed, 13 insertions(+), 15 deletions(-)
>
> diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
> index 8401562cb5d9..a1887b50a900 100644
> --- a/Documentation/sphinx/kernel_abi.py
> +++ b/Documentation/sphinx/kernel_abi.py
> @@ -32,32 +32,30 @@ u"""
>  
>  """
>  
> -import codecs
>  import os
> -import subprocess

This breaks the build, since the module does indeed need the subprocess
module.

jon
