Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E4E2528F9;
	Mon, 10 Feb 2025 19:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739214123; cv=none; b=baEh4wDl+iejZR2yjUC0d9nXX+jeZIENAjeIGgC7op1SsGlevd/43/Oji6i72mXo/fghjJDCbjsTDnDZDOJGacJAz1Ewa2i/8KoR5sohvabolMBon5NDMQnVvJCtLJe5oSsJjJ5q1B3nqdKimCAJwNjGGrYQRJsmneMz22CKFLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739214123; c=relaxed/simple;
	bh=sAZdVDmiaTRCmf0IkBkoDIET23qGjuT0YLtH52rbHCM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dNJ6E5SDjvzMkdAVpl3QsPwy2fq3S/XzmW4TuD5Ofu19GHsxDyGm5J/9GmTEf7BNJ60gVmg/31/Biwl7ifzcXISS0jyabeWVHpxhRrSc1A9sFomFyEmcLLC1en9kxKdNCD9F5jdYiQgfpi165KHT4jHDxUsY3V/ReXQ5BxR/FyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAnUmeTF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAnUmeTF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC53C4CEE7;
	Mon, 10 Feb 2025 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739214122;
	bh=sAZdVDmiaTRCmf0IkBkoDIET23qGjuT0YLtH52rbHCM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nAnUmeTFiU6ixy3ne98p3ltY8J67kZYDYf7GxxSUyxc9t/0tSHyb6kiSxFMsXnzjw
	 NP3Eej3h8PdWIuJds+q/ZP9nULBtap26iAaDYAeuBKjhK5V9VUBkr2HBOfB6Fo86hv
	 5P5baPok3mPbVHZpCuKICt5LFWmCopGtr2pJkGRN7bVxcIydl0ItxQKwPZNwXWf/U5
	 IPqVGSfoEAgI4KBb+zNiHNeH38S7I57+9Fdxg6ryuUmskLaRqwXLcNpSkFBksKhFXd
	 riDH+YNcdkbOW0KemAfzc9mcsPgXRIFd576eLkAgWNCgF4jLtV7c86qA2mm9RDjO6k
	 u5daQHxPkMkVg==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org,
	kernel@esmil.dk,
	robh@kernel.org,
	krzk+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shengyu Qu <wiagn233@outlook.com>
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: Unify regulator naming scheme
Date: Mon, 10 Feb 2025 19:01:51 +0000
Message-ID: <20250210-banish-eternity-b1168fe47047@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To:  <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
References:  <TYCPR01MB8437F6FCD14E116B6CBBA09098F72@TYCPR01MB8437.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=439; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UQw5Egv0d2/v0E8mm1dyXKsG5bGJ9j9WfOpRO6obpLo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmrfOUPeSh9klCyOr246lWt37zkyQ5Vt/7M9xFb55GTM 0PfnPN8RykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbSco3hn/2r7w88Km0FSxtf PavlUH32/0uk6pa6DA/GrXPP3zSp8mRkOPujT/o4D0NFzV197YUPS5Ni1lheKmqbVHe/pGjCB46 /nAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 06 Feb 2025 01:16:35 +0800, Shengyu Qu wrote:
> Currently, there are 3 regulators defined in JH7110's common device tree,
> but regulator names are mixed with "-" and "_". So unify them to "_",
> which is more often to be seen in other dts files.
> 
> 

Applied to riscv-dt-for-next, thanks!

[1/1] riscv: dts: starfive: Unify regulator naming scheme
      https://git.kernel.org/conor/c/6b47db27468c

Thanks,
Conor.
