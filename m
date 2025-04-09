Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621E725D911;
	Wed,  9 Apr 2025 10:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195955; cv=none; b=jdEWkdIq8V7318giSWxUJ6LVigjQR/eLzmMaQ99J19kYl0Zwt5wbY7jQIQ13ovhzI0ZejW9gEm0ksGVUllq8dCAE3NCfWqZvoNckSEycAPNglvqUBKGxZP/B3nleEvFL5GgG6T2Df+2fDW9w1O86L0BPeTPXG05km5ei6aoYJWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195955; c=relaxed/simple;
	bh=p6GeSCt9NyeEoq+z0pocbYa/6DI/+OZ7c6IReptS5X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gZ82KzQSIZ+HBisb1nyGAh4jF8eikx6zKN1BzG2sjq6B1yXhAq/fohemf+Jn2pxCs7JGClJg7IBLR3S1sAmBmjZO74horxKFnejQmsJ081HpaQp4HW7yQ4LFa/M0t+HijU05LqebDGe4TvEATXlbgoSJJWb8ga8lCFWeUYrEKCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEAB71595;
	Wed,  9 Apr 2025 03:52:32 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 340D73F694;
	Wed,  9 Apr 2025 03:52:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:52:12 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Matthew Bystrin <dev.mbstr@gmail.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z_ZRXBed2WVZ_O8Q@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
 <Z-1gY8mQLznSg5Na@pluto>
 <D8X9JJGPGDNL.1OTKIJODRFKNN@gmail.com>
 <D91JD15NY3Y0.23E428W332D@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D91JD15NY3Y0.23E428W332D@gmail.com>

On Tue, Apr 08, 2025 at 11:22:38PM +0300, Matthew Bystrin wrote:
> Sudeep, Cristian,
> 

Hi,

> Gentle ping.
>

we replied already...both of us :P

https://lore.kernel.org/arm-scmi/20250402104254.149998-1-dev.mbstr@gmail.com/

Maybe in your spam folder ?

Thanks,
Cristian
