Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7F927511F;
	Mon, 12 May 2025 21:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747083715; cv=none; b=c6QYiwcQYSg+Oc4txif9vQBiiHq4Gfl7gTHkpu+FA6yF1omUOmG2rSLSQ5v9CUAIAmHp9IAB9ygrdBc5EcNMeaHXoEZtBtc+s0IYr8FOnrpAvycKun5T+j90DabS7UdbRCjqPXb5TAsXRHGLuH1itDaOh77qPQ2Uq160t0l4300=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747083715; c=relaxed/simple;
	bh=LXSvStycbO7e+LWkP6Ux2L7CIUTJFuV0FgCC6legcUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a9uxYteeM2mHNKRyDVXsJsW7YbXwg6WqVB1fhFcNmlhe+DbYSQ0LlyyAlHG8h1BAbk+y+HbMRejCs5KLl/9mqCcSRKQrvlSB6ABGoWLzTe7Tot9y4MEzeu77gB+8aNeArlDWyi+JVLWzM1aysFCdzRapTHJrSBaT4HSQFo2EEpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36CAA150C;
	Mon, 12 May 2025 14:01:40 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DCB303F673;
	Mon, 12 May 2025 14:01:49 -0700 (PDT)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: Re: [PATCH v4 0/7] Arm CoreSight: Support AUX pause and resume
Date: Mon, 12 May 2025 22:01:40 +0100
Message-ID: <174708367151.538896.17315293858076521324.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250401180708.385396-1-leo.yan@arm.com>
References: <20250401180708.385396-1-leo.yan@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 01 Apr 2025 19:07:01 +0100, Leo Yan wrote:
> This series is to enable AUX pause and resume on Arm CoreSight.
> 
> The first patch extracts the trace unit controlling operations to two
> functions.  These two functions will be used by AUX pause and resume.
> 
> Patches 02 and 03 change the ETMv4 driver to prepare callback functions
> for AUX pause and resume.
> 
> [...]

Applied, thanks!

[1/7] coresight: etm4x: Extract the trace unit controlling
      https://git.kernel.org/coresight/c/242f5feb
[2/7] coresight: Introduce pause and resume APIs for source
      https://git.kernel.org/coresight/c/0b5fce04
[3/7] coresight: etm4x: Hook pause and resume callbacks
      https://git.kernel.org/coresight/c/e2dd46da
[4/7] coresight: perf: Support AUX trace pause and resume
      https://git.kernel.org/coresight/c/e2033fe3
[5/7] coresight: tmc: Re-enable sink after buffer update
      https://git.kernel.org/coresight/c/10b9a3bc
[6/7] coresight: perf: Update buffer on AUX pause
      https://git.kernel.org/coresight/c/54c02302
[7/7] Documentation: coresight: Document AUX pause and resume
      https://git.kernel.org/coresight/c/3b0b40d8

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>
