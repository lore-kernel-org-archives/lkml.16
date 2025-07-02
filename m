Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B017A316
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468732; cv=none; b=KxpK97x4RwgRO/G5MVF3GYq1DGNQqMvDgppg1KQvRxU6L2672PNZSjNxDChT4pWCLDLnHAKhhWcOcVAn6ZfOxnsOlzh+zHjSfKdtvH/dv2KJrxnsMg2yR8LP66szqBQui7vXUDXVMTeJzkjr4eGpffuxGNFWqiToTEtpk+xsEXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468732; c=relaxed/simple;
	bh=8EV4srvCoaS1vFbEvdDKV5o73ZwmtrR6zpd6fesLNRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CfclumJtkQ5eLZorJO2CiqymguPljAxu0JcCVjJIcIl46LI0K1ZaKb/0l5ogKDUtpOj95hj/oLq2ZxHy++T+b+JZ0EC05emkqTf1GUnkTjPa9nUmZJqCXcjZpNcvHvSS5IlJ1TvJhT7K5EHf09ykLpl9IA9P6HfFJy0E7HX7b5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V7Px8ZcC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V7Px8ZcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 412E1C4CEE7;
	Wed,  2 Jul 2025 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751468731;
	bh=8EV4srvCoaS1vFbEvdDKV5o73ZwmtrR6zpd6fesLNRs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=V7Px8ZcC0etyxw4j6nOopAJeO1hwTn5vjAQjGgJOQXbeIrU7T+8vjmH7HtRQVM5eA
	 C2K1H8aw4x3iEtGuR2I99oCbUlF59DrQjb2s8kCnN0gSrTsgUbMpK0WbTpci9acfeY
	 QZo5BWDiWIpHm+yIoxL62G5XByM36kqYJnC5oQLPBGWRsCCc8tvFfcUD8UyYMZ+Otg
	 qgSQmGEeUlf1s6h7qTu6p7VHAjF2btKvwUsFCPuAxVNErPzSr9UWZLsUVgFA2crww3
	 MCidi3jTadVf5l1z/KC0iOdqCMjV3kqi7zhiXJaj6IDp4BWlg9dLOl0rY7R5akCOzZ
	 i8J57Go4/+TiQ==
From: Lee Jones <lee@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>
In-Reply-To: <20250626154354.324439-1-andriy.shevchenko@linux.intel.com>
References: <20250626154354.324439-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] mfd: davinci_voicecodec: Don't use
 "proxy" headers
Message-Id: <175146873101.3027543.3191565867761954497.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 16:05:31 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Thu, 26 Jun 2025 18:43:54 +0300, Andy Shevchenko wrote:
> Update header inclusions to follow IWYU (Include What You Use)
> principle.
> 
> Note that kernel.h is discouraged to be included as it's written
> at the top of that file.
> 
> 
> [...]

Applied, thanks!

[1/1] mfd: davinci_voicecodec: Don't use "proxy" headers
      commit: eb58bc64cd05137909859d930d6e320ea086e777

--
Lee Jones [李琼斯]

