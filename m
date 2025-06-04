Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B7B18E1F;
	Wed,  4 Jun 2025 14:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049069; cv=none; b=kQ5PxhzU9G9b42o/tYMdsWk/BCv2HeSzAn+HPFcSCvTYzDTiR1rB3LVacME+R3y63YYo0b+F4nzVs9Azt2UID3OZ8FSoUmLf1i5BYMRZwKmO7jVw84UML+XlAgtNE1O3DH7DXVjNqRJuQ8SmbVQUTbO2Wcw2rsHXeWZ5ngzr/VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049069; c=relaxed/simple;
	bh=mQMGrZaQWboBnhe7ng9WBOI3t0w8RIrA3712YW+wFOc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SusGeUge9eG2QEGu7FD5p2UgszNDNOb3OD1/0k+cBPU0E98EOb6aDGQq471vTGrtu+h/n79Kz9gon0JpzXLf7tFlf/0FPrS4LGdrVBGS60E9Jla/Wudk/seLAlwa/qFaMvX7oIjuxN7wyDF9Goh2ajGoIZBY7JWiopeNoGDvVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zy/8A0UY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zy/8A0UY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094A6C4CEE4;
	Wed,  4 Jun 2025 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749049069;
	bh=mQMGrZaQWboBnhe7ng9WBOI3t0w8RIrA3712YW+wFOc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zy/8A0UYa69f6nsxUJzS2JnymS1QStujgeASAek+SnS5M0rda8HS5Da24HbUtGS12
	 TDD3l+DNmID6C3FAtnbNfl4J1fcfewP0QuQb5ybwDtDTn3PYqiWlemSLtVX9YMhTm1
	 f74NVhjgqJMHf5RwP9TMECmum0dEri0n3QIcM79XpHgU5aX5ctPdZm+qnIMAihW9A5
	 T3MBcML1rAcrGh2Eql6ysKqKYfl93fUNmVCfB7tivsl0kp7MNsS783UKMERdkGXnKZ
	 TBUB9O/1u6wJ0j41/WKVxAlBd1t2Sj3gWzNO6HOVA5yiodZmI6OAphnTEXxGjEX/Cq
	 IkCIJNMNnyU0Q==
Date: Wed, 4 Jun 2025 16:57:44 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "
 =?UTF-8?B?TsOtY29sYXM=?= F. R. A. Prado" <nfraprado@collabora.com>
Subject: Re: [PATCH v2 2/3] docs: automarkup: Mark up undocumented entities
 too
Message-ID: <20250604165744.68d98975@sal.lan>
In-Reply-To: <20250604143645.78367-3-corbet@lwn.net>
References: <20250604143645.78367-1-corbet@lwn.net>
	<20250604143645.78367-3-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Wed,  4 Jun 2025 08:36:44 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> The automarkup code generates markup and a cross-reference link for
> functions, structs, etc. for which it finds kerneldoc documentation.
> Undocumented entities are left untouched; that creates an inconsistent
> reading experience and has caused some writers to go to extra measures to
> cause the markup to happen.
> 
> Mark up detected C entities regardless of whether they are documented.
> 
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
> v2: Split out the CSS changes into a separate patch
> 
>  Documentation/sphinx/automarkup.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index 7828aeac92e7..e67eb8e19c22 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -235,8 +235,13 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
>  
>      if xref:
>          return xref
> -
> -    return None
> +    #
> +    # We didn't find the xref; if a container node was supplied,
> +    # mark it as a broken xref
> +    #
> +    if contnode:
> +        contnode.set_class("broken_xref")
> +    return contnode
>  
>  #
>  # Variant of markup_abi_ref() that warns whan a reference is not found
