Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CED1F8755
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746558305; cv=none; b=lnVJcqHNSBKh0rjRksZoGilCQMUMtXQbHa98v6VMFwketx1n5SSBRd44MRUlt2lzSxyqhT3aOqzuy689i0E8aqGG+SQ0J5itc+pTwqGOxJ47wgymS4m5MTMvK1MdylsOEr2SR/x/h3FwVQ2wUNhSGhQi6mvcQj76qZZIiSJ7G3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746558305; c=relaxed/simple;
	bh=Drs4DiRLxahMb8LIqCxbQcciRHLWjAnt7/5/YflhtNU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CIncsE68Ky2dfuidEBwnq0Bc5iz8yhUGGok+ZLB6/78KQNP6oj78iO2o3IWknV28C1pd013f4zyFOHId/urAzyN/4x+9NOSsUOZEDJdp5f3T4zTtEGwKk8X9YThW6N/KSqgzF030nZx4B8sEzfUsioEbBFFQIxD0ho+tAbSaGtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIhKK3nb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIhKK3nb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65CEFC4CEEF;
	Tue,  6 May 2025 19:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746558305;
	bh=Drs4DiRLxahMb8LIqCxbQcciRHLWjAnt7/5/YflhtNU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aIhKK3nb7jyNNrVpwUDyXULbwlWgOWNG+t7C5LV9hXshqqAk+jGr52VoCGyoStd4n
	 5hvtDawwjlvWIrf1gcKnkX1QwQle+W5kjaBH7edX77JQcGlycR532h4tkV7c5nKLxq
	 tsqaSYJqf9Jgcff6mzLwZEorQeIExUyB4M/vEyqNOcUXyDlHujXHzHQ1mTQSzRy70C
	 5spBF9iSK/7C39wp7j8zgTF5rYfiLzFZJ5N2Z0ynoMWybhKKk/o5Exp25TzLyDhyvT
	 zh3CQeGSVQvuM8MPGbdeYXbDy7LzcUR5xQsBmbl0ZU1P190GA77UWSJ2lnTFwiHv6O
	 V8IcZOL3WJVeQ==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	yangyicong@huawei.com,
	wangzhou1@hisilicon.com,
	Qinxin Xia <xiaqinxin@huawei.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linuxarm@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Fix incorrect return in arm_smmu_attach_dev
Date: Tue,  6 May 2025 20:04:53 +0100
Message-Id: <174653555029.1663285.12170965708138106654.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250422112951.2027969-1-xiaqinxin@huawei.com>
References: <20250422112951.2027969-1-xiaqinxin@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 22 Apr 2025 19:29:51 +0800, Qinxin Xia wrote:
> An error is introduced in commit '48e7b8e284e5'. When the smmu
> does not match with domain,an error code is not returned.
> An example of an error scenario: In vfio_iommu_type1_attach_group,
> vfio will try to match an existing compatible domain. During this process,
> iommu invokes the attach_dev interface.The mismatched dev and domain
> does not return an error code as expected.
> As a result, an exception occurs when the vfio operates the smmu.
> 
> [...]

Applied to iommu (arm/smmu/updates), thanks!

[1/1] iommu/arm-smmu-v3: Fix incorrect return in arm_smmu_attach_dev
      https://git.kernel.org/iommu/c/be5a2d3f8f97

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
