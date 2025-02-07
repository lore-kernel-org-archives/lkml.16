Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7787F2405EA;
	Fri,  7 Feb 2025 15:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941700; cv=none; b=sVNubkTXeIeMU5uE3mdhDl8E1xQAXHKSKJrNmFKjh93PoW5GkVGtwUpXyiHSNNDseUBjsWFriD+MEDgr6Lp6Dm8yyIP3apo/p6Vn1CIlggfS5h0kC4ejLcICWo+MZbYsEpdP2EFmSa12A2RfQajhP/kB7ZBgPrFvXS22pq0dm/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941700; c=relaxed/simple;
	bh=xsDB1Z4itK0LFAhRduY8snfsKbsHRyDF/OxtzpTJ1BY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=rUzUiEnk6cjIwGQQx30lKXNsL/WRCLBUuDYw7XxSC1Xi4ePs84OBjpPgzJ/zcVYZWM65hYSh7MQYOSSIL7qmkxeWnKEvZwGIf8bZu2Z+BpakohKbzRMcHJcx+gn4R7jb/5qAC421M8A2fU1bAWLl1IyB3clCTZS2SI4XsWCpO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IwexZnac; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IwexZnac"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2DF0C4CEDF;
	Fri,  7 Feb 2025 15:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738941700;
	bh=xsDB1Z4itK0LFAhRduY8snfsKbsHRyDF/OxtzpTJ1BY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=IwexZnacYHMUj5iRV6m8qHHtmBxBuefVLeEAXhdM5gdv7Obg1TBGo2wE1UnOAvFXm
	 UV7/2q5XOW3cMgLFOZBbrMY5KBa4YIUaiM+YMLBvUSbX0SKWZCdE0GxiPmkLMLkdvW
	 uS9FhYjmhQ4mAhABePNn2UQFouk1PnQXJOIkiH+5nc1dxyVFa876NYwh2IEReFjakF
	 I4xYIl9H9C/4qZOIZKjKy7GgcNvOui6y9aw0Axx1//VtXxadEoVT0MlydyLnyhkSCo
	 kKr8AqXkAju6vozcbXfPnYPwXx8YYoOjqJawV+p9/zR/jq5O3lMs4PP/sftN24DwCh
	 v0JS0ixJ0Sl7g==
Date: Fri, 07 Feb 2025 09:21:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jean Delvare <jdelvare@suse.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, devicetree@vger.kernel.org, 
 Patrick Rudolph <patrick.rudolph@9elements.com>, 
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, 
 broonie@kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 Naresh Solanki <Naresh.Solanki@9elements.com>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>
To: Naresh Solanki <naresh.solanki@9elements.com>
In-Reply-To: <20250207132806.3113268-1-naresh.solanki@9elements.com>
References: <20250207132806.3113268-1-naresh.solanki@9elements.com>
Message-Id: <173894151141.331439.9793996837825195841.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ir38060: Move & update dt
 binding


On Fri, 07 Feb 2025 18:58:03 +0530, Naresh Solanki wrote:
> Move dt binding under hwmon/pmbus & align accordingly.
> 
> Previously the DT binding was invalid & wouldn't work with pmbus driver.
> Pmbus driver expects a regulator node & hence added the same.
> 
> Fixes: 1d333cd641fb ("ARM: dts: aspeed: sbp1: IBM sbp1 BMC board")
> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> ---
> Changes in V2:
> 1. Update commit message
> 2. Add Fixes tags
> ---
>  .../hwmon/pmbus/infineon,ir38060.yaml         | 61 +++++++++++++++++++
>  .../bindings/regulator/infineon,ir38060.yaml  | 45 --------------
>  2 files changed, 61 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,ir38060.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250207132806.3113268-1-naresh.solanki@9elements.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: ethernet-phy@0: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/net/ethernet-phy.yaml#





