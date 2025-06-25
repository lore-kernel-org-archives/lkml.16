Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0442DAFD5;
	Wed, 25 Jun 2025 19:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750879214; cv=none; b=CvpFqMaoKvm21Vg3SdimXEyXR7tETRPHhEygqzwj/u+QxvQ6Wlo0tb0q6tszG06DiSlSOakjCaynFsCezsDOOj4e+aHwQ3vOg+WUUdrXEufGAloo8VqPapz5/DGVcO5KFooDzWima5d3k92itQlPftrP1XtVZd4DJX+j/LU6aUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750879214; c=relaxed/simple;
	bh=sca62JZH9B7G+ctNvBdw9GUebLjtvA5SkuZvnF4DILI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czocllUJ9eNXgHsZMjN1/gWk7TU4XM6BQng6gkRPje/wQWjBlR+m9vWQll4i9qdFeKrT9beUbzc9SO81YS63/bWYZN2iM6f6NEZrlbR9CkcRl9ewm7asmcBnSz5A/gHVuBpddry072gXaOVaZqnFBDhnCo1ZNuwoxnQ/cqXNYII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoGIOwmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoGIOwmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB60C4CEEA;
	Wed, 25 Jun 2025 19:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750879213;
	bh=sca62JZH9B7G+ctNvBdw9GUebLjtvA5SkuZvnF4DILI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PoGIOwmJsG0aWLCJxONJJ33xF2KR+Cq8zPFTXZ3/jcDW8a1G05z17E1otXTarIxnn
	 Svgv00k99h6AQM9aHgvLibweNd3HPeoBeJdbhx+ChkboDTWekjolHPJX8vHBnSfcT1
	 wzoMi+R16ZdmOumeMWBQUJbdIJIH4uGllxuLFHIuf5dlt+RBP9tS2ZGM9EiWmZHV/1
	 0mINmFUxcAwB7ZncOfzuNT6Qw/+NYiFfmeV8//qVW7uB3fEUBmxTRnxL9TTg6aZNBl
	 TN1KaAVYaMlKTAAdlWOneEm3RHZXM/L1IP7haxKFO/p827jzbKW1AC8BYzrlk7SutO
	 rPypx71p5nVIw==
Date: Wed, 25 Jun 2025 14:20:12 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Icenowy Zheng <uwu@icenowy.me>, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 2/2] dt-bindings: usb: genesys,gl850g: add downstream
 facing ports
Message-ID: <175087921220.2067965.6337398694001968932.robh@kernel.org>
References: <20250608-genesys-ports-v1-0-09ca19f6838e@oss.qualcomm.com>
 <20250608-genesys-ports-v1-2-09ca19f6838e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250608-genesys-ports-v1-2-09ca19f6838e@oss.qualcomm.com>


On Sun, 08 Jun 2025 19:07:31 +0300, Dmitry Baryshkov wrote:
> In order to describe connections between Genesys GL850G hub and
> corresponding Type-C connectors, follow example of RTS5411 and describe
> downstream facing ports. Unline normal case of ports being connected to
> a USB device, hotplug ports use OF graph representation.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/usb/genesys,gl850g.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

