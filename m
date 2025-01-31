Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F6FC1B87E9;
	Fri, 31 Jan 2025 14:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738332631; cv=none; b=BLYWlfqe7q5WVAnNvYxkYYMenVKAfCf5+HbUO8RkewPx+dwkRKPJmChL6X3Sy1ZhhciJHqDxm4a74/jPqZ3f0kFgxvmnmf5DN1/jtyGQrUR0pnhTspNP5puC+5rjhfg0NsdOgPc7OR5OE8qCypYP7fw7zh7rnGxHCqmtNoQgxhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738332631; c=relaxed/simple;
	bh=TEJ45fNosp7BpOTPhXbzgXwToXVydxose2bLKPWbZBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkcKoRHaq3A5Y2z8ldxURafl60eYTiR+GuzepMUmOmNOms8B/a0akcbibs/qDQ7WnbwdP1870K7+DRI+oSbglHxM3JGc7hD/y2VBz7wAw8MMXmjC72sU8hQMqtfFaHBSs2nRp6uiE6iuUf+Ngf8IMKyN46fbGd3ElldssD6cimA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD346497;
	Fri, 31 Jan 2025 06:10:53 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E411E3F63F;
	Fri, 31 Jan 2025 06:10:26 -0800 (PST)
Date: Fri, 31 Jan 2025 14:10:24 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, <arm-scmi@vger.kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH V1] firmware: arm_scmi: Optimize the iteration of
 scmi_requested_devices
Message-ID: <Z5zZ0BnEVKL-vZGa@bogus>
References: <20250107052004.762817-1-peng.fan@oss.nxp.com>
 <Z5t5l9MXsAzg5VIp@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5t5l9MXsAzg5VIp@pluto>

On Thu, Jan 30, 2025 at 01:07:35PM +0000, Cristian Marussi wrote:
>
> ... having said that, I cannot really recall WHY I decided to avoid ANY
> kind of duplicate naming given that teh match happen by proto_id/name...
>
> ....maybe just for clarity ? not sure...even what the effects could be
> of having such duplicated names across protocols...
>

Looking at scmi_dev_match_id(), it should be fine even if the names are
duplicated across protocols. We must just not allow duplicates within a
protocol IMO. I will push a patch to handle it soon.

--
Regards,
Sudeep
