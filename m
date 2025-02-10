Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAB324FC04;
	Mon, 10 Feb 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739208072; cv=none; b=LZilwnB1xy98Fnb8FPNEnnlVxPTTrOLIsCFPOc/o+tQsUOEHrzOekf8UopXqgNW5daoXYA6S3xxFkHx1S0r7wA+SLp5vsGfqSZwIDdJmctAlRUKo1HFJIu6eei1kpT0pgLsMESDYBxrgtXkOo7DyTf8gar43wnm8QwXgGmDzCF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739208072; c=relaxed/simple;
	bh=Te1ASZCrXYWhGODjGnTL88h0vOAiRncqdlFEVsLJEls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fVMAbzDSnYqjV2YLwbSdTkCi7J/QtdPgkSpQ6VBnlOCeyTXv3TRopSKY80FqxcodUHHPRQPTQ+6w+/4JV7YAZ8nOMBKZmNY1U1yfkqrOdHves+e0l87nmpGoUDk/CY/gBCQxq2K5R26CVT5GsRGRXdLD5i8+n/teX9vTqCYyktI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jRIZikI1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jRIZikI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E37B0C4CEE5;
	Mon, 10 Feb 2025 17:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739208070;
	bh=Te1ASZCrXYWhGODjGnTL88h0vOAiRncqdlFEVsLJEls=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jRIZikI1TNUJfOg9Se1X7UpyDvEX9kKyqQmdoxi1Tz4lLlWI2RRcF/1/KW9dmfXzr
	 xcyFAbYPTVhAEt32mlwaPFEBjFnxE7xaENgHHMVV+cX1IC8oanKdslqtJ3cZNfnxYV
	 SCF5HHDBfy2MPPnsLTKJwBriZh41J6JvnGRl9XoC1oSQpilXmXEZcQAOaH3zpXuoga
	 r+jcNZM1BxVyFSyBsIvhPNhENIg7mo9zLLEpMOp8cchGRmf86crlDBuYkCN9ap7PoS
	 GqzDGdv6b0eqPt1yIBASoORvCQhxzBhJiAWokxtTmOrwXKmmXmOfam8Tsd3+AaqS98
	 ERb2RX07Y35tw==
From: Vinod Koul <vkoul@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, heiko@sntech.de, kishon@kernel.org, 
 krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20241231092721.252405-1-andyshrk@163.com>
References: <20241231092721.252405-1-andyshrk@163.com>
Subject: Re: (subset) [PATCH v3] dt-bindings: phy: Add rk3576 hdptx phy
Message-Id: <173920806650.103786.12015599140060722097.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 22:51:06 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 31 Dec 2024 17:27:11 +0800, Andy Yan wrote:
> Add compatible for the HDPTX PHY on rk3576, which is compatible with
> rk3588, but without rst_phy/rst_ropll/rst_lcpll.
> 
> In fact, these three reset lines are also optional on the rk3588,
> they just used for debug, then they were removed on the rk3576 IC
> design.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: phy: Add rk3576 hdptx phy
      commit: ad205ffc0dd0fc3f4841e6ae900037f029aa0fa8

Best regards,
-- 
~Vinod


