Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 161AC21B9C9;
	Wed,  2 Jul 2025 06:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751437461; cv=none; b=hqOLLqI8xvR0xf6o5hbXc2GHSYSBUFgn66OnsXh7UU5xvzuRFscFwUH7+4zT/SM9LrxSoGkrFyJ0NpGQAuloEQzSmKOJayDjHejLOci6pPBlk0m7nEdC5vpBpHFJ0Tc0YL+CA2wfTQjfpIWkXosIp+GZHH24Dl2WaQCI8ydFKjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751437461; c=relaxed/simple;
	bh=f9nF1jmi5t1o2OHha8JUx6MPxJ+a2LufuswIt71nqfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WOJEoaSnRRVo0IBjP8F+QHkt7bvgh6ninX1IctTiWiNxbg6/nbc0n7zr8wSAZ7qarZS1jPgkx0N34yPV05EJbQrqfkek4dccz7JuekXtAqDpbsD6gPGt8syOc2YxSZizklne/MKrqEtaQDF2tfwSfrSQ7cpoT9unANAC9F+/gZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i8fxqiAV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i8fxqiAV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E01FC4CEEE;
	Wed,  2 Jul 2025 06:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751437460;
	bh=f9nF1jmi5t1o2OHha8JUx6MPxJ+a2LufuswIt71nqfc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=i8fxqiAVf6DIQMVsPqjVb9z41Ifas67grtNePFTC1dChLcrvlLFLfYi/t0gcpyISI
	 WkOPTmVEAriMCngovPvwgK88IRAapJVJO01Opnsrg3aofCVYDTBQTXH2Mjy31BFc+q
	 gbS4//UGXL5eT9Rp5qCaX+nKoHKs8Y29FfmRi5DkWsgHD+J9hwL+3MKoEazO9yxoNL
	 dv+S3ZFEcVc8OtuPOLweP5l3rBBHSb0dWcVo8eLdUpAeEouaoazFTLxGlmgHeOCzJg
	 TmD+sbFqR4lHFyKogfutI21tZMqP2ae/D6YNCwmrLyQ15cgi4NXlNDybuicqauSW5S
	 PevTgAo5u3+PA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: long.yunjian@zte.com.cn
Cc: fang.yumeng@zte.com.cn, mhi@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 mou.yi@zte.com.cn, xu.lifeng1@zte.com.cn, ouyang.maochun@zte.com.cn
In-Reply-To: <20250623202814633ukJqUDLU7BRlLLhvWkbD7@zte.com.cn>
References: <20250623202814633ukJqUDLU7BRlLLhvWkbD7@zte.com.cn>
Subject: Re: [PATCH] bus: mhi: host: Use str_true_false() helper
Message-Id: <175143745650.8922.11983003637531738651.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 11:54:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 23 Jun 2025 20:28:14 +0800, long.yunjian@zte.com.cn wrote:
> Remove hard-coded strings by using the str_true_false() helper.
> 
> 

Applied, thanks!

[1/1] bus: mhi: host: Use str_true_false() helper
      commit: 99b1cac2680b297b74a87fdd0f80e501d20e7561

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

