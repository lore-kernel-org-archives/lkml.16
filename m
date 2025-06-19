Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0671A3174;
	Thu, 19 Jun 2025 01:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297197; cv=none; b=ta1i9MC095OaX2nAUChHyFbrK/CMCO/tyXpU5w9jmgvlkBsQZZRE1KWPSHvUMiZQOPFU97etDF+VOm7odq4ktObsmLodfBUZxQMJXnmevzNsEpvBgDa1Go+Vb+Av/AH0kk6zlU5RSE13G4S4gXdgK3wmsXHwdxz2hTZDgiT+4KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297197; c=relaxed/simple;
	bh=p/ZuUMOoZT1PBRD5ieb2s3lfcZl5ITj4+BiQYtiFZ9U=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=fEen5+fBcant7cjB3W9fDzABmGEFJc9gmBpC99w9Ri/W7QEPpFSE0rjmRU8ESjD5Y6B+iLbGtDYVjerP+GNoWBIQ+lVrfaPt+O4CBi1wdAx9dHweVlIJAuBdSpNMn+hppUSk2pq8P/bXx6LG8gHhgaGNJknbpNpzU5Zvt3oivc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QN2J5AeO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QN2J5AeO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFBF9C4CEE7;
	Thu, 19 Jun 2025 01:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297197;
	bh=p/ZuUMOoZT1PBRD5ieb2s3lfcZl5ITj4+BiQYtiFZ9U=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QN2J5AeOoOJTHOUFquBJjEbPwxghbLjxO4iZLnChwNwyutPs5KechcN5PTxeNysiF
	 7sMceW2n4FLk8W4ozTGsKFnDN/GcgNFPW5veO66Rs+mHVJ8RZqZyG0LnyFx8O0TG2X
	 bJdDCvMuwxrewTPIDw0ux+NgLPPffM/3FW1TbeyzxHwLhppOZuXkW1ioKJ/FNMOF9/
	 cJN2+QgYm8eOV56gzzTA4WRzlvC08JiTWcmpDCuaASOXB1Hu7tmAtwXm1BPCRLxrKv
	 ZnEHDXTjKk0RdpqL6IQONYKPCGpBUD6ZNosv1luZTaozkAjqN3VIRJL7wbNcM+qzw5
	 HO8Fb1T5GbRdg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521210741.60467-1-robh@kernel.org>
References: <20250521210741.60467-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert lsi,axm5516-clks to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Anders Berg <anders.berg@lsi.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:39:56 -0700
Message-ID: <175029719620.4372.15420645716466389185@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:07:40)
> Convert the Intel/LSI AXM5516 clock binding to DT schema format. It's
> a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
