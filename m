Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D04238141;
	Thu, 26 Jun 2025 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750971435; cv=none; b=L9fLWkrp3d6nuHh3gm4YLrlf8+2OUOkeWvL1pX3DgMhlFdT0wcor9iZK0LgLyAtc1mZ9X/ve+4thm+dhcLFnD4Bd+CKc5ddvTeyCJTz+xLXqofRSvmudxdE6hAY8+fNRSMk4b4jBrpMfzah+TD6Bu+Eig1IuO7fCDTeKCFAY+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750971435; c=relaxed/simple;
	bh=y+I3wvSFJie1KbTB1qaDSKpuCbBStfymZluyOJOzXjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GhA39EhnT6VmN3FVdtV73ZvCbFqSMCbXDF678ar0C3eKkasUC9KYNI734KKqlX+eRy9t8SjY15uS2TBuGnd4YtVJ8gPh/NQ+JO0dJquzXXFOSRzELS6XTwJ+F/SjEd6WyHk3mjQv4Pq1YQXIIA5VEJsy5WFhU3B/Gk+SNjjt3KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giK+k8ld; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giK+k8ld"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B61C4CEEB;
	Thu, 26 Jun 2025 20:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971435;
	bh=y+I3wvSFJie1KbTB1qaDSKpuCbBStfymZluyOJOzXjk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=giK+k8ld5Xi2maVQuSgSdTLIxCt64I3ZXLyzWmUA1pYErAp2REflslxyqE4356ITk
	 eIjUbKNoru3G5msVRsKIFdp7bEFXh1agUwozRIIdze5uekl8AceD9jdwrEq8kJCzC/
	 RObRamMmYR+6RX79VfXOAR3Owmhxy5M75YHIVtT16U1lCrsVBUwAy8AuKRKlkIrpob
	 uJ/Iij1LJKvl/3yt+/L+Z2xt4yzfKk9CP7CdG1QplOJ8W62GZCIPXlivR/h2AfvJha
	 cMuLj7cAO/0+QwO8qPgyPjy8JB+nju1ojcMfBstEPHNGkOSYEPFtXO9/t3tf3kaNZc
	 aOkjUZwf1hvlg==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 peter.ujfalusi@linux.intel.com, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250624125507.2866346-1-ckeepax@opensource.cirrus.com>
References: <20250624125507.2866346-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: Correct some property names
Message-Id: <175097143504.44160.17127007052966518976.b4-ty@kernel.org>
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


On Tue, 24 Jun 2025 13:55:07 +0100, Charles Keepax wrote:
> The DisCo properties should be mipi-sdw-paging-supported and
> mipi-sdw-bank-delay-supported, with an 'ed' on the end. Correct the
> property names used in sdw_slave_read_prop().
> 
> The internal flag bank_delay_support is currently unimplemented, so that
> being read wrong does not currently affect anything. The two existing
> users for this helper and the paging_support flag rt1320-sdw.c and
> rt721-sdca-sdw.c both manually set the flag in their slave properties,
> thus are not affected by this bug either.
> 
> [...]

Applied, thanks!

[1/1] soundwire: Correct some property names
      commit: ae6a0f5b8a5b0ca2e4bf1c0380267ad83aca8401

Best regards,
-- 
~Vinod


