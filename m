Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1241320102D
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222306; cv=none; b=GVkMRQG3SOJiFQrjF0JPZoA08uCFvtY0pGBye/xEXKkNiCdun7+gMZ8G/uzkrc165ysC++WPsUjxm5/Te54D28O6VwajxkPiZy3/yiM0qzaTxGil7bgTQG4+GanSOAIsbfOdblZwHP0A09ufLGPTAjM6ZMQmrqreuBTO4Xjvzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222306; c=relaxed/simple;
	bh=moXEfyVKJ32fVWfovmj/8bS6KOq57MP09z5rxjmMVX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZC/cOlXKA6QrKZwky+zKD13lZ131eEKwmOiF5gf5gphg3qRFhQe7Ah9yJWMY4oHoYcg0nMFGWcBywplo2NIpyDP8IMGWl4ifxTo4axOCxTKrBfMjK1IY1YMSMYIY177GMVuCwKrqomeTze51cUA5/qX/cbQ8E/TKDgnbJapwZts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qixUZ/bt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qixUZ/bt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78FBC4CEE9;
	Wed, 14 May 2025 11:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222305;
	bh=moXEfyVKJ32fVWfovmj/8bS6KOq57MP09z5rxjmMVX0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qixUZ/btnbmPmcqUEjTUB1aGGbHP0fw1WlMEOyGzCLB/Wm6GRsRAXwRKQDz+/Bl7Z
	 d3EPn7DgzEyACOVoOkygkKfQNJq33Xz664noff2n+U2/qmYS5GcJxZ/sRwlZaPllfg
	 sdvPtCezMB3KH1qXYZT4r8VwElHpLOvISHxbSiaKcCnbgPQ4c5Yp6ZopMoBtb186JT
	 ECCGmLIA3S8o6jfNKC86FRuG3uGoV8fTb4T8xlyXKyG4N6AX2O/7R53h1ZIjJ1tBwO
	 58whQrAgmQPOq2BarQK75EwG/tOjU2I2GZ0ij2kbYHMByk0IdodedweyU9NdeYXaEl
	 RG3UkaTS0dy/w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Hal Feng <hal.feng@starfivetech.com>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250422101244.51686-1-hal.feng@starfivetech.com>
References: <20250422101244.51686-1-hal.feng@starfivetech.com>
Subject: Re: [PATCH v1] phy: starfive: jh7110-usb: Fix USB 2.0 host
 occasional detection failure
Message-Id: <174722230439.74407.4949832120715878056.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:31:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Tue, 22 Apr 2025 18:12:44 +0800, Hal Feng wrote:
> JH7110 USB 2.0 host fails to detect USB 2.0 devices occasionally. With a
> long time of debugging and testing, we found that setting Rx clock gating
> control signal to normal power consumption mode can solve this problem.
> 
> 

Applied, thanks!

[1/1] phy: starfive: jh7110-usb: Fix USB 2.0 host occasional detection failure
      commit: 3f097adb9b6c804636bcf8d01e0e7bc037bee0d3

Best regards,
-- 
~Vinod


