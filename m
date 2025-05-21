Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9460B230268;
	Wed, 21 May 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747818315; cv=none; b=WnC6BKPGwwSWHGULHT8Fq1PbIvxnYn1yuF46IrQkZXXFbyHr/XNLxbz49UJy4QfWbAFUy/Ui0MQ0cqexdmc7LaOs0VnRjDHtV466HnXsIgZTnqqtF/4fS6xVmEjZiXfu2+jM5+Guoer8koLru69jT0KNH5q641M241vGip7jBxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747818315; c=relaxed/simple;
	bh=mmqUXpMc6TlkAa2xMaHSr9ct20LHhndHE4Eb2UUfBzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSALmZ3tWHdb8jXO30LCKXypNX1j10mqIPaxHCDkOBhq7GxNbYPPO3eZ+46eyIVOmXVOrQezRb5fwseQjUbunRS1Q0UvABhMHCrTZjOeJR8e+m8Emt4Vt5jerWEtrssuISe0jKofaeLk8HSuYYI52NYkMPyqa6nC4kEbO4atA4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q2+GyFMd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q2+GyFMd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A326AC4CEE4;
	Wed, 21 May 2025 09:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747818315;
	bh=mmqUXpMc6TlkAa2xMaHSr9ct20LHhndHE4Eb2UUfBzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q2+GyFMdiogbhO42/5OOkH40tI5wvQI9T06584b2BHrNgHlQmUkYiLgBZIF7Xiz0M
	 QJsve4Q10lDnn4j3l8as/pVpQ/E20ULk5JXcrve37azofc+3a2Tczi7o83Qyt2dTQd
	 71JIsoNoo8Jw1AJ7UgFZj8XGUTWypzyfT4oOCorE4ByJWtRsV3jRtd1YkcclTuZPKH
	 URhZRdN9UG1N5bjYLbDAcx/iSm7cx+9u97T28G0JR/M7VCewzOj3TJ/dNqLZLMXtZy
	 zv/k26YX40CeNEBhi7ng7rI2qnJvaor4fiO7Ke0q9KK1hIhBxPMZ1SbbDgTHb0SIbv
	 hC2weHWwOXQww==
Date: Wed, 21 May 2025 11:05:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Han Gao <rabenda.cn@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Guo Ren <guoren@kernel.org>, Chao Wei <chao.wei@sophgo.com>, 
	sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0
 board device tree
Message-ID: <20250521-cream-pogona-of-awe-b61cf4@kuoka>
References: <cover.1747231254.git.rabenda.cn@gmail.com>
 <53a9a794641af697be9170e6d0af464a39d862ae.1747231254.git.rabenda.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <53a9a794641af697be9170e6d0af464a39d862ae.1747231254.git.rabenda.cn@gmail.com>

On Wed, May 14, 2025 at 10:09:02PM GMT, Han Gao wrote:
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
> +/ {

Why do you have two root nodes in a file? That's not the expected
syntax. Really odd/unusal.

Best regards,
Krzysztof

