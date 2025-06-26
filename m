Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A4925A2B3;
	Thu, 26 Jun 2025 20:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750971436; cv=none; b=U3mpVFoZTwTtbVpWM8TEtAwoKkwhzRBN13FJitqwSG4ooTq0WYLRnFS531HGr8swWghKtMaP2qT4BJpuBx3R7UIFBq4Yt22QZ9trRcmvG53vOsTAvOZnbizssiThWg1F+V6fKqBc2JJ+kL5NwURGeEuWNqqS5EvxPrtLc18QqFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750971436; c=relaxed/simple;
	bh=mvgwb75/wsqsPPpZl+CuS3VKj97ALV/tQGv34pfvXQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RV5VU2x/5oIh1OvIdy7lTXIh7F/4PaOCDY243eSM4x5Asrr7tVWpMGQlfC553hZEAKfLTuMPJu1ua9wRx2vnFk1TJxrpMvPOyJPJlKpBHu/dLez6ef0hWPdfdwT/AIkoOgBOxvqft0u1hkdDftFfRc7+t6FhOQq2VmnawIjnzoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jqrHnvde; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jqrHnvde"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C788AC4CEF1;
	Thu, 26 Jun 2025 20:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971436;
	bh=mvgwb75/wsqsPPpZl+CuS3VKj97ALV/tQGv34pfvXQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jqrHnvdezfQW8wKFy9GzDzKAi1KbMOEJdrb22EaRyR0+mS7gVywosk/VnV/MS4zsC
	 elCROPGNtlHObb2Mi3Bpr/1DPtEvCSiHVuptvGbIIZNn9C/GISJh2GKFLxV9/loWcL
	 DY9cF1Y3fAzrwHSLjvHRKecIwkheGBus/6XTISiaLnlOmeKj3ZbQtrO3d1Ue8V+aFe
	 G0q+Fk02MtZT6s4VQy/qxsvCehDcPaPyWN/NfvB7DuJR1B7sys9954ZY64al8kj60S
	 4dMrrcfqFMIlLtGM43pQrh9F4OgJnGCR4LHBTyx/aJrUwADItWA+/qIpoI6mueS52P
	 LOW1xSbj7+6aQ==
From: Vinod Koul <vkoul@kernel.org>
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com, 
 venkataprasad.potturu@amd.com, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250620102617.73437-1-Vijendar.Mukunda@amd.com>
References: <20250620102617.73437-1-Vijendar.Mukunda@amd.com>
Subject: Re: (subset) [PATCH 1/2] soundwire: amd: fix for clearing command
 status register
Message-Id: <175097143577.44160.142605369217423066.b4-ty@kernel.org>
Date: Thu, 26 Jun 2025 13:57:15 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Fri, 20 Jun 2025 15:55:19 +0530, Vijendar Mukunda wrote:
> To clear the valid result status, 1 should be written to
> ACP_SDW_IMM_CMD_STS register. Update the ACP_SW_IMM_CMD_STS register value
> as 1.
> 
> 

Applied, thanks!

[2/2] soundwire: amd: add check for status update registers
      commit: 72bbf6e866a7911aaa0b4d0e9bb03109c7c046f2

Best regards,
-- 
~Vinod


