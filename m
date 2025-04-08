Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20099204599;
	Tue,  8 Apr 2025 06:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744093675; cv=none; b=pU1vQCC3RT5slYkqJG3O9ACX8FF0tZAPOg6PYIrd1sS7go3cX/7Dj0grD+f7d7cXwMY5Qvx1jBSPfKY2h6k+iqtVqf7EPwCrtl5lCw2ON1PvYjPqHLFVSnWOEnatGfo2ia6tgDigqkJAatajN88TZXuPc9RdSEyUuwhKe7tahcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744093675; c=relaxed/simple;
	bh=sMS+pgw6gVqh68XJIsm5XK7zPr1Qw6uCBmzpegKq8po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DiI4GATQLyiQbd6nEcNqPLMFR5vSZefbv2A8HYZ9NQtMl0M3rJNsiqfaVYmJp/0XqrvKhyW5oMwr+NSqA+XHLY8SZHejTc6DtHBN8eAdHJy7692TjFL0on9WjA5v36G00DjDO8gRh8ANqBFujBZaLJS1N39RxMeaW72Y/03wqcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCxPKDAt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCxPKDAt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA00C4CEE5;
	Tue,  8 Apr 2025 06:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744093674;
	bh=sMS+pgw6gVqh68XJIsm5XK7zPr1Qw6uCBmzpegKq8po=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KCxPKDAtYbCUGWLAiugHnlJ1jfR7zWnnyv2OFh5PAfDoXZ5tNhjnYj7CCDh9B4YZr
	 XBmjYBbC965nulCVvYBO33HlCKoyIb6T9L8+o6kkcPbMC1XL8UdineCjJrOqAm8hBn
	 qJSX7QgOzaL9eL0P46aTPKRWWE/2PEJXSpZNv9W62YJmepkAFgw7oPDwOjEohJrRcK
	 vPgCUGoYuZZGPBDkWZaGmprtjx1O5BqTz0ZP+XMUgSSswwnZYFbys0Yi1QK7/hgGTt
	 AelyZ9xgtBpZmhTCEgPBnZHn2F/RRbPngzI7jYEKmxwfHvglujYi5USJVC1oadHCFE
	 7DncsVfNmNocQ==
Date: Tue, 8 Apr 2025 08:27:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 1/3] dt-bindings: memory: mediatek: Add SMI reset and
 clamp for MT8188
Message-ID: <20250408-bulky-optimistic-lobster-69ed77@shite>
References: <20250408033206.12176-1-friday.yang@mediatek.com>
 <20250408033206.12176-2-friday.yang@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408033206.12176-2-friday.yang@mediatek.com>

On Tue, Apr 08, 2025 at 11:31:54AM GMT, Friday Yang wrote:
> From: "Friday Yang" <friday.yang@mediatek.com>
> 
> Add 'resets' and 'reset-names' properties for SMI LARBs to support
> SMI reset operations.
> On the MediaTek platform, some SMI LARBs are directly connected to
> the SMI Common, while others are connected to the SMI Sub-Common,
> which in turn is connected to the SMI Common. The hardware block
> diagram can be described as follows.
> 
>              SMI-Common(Smart Multimedia Interface Common)
>                  |
>          +----------------+------------------+
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>          |                |                  |
>        larb0       SMI-Sub-Common0     SMI-Sub-Common1
>                    |      |     |      |             |
>                   larb1  larb2 larb3  larb7       larb9
> 
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  .../mediatek,smi-common.yaml                  |  2 ++
>  .../memory-controllers/mediatek,smi-larb.yaml | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
> 

<form letter>
This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions of patchset, under or above your Signed-off-by tag, unless
patch changed significantly (e.g. new properties added to the DT
bindings). Tag is "received", when provided in a message replied to you
on the mailing list. Tools like b4 can help here. However, there's no
need to repost patches *only* to add the tags. The upstream maintainer
will do that for tags received on the version they apply.

Please read:
https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/process/submitting-patches.rst#L577

If a tag was not added on purpose, please state why and what changed.
</form letter>

Best regards,
Krzysztof

