Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE84A277818;
	Wed, 14 May 2025 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222648; cv=none; b=QbZ1VPwEeC9Kw7Vacj1NoZHQ4GXxNVfXka9irpoSBSR4P2asNxua8JfhYWaruf1oYmgqsfgcCAp2oLY9rTZLsPb+JNzOo7XgPaMhEBnHccOZsjuTBtYdEgW+9kj3RaJv1GbyUsZUGBfFx6Xum+GTmJ7CfmVk9EznC1RdahtqpCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222648; c=relaxed/simple;
	bh=QBZg9ajvmrl3SpUn5aZzbOp5nzqEVoNIB4YA06ESVQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OWXaJTpXTHLmRH7Ja5GP8k+Z4Lq1qXjhBwlrwW0K2j7c9+KG+K2V8gICqrERpDt01Skjk2y7zNgVgZrpiE05HFmDVN7NJSGkZcSlxBGAsPGZtfj6bhTHvzzOR5Jh4kh367b7gAQ1fP6alMa3EF1nD7aOVjy5KBKYYtraKodSd9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7WeLSqN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7WeLSqN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF1FC4CEEB;
	Wed, 14 May 2025 11:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222648;
	bh=QBZg9ajvmrl3SpUn5aZzbOp5nzqEVoNIB4YA06ESVQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=T7WeLSqNOdHzt4AbmZhuc1tD0i4CAtVNQ8HjgGVnFn7UGSdetiaAcZ691NtRjOoPc
	 /OKootVEK0361QHSVwDGD812DW865qfS7q6iaqhC6EAxjBGNMEO6Zj04eMaHtNU0B+
	 hpULSQAyeOrWdwHfRxumHrefUABj54bXRw7rnFozYHN1WIsTp2tPTAb+kCASImYKhU
	 GWCJve/M6LPq8K/VtNlm2klNY5lnPIf+LWAR+FbeoxXs29NfTirR8sc7RBZpHlqKFh
	 6vzTu454sK4z9f2FuXE/cMbBA+je/4VA6aEr4oYMbyBvNbSwXBV9NpA3NBIe/ucp4/
	 x6eZeyxIcKQlg==
From: Vinod Koul <vkoul@kernel.org>
To: chunfeng.yun@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, chunkuang.hu@kernel.org, 
 p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
References: <20250416120220.147798-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 1/2] dt-bindings: phy: mediatek,dsi-phy: Add support
 for MT6893
Message-Id: <174722264485.85510.16108514718041133697.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:37:24 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 16 Apr 2025 14:02:19 +0200, AngeloGioacchino Del Regno wrote:
> Add support for the MediaTek Dimensity 1200 (MT6893) SoC: the DSI
> PHY found in this chip is fully compatible with the one found in
> the MT8183 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: mediatek,dsi-phy: Add support for MT6893
      commit: fe750a871d90e081c52ce1988e1fbc85576152a3
[2/2] dt-bindings: phy: mediatek,tphy: Add support for MT6893
      commit: 1b1e949924fb59e98d9401681b139e92e75686ac

Best regards,
-- 
~Vinod


