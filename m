Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0BC2749EB;
	Tue,  6 May 2025 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526441; cv=none; b=ECLTcDFSWnuLwOFB+7zuXQk016JRg+3Js4Gen6WgqV3f/kXPSYnej+Qm1x7L1o9qJYM77T7P78JAUkE1dqzzu2GgfmwxZ117IQ4mIbODAeY7bUW381mHWE2kp5ceTZaku+64uniiG5yWv41zyTWVwBJTBOm4YW3OkDaFulNEeQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526441; c=relaxed/simple;
	bh=5AWVl9a+q1WS9q1OSptDsM0mFQJLdZ6UHEH3Ksk81hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uz3FdrhhZL1XHDfr+3yqnJcjsSfz14DhkQBpvK2Dp0Ug4jM8TJ2PoorJ7SSvq0VyHzXe33P6punoDZV7TqvDTrYRXGy/VT9aCFSZBbvDEco8E6P/G1+rY1xWi+5bwShHwZBeSPyZZd2A0cDLZgH8/EKbQIYE56qxkqkVt6Prd+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 04E80113E;
	Tue,  6 May 2025 03:13:50 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 528053F5A1;
	Tue,  6 May 2025 03:13:57 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	james.quinlan@broadcom.com,
	f.fainelli@gmail.com,
	vincent.guittot@linaro.org,
	peng.fan@oss.nxp.com,
	michal.simek@amd.com,
	quic_sibis@quicinc.com,
	dan.carpenter@linaro.org,
	maz@kernel.org,
	johan@kernel.org
Subject: Re: [PATCH v3 0/3] Introduce SCMI Quirks framework
Date: Tue,  6 May 2025 11:13:51 +0100
Message-Id: <174652639726.3776516.14512391795874302742.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250429141108.406045-1-cristian.marussi@arm.com>
References: <20250429141108.406045-1-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 29 Apr 2025 15:11:05 +0100, Cristian Marussi wrote:
> with the increasing adoption of SCMI across arm64 ecosystems, we have to
> start considering how to deal and take care of out-of-spec SCMI firmware
> platforms that are actively deployed in the wild, in a consistent manner.
> 
> This small series introduces a simple framework, based on static_keys,
> that allows a user to:
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/3] firmware: arm_scmi: Ensure that the message-id supports fastchannel
      https://git.kernel.org/sudeep.holla/c/94a263f981a3
[2/3] firmware: arm_scmi: Add Quirks framework
      https://git.kernel.org/sudeep.holla/c/487c407d57d6
[3/3] firmware: arm_scmi: quirk: Fix CLOCK_DESCRIBE_RATES triplet
      https://git.kernel.org/sudeep.holla/c/7b487beab7cd
--
Regards,
Sudeep

