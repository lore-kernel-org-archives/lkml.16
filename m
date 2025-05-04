Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD94219FC;
	Sun,  4 May 2025 17:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746381065; cv=none; b=SG9zPilwx+YhF4ziNmc7nUt3v2yTGoqzTSrAjEEVfb3idDZWdn9bBMFExjMYjiIwI9k7XonuTff+JKMqxFlx5gQEckc7+aCPDDmbDIE9lkBWzWB0MJzqITgfLS9IBc7o3vOHb1829+6sY5CN89ZUr/4PlWVZF2EHBVVr/B2v47U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746381065; c=relaxed/simple;
	bh=LYejNqAF7mFzd0DoH7tOPP4SnFsHrCVcN3FViu8lKHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnlrlhcsIFZxG9FQrohn4yNapTIzC9eOg7W4eh/qcglHZTiSqF2R4UhCPebAqPmouIo8V/z1C1BQlXu++/SMkH168mrNPMDamAlRjondPa7Et+DyUfwnRyBaSTYzb0LUOmVe4OCejqIN7f1XhWzlwy9/OiQcjmgFu+d43yIR5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oyoYjb+0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oyoYjb+0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB47C4CEE9;
	Sun,  4 May 2025 17:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746381064;
	bh=LYejNqAF7mFzd0DoH7tOPP4SnFsHrCVcN3FViu8lKHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oyoYjb+00MS71Q1iEk+OZBdQdzv3hJZH9AYOTLjTgobvvSOWWAt5SSyTEDzWUHKXG
	 IDRQDFJ4mi7FTPnvjPNuS0DlrDZWPAocIBHmyqTc4W1SN2HOpr9r0TUuAU8kCGPu8W
	 j/rQ/uvoXfe+r3+9FbJYbBW05pgcAFcXTFE8uWwvQx+7dCtGqAjMa4vFyPRbksUD+i
	 dyoE5BFbWZszw2TdNW4VMDwKKMawIb8HB90e+0Sl5JBP53EKpI6klJYcYc2SnPN054
	 LGW4IR1N8ug1qfZMexYflJ6hAlHDkt5V0NHHdLI8sqygyFHX8nl3z56fMuTTLXx7+f
	 GoT/LsOGNdoXQ==
Date: Sun, 4 May 2025 19:51:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alireza Sanaee <alireza.sanaee@huawei.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, 
	jonathan.cameron@huawei.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linuxarm@huawei.com, mark.rutland@arm.com, 
	shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v2 6/6] of: of_cpu_phandle_to_id to support SMT threads
Message-ID: <20250504-acoustic-skink-of-greatness-1e90ac@kuoka>
References: <20250502161300.1411-1-alireza.sanaee@huawei.com>
 <20250502161300.1411-7-alireza.sanaee@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250502161300.1411-7-alireza.sanaee@huawei.com>

On Fri, May 02, 2025 at 05:13:00PM GMT, Alireza Sanaee wrote:
> Enhance the API to support SMT threads, this will allow sharing resources among
> multiple SMT threads.

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC (and consider --no-git-fallback argument, so you will
not CC people just because they made one commit years ago). It might
happen, that command when run on an older kernel, gives you outdated
entries. Therefore please be sure you base your patches on recent Linux
kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about 'b4 prep --auto-to-cc' if you added new
patches to the patchset.
</form letter>	

> 
> Enabled the sharing of resources, such as L1 Cache and clocks, between SMT
> threads. It introduces a fix that uses thread IDs to match each CPU thread in
> the register array within the cpu-node. This ensures that the cpu-map or any
> driver relying on this API is fine even when SMT threads share resources.
> 
> Additionally, I have tested this for CPU based on the discussions in [1], I
> adopted the new cpu-map layout, where the first parameter is a phandle and the
> second is the local thread index, as shown below:
> 
> In the CPU map, there are two cases that only one occurs at at time.
>     1) "cpu" = <phandle>
>     2) "cpus" = <phandle> <index>
> 
> The first case addresses non-SMTs and the second case addresses SMTs
> that the variable must be cpu(s) with an index where we later look up
> the reg array with that.
> 
>     core0 {
>       thread0 {
>         cpus = <&cpu0 0>;

Not so sure, dtschema says only one item is allowed in the phandle and I
do not see here binding change.

Although this wasn't even sent to me, so I'll just ignore your patchset.

Best regards,
Krzysztof

