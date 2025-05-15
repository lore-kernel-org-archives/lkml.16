Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BB01E7C03;
	Thu, 15 May 2025 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747343292; cv=none; b=kB34Rs3ZSTTyeSNzQdhTx/nvZkejFWmndM7jJigphKeExKREqlcOavoIvlIx8slJHcBrffiU8yRTdtU9J6pSzgFfpoRgQqWk+MIm0+LPIswe8FNhSw0IkrErbn7KFASu6K/+y2P4DFHAq8kQi9SyU3Z9c5epoiSkXDyHTKKpzKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747343292; c=relaxed/simple;
	bh=IqTyQ8OFnHGPivZLHwcSRdaS0hb6ABGECTq+fFAd/zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W75iaaRgF5H+3DC4ynuuPkgLQnPtlZkTd+eEbnGPojdZy77tZ7YVdUtq0ZlZkt3XH2wDVm9vvncLncaAO0VvytkdqHgwz/13UBg1yWfqorGb2QAVlxlS+G7IC5g0vRd5xVKTbj4Fmdm7/I7okec4XGwRrw9rR8mH+r4q/YNLZC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaEKHhlw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaEKHhlw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88BA1C4CEED;
	Thu, 15 May 2025 21:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747343292;
	bh=IqTyQ8OFnHGPivZLHwcSRdaS0hb6ABGECTq+fFAd/zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaEKHhlwrKyCFlQtp+o14h4ZsNzcnjzI2Nv/n9UCTCasvdkjn/FNmMEKKcO+CBDWm
	 s4tKgXj82rkKlE4gNDCs/Wnp75RONlR7MJvy0ECQ7Uo6e8JCArF7/s+ncHdiOEGZ2j
	 EALGGV5EI7TpU40IIpBMmcIgnzPa8DNYFlty8AC/nkB6OHpGxlB/OZDWvIvWlVlEOQ
	 mXhMfhIhroKvI3doFheZ9lXZ1pg2t8raB342brzPFD4g5nue5B5KJXsFO3YJj8NLvt
	 CqoCpbdxm0eaVtotG4zbFCuHrvuhBRVHO/LkABVd7AVqPqAv7HWlNuaXMLlmnu/PPA
	 dazwtzdUdYB3A==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Maud Spierings <maud_spierings@hotmail.com>
Subject: Re: [PATCH v2 RESEND] riscv: dts: starfive: fml13v01: enable USB 3.0 port
Date: Thu, 15 May 2025 22:08:01 +0100
Message-ID: <20250515-refusing-deranged-2c601f50992e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
References: <20250324020958.2235802-1-sandie.cao@deepcomputing.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=340; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MPiun3zRpy2NvzGhrx8iv30vxT26QO3dE3Sh06BSVjI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDBlq4RtbV2z5cYHjK4OPwRZtldMPTfZXtzyNklz20Cm96 Vy0dOLsjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkyVqGfxY7+a+YP52XLv38 7va5soe+pXDGhVkLxp2Y9fn+1tPRbI0MfyWfP59QMjc6Pcr40enNbQs+vQ0wWNMga/vnfrtNB1/ OW34A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Mon, 24 Mar 2025 10:09:58 +0800, Sandie Cao wrote:
> Add usb_cdns3 and usb0_pins configuration to support super speed USB
> device on the FML13V01 board.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: fml13v01: enable USB 3.0 port
      https://git.kernel.org/conor/c/a2e7f6c48740

Thanks,
Conor.
