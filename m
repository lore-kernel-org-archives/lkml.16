Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0D1C13AA2D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 10:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749465222; cv=none; b=Ihyl7ls9rSYRsr/sKorW7ziojnkd7gQMuyQYdWeWwmRBRQ/vYEP/u7Xj2fqVFcVb8hRkdLq0HYjYQZb91qDPuQL1t8ky0Mf65ADEJK66G2320NDp73pKfGQpyiRbhH+GwQBPxxYCQvce8wiWtUFpll4kBLcWYJ01nxXQ+NASvak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749465222; c=relaxed/simple;
	bh=eheXtUq2V/rV0FvM/zatxvU6yEFxMxxACpKRbY3hGhQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uRocf3fJfaUmfS1DjrQIIQdnLs8oXLpgvSfl3OuwrY16ltVgLrWkt9J75eOXMTGzK0qjAofUQDUyVBgQgfCJQGM3n4Cz24+adn5KYsZf+/GHX1jI9Q0FrP7Fzz8OK3YPuY9tR96TeU6ZbCU08afHtBxBX+z/TCQXSUYy6CRMsuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49C46150C;
	Mon,  9 Jun 2025 03:33:21 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C8AB03F673;
	Mon,  9 Jun 2025 03:33:38 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Bill Mills <bill.mills@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
Date: Mon,  9 Jun 2025 11:33:31 +0100
Message-Id: <174946516044.1179265.589690012016225965.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
References: <28a624fbf416975de4fbe08cfbf7c2db89cb630e.1748948911.git.viresh.kumar@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 03 Jun 2025 16:38:53 +0530, Viresh Kumar wrote:
> As per the spec, one 32 bit reserved entry is missing here, add it.
>

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Fix struct ffa_indirect_msg_hdr
      https://git.kernel.org/sudeep.holla/c/4c46a471be12
--
Regards,
Sudeep

