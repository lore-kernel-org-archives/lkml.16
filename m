Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D88942690F9;
	Wed, 25 Jun 2025 18:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750877339; cv=none; b=ZVSF+e9xHCKrLZT5JGcVznVJYzOvwHBAgocUZH6c2jkRJcF5y/aGDBb8N/CmMqLQoCITAcMGE//1E39WkhimYL/gmL0b2zDB1ii0pWf0tLcNACMzm1Nluqe4Spparke+EFNKS+cR4rlnuMZgLTrt+2jqdTjrqouU3rrjySvK7oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750877339; c=relaxed/simple;
	bh=7ax4htsn3Fwg4rqcMH5Pa0holPGvKyZnXDOQSai1m+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1oSu+GWNMR01R+S3a/CJF8PnlHFugmv8TuCRmiDZodyvzeluAkw9sTV/Lhg83JlI63C+E1XrAwUF6+kVo/tGeUQgEgDnEQIMCIgqy94JrZcONiTzoC0kHoufg46pjX+nPGaJ2hMkLDHPP7j0ZxIPbMWUBUvdW+q3N+MnE/dq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMJBhwH4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMJBhwH4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E275C4CEEA;
	Wed, 25 Jun 2025 18:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750877339;
	bh=7ax4htsn3Fwg4rqcMH5Pa0holPGvKyZnXDOQSai1m+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oMJBhwH48fKOA/r9ZNid8t+OJZMQ7gZ72pT477GQ3YTF4h+oEa/k7bHp3DeM36GoC
	 zlJLc7xnHhz4F6ZMHEeMcsTDLt7yl4uibq3g/vDB4omZVZmLRugakQNcEm8ZGN6Ys9
	 ZmGhGC9PR5B2LRzRI/mE3HOPFoSgq3yiE2XyZCOBhg7kQhesGODPfiKqOLhm3p5FRS
	 htVxX6Z3Rc5jsd0bWE6Li/Q/+jqy2qpWih8Q+mehYLGguD0XaogQSGRK2VanO6HgzO
	 /0NxDP/z1XdO68VkYBOwzTwS16JD5KtVDvId5J6ySangHT2wLOCFwj4OaHWWPmxVmU
	 I5RVN3qcEQL7Q==
Date: Wed, 25 Jun 2025 13:48:58 -0500
From: Rob Herring <robh@kernel.org>
To: Chintan Vankar <c-vankar@ti.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, Andrew Davis <afd@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, s-vadapalli@ti.com, vigneshr@ti.com,
	nm@ti.com, danishanwar@ti.com
Subject: Re: [PATCH 1/2] devicetree: bindings: mux: reg-mux: Add support for
 new property 'mux-reg-masks-state'
Message-ID: <20250625184858.GA2004209-robh@kernel.org>
References: <20250605063422.3813260-1-c-vankar@ti.com>
 <20250605063422.3813260-2-c-vankar@ti.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605063422.3813260-2-c-vankar@ti.com>

On Thu, Jun 05, 2025 at 12:04:21PM +0530, Chintan Vankar wrote:
> The DT binding for reg-mux currenly requires specifying register offset
> and masks in the "mux-reg-masks" property, while corresponding register
> values are defined in the "idle-states" property. This approach imposes a
> constraint where "mux-reg-masks" and "idle-states" must remain
> synchroniszed, adding complexity when configuring specific registers or a
> set of registers with large memory spaces.

Sorry, but I don't follow why there's complexity. Having to support 2 
different ways to express the same thing adds complexity we have to 
maintain forever. I prefer to impose the complexity on the .dts than 
maintainers.

Rob
