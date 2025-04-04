Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D771624C9;
	Fri,  4 Apr 2025 14:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743778564; cv=none; b=ikXIQBN7igLQTOxjkTAe23K84yMI/wpEje9cf18nMEa/XNtKeaahu2aWu8A/RqyB3+3ga/vom9ELldZyHF6RLgTTHXovJ2DHrCNh4N7eXn5jS2W6mnd4cjXItxdGpEpYyliePendZj3211jKy/EiLc6JxEwvr6woiYgTPyLg0dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743778564; c=relaxed/simple;
	bh=bsmW9y+0W+KUxx34ofruUlBo0xOvw2rXR++TeDi3AKA=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=WPDd3Sh0lhpx4BEgHmL0chy8vKpymZgBwn9WpmADN+T3Buf+QgJZw8mE5OQy+wWc7Bd6cpxr564SmTtRNmRBr1lmz3mGr7qYol5BtZ/kWbnRDgKvBdvX66ScAyYMENTXxPKni7F+qG096Hgz8FcWNxs+2amRZ5Et9szFJTSh9Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rzZ8msxb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rzZ8msxb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E06CC4CEDD;
	Fri,  4 Apr 2025 14:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743778563;
	bh=bsmW9y+0W+KUxx34ofruUlBo0xOvw2rXR++TeDi3AKA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rzZ8msxb+/87y0OctRs5tOxOR6tE9h/KjZci7JmdyMbsLYl923ZVvR8wlqmckWIcm
	 AG1QlHYsthO0au0/hChQLhy8gOzM9fw3c1F0qusmYKdvqb9U8zQpvj8bBIkFENqWbl
	 8lBZRlX6JKPwiWazZloNOU53X50y4s00DY2MROrSpE/TF8T/hQrafuwTxpc8WWxvku
	 YowoHFp9YHOAKDFCaqrWFTK9b9pGXoVobpR/TN/xgmNWuXFZKLalvSK7Bm6rzig2xF
	 nd8CoY+0BnWvoEIhPgy8jUUE5Q6Ftadlo4feiT5exPfQpsVoFVkoZbZvyHED3yasvs
	 dEHi3HN5tGQAQ==
Date: Fri, 04 Apr 2025 09:56:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org, 
 Tero Kristo <kristo@kernel.org>, linux-kernel@vger.kernel.org
To: Sukrut Bellary <sbellary@baylibre.com>
In-Reply-To: <20250404014500.2789830-3-sbellary@baylibre.com>
References: <20250404014500.2789830-1-sbellary@baylibre.com>
 <20250404014500.2789830-3-sbellary@baylibre.com>
Message-Id: <174377855887.1313159.8477749895324191477.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: ti: Convert to yaml


On Thu, 03 Apr 2025 18:44:58 -0700, Sukrut Bellary wrote:
> This binding doesn't define a new clock binding type,
> it is used to group the existing clock nodes under the hardware hierarchy.
> 
> As this is not a provider clock, remove #clock-cells and
> clock-output-names properties.
> Though few clockdomain nodes in the dts use these properties,
> we are not fixing dts here.
> Clean up the example to meet the current standards.
> 
> Add the creator of the original binding as a maintainer.
> 
> Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
> ---
>  .../bindings/clock/ti/clockdomain.txt         | 25 ------------
>  .../bindings/clock/ti/ti,clockdomain.yaml     | 38 +++++++++++++++++++
>  2 files changed, 38 insertions(+), 25 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/ti/clockdomain.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/ti/ti,clockdomain.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
Warning: Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/autoidle.txt
Warning: Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/clockdomain.txt
Warning: Documentation/translations/ja_JP/process/submit-checklist.rst references a file that doesn't exist: Documentation/translations/ja_JP/SubmitChecklist
Documentation/devicetree/bindings/clock/ti/fixed-factor-clock.txt: Documentation/devicetree/bindings/clock/ti/autoidle.txt
Documentation/devicetree/bindings/clock/ti/ti,divider-clock.yaml: Documentation/devicetree/bindings/clock/ti/autoidle.txt
Documentation/devicetree/bindings/clock/ti/ti,gate-clock.yaml: Documentation/devicetree/bindings/clock/ti/clockdomain.txt
Documentation/translations/ja_JP/process/submit-checklist.rst: Documentation/translations/ja_JP/SubmitChecklist

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250404014500.2789830-3-sbellary@baylibre.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

