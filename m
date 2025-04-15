Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81F11224AE9;
	Tue, 15 Apr 2025 18:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744742379; cv=none; b=kOCEf+Q+umCRmil6u65ekxorFzRyHupw06jpM18Faq/NkxEsT3flgWJP+zEFswfrj+6cgyJtC7UVE9ZG7T6R1YmpepEEA2yBqimht7JPVI+wFc5cW9IEQNfu4j6oB5MlP4xaImAcUAWtYUbcQXeIFeozy2Paxlio3DhugHhYrKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744742379; c=relaxed/simple;
	bh=/QYShN7IRJ3g7iXE3mqIafeBXdL5DRR76aNqimwoUxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJRP1JUMg71neYXtm8fv8XMGGs3Vm6/mZ9lXmmiOF57P6cnIEPYeO7dTuJPH/TGOImnSsMfj6WBNH/upZoi91klpI4pwT5xPJtoV94PHuPWN8Qs6kxIaZwb/Wb1BVMiQdKP0XQf1ocAdr7l0XeG+DtNt5cNOao/QCY2Fst7wdIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6CE51756;
	Tue, 15 Apr 2025 11:39:34 -0700 (PDT)
Received: from bogus (unknown [10.163.48.215])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 23D2A3F694;
	Tue, 15 Apr 2025 11:39:26 -0700 (PDT)
Date: Tue, 15 Apr 2025 19:39:21 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peter Chen <peter.chen@cixtech.com>
Cc: soc@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, jassisinghbrar@gmail.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	maz@kernel.org, kajetan.puchalski@arm.com,
	Guomin Chen <Guomin.Chen@cixtech.com>,
	Gary Yang <gary.yang@cixtech.com>,
	Lihua Liu <Lihua.Liu@cixtech.com>
Subject: Re: [PATCH v6 06/10] mailbox: add CIX mailbox driver
Message-ID: <20250415-beryl-malamute-of-kindness-7fba06@sudeepholla>
References: <20250415072724.3565533-1-peter.chen@cixtech.com>
 <20250415072724.3565533-7-peter.chen@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415072724.3565533-7-peter.chen@cixtech.com>

On Tue, Apr 15, 2025 at 03:27:20PM +0800, Peter Chen wrote:
> From: Guomin Chen <Guomin.Chen@cixtech.com>
> 
> The CIX mailbox controller, used in the Cix SoCs, like sky1.
> facilitates message transmission between multiple processors
> within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> and others.
> 

Do you have a specification for this mailbox ?
I see lot of resemblance with Arm MHUv3. Is this a variant of it ?
I just don't want to see a separate driver for a small tweak of MHU v3 IP
itself.

-- 
Regards,
Sudeep
