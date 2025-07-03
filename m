Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220BEFBF6;
	Thu,  3 Jul 2025 15:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751557785; cv=none; b=YXKqQpg4Qu1mxZpxtBqVeqZtBzIHqMT4ITbItgGD4RzyLgRAQitvvBiBndxGG9j0zlFA+SsxR2lZCTExiYlN70R6hgr+40ywqWhXY9iNRUo2kzz1peC+4Bv0ICKCg/dGaAwMwpwLzIa28nnpGihAG8AhfCuvFFrWXM0I3cbNo3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751557785; c=relaxed/simple;
	bh=HQn7cW+E7GCG5beiJ67yygva488nYXoyN1YXZ+MSr30=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p0Q3v2DyYN88W7Iu+dB2VFgOEEZhd0qBXGKVDxKzwPAljBpk8WnHiHksvbET4rAWKY0NFX0R507z1ObWH3iGPoOp+Ct6wbP/mCueYSZpEzwMSePktw00VNxq06kWbs3xTFH+NTaAzDg2Hyzx/v2/bjw5XHek0dx66WxMbG8keAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=puaesnP1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="puaesnP1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BF0C4CEE3;
	Thu,  3 Jul 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751557783;
	bh=HQn7cW+E7GCG5beiJ67yygva488nYXoyN1YXZ+MSr30=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=puaesnP1ejjI2F5RzPH0SV4ylb2/dxYqrH6BGjiD89xWxY5/i7ViORozn5iG4zGJx
	 u97SaCj0DOSban1QhlwBquEMFETO5bZq7zztAhiujKQiRceQsbmylbpulh+RwZ8tD/
	 V8exX76vX9klxfmrlVtAgIej9Nd9Gwxh9ir+Gll8QCo/2AP7BH/ffuA4w6ENtT61nV
	 bb5AF48HIkNfenkIaXE6x7GvnH6/af2UyezeKUySqpm8kJyTPjjR0ETC8/xW+UsLH8
	 qRzssoxYcOCdKsan8Sc1ATLsHiCgZxDmxJieX0il12quD9mcjmVxs8lxFGWANFcTYf
	 J5xrAXXJD7sIA==
Date: Thu, 3 Jul 2025 17:49:37 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akira Yokosawa
 <akiyks@gmail.com>, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 6/7] docs: kdoc: Remove a Python 2 comment
Message-ID: <20250703174937.50d23519@sal.lan>
In-Reply-To: <20250701205730.146687-7-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
	<20250701205730.146687-7-corbet@lwn.net>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Tue,  1 Jul 2025 14:57:29 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> We no longer support Python 2 in the docs build chain at all, so we
> certainly do not need to admonish folks to keep this file working with it.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

> ---
>  Documentation/sphinx/kerneldoc.py | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 51a2793dc8e2..2586b4d4e494 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -25,8 +25,6 @@
>  # Authors:
>  #    Jani Nikula <jani.nikula@intel.com>
>  #
> -# Please make sure this works on both python2 and python3.
> -#
>  
>  import codecs
>  import os
