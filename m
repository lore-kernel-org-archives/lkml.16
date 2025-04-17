Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6472D35973;
	Thu, 17 Apr 2025 17:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744909477; cv=none; b=ImHfDiWHQ70LtYenFmj3+uNo6CdAxtFNonVut+2O2tJneG99JGDHBfrS58z8hL1mFWOgwlwUGN9/sdqlOq6g/uNeCU4L9VtXfFb7AyOIHC79yUGwqxarx/j8ALKr5/OdTFsTIAQPSBvxN3m1L4K719ntGOTYNK82fGMxvr16CWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744909477; c=relaxed/simple;
	bh=RAgSqwP6v8XUqd0sIEMCAhSCHpxuahOcrR/OC8vTJJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk1y/Ss4DoJhuCu5eqt9qcJDlWhbahLHBDAmVa2g77M90XCCUCRA+Tt1CQzcr7GbZLlB6xANlA7U61heAAqwVRVdcJT/fwcmIExYZtPFUc23sA8en/Qfsf2hq9rNS9/zE7nz7wOtgZEkgopV9xIDKT/J3c+N1o5z/b63vhBKsVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePQEbWRz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePQEbWRz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA99AC4CEE4;
	Thu, 17 Apr 2025 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744909476;
	bh=RAgSqwP6v8XUqd0sIEMCAhSCHpxuahOcrR/OC8vTJJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePQEbWRzWefj/7Ht6qipf1HfTKXla7WSlFH3FZCWrp5rKQ0SHVy2GG8StxLrYpQ1I
	 2BUQIDKLUacHMfI6+P7WOkAgPMPYwCf6jPNEtr2fM86ilRrqWPxyw7xZg5Bmr2Yc3u
	 uybZlR7iTPE4RCK2neY51RGaFtOQVdRwVQSb8N7CebOZa6gIhvOMJUevncWiwlpnH8
	 IMMzQ4P4Bl6FovKQA7ryBkS8hWACCl35WC13H8TEebi8OP2S/hncJMqhYtkfrCAguR
	 s4EVKqXvQSg34RVUOx5rj5jXTdKyhdnzvvedgk+wRjxVASn3LJh60S754Y3AHQvclW
	 QU3DzGsaym3Sw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5SfF-000000005Ch-1biL;
	Thu, 17 Apr 2025 19:04:37 +0200
Date: Thu, 17 Apr 2025 19:04:37 +0200
From: Johan Hovold <johan@kernel.org>
To: quic_sibis@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org, maz@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore
 FC bit in attributes
Message-ID: <aAE0peT-Fk7TZGGo@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-5-cristian.marussi@arm.com>
 <Z__WyYWhelFwt-rQ@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__WyYWhelFwt-rQ@hovoldconsulting.com>

Hi Sibi,

On Wed, Apr 16, 2025 at 06:11:54PM +0200, Johan Hovold wrote:

> Interestingly, I'm no longer seeing the crash on x1e without the quirk
> enabled with 6.14 and 6.15-rc2.
> 
> I still hit it immediately with 6.12 and 6.13 when accessing the cpufreq
> sysfs attributes (with patch 1/4 applied):
> 
> 	[   30.663577] arm-scmi arm-scmi.0.auto: timed out in resp(caller: do_xfer+0x164/0x564)
> 
> So presumably something changed in 6.14 that masks the earlier issue
> when falling back to regular messaging.

I just realised that this was due to a local change in the 6.14 and
6.15-rc trees I used for testing. Without it the crash still happens
with 6.15-rc2.

Sorry about the noise.

Johan
