Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5DC19D892;
	Tue,  6 May 2025 08:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520593; cv=none; b=gSABUFA7rBOSJrYuRuS4kguW0cPelQlwTKtio/PS0qoWVrfoenZyhIZR198vbi1JWaITg1MnLmJ6HSscSeY/DMvMK4B+F39DGmNyVCWXTHyU6l+HmLq9P19uEUYX3+G6mZ3uikegtKPwDpc00SF3+j8AmjsZVtp1FPl9PJ+YayM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520593; c=relaxed/simple;
	bh=+9mpv0BaF4cHinsYyWqRzjMvWVxnqlfFBy9goAV2c4k=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lIKzwJxuMzLKmmLCtIMF1ocgD8ANWSFaSKgRGUK7qvRwsDNLVQkf4VGMUienSR7CX5JV8eMF1f7erEaXJLNJo8TFa4U2wMHbefpglXV+lPdJSQRI5jsS3fi4DWgJzzsf+pejb0VelmDkpCojg2YN+EOldKa35PNza7huFzPSoKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CzhV+SbH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CzhV+SbH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8AEC4CEED;
	Tue,  6 May 2025 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746520592;
	bh=+9mpv0BaF4cHinsYyWqRzjMvWVxnqlfFBy9goAV2c4k=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CzhV+SbHwBKFGnLXYQ6VWWdQbh3fU4l0BQBFpk6dzU+5uzJ9vqRP7Jq8qqrUaUOrM
	 vO0ZIHnSWlfQ1g4Bp/soJ4IaiLNq/ybdeYI3yt1HQ6SkqJkereIl7tLZLL9i3oNBFX
	 vCtLZvIxXHvsLUijCbvlCXJSriI80xMng0TAsnavUUSC3I/sX8Jc8PAyhpPYyNhS4t
	 uQp3ZRPT5vH1yhhNYzg0S8AjrnkmLJ7Yiw72ek59ZqqB0Q4lxAVLN24MFTeH/7k0eM
	 kXHkUVqiAlrH+xOV50OT4bG18B92hc4cID1dIyRydcn+O8aAj9lJRNcY8ymY9UuDJS
	 9+duoNSgAD0Bw==
Date: Tue, 06 May 2025 03:36:30 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Joel Stanley <joel@jms.id.au>, Thomas Gleixner <tglx@linutronix.de>, 
 devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
In-Reply-To: <20250506022241.2587534-1-robh@kernel.org>
References: <20250506022241.2587534-1-robh@kernel.org>
Message-Id: <174652059077.3542988.5596879030416436987.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: timer: Convert faraday,fttmr010 to DT
 schema


On Mon, 05 May 2025 21:22:40 -0500, Rob Herring (Arm) wrote:
> Convert the Faraday fttmr010 Timer binding to DT schema format. Adjust
> the compatible string values to match what's in use. The number of
> interrupts can also be anywhere from 1 to 8. The clock-names order was
> reversed compared to what's used.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/timer/faraday,fttmr010.txt       | 38 --------
>  .../bindings/timer/faraday,fttmr010.yaml      | 89 +++++++++++++++++++
>  2 files changed, 89 insertions(+), 38 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.txt
>  create mode 100644 Documentation/devicetree/bindings/timer/faraday,fttmr010.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/faraday,fttmr010.example.dtb: timer@43000000 (faraday,fttmr010): clock-names:0: 'PCLK' was expected
	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/timer/faraday,fttmr010.example.dtb: timer@43000000 (faraday,fttmr010): clock-names:1: 'EXTCLK' was expected
	from schema $id: http://devicetree.org/schemas/timer/faraday,fttmr010.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250506022241.2587534-1-robh@kernel.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

