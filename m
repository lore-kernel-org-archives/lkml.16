Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A597B19AA5D
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 20:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743192541; cv=none; b=cZm8wsUu+3tW7gqDMGp4EELrp8ep79oVejP5vgEfRK2jc3FYzMfogVjj26quQ+r3ToJu8m7M9/HPr/uSuEC+L5MzX0Xi2MT1CcvBnGkbKVVe1nUg96hXoLSYZFF8244quTB2zOHbHpT8of7ajLUn3kkhnq0JbOcItjrXZiVUJGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743192541; c=relaxed/simple;
	bh=a+jLtl2qib7wr1sg2Zn0XQvOlYluA2aNoXcvOUZxZGw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VA7rARGo8mSMRrlhegGlegL3CHk3X1c/lLeI1sKzIVhHX08MWUotMJauxtXXuSx5QV19PCUncxKVdIOwatW/pHwRlYYOFGK3mSyXluzZs+ssv3Y9f/VhRXGJyPIXar1AU+AeOdP9LIovyjTZcfvFlM5HLThUHMwbRgzzEyhqEas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0EC3C4CEE4;
	Fri, 28 Mar 2025 20:08:58 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	oliver.upton@linux.dev,
	maz@kernel.org,
	Jinqian Yang <yangjinqian1@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wangzhou1@hisilicon.com,
	shameerali.kolothum.thodi@huawei.com,
	liuyonglong@huawei.com,
	jiangkunkun@huawei.com,
	yangjinqian1@huawei.comm,
	xueshan2@huawei.com
Subject: Re: [PATCH] arm64: Add support for HIP09 Spectre-BHB mitigation
Date: Fri, 28 Mar 2025 20:08:56 +0000
Message-Id: <174319246800.4193737.16068593925893722302.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250325141900.2057314-1-yangjinqian1@huawei.com>
References: <20250325141900.2057314-1-yangjinqian1@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 25 Mar 2025 22:19:00 +0800, Jinqian Yang wrote:
> The HIP09 processor is vulnerable to the Spectre-BHB (Branch History
> Buffer) attack, which can be exploited to leak information through
> branch prediction side channels. This commit adds the MIDR of HIP09
> to the list for software mitigation.
> 
> 

Applied to arm64 (for-next/core), thanks! Please check that I added it
in the right place as it was conflicting with the current for-next/core.

[1/1] arm64: Add support for HIP09 Spectre-BHB mitigation
      https://git.kernel.org/arm64/c/e18c09b204e8

-- 
Catalin

