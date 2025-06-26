Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C6202996;
	Thu, 26 Jun 2025 20:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750971436; cv=none; b=OBgab2kqGe8D4PoCdRFjjcQYjtoBhtQlQY9sojoFLQDnfmdp1n+GDAar0um7lUUSgjfde7gtsD58OIwH8Ox8RCnjG2Kie+1pNLPEG7J5cyFfrXyCge6l1ohGb6hitYAdIlzMRYew0gZ1NZn7hrQmfeog/bxQLUXcrUwWY0CKZEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750971436; c=relaxed/simple;
	bh=ChGnZmmq74D9pfG2y/C73bIqbdSptliB1w7H48IgBHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gzElzeqLJxyTPJWPS7dCOrZ/JZoeJ/m6l3GP5v0Au417kf9szJwPnFs1R+uVYGJ7Y+9hORyKxYGsT0zNQ2j4ehFeHr5wAzT/T3bfi7x7wbOWCcJKU3ECNLJmuG75gMQ0lw8rvajY8mumPdjqfsWh2+ZrDI0iB9edD4w2MkelWeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cqz8D8lc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cqz8D8lc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72AB7C4CEF0;
	Thu, 26 Jun 2025 20:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750971435;
	bh=ChGnZmmq74D9pfG2y/C73bIqbdSptliB1w7H48IgBHA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Cqz8D8lckJxEqfgvuXbgojB/kmH14u65gcYJX1holi9BE+7JaEybVkjEuObqSifjx
	 7B3uYWAHAQTF47TZiMDaiaJWI5Wl7uxq3UIXmWHqkbEuUwTJg3oUFCqeppnd9lWp+m
	 wevRCzsJOLom3e2C9CGhdTgJehfBKB7WK0BB7NcLxE8mzP6zlxWokRZUX469ThJXIY
	 KWPQlyA2TVKV/Pe263hec5hI4N2J3q/qNMC5wNabnIyzkt9fjZknSOxPeYOQLI1aSQ
	 uqsVAf5vk3Vx1E8tPHOwe35GVo2uy0RpaKgc0a96r1m+0OF1D+1N4mPIU6iQ97dtzD
	 lcubmSfFHcH/w==
From: Vinod Koul <vkoul@kernel.org>
To: linux-sound@vger.kernel.org, 
 Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: vinod.koul@linaro.org, linux-kernel@vger.kernel.org, 
 pierre-louis.bossart@linux.dev, bard.liao@intel.com
In-Reply-To: <20250626060937.405978-1-yung-chuan.liao@linux.intel.com>
References: <20250626060937.405978-1-yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH] soundwire: intel_auxdevice: add rt721 codec to
 wake_capable_list
Message-Id: <175097143542.44160.16482034102820784391.b4-ty@kernel.org>
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


On Thu, 26 Jun 2025 14:09:37 +0800, Bard Liao wrote:
> rt721 has wake capability. Add it to the wake_capable_list.
> 
> 

Applied, thanks!

[1/1] soundwire: intel_auxdevice: add rt721 codec to wake_capable_list
      commit: 8168dba757c08aed00d0a1a25426c807adbf4491

Best regards,
-- 
~Vinod


