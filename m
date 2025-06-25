Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958E7285C9E;
	Wed, 25 Jun 2025 18:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877381; cv=none; b=QTo0tD45d+GiAlptESUgnVMoR1za8TItxYZ4VvCsRDA4s76PJ1old5aQzg5aFyp6INKLcal3ZNojE2/swq4B0TbvqKOsNi9U5KbR9QsW/SXphhNZnh1nUfDlKF5q3Nb7LkiSLQ8Vjie1bXDQGSrYEslilG6OuYY/CzVgZHImQ00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877381; c=relaxed/simple;
	bh=wGGX0Wtt6xHjoEp1aAerSxDzMmzRx9XKKRo91rlrK8o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=lH1BElEcgpQKREY1BvMtrNkRqDh7rUT51u6syqfzvioLT4cTw+0OhsvUfWAPBNWy/I3XPxtaZVXrVbPfgtpaBxEyfdJK/Qz1O6NzmZyGmh4GLfij3lvzWeXNzncogCEg2zDC6beYReqp4HlpKVnucjtdwGv6YF34bWtWNkPHSVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=lKb8EEkq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="lKb8EEkq"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A938740AB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1750877379; bh=Iave0JOHPwJ3frtHUomiJjK2jeAoC8mkonY8YfjRL6w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lKb8EEkq2q6G0cw0SSB+c5bn7pE6fdogjqHYiCe8li40nx6dDRWewP3HcKh+yhYIb
	 Ngw2zO5sU779jaRNQ3AO/Ob98+RuhiDYtEr4iK6VwpxlqnCmnHkYckzpIMUMZmV2x5
	 MYPbz5KqCOftPScZ3NHEi4zscyVnU6QU0yv1InYPrI8sEdBdipm79eEXslK2XNBvpq
	 akRIskwwSiy7smqB5Zs7KFEGTJo879EFAEnu0j9l3BnfOjHFR6UwgPm+9AMD3GoW85
	 uT/bU74iFlAWI7vgpNLl07H0hHHXPfXprQEMlm27+dkC7mvKZmll68LIYmHYxkM51u
	 Ra/NRaeOK287g==
Received: from localhost (c-73-14-55-248.hsd1.co.comcast.net [73.14.55.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A938740AB1;
	Wed, 25 Jun 2025 18:49:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Palmer via B4 Relay <devnull+daniel.palmer.sony.com@kernel.org>,
 Dan Williams <dan.j.williams@intel.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Palmer
 <daniel.palmer@sony.com>
Subject: Re: [PATCH] doc: Remove misleading reference to brd in dax.rst
In-Reply-To: <20250610-fixdasrstbrd20250610-v1-1-4abe3b7f381a@sony.com>
References: <20250610-fixdasrstbrd20250610-v1-1-4abe3b7f381a@sony.com>
Date: Wed, 25 Jun 2025 12:49:38 -0600
Message-ID: <87sejn8xml.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Palmer via B4 Relay <devnull+daniel.palmer.sony.com@kernel.org>
writes:

> From: Daniel Palmer <daniel.palmer@sony.com>
>
> brd hasn't supported DAX for a long time but dax.rst
> still suggests it as an example of how to write a DAX
> supporting block driver.
>
> Remove the reference, confuse less people.
>
> Fixes: 7a862fbbdec6 ("brd: remove dax support")
> Signed-off-by: Daniel Palmer <daniel.palmer@sony.com>
> ---
>  Documentation/filesystems/dax.rst | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/Documentation/filesystems/dax.rst b/Documentation/filesystems/dax.rst
> index 08dd5e254cc5..5b283f3d1eb1 100644
> --- a/Documentation/filesystems/dax.rst
> +++ b/Documentation/filesystems/dax.rst
> @@ -206,7 +206,6 @@ stall the CPU for an extended period, you should also not attempt to
>  implement direct_access.
>  
>  These block devices may be used for inspiration:
> -- brd: RAM backed block device driver
>  - pmem: NVDIMM persistent memory driver

Applied, thanks.

jon
