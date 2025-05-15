Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8E47261A;
	Thu, 15 May 2025 13:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317578; cv=none; b=W2ay7F5vnjeMxU449c9NCB9C41TBmAP5kQ2lUge+sbFlkS3ltwJ0psYGWp0w62a93s0eaH8VRJvWxeNm/lch9+tu3V4XGHDkh/SpD33iFWvVaa40CGJ3vYak+uh5HeKUf52FwSMADJVYjQIOUaY8MvDFK64QIN0sZQXZU2xsPZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317578; c=relaxed/simple;
	bh=6JLKEghaGM1X6LutsUagYtpBfpLfq1WI0NDNTcCYrME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J9QZNsywMVL6vKGlFnQChwhocL8toUCcBsag80FdhrlDHXJKQKB9q9SqLMfHcmnUUv0ccUBN7RF5GXeuAF44mY5ln4IRlP1nGaAznBJqR/LZ6scbgU9L9viEqrn1QKN2qHbtkLYhZ/Wr9BMPpE4uZ64I90lqjF0e9jpMR0DkVb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D858C14BF;
	Thu, 15 May 2025 06:59:22 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4F8C53F673;
	Thu, 15 May 2025 06:59:32 -0700 (PDT)
Date: Thu, 15 May 2025 14:59:24 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: long.yunjian@zte.com.cn
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, peng.fan@nxp.com,
	justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
Message-ID: <aCXzPGvPayVyiMHG@pluto>
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>

On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
> From: Yumeng Fang <fang.yumeng@zte.com.cn>
> 

Hi,

> In the probe path, dev_err() can be replaced with dev_err_probe()
> which will check if error code is -EPROBE_DEFER and prints the
> error name. It also sets the defer probe reason which can be
> checked later through debugfs.

All true...but...if you look at the main scmi_probe() function all of these
failures are trapped at that level currently on the return path...

see the call chain from

scmi_probe()
	....
	ret = scmi_channels_setup(info); 
	...

...so your probe errors will be overridden there with a more generic message
left in debugfs at the top level.

Thanks,
Cristian
