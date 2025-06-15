Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E6280315
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 16:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750006383; cv=none; b=URmzg+oYMkcDZoDms9Eg4jAg/bAB9u2fg0jF5TmUx+Hb4+AFW5JlNMWVIvH/aCx2qa/a8egRy9Q4Eh79AdHmSPCC3N9txrcpCjcGxS9CH1CIPp9uZuf5LlHBrnE13Ujhpr5Z5kdcaRYLv6wkIGSsEJZj0gbyxJtM6ZxGRmjJAU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750006383; c=relaxed/simple;
	bh=iPxJ9YbUiNAqgnRPEO+mLFdnygq/9Inp/T8SioCETZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Wwnszl4UpKu+CWHzupvfSgcM5HsvSRkUJmqeUY1BCgu5Fy+4PZUUUh7YT8ATq4RIYzZzXfkyT3kKj+zO8P6oUWqkVV0XlEIVaXObuS6+ldhAEWlAl+Z27WaHGJDS76FfxuNg++svpD4kjndwJVGk0ipGmDrDbwFLxqeMOM82iV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rJaFFK8N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rJaFFK8N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96769C4CEF4;
	Sun, 15 Jun 2025 16:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750006382;
	bh=iPxJ9YbUiNAqgnRPEO+mLFdnygq/9Inp/T8SioCETZ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rJaFFK8NVrJ428CUp2Iwl7qExG+kfiRqzsricVwshi+KyTb1PfbUYZ7LCfamCEaMq
	 8FOX1AYe+UpGCRfzRAx+JgoWHIxSTV5gkBrHGcRXmzU5JBBwhgAWwG/AxXuefMbP2P
	 ww2c9A6eKWmh5uZgtMQvcXXqju9iNAum6fgz+AffKixrky0drKf8vcl7eBUfPxb634
	 L+ouuf9phzGcRP/bfbGFGXA9SXGrJ662yJHP+2oBARWY0fqo4G0rvEDFHVnvRFMNYn
	 ypuP+Tc0L8sjVhRfSMT/1GyVPinApm0uz4i9SYGWAgZXbz0Q0BrwqOhhGc1SOlnKNX
	 9z71QRTME64kQ==
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Abel Vesa <abel.vesa@linaro.org>, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250523084839.11015-1-johan+linaro@kernel.org>
References: <20250523084839.11015-1-johan+linaro@kernel.org>
Subject: Re: [PATCH 0/7] phy: phy-snps-eusb2: fixes and cleanups
Message-Id: <175000638017.1180927.7231066808038333033.b4-ty@kernel.org>
Date: Sun, 15 Jun 2025 22:23:00 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 23 May 2025 10:48:32 +0200, Johan Hovold wrote:
> Here are a couple of fixes and some related cleanups to the recently
> reworked and renamed phy-snps-eusb2 driver.
> 
> The clock and repeater imbalance fixes are not marked for stable as the
> first issue was introduced in the recent rework which is queued for
> 6.16-rc1.
> 
> [...]

Applied, thanks!

[1/7] phy: phy-snps-eusb2: fix clock imbalance on phy_exit()
      commit: 641fa5b515a6900b1452cc92d30d1ab391e04414
[2/7] phy: phy-snps-eusb2: fix repeater imbalance on phy_init() failure
      commit: 3232a6b0d834569f71aa898401288af6b4ab781d
[3/7] phy: phy-snps-eusb2: rename phy_init() clock error label
      commit: 4f333990841e06059c3cd7251791017d4c9e9028
[4/7] phy: phy-snps-eusb2: clean up error messages
      commit: b7996f8e9473cf8a594af1fa1bb799f8f28c0670
[5/7] phy: phy-snps-eusb2: fix optional phy lookup parameter
      commit: f21b9bea6bc29de88b885cecd5e4f0ada60d4700
[6/7] phy: phy-snps-eusb2: drop unnecessary loop index declarations
      commit: d2d0ae723ba3fca2c54dfbc758b368d3009e79a7
[7/7] phy: phy-snps-eusb2: clean up id table sentinel
      commit: 47311eaa0a3be575f7835d99e3767f5ee5940b45

Best regards,
-- 
~Vinod


