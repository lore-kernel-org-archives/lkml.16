Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B1D1C7009;
	Sat,  7 Jun 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749290359; cv=none; b=h8V3sIJFW/x7yoZ/Wz+VcDxzTbUrJXgQXceaGrzocAK/xKjh+tZGskaAzf4DYQUtWWzpj8Zo1uLZbsDnyRrJ5HMN1e3UfZkMimr4IPJMor2iyDvRVaPiABI44KDwM3T5qIYvvATbVDzP03Qg5gFbfnxto4P8HFl+AwJkF26SoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749290359; c=relaxed/simple;
	bh=9J1B1gTTSmnk03y4Wf7Nt+d05rnS5/cDlUL84h1ML/k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S5x+kxaBLDrckz+fOPz0hj4FUkey790QGG5jVD/cCJwbeTjZCMwjOWnr6K3rdzdOjKlhQHr/OF0gR30hGdHXnCL6UJDRddJZMDdT1+rjA5JaLDQzxKnzd0blX4+txSXb6X+m0hGfw5IvduzaxuwsFfefDEymtokZLuMVZB35HH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQ5hm63b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQ5hm63b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5393DC4CEE4;
	Sat,  7 Jun 2025 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749290358;
	bh=9J1B1gTTSmnk03y4Wf7Nt+d05rnS5/cDlUL84h1ML/k=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pQ5hm63bwLVne3k56D22cmjOM4nxR7P2+98V0Cfi7uKFSsKHYKe4yotjl1KD91TdT
	 uBhFmV64TZSbG6xN+8W6LxobsgNt4//PH8KiHeuuqUAWJeSGdxiyLRoVrRKIaJWTX2
	 G++ACfWFRJvsIFgVXsEnQtoUEGRyKhEuafs9Wt0pQr2oigaNI5vnROEsSuW/ylPB0A
	 QY9iOv6HoWX34sTGbRp1U66R0iTjkRjR7hHx+BxV5PXgEWnfqWngRt1nymqedL7Vvq
	 wFbv/HCopSCdaRNzlDcfEQrW4e+uC7zdzzZqdL/oEpq9nJ7X085KxKdu2CEWW3f6fM
	 GiAMUaLXQ5o7Q==
Date: Sat, 7 Jun 2025 11:59:14 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] docs: kdoc: simplify the PROTO continuation logic
Message-ID: <20250607115914.20e897e2@foz.lan>
In-Reply-To: <20250606163438.229916-2-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
	<20250606163438.229916-2-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Fri,  6 Jun 2025 10:34:30 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Remove the unneeded "cont" variable and tighten up the code slightly.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

LGTM.
Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  scripts/lib/kdoc/kdoc_parser.py | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
> index 062453eefc7a..b193cf9dc0d1 100644
> --- a/scripts/lib/kdoc/kdoc_parser.py
> +++ b/scripts/lib/kdoc/kdoc_parser.py
> @@ -1680,7 +1680,6 @@ class KernelDoc:
>          Besides parsing kernel-doc tags, it also parses export symbols.
>          """
>  
> -        cont = False
>          prev = ""
>          prev_ln = None
>          export_table = set()
> @@ -1696,18 +1695,14 @@ class KernelDoc:
>                      if self.state == state.PROTO:
>                          if line.endswith("\\"):
>                              prev += line.rstrip("\\")
> -                            cont = True
> -
>                              if not prev_ln:
>                                  prev_ln = ln
> -
>                              continue
>  
> -                        if cont:
> +                        if prev:
>                              ln = prev_ln
>                              line = prev + line
>                              prev = ""
> -                            cont = False
>                              prev_ln = None
>  
>                      self.config.log.debug("%d %s%s: %s",



Thanks,
Mauro
