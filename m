Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D84B251795
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 14:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744900063; cv=none; b=KnecEynuwiWflkRUpL8fdpX8hWMmF9GHxDZRZXCxB/8DV8QbhFkRK7Tlss5XQ1PLqBlVkWYkEzO2W9eQU9erX2+HCX1MwMSm2e8hXljnE4nVAXiHByFXEDyAq0OXJxzkYf8ZkadIJ5YWm1LUHQh5y6L4QyII9YnxlIqffpe7/sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744900063; c=relaxed/simple;
	bh=VAD+DaKQjwY98GIPk9h72X9BL6VsYoPUJg6LiapYrC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QESFwr8cIVCc58AaBzhpG4tE429pyc9YiqsR0QBh2Q1pi+fEjYgHeKpjIt5UB9yHsYbFXhYoucJnqRM785TimSPJpfqyF85zDTYwNm0Uz42L9BeYbchXbIi2XJvNt9P78GwQ4u8XnUsh6plbCgLT6/t9mT6U+ajCK48Pgo6/rtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qRzfAcPc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qRzfAcPc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E478C4CEE4;
	Thu, 17 Apr 2025 14:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744900062;
	bh=VAD+DaKQjwY98GIPk9h72X9BL6VsYoPUJg6LiapYrC8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qRzfAcPclS4rD+PWwWhSgGpYwmRwnikG6bvVDqkN/kcr8nhesLVqHNmAQLxNx6aHa
	 1y8FXRbBzH9ZdIrEounQjLu0Nm5UUZaTrK58TaHorjifhPXyEUE46u4xMKNMIW7Yju
	 U8skOC3iip2OYZJdKo6Glw2UtNYLdHfOW7Dcgkpht3ugxU/W8vQnoATyZKd0TjC3BP
	 ut1TtWSfypRrN4MgME35RxqwlemZeSmncUNPlDgyzmhVGHTeJsPHjKcKgBb06MdVTc
	 wBBsMkA4H76BcuNaWyHQDlBCLWLOW6cbc3J1D5igIustT/xw75T9ac9qHxqga7SbQ0
	 3UDqjkQyHjyVQ==
From: Will Deacon <will@kernel.org>
To: robin.murphy@arm.com,
	Hongbo Yao <andy.xu@hj-micro.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	peter.du@hj-micro.com
Subject: Re: [PATCH] perf: arm-ni: Fix missing platform_set_drvdata()
Date: Thu, 17 Apr 2025 15:27:23 +0100
Message-Id: <174489645540.2697340.5524716778824476252.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20250401054248.3985814-1-andy.xu@hj-micro.com>
References: <20250401054248.3985814-1-andy.xu@hj-micro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 01 Apr 2025 13:42:48 +0800, Hongbo Yao wrote:
> Add missing platform_set_drvdata in arm_ni_probe(), otherwise
> calling platform_get_drvdata() in remove returns NULL.
> 
> 

Applied to will (for-next/perf), thanks!

[1/1] perf: arm-ni: Fix missing platform_set_drvdata()
      https://git.kernel.org/will/c/fc5106088d6d

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
