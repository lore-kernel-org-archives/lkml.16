Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB311754B;
	Fri, 23 May 2025 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748027815; cv=none; b=HHBFmgoL7xYf9uZo0DEGxW1jGnXr4Iuf2kppZ4jYusAmoQMBk6HROqGy22m7AxPtriIC0+6Y3ZuB8ZRUIXk2QK6MyIYDUjY6DMQb9ipHuerW+pB1In+ZkZZNwV/fQp3AVLw9Cn2HzwMI8U6dA7IJDlx3JtzbhYE90wUq/sGubjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748027815; c=relaxed/simple;
	bh=JHrKA3GL2+btQ5M4dV8mn1YJFtLDJRKXWtBxFancfLU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=PU1187mUPcUE8hE82vs67jx4qA8AIlJUTyVJqZRlob4IqYisEsUpojtXDP8wMGBvwDr6sOCP3Y1Y4oZYLI49Z1s6+dvJRh5tFBj/6P689nsj1eR+Y/Z4IBmsONvk69TdEyE1F8yUtvZu40nUR1Xj2F8tSCuMe1fuaJEkMTGjQd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=clQVrlbu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="clQVrlbu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D503BC4CEE9;
	Fri, 23 May 2025 19:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748027815;
	bh=JHrKA3GL2+btQ5M4dV8mn1YJFtLDJRKXWtBxFancfLU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=clQVrlbu7Y0j/lMuLit9u7kWHNAEVD2Jbro0BJsft+ZAdTHA1r1MelApy0fJoGeRx
	 ozujjdejxquoGhZ49UbLRCDO9HJFjCFR5Hze0qQHGfAOy5QCkpvkeYAoi+1YFWI69U
	 RlZeM+DzWZYoHIWFMVYmLeRheEsJG629pQiq4KL3uBsNHZs09RD74xDeJWvgfOA0wn
	 3drgZgMVd5Kdqo0ir+AfopMH5DAaaJXyl6qHF93PHBdbKqrc9E9893b0nAGYwLjrt0
	 tvb5UNYPF5WdKSg9f4AGnKDJRHPTe5Li3rAfaMvClM5V/fD2PrCF48KOJqoFhZwWcP
	 EstHME57V6jCQ==
Date: Fri, 23 May 2025 14:16:49 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Wayne Schroeder <raz@chewies.net>, Kevin Hilman <khilman@baylibre.com>, 
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>
In-Reply-To: <20250522172535.302064-1-linux.amoon@gmail.com>
References: <20250522172535.302064-1-linux.amoon@gmail.com>
Message-Id: <174802762618.2701053.17389702773465611504.robh@kernel.org>
Subject: Re: [PATCH v3 1/2] arm64: dts: amlogic: Update USB hub power and
 reset properties


On Thu, 22 May 2025 22:55:31 +0530, Anand Moon wrote:
> Add missing reset-gpios property to the USB 2.0 hub node to
> ensure proper reset handling. Also update the vdd-supply for
> both USB 2.0 and 3.0 hubs to use the shared hub_5v regulator
> for consistent power management.
> 
> Fixes: ccff36934137 ("arm64: dts: amlogic: Used onboard usb hub reset on odroid n2")
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
> v3: dropped remove of usb2_phy1.
> v2: remove usb2_phy1 phy-supply since now it's managed by
> the hub reset control.
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: using specified base-commit 5cdb2c77c4c3d36bdee83d9231649941157f8204

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20250522172535.302064-1-linux.amoon@gmail.com:

arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dtb: usb@ffe09000 (amlogic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#
arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtb: usb@ffe09000 (amlogic,meson-g12a-usb-ctrl): 'phy-supply' does not match any of the regexes: '^pinctrl-[0-9]+$', '^usb@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/usb/amlogic,meson-g12a-usb-ctrl.yaml#





