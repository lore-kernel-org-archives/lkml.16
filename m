Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD85360;
	Fri,  4 Jul 2025 00:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751587916; cv=none; b=l4NGDUi49EUltWh6kd8bIbO54CL7Fi6NjQ78iD8V5FT3v4rf2SV9Xj4x7P4bJuEG+cMkzuhVZOMWOcAYsOi/Fac7XA4x2w1VI0KnwlPHMSGjVvAUeLcOlE1irreHuGvb1ECk/eVztW6sxendNaOKP7EVo2wxmApPD4yIc4VV8/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751587916; c=relaxed/simple;
	bh=vRae16FTMewFnY4A+z3eMOBzVPHBvIAgsebZ5Q3YlCg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uIqw8L//YGXnEGyg2Y0hzHNisXJi18+IAeASm5mD7Z18L+cnr/ozKxmDC9uN7l05gj8p/QlBXCdkjmQPwjvGGDh+4f1sahzYZx1yXZXRXXYyttAFURVKf48O9K5dX8yzgJjBAQxN8oskEadN4tf0ESwSPoGFdDdAwNVYI+o99u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=XeyBwjIM; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="XeyBwjIM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751587913;
	bh=vRae16FTMewFnY4A+z3eMOBzVPHBvIAgsebZ5Q3YlCg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XeyBwjIMtpLKcmGrtMZ/p6veE7enBFfIx18cUA84QVUnc3r7+KVvnP460pGyRB7Lk
	 fMJQc5WaHrrq7Iuym6bElVh7D+OWhkBVfOywVr61lhmlErWAUPZZZIRsYwjmFk2nq6
	 cdn0uXeYgQvp5oYXwM0j5MlaDHoSZxj7o85AeYJWSWhFzl61fSls/yT3B0fUfgUTv7
	 ZaD6Bf0+6z6CxWov480SlKUpL3V9msSQqoCMoEMwivfplSMEegPQ2ShA0AWew7xGhU
	 hApgTFQZijidnuAvWx93Wdn0n1G7Cr+se8Vc4N+4fEqC6rIa5frvi15iIiT4SOS7Ga
	 EYSuTjqpko4oQ==
Received: from [192.168.68.112] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 4065E6A680;
	Fri,  4 Jul 2025 08:11:52 +0800 (AWST)
Message-ID: <0782e276f6e22a2f590eb905ef2c5617f0870b63.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 1/2] dt-bindings: mailbox: Add ASPEED AST2700 series
 SoC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jammy Huang <jammy_huang@aspeedtech.com>, jassisinghbrar@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, joel@jms.id.au, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Jul 2025 09:41:51 +0930
In-Reply-To: <20250702011956.47479-2-jammy_huang@aspeedtech.com>
References: <20250702011956.47479-1-jammy_huang@aspeedtech.com>
	 <20250702011956.47479-2-jammy_huang@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-07-02 at 09:19 +0800, Jammy Huang wrote:
> Introduce the mailbox module for AST27XX series SoC, which is responsible
> for interchanging messages between asymmetric processors.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
