Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B39D67083C;
	Thu, 19 Jun 2025 01:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297021; cv=none; b=RdVuJIsjAbEGcxVeB/Mj6a8P1fFqLyJVbMJpCBt9auekqAykI8QPQuEJCwbG1oR9sor4v/fhJSK9r345f1TgKt2FZMvVKGM6tZF8aqsb2aC8uI08wWOCmhFnoIHLwp+s2JyXOtlxmuKJUaq7E5g/Zt/HPuhs+JFZ3+WwsxMWhuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297021; c=relaxed/simple;
	bh=Qn2xM0RNFoqruwMHikYXZx6tN/u9+X03naz73G6vODk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oMc6UJ+c2Kw/nHXDwJYsK3ytCKSECjBO7LfjMD8VnF+I5RnwYSlzKxiLKX82DPWeQXDJc5RqjRQ0F2QV2RIQg3zHMBVo4mSPsBrcH0PT1o0XjNhGMojfZy2Gc6F/4X7uffXpLtjx2HDxqlDwwJFKUdSLw0UodgMTbLUCfPUYfRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jSV2q5m/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSV2q5m/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDD1C4CEE7;
	Thu, 19 Jun 2025 01:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297021;
	bh=Qn2xM0RNFoqruwMHikYXZx6tN/u9+X03naz73G6vODk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=jSV2q5m/txdTauwg0C/mBRkgveCdeD11PUihKfFqXmVsGYAZ8mDfJdJQnvhhIgOHC
	 RFocWkLqFvut/HHMSn92bQgDiZiGIHJ3iuSEDBbK2rEW72JpSELBJAoAMDJ6PcrhmH
	 gJmjGrE8ko/Qu25Rw5dfo/SYzB6jLUvyaB0+BsgWK74zF6TbP/rlq1ZLsOpdAn8kcz
	 YWCH/GvBoG461hZIsKNofmjfEDkIuO4tD4z8fX25tSPNeurOYLbNpicWBS0CUq7fja
	 8sXqCfxdE+x46c4iZPPmi7HPYecsDyFvrgMrTwG/N+vdoyxWJXH+anDFohLdbXvCH8
	 YRfYcfAE7h5sw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004923.1795927-1-robh@kernel.org>
References: <20250521004923.1795927-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert cirrus,ep7209-clk to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Alexander Shiyan <shc_work@mail.ru>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:37:00 -0700
Message-ID: <175029702032.4372.6033734884205316943@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-20 17:49:22)
> Convert the Cirrus EP7xxx (aka CLPS711x) binding to DT schema format.
> It's a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
