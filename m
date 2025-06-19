Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FD91A0BFA;
	Thu, 19 Jun 2025 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750297272; cv=none; b=ZImLf9Y7l0bXdzLt2xUHHV8eMS2Bu5WuCayO+fXy+WHNQtIbxs52s8tRLuVr8Zuy+eOn/8YIfosbEhp/s6q1eL3jr0mxbUxq2pE2dxrwfw1VWe2V74BoXrAQUYt1NjJqUcY9xgQd43uwewLQrkUejklg+gx0c2f1Q2ordVSfJ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750297272; c=relaxed/simple;
	bh=elO6GBfAZb9GNpoFweQVO76vKG3BzDoku9MSSNMoJWU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=JFtsTywcwCXXf1NEDOMwQ2qE/fh/Q1iYvLutNT7IAPE6RfXlTUQZ7kkaRzP4/Iec4VcYyu70YKHE63nd1fWrhvl2FW/2zgL7S2IxrG76VwWy7Pm9C7pYHDcK2gVY0ltLD7JOcLAPEh45fYhfUtRGC5MwQ5D4YC48Qq+MAGJGBzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poysL45Y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poysL45Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57FCEC4CEE7;
	Thu, 19 Jun 2025 01:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750297272;
	bh=elO6GBfAZb9GNpoFweQVO76vKG3BzDoku9MSSNMoJWU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=poysL45YdXVqrtJS/d9S1zAtzjQPUwjkm9Ami8syRh1ynV7K9XySrEWSQVsNFMd+z
	 nMkyaUadyq1KpxVAwxu5R7lXaFTFxdESbHQnViRnsL4EkjIIVBHxowFqMHRmEqluWI
	 o8XsazU6Wh4dOtRCvgIwo7n5AMuvb+7WLr8/4PNbroSVRV3Re2zzQ55PvsrpquHTpO
	 9ARE7kUSvhGUlnl0VSPFvonhxuql8enAgkUixWSh2Pdn/t79AZK7izaHnYQU/vUsmd
	 q924viwTgAHR43CgvzQIBQY9IiEhHfVxzUyBXGiLQ6f1vydrJIgCOFd4af+6pMkmnr
	 MruLpKaTCznNw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521210839.62409-1-robh@kernel.org>
References: <20250521210839.62409-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert marvell,berlin2-clk to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:41:11 -0700
Message-ID: <175029727157.4372.6208847800128635304@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-21 14:08:37)
> Convert the Marvell Berlin2 clock binding to DT schema format. It's a
> straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
