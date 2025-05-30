Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94507220F2A;
	Fri, 30 May 2025 12:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748609302; cv=none; b=tRcJfERw7UwNro1Lqv6/SOpVziDyZZkbxSiqToWTrPqP6IPao1xhqXQcbt7FABa2kV2apo8OSz3olxJUH2DH8Mn7MAq92+kAr1agYjcuDt//XIHkAHZIWJwZBHUVahV/uPGPKkniEKP2ZYaAplsIodydzy6JVcNTtDAcwyopyOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748609302; c=relaxed/simple;
	bh=Uu+J/75Y+APjxjZJb6aUuW0stGXdqjKN2PzkX66KaoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FPWWex+ybaOtTA8xogcsoNifwazlM355Vhq5PBuyc/yT27Y8bNymxEi2eKeQAQ/mrjnskOHT2zqFaHvFzNQV5b6c3n3LLefxcdWl04LririCFsQqdw2JrdI4JZ50AdgM1C6JV5pp87gB0PYf/fojlFnXmL5yeUdmiWYlGm5rkA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E62F16F2;
	Fri, 30 May 2025 05:48:02 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B243F3F673;
	Fri, 30 May 2025 05:48:17 -0700 (PDT)
Date: Fri, 30 May 2025 13:48:15 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/7] firmware: arm_scmi: move boiler plate code into the
 get info functions
Message-ID: <aDmpD9qz-4RUXvFq@pluto>
References: <cover.1746443762.git.dan.carpenter@linaro.org>
 <8bee4505bdc1d74e62533ed9975dc4500b2cfe53.1746443762.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bee4505bdc1d74e62533ed9975dc4500b2cfe53.1746443762.git.dan.carpenter@linaro.org>

On Mon, May 05, 2025 at 02:37:22PM +0300, Dan Carpenter wrote:
> This code to check whether the selector is valid and if the item has
> already been recorded in the array can be moved to the
> scmi_pinctrl_get_function_info() type functions.  That way it's in
> one place instead of duplicated in each of the callers.

Hi Dan,

thanks for this.

> 
> I removed the check for if "pi->nr_groups == 0" because if that were the
> case then "selector >= pi->nr_groups" would already be true.  It already
> was not checked for pins so this makes things a bit more uniform.
> 
> I also removed the check for if (!pin) since pin is an offset into the
> middle of an array and can't be NULL.
>

A much needed and appreciated cleanup. LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
 
Thanks,
Cristian
