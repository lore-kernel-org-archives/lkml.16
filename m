Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F7D2236E0;
	Mon,  7 Apr 2025 19:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744055869; cv=none; b=hSNRpLH98ISguYrDAnLRCSjhwLfcgXd/Ifk+dPqdhokcGZUhqNunKUO0u/U6wQX75Vkgsms0lNpqH4li5av2E57aGhfrwd8OGvow8vsRHLM1uJllKbEHnxgd3NUd+g3iDB1rrDTMgsapQbaTl2J/tlRy4lbuXulee3bFj7ozckg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744055869; c=relaxed/simple;
	bh=BcFYwrrUvlWqghmgRn3eq2YEAKq4QVcILIm1acwgZio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i1JuDIGVSaSqvsGT88CnXT+oeXLGB97zn3JTqjR9os7vpacV+d+E3g6RTWUUqf3Y0fR3I5GE/RQQLivyzzkvN0hYYyhzIzj3lpKRiq4NWDo2UjdDUJO3dNaYn8dLvDLz60bv8brsghgMed67S6Jh+MXiCn4Dj60Xz6SJKIUgABU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mAYinYCb; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mAYinYCb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744055864;
	bh=BcFYwrrUvlWqghmgRn3eq2YEAKq4QVcILIm1acwgZio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mAYinYCbNAeIX1DWVSf1aQ7fQ6goCEva8SkneIcLZBbvxm8sQvw7GSq6pw924DhZc
	 z+kCAueRMW3HXX04KVA8buPPxdYn7A81sXaaYH6QOwDg2UWf6UoAa6Jwz+Ngtd7Fko
	 5hIhHBFzH/uybzDROa1glUlgn1LF4MypslEOT+i3MsdP3e9Fm76LGNHaiWpOR4AqQd
	 7L9b7b17KfTtAzrkV0MM62jsM4yI5qwG1bcK6p7899tU82nYhT0Pu7v/Takayut/nX
	 iSApwnUYeBV/qEpAsdNvC5OTbfzOjpRcw22UH4qG8OdWEdxuLFRIBrSWeXMUW7sq9R
	 cW+L678MNIB3A==
Received: from notapiano (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F3EF17E0CBE;
	Mon,  7 Apr 2025 21:57:43 +0200 (CEST)
Date: Mon, 7 Apr 2025 15:57:41 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: automarkup: Move common logic to add and resolve
 xref to helper
Message-ID: <b06fff0d-7e15-45ac-877c-62479526a1aa@notapiano>
References: <20250407-automarkup-resolve-xref-helper-v1-1-9cac06ad580f@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407-automarkup-resolve-xref-helper-v1-1-9cac06ad580f@collabora.com>

On Mon, Apr 07, 2025 at 11:42:03AM -0400, Nícolas F. R. A. Prado wrote:
> Several of the markup functions contain the same code, calling into
> sphinx's pending_xref and resolve_xref functions to add and resolve a
> cross-reference, with only a few of the parameters changed (domain,
> reference type, markup content). Move this logic to its own function and
> reuse it in the markup functions.
> 
> No functional change.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/sphinx/automarkup.py | 78 ++++++++++----------------------------
>  1 file changed, 20 insertions(+), 58 deletions(-)
> 
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index ecf54d22e9dc6ab459a91fde580c1cf161f054ed..8b129835e521428c0bafdc1584c8ce69252a668d 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -128,13 +128,11 @@ def note_failure(target):
>  # own C role, but both match the same regex, so we try both.
>  #
>  def markup_func_ref_sphinx3(docname, app, match):
> -    cdom = app.env.domains['c']
>      #
>      # Go through the dance of getting an xref out of the C domain
>      #

I just noticed I missed these comments, they refer to the code that was moved to
the helper. I'll delete them in the markup functions for v2.

Thanks,
Nícolas
