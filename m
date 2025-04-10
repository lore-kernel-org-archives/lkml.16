Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EAB374D1;
	Thu, 10 Apr 2025 06:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744266597; cv=none; b=fu0Ykpc8B/V1Kz1HPn4K9gf9P9P1Pmn5ISSetqtnHL49JiFnXUkGNXsqPUN1MkOb7xB8hWUFGrcSYvHW1UEuEoLJlXwCSM7md2IQ482J1UuSxF4Vdi3/972ml0ndvhO1TqvYmz+aIVJ5MNveBlu+i4SG/RK5stLs929POHbvpY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744266597; c=relaxed/simple;
	bh=Tf4vDmIZdgxRq3T3EzlpxsDPO4Nswun6o2Hr7RsmHH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jQoO6Z9QptZXq73VjF8i3KGSmeHJuzMf5zsGLrTouPQ/Bgaif3P7pyDJ3a0xAdFwQqSAJWs2nbNMEE/sX3w85wYXkqe5/3fauxnvPCu2plnS46xc+hnuDyndwyEfIwRU4bsBYWuZii79dChJjpcBqFOefccKaXzPQQjG8FpUuwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jvynMcBN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jvynMcBN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EBDEC4CEEA;
	Thu, 10 Apr 2025 06:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744266597;
	bh=Tf4vDmIZdgxRq3T3EzlpxsDPO4Nswun6o2Hr7RsmHH8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=jvynMcBNI6s/Knr+ZZaQjKVvqAmVkZWB3hxp3Wa2MKUey4UXMDCHg8SadydPUNRtB
	 wv5o2rh75mnwovNa1O59WDXc+H07T71jVBwxjsB7BONt/JIieHayvrQdqa9TVo6cXh
	 r5rqio2gMjJBVb8UOR7Jq8c3L84Z0sp5OWgENUjfXv2xFR9LSHTCjpBXyC9NrWPDlW
	 dq/4xdoPBrxZuVLDkuBFicjC0C/MovTDrx+Rn820s5N7+sI5q2hBMLtt2RktFTFODD
	 0o8piaoMJnKE3cIpDVzydKjG89BxFoTjqvhSOaUQ5jyWfFCD+r2gkQuqKGM7o1xgWl
	 2YVvUPJ2GeOPA==
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev, 
 sanyog.r.kale@intel.com, peter.ujfalusi@linux.intel.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 patches@opensource.cirrus.com
In-Reply-To: <20250409122239.1396489-1-ckeepax@opensource.cirrus.com>
References: <20250409122239.1396489-1-ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH] soundwire: bus: Fix race on the creation of the IRQ
 domain
Message-Id: <174426659476.548113.7885555215947358719.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 11:59:54 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 09 Apr 2025 13:22:39 +0100, Charles Keepax wrote:
> The SoundWire IRQ domain needs to be created before any slaves are added
> to the bus, such that the domain is always available when needed. Move
> the call to sdw_irq_create() before the calls to sdw_acpi_find_slaves()
> and sdw_of_find_slaves().
> 
> 

Applied, thanks!

[1/1] soundwire: bus: Fix race on the creation of the IRQ domain
      commit: fd15594ba7d559d9da741504c322b9f57c4981e5

Best regards,
-- 
~Vinod


