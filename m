Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CC421858A;
	Thu, 27 Mar 2025 14:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743085648; cv=none; b=LgzaNmGt+IAZF0VJGi0pO52YvLxGULWq1r1u3pWYrbbBr3K0zAy2trOjzTncZPdDibwJs1hvJZiydBZ9VObJ4i87yTuozk1gJC13BznGxq56IRaahTJigbgjmejgqooeoQmu7qZjN7Ao6ggV204n/SP2MvuT1VXUexGtzcVXN50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743085648; c=relaxed/simple;
	bh=PHCtWk2ujBixo9IvPmi6q3vmA3r7w6UW4s2qw+/aOKI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=u/WnOduzucT7DOHIfDAsZ8QxYYWtFdG9zvJ1rcSJFSycp68dWkRYGxgtwGavYx8FjMz5T9049JwemSIpgtpDKYUbvvRkax9BYj5jizaIJmoXNCYkC7LKy/2+J9spjB9qo1E5bIr7aUQPkyiMHq+ZaaVa8EENKQmEJh0MG7ydfh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WH5bLeyY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WH5bLeyY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA91C4CEE8;
	Thu, 27 Mar 2025 14:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743085647;
	bh=PHCtWk2ujBixo9IvPmi6q3vmA3r7w6UW4s2qw+/aOKI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WH5bLeyYejpQfYXXDzOiCSxKnk5iMRHvuy3xImI7mNxU1PZaahP4bZNgHqYhnzN5h
	 9b593HZ86bRvjkIOlj7WNhEZ1YRC16twAPNAE1mkWYmtuBvHCTuo63Uejwa7tklIzj
	 /G9TZ/HC2BUVn3jeYAhRUdYes2woGmKEbQqcadWPgsI8X87TOHsj34vskpCDiimyNa
	 UmaU1MT5T3HxIAv8iQNaeBvaHQ/ZLp0fFPwkprY1Xm/lWGXa1fAya05u4qKiWziDy9
	 OlGl3rX7Y7j1TYKFlAHNVRye+iFuB1mAyG17/ewDUrvm5fYyzgHuI7NYB8OOA/nws6
	 kprtWqXfj5fTw==
Date: Thu, 27 Mar 2025 09:27:26 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: christophe.jaillet@wanadoo.fr, linux@roeck-us.net, 
 Jonathan Corbet <corbet@lwn.net>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
 devicetree@vger.kernel.org
To: Wenliang Yan <wenliang202407@163.com>
In-Reply-To: <20250327131841.15013-5-wenliang202407@163.com>
References: <20250327131841.15013-1-wenliang202407@163.com>
 <20250327131841.15013-5-wenliang202407@163.com>
Message-Id: <174308564652.728326.9393437187243408438.robh@kernel.org>
Subject: Re: [PATCH v6 4/4] dt-bindings:Add SQ52206 to ina2xx devicetree
 bindings


On Thu, 27 Mar 2025 09:18:41 -0400, Wenliang Yan wrote:
> Add the sq52206 compatible to the ina2xx.yaml
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
> 
> Add the meaning of 'shunt-gain' in SQ52206.
> 
> v5->v6:add content to meet the update requirements of the ina2xx.yaml
> 
>  Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml: allOf:1:if:properties:compatible:contains:enum: ['silergy,sy24655', 'silergy,sy24655', 'ti,ina209', 'ti,ina219', 'ti,ina220', 'ti,ina226', 'ti,ina230', 'ti,ina231', 'ti,ina237', 'ti,ina238', 'ti,ina260'] has non-unique elements
	hint: "enum" must be an array of either integers or strings
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250327131841.15013-5-wenliang202407@163.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

