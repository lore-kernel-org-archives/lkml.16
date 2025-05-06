Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9321A427;
	Tue,  6 May 2025 08:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746520975; cv=none; b=IiSNkoauOXQdFPbpNMRVRM6UXmM9ir2IMZYfSonYeQRFvJWWTd3AZyXObtGqyfacp6e7zCIt+tJ2SmDE5gcMjlTddmBk2nf3Awj6VdYu6qLoWs9Y5zWIsHU5qMueQ9CtQMCWfUV6sTnmhzS6tG51YI4o6yRczfF/YZOwgKRuZgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746520975; c=relaxed/simple;
	bh=EMYhFFoARHbzfZzkwxynOmrqp7PVvZyw9myvGYU2tS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=NE+u/rM7CRedtG28H7bWFWwFKveElPH6xLcje+BCKXCCT09IhMBzk+WsLLXhrTCKG4Wt7S5MHzYxCQkabSk+FEKM/y6OE1ivOkNZAdr/G96a7bEti7sJLk1hidJWGyGQtf4eHGVQAv7ChP4qiP9Qzl5FgdM2hXzyp383uD59M2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ewqCs6aB; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ewqCs6aB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746520971;
	bh=EMYhFFoARHbzfZzkwxynOmrqp7PVvZyw9myvGYU2tS0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ewqCs6aBBMsq7wxQW6Eings7oKZ52Kgg//eTpYBL7BBLPZwNxRH94gISSRfocq9aq
	 QudggkamKSgpxeSv043iUV8Gxk5HEHPG9VIU3UvQeddW9PJKLEoC5nXQebe3Vb26dd
	 sgq+x42XTuSGhsgiOVTuiUZy3tZ4nbs/RxvGjmvJbg0IGFhKFRp4PayQmuLJ/n4LLa
	 lvjvQ2J1k/YcDgbb/uQ2E7RdkV54Ojx5JwK9Ks6U3guJSGchFZSvoQKPTPnZ9NQff8
	 UGbPnyYiGBS1YJfBsV1vBphRvKI5bYAtA8fj0/1rMDzLJpTxaP7w4rS80t+wKv2aMB
	 wTUD57GVCaSDQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0088D17E0B46;
	Tue,  6 May 2025 10:42:50 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
References: <20250502-mt6357-regulator-fixed-compatibles-removal-v1-1-a582c16743fe@collabora.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt6357: Drop regulator-fixed
 compatibles
Message-Id: <174652097090.119919.16240846809714782858.b4-ty@collabora.com>
Date: Tue, 06 May 2025 10:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Fri, 02 May 2025 11:32:10 -0400, Nícolas F. R. A. Prado wrote:
> Some of the regulators in the MT6357 PMIC dtsi have compatible set to
> regulator-fixed, even though they don't serve any purpose: all those
> regulators are handled as a whole by the mt6357-regulator driver. In
> fact this is the only dtsi in this family of chips where this is the
> case: mt6359 and mt6358 don't have any such compatibles.
> 
> A side-effect caused by this is that the DT kselftest, which is supposed
> to identify nodes with compatibles that can be probed, but haven't,
> shows these nodes as failures.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: dts: mediatek: mt6357: Drop regulator-fixed compatibles
      commit: d77e89b7b03fb945b4353f2dcc4a70b34baa7bcb

Cheers,
Angelo


