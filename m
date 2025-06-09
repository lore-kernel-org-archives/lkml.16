Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3881A238C;
	Mon,  9 Jun 2025 09:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749463024; cv=none; b=BZ0ShV5pbTD1PjqHndUf4Ajod4fEU4jd56QZixyt0NZNGIJBQeWr08aAmINJ9HYdi64VZ+k0EqHJCZMLp1hlAzYpjUQBfpJ+eL7sHAuVYwsMQas5aLa4+KXkTU3opsu9LwANWF7mmg+oUJY4mSawqAxtfYTwBNbjv95gDtrd/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749463024; c=relaxed/simple;
	bh=9VV78mTdCM8Xz6t4vnsFu4D1l32Vq/PgGJTS58c1DNc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z3NbysEvmhkPeFmJ6FWgJlZoeqFAikWwjFh6ro78J2dS9pxbvEhMsl7xKFiaSCUoAKKRUaI4H7r+Xab5wKtjXlXpDFQiMuNsH8jHR3ZzmK0TSHHOyvjlwz99lpEHpD7Az3+KaGCxSRFGUIK8Z4w1mWQYUIyHi3emJbTOs7R6o/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=URNFd0PS; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="URNFd0PS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6DvcsTsouDL2xyct8nJS/5GZ1osdIxIFWhYhic/hWMY=; b=URNFd0PSsk0P7K0Be6K+rbYh5F
	YFOT1i5tAEzi4qVMmo2RYnmW7JeMvwjeZ+Gjgs++GiDpvyM2EVWHvu9fvuh7UDagqGLDoOPqvHfyq
	JCtKJFT8b3VbzgFWPXUx0aThsllZ/pbVmG9Rki9yO4LIqbU3De5KlWrsjtKfbDCdXZYQM7XkLvy7k
	BO60Rh3Ir/Vs9nLxZP7M2vobuXXU+yK/1WEa6x3n74nz3e/QrpMm7hsaCdK8/PVq8mqHyDR4OAnEG
	y8bVWLJ/Mfsei0haUi6GtY3TxPvKcXGtYnq+Eem393Q1dmTSfsK3awMP8KWzMjEAkEtXStDavTNZ8
	/IuybvlQ==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOZFP-00062Y-Hr; Mon, 09 Jun 2025 11:56:55 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Quentin Schulz <foss+kernel@0leil.net>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Quentin Schulz <quentin.schulz@cherry.de>
Subject:
 Re: [PATCH] arm64: dts: rockchip: support camera module on Haikou Video Demo
 on PX30 Ringneck
Date: Mon, 09 Jun 2025 11:56:54 +0200
Message-ID: <2806486.NG923GbCHz@phil>
In-Reply-To:
 <20250516-ringneck-haikou-video-demo-cam-v1-1-fff23160395f@cherry.de>
References:
 <20250516-ringneck-haikou-video-demo-cam-v1-1-fff23160395f@cherry.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Quentin,

Am Freitag, 16. Mai 2025, 19:26:10 Mitteleurop=C3=A4ische Sommerzeit schrie=
b Quentin Schulz:
> +&isp {
> +	status =3D "okay";
> +
> +	ports {
> +		port@0 {
> +			mipi_in_cam: endpoint@0 {
> +				reg =3D <0>;
> +				data-lanes =3D <1 2>;
> +				remote-endpoint =3D <&cam_out>;
> +			};
> +		};
> +	};
>  };

dtc is quite unhappy about this construct ;-) .

with a W=3D1 build option when compiling DTBs we end up with a number
of complaints about missing and/or unneeded address-cells/size-cells
or "only one endpoint, @0 not necessary".

I think it would make sense to give the isp port a phandle in the
px30.dtsi and reference that one here - similar to how the dsi-panel
works.


