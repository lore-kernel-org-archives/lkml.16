Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF3E274643;
	Tue,  1 Jul 2025 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751398432; cv=none; b=SYZQbJjbZzCQup1tJa0uCFssnNyKXA6vA7+kI5ufs5MkcKuVPjuyNUyURntAhc/0Qt68zUv+LSmPmady+pZdBchTifjKIHhTrNH6JbLL/paXky3x5P3WHHJwokjK5OIYijXiy5yq330rBjFEZ03hpjKCaMi7zWVRbaV+hj2wYfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751398432; c=relaxed/simple;
	bh=t76fGweTBymeWH8gKiI3BBohTVwjkyZEfHtPNBMgcrw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=JrDreACtomwq0fNVpbXUXPkRR8aDGoRBX2krHN2d7KMb/I8iTQthabFwckHApNME9S2cdZAboUtmD7T3ml4oF8++1jhPGSwhTHvajZky0Pv95hQNJvX4qAtBTduUxFqQf7gDqFJv4QBPZ0FIW3ozJNcegq9ceTDkUtZTp2/LcF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eieWzaTT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eieWzaTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672A4C4CEEB;
	Tue,  1 Jul 2025 19:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751398431;
	bh=t76fGweTBymeWH8gKiI3BBohTVwjkyZEfHtPNBMgcrw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eieWzaTTxtzmX1lHcj02YFdTl1Ak8zaLjG0p9VCfNogRtFLGx8DU+5l81TXxFbeK8
	 UwEXQtCkB5GFcSrB5x9yQiA6/bLvsgIMHb79s9LYDTPFKeLZiRb3utFqHI6IK4Amt0
	 +OOuDUWEPPgAChURayvD+7uVBU/ky6pCWa3CCO6/AjhtYGS1nAdPnWfmLoIF8K+Oz+
	 zhNCOxb+v0YRMHJaMnI8TMdioAeEMA/qaGE1IVp6FpstFaDPjPBWQyRqzymwvlEhUe
	 9G8EQfTvsNKth+irXMkmvZvM348anwrnARuObJdebgWeGHYTa33UZRsHcDuzTGV+M2
	 C6L4xJTk1+USw==
Date: Tue, 01 Jul 2025 14:33:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, linux-doc@vger.kernel.org, conor+dt@kernel.org, 
 linux-hwmon@vger.kernel.org, jdelvare@suse.com, linux@roeck-us.net, 
 corbet@lwn.net
To: =?utf-8?q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20250701181228.1196102-3-noltari@gmail.com>
References: <20250701181228.1196102-1-noltari@gmail.com>
 <20250701181228.1196102-3-noltari@gmail.com>
Message-Id: <175139843060.2356328.5526096489625404757.robh@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: hwmon: Add Microchip EMC2101
 support


On Tue, 01 Jul 2025 20:12:27 +0200, Álvaro Fernández Rojas wrote:
> Introduce yaml schema for Microchip emc2101 pwm fan controller with
> temperature monitoring.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> ---
>  .../bindings/hwmon/microchip,emc2101.yaml     | 79 +++++++++++++++++++
>  1 file changed, 79 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml
> 
>  v2: add missing properties.
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/microchip,emc2101.yaml: patternProperties: '^fan@0$' should not be valid under {'pattern': '^\\^[a-zA-Z0-9,\\-._#@]+\\$$'}
	hint: Fixed strings belong in 'properties', not 'patternProperties'
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250701181228.1196102-3-noltari@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

