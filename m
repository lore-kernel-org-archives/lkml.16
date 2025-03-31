Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA00B673;
	Mon, 31 Mar 2025 06:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743404255; cv=none; b=GVjnO8lyPorzVwFaQlAH8N3v4V63CMTVOoTPmpCiwnOVnuUhI3rgdFoWqSsMcGC+mqNsNu9f8TF59D0J0Uq5Wrtaz5kvB2tY0atLcyE+zUMdiC8SgOW/gQaRoUa2lBI9uQRZcRkoYxBTzmgXtpLUN025gRjq+yCHNJs81GYsIaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743404255; c=relaxed/simple;
	bh=wRiDpJ1orNt9FtKcdSnTiDrKHTvKgW+m1TBmrLnG+Rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ti0ht4MVcvj/Fa8J7hgZYqMzw2JCXj7NS+I3E8B3b0pNMqqg0uvZfxIm10vfGq7+8IZDokHDkBnpJwlBA3LYrfUDJnx5zYx6IZ+OoWae9xXc0XQL5pYVTuynktVio4/ivsNlC6jDqgrJKwwfXwrL7ekeOSdGW/5F9dzqoFVw+hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u5SNA6tH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u5SNA6tH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF2EEC4CEE3;
	Mon, 31 Mar 2025 06:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743404255;
	bh=wRiDpJ1orNt9FtKcdSnTiDrKHTvKgW+m1TBmrLnG+Rs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u5SNA6tHU6QyoFGEJoSqNUGsqTczu5GkOcpmYPM+OzX74+c+gczWsmr3iOQ+L6+36
	 g5SeUFRxg5ZbyElwLKdvF7ytBH/iywrCcIoAZZS6Oxz48RP2GY0gE5j/f9FYJoJ4nr
	 u/Dil7bGiG+bc9RHlg+MVMI6GxF3BVctwX0rlM5vlhrfoCoCtv0/EurNuOQx0jpIRl
	 69Hk50U5Rre5as6gXK46g5RJpQs9maVW1G6wsGPtFf3RE4nWqHnXtZuSXKXV4+KD3M
	 SF2IPPuj/vIJmTCotBr5gYXZw9lRJq9LJo6nfpYmJz6t9GCoCeJMQViLgIDrGhK84C
	 srBjMPaBOk87Q==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, broonie@kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com
In-Reply-To: <20250321023032.7420-2-yung-chuan.liao@linux.intel.com>
References: <20250321023032.7420-1-yung-chuan.liao@linux.intel.com>
 <20250321023032.7420-2-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/1] ASoC: SOF: Intel: Let SND_SOF_SOF_HDA_SDW_BPT
 select SND_HDA_EXT_CORE
Message-Id: <174340425181.37694.12886104505045994928.b4-ty@kernel.org>
Date: Mon, 31 Mar 2025 12:27:31 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 21 Mar 2025 10:30:32 +0800, Bard Liao wrote:
> CONFIG_SND_HDA_EXT_CORE is required for CONFIG_SND_SOF_SOF_HDA_SDW_BPT.
> 
> 

Applied, thanks!

[1/1] ASoC: SOF: Intel: Let SND_SOF_SOF_HDA_SDW_BPT select SND_HDA_EXT_CORE
      commit: fcc0f16923621e670d5ccf486160e4a1b960b17f

Best regards,
-- 
~Vinod


