Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC6525C708;
	Wed, 30 Apr 2025 14:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746023773; cv=none; b=MHkoj+JKWoBnYdchs+k7rh8EB0cxqkPPhvlCDjtgzz8AxQd/QFGsLEOVlBE1TPHHGAW2+MzeX9rslK9UfTLVD3KKkZ9NOWt6gtSz6igHnIdz3sriiHZ/Uk+dAGqO2Zpk8fkhVhCs40VsUrYUjsgcM72Do86EEi+pTTd++WmBOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746023773; c=relaxed/simple;
	bh=cKXS0wbgFsKYhv80O7ouzrBxO3wfwf4oihtTeXawYtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifTt2qqT8Zhxxn1fm07tc/x6nkZCOB0UCpuO3/frXFIZ7oTRNeQjXi/qBOkaxW8SnPDr1FLNKfB3i5FTFK1k2wh/9dC7To/EFvUgXVflQKSkMlNCSXUP/wW5jnHI3NsXXcSkv+zTGjQWB90V05zBXExPutdTNZA4dEkAkTj8pRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WauwNMWt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WauwNMWt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DE11C4CEE7;
	Wed, 30 Apr 2025 14:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746023772;
	bh=cKXS0wbgFsKYhv80O7ouzrBxO3wfwf4oihtTeXawYtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WauwNMWtUTHe5HHI+QLThurQGREbcqLfHQ18UpVLclxxxtRUkcfqba7LkFfVysHzF
	 gquw22zFkR4sVoxAjTyUvBDLHEjw/hk2vAnDzHuTQ3yGeuINGQXCkEbDkJcl9uCoNB
	 SIFrgAKrVUQasWkw7hHuyeJP57p1SUs7vnJBG9BZfQ1ygHpKJMI1AV2lf77VEH7qNL
	 93U+RVM9TpRi0UZil/z6y7vppSaydNgyMwUWOH1heAH9QW2b5qofbWydsKh/IXeC48
	 I+4K9y08oLBLT1oUP+qDnBH3GFRTfdjnHTXJOJac4o7Nr+3rOTcqH93G85uveDmGJ7
	 7et0ESu527O2Q==
Date: Wed, 30 Apr 2025 09:36:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Chaoyi Chen <kernel@airkyi.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	FUKAUMI Naoki <naoki@radxa.com>, linux-rockchip@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>, Dragan Simic <dsimic@manjaro.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	devicetree@vger.kernel.org, Kever Yang <kever.yang@rock-chips.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add rk3399 industry
 evaluation board
Message-ID: <174602375195.3396795.11425847299435773154.robh@kernel.org>
References: <20250430074848.539-1-kernel@airkyi.com>
 <20250430074848.539-2-kernel@airkyi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430074848.539-2-kernel@airkyi.com>


On Wed, 30 Apr 2025 15:48:47 +0800, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Add devicetree binding for the rk3399 industry evaluation board.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

Missing tags:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>



