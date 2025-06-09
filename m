Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2390F1442F4;
	Mon,  9 Jun 2025 16:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485834; cv=none; b=nt7lQoHbb5gmb9Iwnf32ZazPMLlsat/l2RoQCfQ6U6MCeOjkJjVkNkvcBLa2fGxoSfv99atYTIhZ/n9Q4SRwDhoU/ws9eh/Al+l0wPFdlAgs7/VEqfu+E0wy+un2AOr2/+g8Nw/M9b1Qv2aAIt3xOAHol+hC5TQmMpcqYWrHwUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485834; c=relaxed/simple;
	bh=1UrG9nhoPoMfpbyA/DogGIHx2IpDgypd6UjQLhfcdjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=mToy5jmG8owIgW2K3Ksbmuzh40lKsGcgQtE+YcM615tI0JQoSe9mExZ/vzwEHjkbh4jCNp7n/I37RoQvsD0UxHTKvuvt8CMdvQ5aePWlYQnhifskkq4FuxhSlivcrLowYZ2yl0mCzaZOrfNsk40WxtINbpsWZLIwDIaN8iOzKgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6k4nREi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6k4nREi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5144BC4CEEB;
	Mon,  9 Jun 2025 16:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485833;
	bh=1UrG9nhoPoMfpbyA/DogGIHx2IpDgypd6UjQLhfcdjc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Z6k4nREiCRC4ZeWNxwXdpJXCegUyBF/O+uySGecEWZEbo9k8GwkOx8xeIhsOYARS0
	 tL1vvVs6QFRnLOel8Ace4RADIFGviyWr1SDa3Cx7ebt60zuFxVa8BYbzSSjvVr6lp7
	 fWJmI4esDvY0sqhn0jPKV6ZDMJTR55puih7LPqB5NThhJAZpK0j4jcqpoIByOlISJ3
	 RbjhaDyar2aU9Z4IVEY1TJIjxSS+eiE9OtQq/0KIBM6ArWIxNDGLmPntCGXxCYz4YF
	 2+TXq7CC55ZUXcPc22wF5wohdXIdzw9PP+AcCCP+R4aVL5YMZe6ZFGUYb/LYqcDCZK
	 WiyLWVJuwqM0Q==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org, 
 patches@opensource.cirrus.com, yung-chuan.liao@linux.intel.com, 
 pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
References: <20250609143041.495049-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH 0/3] Update SoundWire IRQ handling
Message-Id: <174948583095.818152.7190907792484657066.b4-ty@kernel.org>
Date: Mon, 09 Jun 2025 21:47:10 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 09 Jun 2025 15:30:38 +0100, Charles Keepax wrote:
> Fix some difficulties in implementing IRQs for the SoundWire system, by
> moving the handle_nested_irq outside of the sdw_dev_lock. Also a minor
> maintainers update.
> 
> Thanks,
> Charles
> 
> [...]

Applied, thanks!

[1/3] MAINTAINERS: Remove Sanyog Kale as reviewer on SoundWire
      commit: 99d4a6e5c24fc05fc56a33d9d24e89720bfd5665
[2/3] soundwire: Move handle_nested_irq outside of sdw_dev_lock
      commit: ccb7bb13c00bcc3178d270da052635c56148bc16
[3/3] ASoC: cs42l43: Remove unnecessary work functions
      commit: 0cbce868fffaf115a26d6cb45516627cf13cc3d2

Best regards,
-- 
~Vinod


