Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5BB184;
	Wed,  2 Jul 2025 01:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418118; cv=none; b=l/F4AjyPGouLJZ9+wejyWO0pgPmWXpibIAJMY9Rv4A7NUXIHbxacUC1p+bKYF0qPmjFKGNjwxpij1Lv6R+gHQGSm6jjrwBS01Hva8YxmRElB5K73Aynrg1k+X7guEDvLUylqsmyAwk6gVwDEGgiqBAjsyTg6/Rr8Myt3OKjXqvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418118; c=relaxed/simple;
	bh=tQ5xzcUMChmToh1nBTixSDORJcnHx1Swcj4IT0HrGhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JXGnDDg3sc7rrA3F1Fw0ooVkDHkvilN4AL9TtX3ZLX7ZGXRcnI3FvAaNEBemQVVIrMA3EfWK9OZxKTg95ZWsD+Uhzsz8T2k3p6RkSWdZogcb4EuDY33bW+xaOlnyHy5ze3RMtamGEGnxEJyAg7tqXN4ByNgnq7Tqjo73CmWtnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkznIQkK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkznIQkK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEEC5C4CEEB;
	Wed,  2 Jul 2025 01:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751418118;
	bh=tQ5xzcUMChmToh1nBTixSDORJcnHx1Swcj4IT0HrGhk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PkznIQkKsLX55qmb21h+o4csgW2R5XQDmjV+y5x+N0ds8Weou6MsgQTiuAmxsQP6a
	 JIZh+jrqmJbZmgcNkuHOw6WMmKcqKdVpU768lXYNMWcUv5nCAfPRFqBDV3lTg6cGXo
	 xvl26VNS+EPJ6UEnf6snbbriZqPnGEWEoqv7KQr00R21FMe0QBJbBbXmtBAYvKdp7v
	 NFlF+StBCWii1tn87eyHi/bYLdlFv3OdGKOmnnWbUmvHg9LOYpykLQluN3b3JfkS9T
	 Q3ywAXhR+OuaUMpeoIb9WNpAy6BIkbZPZpzOPtc6eaqKJOJLl0njfg+6yeuRFPkc7b
	 CpUwJnBnCnsfg==
From: Manivannan Sadhasivam <mani@kernel.org>
To: slark_xiao@163.com, johan+linaro@kernel.org, quic_vpernami@quicinc.com, 
 tglx@linutronix.de, fabio.porcedda@gmail.com, quic_msarkar@quicinc.com, 
 mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
 Adam Xue <zxue@semtech.com>
Cc: imocanu@semtech.com
In-Reply-To: <20250528175943.12739-1-zxue@semtech.com>
References: <20250528175943.12739-1-zxue@semtech.com>
Subject: Re: [PATCH v1] bus: mhi: host: pci_generic: Add support for EM929x
 and set MRU to 32768 for better performance.
Message-Id: <175141811334.4694.335842713710601190.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 06:31:53 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 28 May 2025 10:59:43 -0700, Adam Xue wrote:
> Add MHI controller config for EM929x. It uses the same configuration
> as EM919x. Also set the MRU to 32768 to improve downlink throughput.
> 
> 02:00.0 Unassigned class [ff00]: Qualcomm Technologies, Inc Device 0308
> 	Subsystem: Device 18d7:0301
> 
> 
> [...]

Applied, thanks!

[1/1] bus: mhi: host: pci_generic: Add support for EM929x and set MRU to 32768 for better performance.
      commit: bd78a01cdee3d2333f70e659f3c1b4ffc3fd5c42

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>

