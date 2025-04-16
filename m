Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE41ADC78;
	Wed, 16 Apr 2025 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744819916; cv=none; b=HQkZrNEWsmLk20NhO4/FC9lbUa86+sM7Kvf1dhQs5YLpAI9NwQyvQJw694Xd6EChgFynLodI+VHtMJg5GQLsjpdBcXshujeQ6Yh1+Dq+/FO4YUKzxJoobiR+BqT4ld9Biv0Qvqb8Z8gUWwHvYzkj97X55s3DOcVbq5qNxBlcBLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744819916; c=relaxed/simple;
	bh=sWaORZRshemWzFZsKcditOWZrjblebMb5oMGJ741IuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ntoRcM1uWTB2AxhkaLk7GWdp1nKqAW7QAdS9sFOh03OVwk1yY5v/HYuiI9He6m7iitk3ewpb6RU9Zds5yf4TJZRwx67A83GNoD8gvXKeYW6h/Qs/TmSuQrEyeg4oFYM8vdFWQ1BAOlsvn0kV6HunmlF6+60nDFByTQpURRA78rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WJOu70q+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WJOu70q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4031C4CEE2;
	Wed, 16 Apr 2025 16:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744819915;
	bh=sWaORZRshemWzFZsKcditOWZrjblebMb5oMGJ741IuE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WJOu70q+hUr+FrrsYKfyAYk2FRTygiV3pqZrHh3duEgpxfDeMCiEocwS3ZzGbpGzB
	 ttvf24I0+PRyGcvM2vRAcvD1Fy9qGq1nLXAeTlhDAtFgpvT44uqsuEJSksnk1RL83l
	 YgkEBNcTXkJpDG/O7YEtDJy08ieOYkYqraRntir8y+ApmSslGrTFUTKZaTyqkJToq4
	 50sadUVwjRZkjILE3URn1slF4omwTnJP1B1kkQ6ZOpeSbMs4IOvgZKpjoJ5+p5Ewzo
	 aVYvKIeUVuXCiMRpTSh0etKXMR+R4CVR77h0/PxxzdNaK98otjOxFSO4S3XyFdH7a8
	 3whu3KtDMiJAA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u55Mf-000000007Pv-3BLb;
	Wed, 16 Apr 2025 18:11:54 +0200
Date: Wed, 16 Apr 2025 18:11:53 +0200
From: Johan Hovold <johan@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [PATCH 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore
 FC bit in attributes
Message-ID: <Z__WyYWhelFwt-rQ@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-5-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415142933.1746249-5-cristian.marussi@arm.com>

On Tue, Apr 15, 2025 at 03:29:33PM +0100, Cristian Marussi wrote:
> Some platform misreported the support of FastChannel when queried: ignore
> that bit on selected platforms.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Match features has to be set-up properly before upstreaming this.
> Ideally the out-of-spec firmware should be matched with a quirk matching
> pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> platform at hand will ship with future fixed firmwares where the ImplVersion
> field is properly handled.
> If we cannot be sure about that, we should fallback to a compatible match.
> 
> RFC->V1
> - fix QUIRKS conditions

This looks good to me now and works as intended after updating the
vendor name:

Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
Tested-by: Johan Hovold <johan+linaro@kernel.org>

Interestingly, I'm no longer seeing the crash on x1e without the quirk
enabled with 6.14 and 6.15-rc2.

I still hit it immediately with 6.12 and 6.13 when accessing the cpufreq
sysfs attributes (with patch 1/4 applied):

	[   30.663577] arm-scmi arm-scmi.0.auto: timed out in resp(caller: do_xfer+0x164/0x564)

So presumably something changed in 6.14 that masks the earlier issue
when falling back to regular messaging.

Any ideas what could have caused this, Sibi?

Johan
