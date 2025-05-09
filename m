Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9C823D2A0;
	Fri,  9 May 2025 14:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746799803; cv=none; b=LQcTEpQfC1BquxfcSiy5EB9eqPAxyEF9Sa97GmJFfM2ht/n5NZCi+5HGn1pKOq1liaFBjmFrZBY89n7evAScdw5WK+6DZzcSShAET2KaKxHqFAUG9P3qItxWOltuGumTD9ycN1J3b8Pkx+/bzOzAtZ9LmSC7MHM9WHO1j0xltOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746799803; c=relaxed/simple;
	bh=af+UlDGvEnPRHtlg072O638zTmK/MXsSHJDlxvwBJf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CxbBZ2OaIZJSA0sckkJtcvMOEh60APDSK3aSktWqlnO1Xv9e5jQIPCtSahdTlty8l533Q+DtSIj2JhHL6+pNvBmQ5cZ4uqLykQVv0QiCBY7QOj/u36slC6il/3DCZt6c45DhzXWCDRp3YNhmSuEoNgEXQJREmQhfCG71enb4kac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QSn1GeRA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QSn1GeRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82DCC4CEE4;
	Fri,  9 May 2025 14:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746799802;
	bh=af+UlDGvEnPRHtlg072O638zTmK/MXsSHJDlxvwBJf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QSn1GeRA97cqq51SKJmTesTao/PVP6KsOEfzr+w/mw17GqaagBvS2bM/q9mHW4wJE
	 LTtKGeDHXQAEULp1Vj+kEJC+LatnYuSrgdfcqPeZnk5V63kky1krpp8+MqOkgSMLUG
	 B22zzyrArvjfx9gwzd7wSaPGhe14z6SUbvQi8T7FxfyPbk/Yv70fdKAWTmGISgqr0O
	 8gCBoipnMeq3taS7XLYsZSJBg1wVWLPQw7qS9WHroHDYA/R+skWOlLBYY+RCyUYYkv
	 eF66o+R7K9eqc30XLBCGp16bVvOBBxzO6eqRcyx5UXQiLZe7hIEf1HC8rvm8CIPDZY
	 6DR0TAGvVSBWg==
Date: Fri, 9 May 2025 15:09:57 +0100
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 4/9] mfd: bcm590xx: Add support for multiple device
 types + BCM59054 compatible
Message-ID: <20250509140957.GD2492385@google.com>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
 <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430-bcm59054-v8-4-e4cf638169a4@gmail.com>

On Wed, 30 Apr 2025, Artur Weber wrote:

> The BCM59054 is another chip from the BCM590xx line of PMUs, commonly
> used on devices with the BCM21664/BCM23550 chipsets.
> 
> Prepare the BCM590xx driver for supporting other devices by adding the
> PMUID register values for supported chip types and store them in the
> MFD data struct as "pmu_id". (These will be checked against the actual
> PMUID register values in a later commit.)
> 
> Then, add a DT compatible for the BCM59054, and provide the PMU ID as
> OF match data.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Move PMUID value to MFD header
> - Use PMUID value as OF data/device type value
> - Add bcm59054 to I2C ID table
> 
> Changes in v4:
> - Rewrite commit message description
> - Rename "device_type" member to "dev_type"
> - Drop awkward line break to fit function call
> - Add PMU ID/revision parsing function
> 
> Changes in v3:
> - Fix compilation warning about device_type pointer cast type
> - Name the device types enum and use it as the type in the MFD struct
> ---
>  drivers/mfd/bcm590xx.c       | 12 +++++++++++-
>  include/linux/mfd/bcm590xx.h |  7 +++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)

I can't merge this until Mark has provided the Regulator Acks.

-- 
Lee Jones [李琼斯]
