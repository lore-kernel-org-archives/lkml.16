Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 920732C3246;
	Wed,  4 Jun 2025 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749074714; cv=none; b=OeZq8GPw6iiRtZa6QbLCOZUa5imNINxk5Fvsx9z2iV2Zd7+RXUBc2d4bfnNx/SC+zJWfuXj3kGh5kD+R2iJUuQQ35BZlVlfU8Xx78J7O7TCsu7BNE1re+sbq2NY1RtSV3zh9Y3UfhD5ASK+Y6xxDU4rz388C0+sDi6+Wok9q/P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749074714; c=relaxed/simple;
	bh=Nh/C3jkigC/s5IYwTai6YLcfd9DUBEpg9k9xorz/KHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1udoyGETmH6eDO28yafzpzy+EfRm7Nn6xPhCKx2b89f6mfUE/wqfr7Qiv7LTAIZzbdrxnHk155bMK9EimwS6g2yVSX/Fz3/FPlNrsHe0VBuw7SB7di85G9utP6RXfMp9zaSIrq/nDtH4eDeiLiDGachkRUEsOVjCChqkxZnkQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=HUiB6XqF; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="HUiB6XqF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749074710;
	bh=Nh/C3jkigC/s5IYwTai6YLcfd9DUBEpg9k9xorz/KHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HUiB6XqFFgdF60fjimTAw2GMN1B+1vgY6gDrs0juL3FXGWRXL08bKEBh/Qke//zMw
	 jH3yUAYfCXr839Vll2/scvSCd9CSDSXcOUXN5zeXO/yutqwRWCI95JlzAUBN5NV0gr
	 kmaNqdUhuVRg2pnMLgK4onnzfYAtK/6mXck/a/rVxhF8YDAABOwYTcUNrwMGxC9aLU
	 8zru5C1r3tQB/D2gFuaU8DDoKEmSUpPSxR5T2JZ/ZRsEpmctbpAeLhnYXODxV17741
	 EbWNTiYfwH/bzCDUZzCAkhyVby00kW2FNsftbp1Mv1z6OHokVH25k8rib4RyC4xpvZ
	 trWKCK2DpDa5g==
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:9400:99d:464c:62e0:2118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5775D17E0FCE;
	Thu,  5 Jun 2025 00:05:09 +0200 (CEST)
Date: Wed, 4 Jun 2025 18:05:06 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v2 0/3] docs: some automarkup improvements
Message-ID: <ebeb020a-8403-441b-ab02-f017ffcb7b83@notapiano>
References: <20250604143645.78367-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250604143645.78367-1-corbet@lwn.net>

On Wed, Jun 04, 2025 at 08:36:42AM -0600, Jonathan Corbet wrote:
> A small set of automarkup changes to improve the visual consistency
> of the rendered HTML documents.
> 
> Jonathan Corbet (3):
>   docs: automarkup: Remove some Sphinx 2 holdovers
>   docs: automarkup: Mark up undocumented entities too
>   docs: CSS: make cross-reference links more evident

This is much better. Markup, links and underlines are all looking good now.

The only other thing I noticed is that the links in the sidebar still use the
old style, since they rely on a different CSS selector for some reason:

  div.sphinxsidebar a {
    text-decoration: none;
    border-bottom: 1px dotted #999;
  }

That makes it a bit inconsistent style-wise, so I think it'd be sensible to
update that selector as well to follow suit.

In any case,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
