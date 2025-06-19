Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFC623BF9F;
	Thu, 19 Jun 2025 15:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750347743; cv=none; b=Ec1R1RR3CxfauJJGahrRa697JUjBe27sX72NmGaO0LcwTPP9sm4rBSeXX8jDxi5Agne/ysFnlybiLaGw78IXUp2inn3wuMmzyvR2FLx6COK+a14qHU5o7qQf6xvaGTXf1JHStLSyf2/4rCaQs4EcsyJ2ghOHL1DDSW0y3+C4bNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750347743; c=relaxed/simple;
	bh=F7c4bHewCgBdtpNsuT/O7caWd/v5fDAoW+hiBxnfJcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=cRQAmQSHzXKzZe1p/LDImd6t60Y6nCgRS0h0Qhea+pk/Rdp2A9Q8wFvqqBiZstrmUa+16BAFitmKW20AquPn+m+nqi/P/cH6stJrsI+0msNKcywVKUmajc9CC2xZzAj4P59qHAtjKt59uuzjWYPEawyC3At40uw8LO/VmEnRtXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1BA1113E;
	Thu, 19 Jun 2025 08:41:59 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F30F3F58B;
	Thu, 19 Jun 2025 08:42:18 -0700 (PDT)
Date: Thu, 19 Jun 2025 16:42:10 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <Philip.Radford@arm.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, cristian.marussi@arm.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org
Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
 functionality
Message-ID: <aFQv0rwS3PwyTeG7@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR08MB99669F0D3EB80C4ACAA90DFA897DA@PAWPR08MB9966.eurprd08.prod.outlook.com>

On Thu, Jun 19, 2025 at 04:13:57PM +0100, Philip Radford wrote:
> > -----Original Message-----
> > From: Dan Carpenter <dan.carpenter@linaro.org>
> > Sent: Thursday, June 19, 2025 3:38 PM
> > To: Philip Radford <Philip.Radford@arm.com>
> 
> Hi, 
> 
> > Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; arm-
> > scmi@vger.kernel.org; Sudeep Holla <Sudeep.Holla@arm.com>; Cristian
> > Marussi <Cristian.Marussi@arm.com>; Luke Parkin <Luke.Parkin@arm.com>
> > Subject: Re: [PATCH 4/4] firmware: arm_scmi: Add new inflight tracing
> > functionality

Hi Phil,

please reply to all the recipient of the original mail-thread when answering a
review, so we remain on the list. (mutt -> g .. I think :P) 

(I added the CCs to this)

Thanks,
Cristian
