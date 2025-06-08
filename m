Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4A01E25F8;
	Sun,  8 Jun 2025 22:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749422027; cv=none; b=TW1mWcAfySsNYLAHA8KVYh3IuGdpr5eQ1LFiKb7ih7QR8RHH25avbJ2a1FZ8tg+xOGWJFTQj4Ofxw1pLT3tK9i1x7WnOHzTK0oxC1D+TwEIO3zOPzoh8RmlJUVvuf0wzAiAx2zZ/8L1K57fmsaLn/ykw/xVoJ7KIpRS46pbUPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749422027; c=relaxed/simple;
	bh=p6e6O6y2Pf8XwXH8KwfPsonKx6xmLEy+p8t4oVtHFiU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SDTxJ/96cAVu73IDLXBC1ZnZFSg0Mz0qWUempB4hF3brSxHQaSG1WY+DCCg24WJ0DZBrmEJIj4Aj/pddbXK7/04x8QX+ScyPBFMArhbTWLESwNeFOfr7pFgNGD+mVJT8r8MNkjYOFEIptXEmBOhml9RwgKtV0AgkwQuP+jqwrlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oXG9j1IX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oXG9j1IX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B8AC4CEEE;
	Sun,  8 Jun 2025 22:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749422026;
	bh=p6e6O6y2Pf8XwXH8KwfPsonKx6xmLEy+p8t4oVtHFiU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=oXG9j1IXnd7uqUad9rWrublROUqma5WYKkJFk7VKvsBObe3saFsB9O60ydQPeJHA9
	 0rDaNCPi7k95xSMEoKxP9gkrjge0+j9NHDoGkiVjmcNG95b/5/89Kzmm1/FL5pI0d+
	 JxA2y0/st2moSDYTdRaN12Ih4r04QvqCxpcOYL2UZcwj+GTI/h7tQg4+OaJ0DlJneD
	 tOYZ4JwMkzIfKsAwlbeiKVyVHcKRx87nt90nMzf4Z9FZh/Ih3J55vFLrvx9D2mllLT
	 VFNAbxbaVfWsM2vawLCwHgx81PANivaQuK4LgIWfxJFJDO2ZiuMAVUpUW36rpwecfj
	 unTgWWxTMbpSw==
Date: Sun, 08 Jun 2025 17:33:45 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, jens.glathe@oldschoolsolutions.biz, 
 Conor Dooley <conor+dt@kernel.org>, konrad.dybcio@oss.qualcomm.com, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250607212654.126412-2-alex.vinarskis@gmail.com>
References: <20250607212654.126412-1-alex.vinarskis@gmail.com>
 <20250607212654.126412-2-alex.vinarskis@gmail.com>
Message-Id: <174942202584.3889182.15644402442833643578.robh@kernel.org>
Subject: Re: [RFC PATCH v1 1/2] regulator: Add dummy regulator consumer
 binding


On Sat, 07 Jun 2025 23:25:38 +0200, Aleksandrs Vinarskis wrote:
> Add the devicetree binding for the upcoming driver.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---
>  .../bindings/regulator/dummy-consumer.yaml    | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/dummy-consumer.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/dummy-consumer.yaml: properties:vdd-supply: '$ref' is not one of ['description', 'deprecated']
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250607212654.126412-2-alex.vinarskis@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

