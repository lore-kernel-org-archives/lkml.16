Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A271E7C03;
	Thu, 15 May 2025 21:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343296; cv=none; b=B65NtC/R1ueofqtv3DV8ghsnpcwDZjPgAc0ZMxWg0jBzt7gsGsLRf4wWtyaa36VNz0EIUXcoeUXJjqwk3UtgPUtYSSP6v+Zx2DhY5IC/tYJ5IF/ph10YjonTHaretOAmqU/ZDj6FcOVbUTCVHStxAhqIJU934aaL8ssWAxBynvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343296; c=relaxed/simple;
	bh=kOIuaXYXacOb8Nlq4Aidqtnio6EeKovLJb4GwnhdDkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XIV+3sW4yCIEgBr5+KRkdom3Jqrth0eYSHpVMkUseiDYEGUzYD4tsGhFbjxlN0daQneMvEokdl9vxfozyI/1H2skchuPeIVGz8n1s/Ik5XNm2x0RQSwkuS+ZlmVzKzzPfV9XFscU55YtbZ+iSuKmy7Q9H0za9PSbSon29jbdO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uyxZjUvw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uyxZjUvw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E78C4CEED;
	Thu, 15 May 2025 21:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747343296;
	bh=kOIuaXYXacOb8Nlq4Aidqtnio6EeKovLJb4GwnhdDkg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uyxZjUvw+s8+cf9Hp4pJCB5EmT5FhFo4CQp7qZcrf5bl55P8ip45XmUK+Vfaz7aaL
	 uGAKdMKnrRvt0lRlVZiaDXOHpXw5itSfgO5SVDXUYYyUc9lpN1jw/wwIWFwMwo1lJA
	 wzAYbQGmr1C9fakKoTNKYYJCEr+cAdKWZmRskPNTR+qmzDl8bU7p5C1ll3HhTI9xdP
	 rq1L/hn4g0jOYheoM/FSSRCaCY7SaGn0HZsEgT21bakaIx3NTyRlmKXZcCmphAOSgf
	 YIoXYLYgAYGFYGrvchtjp50IfOMGcskT+98IXeWDmXkxElb04SM0gxHZRMei0CdJte
	 Xi5we58V3Kzew==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
Date: Thu, 15 May 2025 22:08:02 +0100
Message-ID: <20250515-crank-tattle-746b52ee5821@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250424060605.638678-1-uwu@icenowy.me>
References: <20250424060605.638678-1-uwu@icenowy.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=481; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tvYL9sBfhLGwtirpWTpefPjcI+3N6MPtjEqajh06cuU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlq4Rv/7l5QdIPpR+dSk/cP5iw2F9G0+5+1/w3nGv63+ szrM8LYOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRG3sZGTa++HfbPfX571XF PM/XKJla+ylYXdaSCZbcVOdbKHPrhD8jw7VD4lcjzxucMRLfn9uSu3t/oaCRbP/Jr9r172q9JT8 9ZQEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 24 Apr 2025 14:06:05 +0800, Icenowy Zheng wrote:
> The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
> associated with starfive,jh7110-pinctrl .
> 
> Include the header file and use these names instead of raw numbers for
> defining MMC0 pinmux.
> 
> 
> [...]

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
      https://git.kernel.org/conor/c/71385a893cea

Thanks,
Conor.
