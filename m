Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9155F288CA4
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751470029; cv=none; b=HmtEdPwK6qy+zXKy0INoGG3GV4jX2d9Yz0GvWPn+kk1cmgbtuGKynPIYIp7vOywwt9pwYyWlvihh9U5wo2fJDWmoZU57Y2OBo8Zev6raT0Nl6bASTHElLRPjUqk86jdKJB+YM03kfY9sJxBsuCxCSaM04QR/xnW0Dj4HOniQ3hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751470029; c=relaxed/simple;
	bh=btDnX36bweTfeOT9edsZTI/3vFG2DCSyHJ5Lt0omg/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TI9H6Me5sZhSq8rD1rqKy0qDo4KwQoEQItUK+YeTzXeMKopVRtsJoKb+m8zgmBLHoYFrHOgJxfEKuKn0iYzU94BUtJPBVTusRab6IH/HlBiK2DMwazaNQWmlsHBy2+XnOGvFcRdJmY1UQOLlulOfoaDTjCj7hi1BL2w168R02PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zt0vwIIr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zt0vwIIr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47AFCC4CEF1;
	Wed,  2 Jul 2025 15:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751470029;
	bh=btDnX36bweTfeOT9edsZTI/3vFG2DCSyHJ5Lt0omg/I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Zt0vwIIrGa7R70px+yAEo+iDEfer2Mb7ZSjOEaELxAo+4WBb48dhCzJsarLm4WPl0
	 jniJ8XKAO6dnaRM+7d4ZgmbxLSuUCP16vmmH3Awkm7CNlgDTt7k3miQKPBRRAg/IsF
	 ZwtEFEdllSUXZtwlECq+zuf/KJrBsuBaxpbPtb3XLStQycCmGJnjVQQc+RebeQYsww
	 +5mS1GyzsidDrRVNgRElEijPubHu5g7h+V5VFuV4qYW605+y3VV628Lz9Pyx08m0Zp
	 G5Y54Fslk3knT+xyTmORBcRTfAb2qP9brUr85br0yRyd/DqzCiVNa5nRgqr4YHAQo6
	 GCnD2W3FlPvUg==
From: Lee Jones <lee@kernel.org>
To: patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>
In-Reply-To: <20250626155951.325683-1-andriy.shevchenko@linux.intel.com>
References: <20250626155951.325683-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: wm8350-core: Don't use "proxy"
 headers
Message-Id: <175147002801.3040896.1326709487140753425.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 16:27:08 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 26 Jun 2025 18:59:51 +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: wm8350-core: Don't use "proxy" headers
      commit: 4fe2e96c88afde2f06485f90b7b01e2a45eb99e4

--
Lee Jones [李琼斯]

