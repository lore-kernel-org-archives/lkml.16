Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DDBD263C9E;
	Tue,  6 May 2025 10:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746526509; cv=none; b=p1VvkT4ptds5UN+M57faWbPxUWlsafA8c0G8Je3BUKPAnyn0RcCnjo5ontUEFSHpiOG2Xb2a7CRKzNYvRU3s8D5Kz1Dug6eIvx40l2lIV/BIsGly2IPOh5jOiXEtWX1KSbtzYOQEBhHq4IYc7L2wxJwkdwBMzZD7JxMfmGm0iDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746526509; c=relaxed/simple;
	bh=tf73Q6LnPVFcelZ+v5g7F9l+lfoqrxrUSRjiLI8saGc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cm/nIWLX1YkXbvLpsxHSfH+Tp4nIidbay+2Rw3TFZrXfUQXanDiS0Tb2qMAUcFhhgxeWPTTVx/U44xpJz/3rWtuMD+6gf2S6qgTrKENHPzjOI0CjilH9rJKKPqsZ6VZ51gBuwcNuR0TdHmw5H6esoLS97xJRnP6E609AkyyICKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50D12113E;
	Tue,  6 May 2025 03:14:58 -0700 (PDT)
Received: from usa.arm.com (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 828EC3F5A1;
	Tue,  6 May 2025 03:15:06 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sibi Sankar <quic_sibis@quicinc.com>,
	Marc Zyngier <maz@kernel.org>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_scmi: quirk: force perf level get fastchannel
Date: Tue,  6 May 2025 11:15:04 +0100
Message-Id: <174652648581.3776799.11461926125587533598.b4-ty@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250430135146.5154-1-johan+linaro@kernel.org>
References: <20250430135146.5154-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 30 Apr 2025 15:51:46 +0200, Johan Hovold wrote:
> The Qualcomm SCP firmware in X1E machines like the Lenovo ThinkPad T14s
> does not set the FastChannel supported attribute bit for PERF_LEVEL_GET
> but crashes when falling back to regular messaging.
> 
> Use the new SCMI quirk framework to force FastChannel initialisation for
> this implementation.
> 
> [...]

Applied to sudeep.holla/linux (for-next/scmi/updates), thanks!

[1/1] firmware: arm_scmi: quirk: force perf level get fastchannel
      https://git.kernel.org/sudeep.holla/c/397f802d06c4
--
Regards,
Sudeep

