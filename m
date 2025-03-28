Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C5718309C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 11:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743160645; cv=none; b=F46UqEf871iHSdzZtSNTFR7KXtwUM460E4FMs0BcCbykLyjjaEwJXERThdKKBAPAn7B6dUWdWy6BkMDYPK5E/QmcjD/oIpTpRZqiUJvVMX6EUyu80n5+7txVslfMxjiVfIo8T7zpZmHLtGrQqVlqlxsOUYjYzVcWKqSkytPNoGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743160645; c=relaxed/simple;
	bh=1CjbzxdxRsI9BHxKH9ZlMCbS8TpIKZN34vQ8faNhekA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6zYKU6GW/n6YO2ZjbSn/I+C/PnNcdpc/uF7BrTKkjiTws4qWJvfoZxtnNrf11d7QTjJgYLkMAtg0qigzhpwYItUl4qHpjy9VqdN4EtBiDv6arjx24HsgHrPD5bOxFhFOiwCu+L8fboyqrMAfzdSIiTZkKIixns7ZnWV4mtN7rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Sqvv6xjg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sqvv6xjg"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CB309FC;
	Fri, 28 Mar 2025 12:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743160530;
	bh=1CjbzxdxRsI9BHxKH9ZlMCbS8TpIKZN34vQ8faNhekA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sqvv6xjgQrYuuOHZUkfT5ypRw7Y8+6yxRAtU/9PrPx7eJLyloepPfoy93KOJ4OHE5
	 yGJJk6Ca5DrfodOgBEkhy/GpcuKCBRCc2P5VbZQ4V5ob3Y6/JB+303jPi5YXZghhp2
	 Abw4pPQUmSNhYBJZ7+iJXH+tuP4pTpixGUGug92k=
Date: Fri, 28 Mar 2025 13:16:56 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mailmap: add entry for Jean-Michel Hautbois
Message-ID: <20250328111656.GA11349@pendragon.ideasonboard.com>
References: <20250328-mailmap-v2-v2-1-bdc69d2193ca@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328-mailmap-v2-v2-1-bdc69d2193ca@yoseli.org>

On Fri, Mar 28, 2025 at 12:14:24PM +0100, Jean-Michel Hautbois wrote:
> As recent contributions where made with the @ideasonboard.com email, any
> reply would fail. Add the proper address to map this old one.
> 
> Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>

I can confirm that jeanmichel.hautbois@ideasonboard.com isn't in use
anymore.

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v2: Properly specify the mail addresses
> ---
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/.mailmap b/.mailmap
> index 05a3889ae2d3dadcd9265af6b02e35f9f6095c13..03a725d0f890f8ac7c06a06a386f591116957eea 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -315,6 +315,7 @@ Jayachandran C <c.jayachandran@gmail.com> <jchandra@broadcom.com>
>  Jayachandran C <c.jayachandran@gmail.com> <jchandra@digeo.com>
>  Jayachandran C <c.jayachandran@gmail.com> <jnair@caviumnetworks.com>
>  <jean-philippe@linaro.org> <jean-philippe.brucker@arm.com>
> +Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org> <jeanmichel.hautbois@ideasonboard.com>
>  Jean Tourrilhes <jt@hpl.hp.com>
>  Jeevan Shriram <quic_jshriram@quicinc.com> <jshriram@codeaurora.org>
>  Jeff Garzik <jgarzik@pretzel.yyz.us>
> 
> ---
> base-commit: 6de5ac43b603a7cdf6adea1f53fb24b7d064f1a0
> change-id: 20250328-mailmap-v2-088335d65871

-- 
Regards,

Laurent Pinchart
