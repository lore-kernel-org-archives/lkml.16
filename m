Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DB426B09D
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 20:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958497; cv=none; b=GHd9eBZOlz+dWVgxcq1YXwn+VRWMZJHTEuV/TXQTfXSl06cztn4n4Vl35OgzbSZn6B4JzP4w7sq1C/3v8HEPeg9p2a3T5l01QQaRPGaWusMDRoq1yHlh6nemNkMW6KPz9qdJfHIzTbrwSGWTnM6kwqq2ewrcRvNE1SxZKYW7kZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958497; c=relaxed/simple;
	bh=j6cRsnJcuJGGzquyyvJ5hVFHCEDkziQIJdUywXnkqdc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rz6ruhBn5PwkC+qX7EWl3xoT+DaVtTmH/AkOTvElPKFOOXe/jOG0Jl5MR9cDrf1LE7+PTsFxfKcIEOvRVkmzRqo8ZhEtkQ5XXsU3RKIwQxPK14yQwCUtTyJu4+Uf44o1NBwRb6vBi0OprrFyA/TsjigE1ZLaCTvExemUxWIejQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EklBAx+S; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EklBAx+S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B92CC4CEE3;
	Tue, 29 Apr 2025 20:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745958497;
	bh=j6cRsnJcuJGGzquyyvJ5hVFHCEDkziQIJdUywXnkqdc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EklBAx+Sk8O4MDypA+nM92eodqBUZf0kdoLrsXb+d2WOK1BU58bLd3a5sXIc62A6X
	 er/oXBPQw2TWvWNyWIuXZt2mK82LBRX+7xXyQV17jPEGkuPJXDuyK0O2f//Bd3hdNV
	 ZeJg1YvouKFQoecBZHnExac9vvKbsKVZ8ko3mnofvs6yPuAOUta+8QqrzqmMENxPAn
	 /SdsjlE/DGEhU1XKnrIsGv0KgIVzpdYBhbrMxrItAEjSoS57ga4wqh0KHUhFhJxLG+
	 eTzpLa6MbPkGYk1NoTQ3X+kKHz9gq0wM2S1HG4QOUGPl0Df0PCP8J488BT+AfNblFF
	 L3WmnVM6fUT2g==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Miaoqian Lin <linmq006@gmail.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH] firmware: psci: Fix refcount leak in psci_dt_init
Date: Tue, 29 Apr 2025 21:27:50 +0100
Message-Id: <174592994212.427921.17461621351639066667.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250318151712.28763-1-linmq006@gmail.com>
References: <20250318151712.28763-1-linmq006@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 18 Mar 2025 23:17:12 +0800, Miaoqian Lin wrote:
> Fix a reference counter leak in psci_dt_init() where of_node_put(np) was
> missing after of_find_matching_node_and_match() when np is unavailable.
> 
> 

Applied to arm64 (for-next/psci), thanks!

[1/1] firmware: psci: Fix refcount leak in psci_dt_init
      https://git.kernel.org/arm64/c/7ff37d29fd5c

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
