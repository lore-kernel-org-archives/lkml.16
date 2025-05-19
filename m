Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2D5D515;
	Mon, 19 May 2025 06:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747636991; cv=none; b=p8EFz+tET3bBUL9n6kmyCKDZ1pnt3rZiO/ABTZvdeVshqVMxP0OSZGp0Sy9t8bZeaBo+Ulr6k8zQJWHsBRCWtGTtZNQ83AXhDNFa2k1A5+3/T8CTZWMJcVV5rUEYEyU61LAseBR2dfvAJITSJNFD1KOGsaEi45DLLicMev4zPjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747636991; c=relaxed/simple;
	bh=Yx1POljrotCIOHaWzbGr8GsvbOuA+Q2oSlphVN9dFyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKWLMRCzAc6bisZ75dQx2nDSIwnYfTlKQpro68AgptYK4FZz0dEVNtLc8OBngs6jtmlq2xqYhH/K4SZBM+bs1itbJT8EPlgn53NrMoaDk24zOXdyCeNFswQH4UGnYsLyWKGOM1sKKbMaj3i6lvGXEYwTl3rokO9NT+b5uF+jAXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eFJWYJ3a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eFJWYJ3a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7388C4CEE4;
	Mon, 19 May 2025 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747636990;
	bh=Yx1POljrotCIOHaWzbGr8GsvbOuA+Q2oSlphVN9dFyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFJWYJ3aD0LD42aTLgS7rWRD6M3842RTrYNQvix8F2UsS0QWl5IMdSeYVXCNs41u7
	 haTgRlRewO1qVE5KwSPzIHR1LRkLvxHTW4qQWEVp712/7mzeQ9TTE6aqtt+OMuvSCx
	 hzl7NHYnmHLhyrps/FKyMlJNiJJ4NSYDUc96uyV7zL3ka/mqPMtCWuPldHBXutYk/l
	 HzO8HCo3tDDUGNp01ejXhGAaoCrs5Er9BNSDI0SNcRa51adNwEBn/22MygGjLg2fYn
	 WFL+0J7Qw4Yc3XH7mOyE3Pa1IW1eSvler4r92MeeYCEN98/bnvMuCA1nQozsr2nqzB
	 /1mu+qfOfhl6w==
Date: Mon, 19 May 2025 08:43:07 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	chunkuang.hu@kernel.org, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	p.zabel@pengutronix.de, jason-jh.lin@mediatek.com, nancy.lin@mediatek.com, 
	singo.chang@mediatek.com, xiandong.wang@mediatek.com, sirius.wang@mediatek.com, 
	sunny.shen@mediatek.com, fshao@chromium.org, treapking@chromium.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v3 04/17] dt-bindings: display: mediatek: add OUTPROC
 yaml for MT8196
Message-ID: <20250519-dark-warm-squid-4bdae2@kuoka>
References: <20250515093454.1729720-1-paul-pl.chen@mediatek.com>
 <20250515093454.1729720-5-paul-pl.chen@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250515093454.1729720-5-paul-pl.chen@mediatek.com>

On Thu, May 15, 2025 at 05:34:16PM GMT, paul-pl.chen wrote:
> From: Paul-pl Chen <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> MediaTek display overlap output processor, namely OVL_OUTPROC
> or OUTPROC,handles the post-stage of pixel processing in the
> overlapping procedure.
> 
> Signed-off-by: Nancy Lin <nancy.lin@mediatek.com>

This was not here before. What is happening with this patchset? Why some
random SoBs were added?

Nothing like that was explained in commit msg.


> Signed-off-by: Paul-pl Chen <paul-pl.chen@mediatek.com>
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 

...

> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        outproc0: outproc@32970000 {

Drop unused label

Best regards,
Krzysztof

