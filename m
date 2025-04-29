Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E7E624C098;
	Tue, 29 Apr 2025 20:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745960261; cv=none; b=X8RNMtYZXLnbPhN5XzINhWtHW8mQoL98/CU1mEPNeC/0E4H0askM52foOHoVK/cZ5oNGLtC+0/0PaefVkZUg0NgnStsKByrrUTxwcPB0pLqfyumObatceRyEPkgW8/VbLe411zQWiYqp1N/uZ/mOmeJI2doPNRMndHia+gFtoFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745960261; c=relaxed/simple;
	bh=Xesn+Je5Mt5M9tVGSEAzD09xDZ28m9HFOwV5V5cEVbE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=rIsBtqeIcPxcYur/BAdfx6wExLUU4AHKcD9fN3m+BVvXRpg3L9Wubmv2kqlpMfm39TutmayH+YFusYsBeJU2suotIit7CSyafxe6oAsFouoNkKfCu3iCMmzaRsFKzwS02SM4sZ4Op+SimyWdJvSzPFtgHWY1xHxmyfwSp9p7VtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSVJ+YKM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSVJ+YKM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0AFC4CEE3;
	Tue, 29 Apr 2025 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745960261;
	bh=Xesn+Je5Mt5M9tVGSEAzD09xDZ28m9HFOwV5V5cEVbE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QSVJ+YKMOMuDSL7SK/i5TlUDSXmlvBk74EFl+c9cIdXMvyHk+rxzmIz0XXVuLV/Re
	 ZTb9Bi46psT00+U169beL/akE6eMtR7+YzZx810G5s9CitkVCP4pHbSmlcTdkZFnFb
	 2EAubpdSgSyPLmkrSBeWnSrjhbFdUvHyhv9kAgcKirx3pqRp0r27esKIEfOWAtRAJz
	 U6sgLQhQAr1QaB/4eVOElcHin4l+auf5ND6JNnGbVZ/gxVDAAwkHAYKCEUKcgT/Mv/
	 GslXYN87cvR/zVoAi5/C7MbLmAwDIkVjRF91fCP44P6QvHKCRmjxDg7qRTKOEVr2yY
	 J1Va3OXpW15nw==
Message-ID: <95c672f35d6e5e1ac91feaa5628cf4fe@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250421134218-GYA42923@gentoo>
References: <20250418145401.2603648-1-elder@riscstar.com> <20250421134218-GYA42923@gentoo>
Subject: Re: [PATCH v5 0/7] clk: spacemit: add K1 reset support
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Date: Tue, 29 Apr 2025 13:57:39 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Yixun Lan (2025-04-21 06:42:18)
> Hi Alex,
>   I'm good with this version, but would wait a few more days for
> people to comment before taking them..
>=20
> Hi Philipp,
>   Since these reset patches [3, 4, 6] are sitting on top of clk driver,
> I'd assume you're ok with taking them through clk tree? I'd plan to queue
> them for 6.16.. if yes, would you be able to give an ACK? I'd appreciate!
>=20

No. Please put the reset driver in drivers/reset to get proper review
from reset maintainers. Use the auxiliary bus to do that when the device
is both a clk and reset controller.
