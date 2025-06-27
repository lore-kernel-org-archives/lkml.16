Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B6AC8EB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750985226; cv=none; b=UC88/jCKocnf9RokgxSdDnyBOMfqrlPAGcfjU6PBL0t5QrqSESUK2NMHqrkjXAk2+h2nUdg/rUoOMB+uVNB6JekT81RO/oXEaUTijTrL6cyAUkmwOErpGByjdNqo2hRNNlKCrJ2JiWPNvzCGQsMxxOnd8cTZYuMps6dk/bf/ZdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750985226; c=relaxed/simple;
	bh=ZtbMVXVDyJuNabjsn9GAikjD6kRMnBKFTKPjsU9bxic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GO0EaUbJKkQHByWIh3QevRO+pbN0UJ2mmP0lpwzvENWBke7jgSibV+YZeTKQkfrxZOZc18xMv/KHABGfjfolyJUG452pjMCwxRCZfklKmFRdtHiMO0nFp7/AzxGxcxrcOr5/ek9/I+52JfTxQIv2oVWa5uCMKN0nyK2d2oj76LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwM3Zca8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwM3Zca8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F85C4CEF1;
	Fri, 27 Jun 2025 00:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750985226;
	bh=ZtbMVXVDyJuNabjsn9GAikjD6kRMnBKFTKPjsU9bxic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KwM3Zca87D8YC8RYnQQAXmO4P4WUhczmBEkE81x3UuHm++NNVBLHOMqOhZTcWnJkB
	 6/N4Ow5XOzeiL+XhAkIy8KJFCJiW8lbLVq5KCeBIo63s1p/EZSywspP6Jm203wzAwj
	 Kdy0tgCKybwASUAzaBA96uqmXCt9rEob3EXoeMvOPTw0DpALAOsqU2NA/6BiLfHVMm
	 tBwNOQSf7hs2VU+2F1iIx4AyCon+CDiMVpPN+sLRmNNKgVJSCurCjgIRSFi9eBDvt/
	 BruKzSvs3p3JPG7VL9Ei96/6WyYpJEPbLHj0v3VcgMF55yogREO0rXM6jBqHggx3xD
	 K4dPmIl7zQK0g==
From: Vinod Koul <vkoul@kernel.org>
To: chunfeng.yun@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: kishon@kernel.org, matthias.bgg@gmail.com, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
References: <20250623120315.109881-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v1 0/2] MediaTek TPHY Cleanups
Message-Id: <175098522610.106297.547358788124214801.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 17:47:06 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Mon, 23 Jun 2025 14:03:13 +0200, AngeloGioacchino Del Regno wrote:
> While doing my usual round of cleanups, I've found some room for
> improvement in the MediaTek T-PHY driver. This series performs some
> cleanups on that.
> 
> AngeloGioacchino Del Regno (2):
>   phy: mediatek: tphy: Clarify and add kerneldoc to mtk_phy_pdata
>   phy: mediatek: tphy: Cleanup and document slew calibration
> 
> [...]

Applied, thanks!

[1/2] phy: mediatek: tphy: Clarify and add kerneldoc to mtk_phy_pdata
      commit: 9cc82c2498b4fac77fb2438080458e42c1d0d5cb
[2/2] phy: mediatek: tphy: Cleanup and document slew calibration
      commit: d6306fc5d77b7cbdf75a90159f58ebb84ae6f02a

Best regards,
-- 
~Vinod


