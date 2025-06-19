Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C2F2111;
	Thu, 19 Jun 2025 01:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750296436; cv=none; b=bqOzShgeDWAou8wxBDZ2mWNN4uluDWFgzm5vgq0dcoMMMSvMNRXpaL3JR1aDpa/JNDF9f4j0zxrVcW/UKweqh3sEOLPecOWyCxM9d/UcWSed+auguxEt8I0I4rwrUWMej89N1Wfo/jzPNnCFC9UZZWBGR0B2tZasXKQpoQc0VRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750296436; c=relaxed/simple;
	bh=uPWNZWLPGv6maWPRqXRFy+jIsQDBpiPtgQdX4cdh3Kg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=boLh1vsBMJxiYcBHadfgYac1dX1eaCIxWIAzukAaj1zOlev1wVQXIZFGLBSyFLoexHLXIk1XtQAYbapHCmdKeJEnUt6Q3eo27Gj2C2SMa5AUcRybEXlqfgonHE5b6XRYiAYnLx0AEQGpg+UGalfDQ13LxUC3WzK3/dH6f2xfCgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vc3bssTQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vc3bssTQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C09C4CEE7;
	Thu, 19 Jun 2025 01:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750296434;
	bh=uPWNZWLPGv6maWPRqXRFy+jIsQDBpiPtgQdX4cdh3Kg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Vc3bssTQGEK6RhsO6nUbqy0Gq8bDd7Bl0Gegb9PY8Sv+TIbRziFS3rQfa7xl+2K/8
	 JJ/VzYu9kgD/iZ2YZZDiYUeWBqoC1rKEQdf6xFhJ8J5ZCKTjv3fNtOfDyJ7qExr1He
	 0wEaS0WradsUsrrDKqPTJPtZi4lTvnKwJFUXmGgCAeDSQLI3TTUQFCtq7OqvXRsFGx
	 ewkX/AX0lAVliV7+Okig9kybp6tRWjKwxYEMojfjPUBWWjlLB2DheFaQd2Jv3m3rQb
	 nN7AGGmYOLqthmtOTRdeAx5NLfDZTS/ZT6ZqyAWiDPuZtjAbVqlKBKC6QajGFddOJz
	 QaohAm2Ula8Qw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250521004618.1791669-1-robh@kernel.org>
References: <20250521004618.1791669-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: Convert brcm,bcm53573-ilp to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Rob Herring (Arm) <robh@kernel.org>
Date: Wed, 18 Jun 2025 18:27:14 -0700
Message-ID: <175029643402.4372.11152938476071136465@lazor>
User-Agent: alot/0.11

Quoting Rob Herring (Arm) (2025-05-20 17:46:15)
> Convert the Broadcom BCM53573 ILP clock binding to DT schema format.
> It's a straight forward conversion.
>=20
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
