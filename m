Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF5C25DAF4;
	Wed,  9 Apr 2025 10:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196092; cv=none; b=jrVjMOIZLnpsrLpDvWxcBYXkYOm/JIbu9OjApWKo9wxUap9ALocTKo2p3akPh+2CUgWmjvZB4AWvZnk4ezFgBEUoies/kifO7saU6s+BADMFot6LCbhf0AdzVbTjSfFxO1GmEoUk/Z/Xxxixsjcqi0ee0yy058BNrbz9RsMNCUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196092; c=relaxed/simple;
	bh=0hk/XJsEEPgQAdzlnsrmd34v4ducnJiXKdi+3uwsWfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5BUQ5s8E76LJDeuKvLQbRlaLDn+pqW34Zhw2+TaCXVm22fXCx03F/p3woI8woPKtNyNsZlkAG1vwAIOn+MAf/98V0LES7RWEOATpydv7eze+Ht6uVuBxQmtmP3tA58f+6wR2xDZMC1qMYWpK+grcvrUKMoh9bzzTZlaB8uWlfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3CFC81595;
	Wed,  9 Apr 2025 03:54:50 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 533103F694;
	Wed,  9 Apr 2025 03:54:48 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:54:34 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z_ZR2WNBwfQqLQMd@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <D91JD15NY3Y0.23E428W332D@gmail.com>
 <Z_ZRXBed2WVZ_O8Q@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_ZRXBed2WVZ_O8Q@pluto>

On Wed, Apr 09, 2025 at 11:52:12AM +0100, Cristian Marussi wrote:
> On Tue, Apr 08, 2025 at 11:22:38PM +0300, Matthew Bystrin wrote:
> > Sudeep, Cristian,
> > 
> 
> Hi,
> 
> > Gentle ping.
> >
> 
> we replied already...both of us :P
> 
> https://lore.kernel.org/arm-scmi/20250402104254.149998-1-dev.mbstr@gmail.com/
> 
> Maybe in your spam folder ?

Wait...I have just seen Peng's reply mentioning some reply of yours,
which I never saw ..  maybe MY spam folder :P ....jeezzz...

Thanks,
Cristian
