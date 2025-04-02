Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0551426C;
	Wed,  2 Apr 2025 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743609967; cv=none; b=czgVRcCgDfdkuwXj4LjAXKItvtGE+RzlVbg5APaYslUhcXPeLp8BiSARWCFdYIbEeQcAROmajUoOD/reZZ84gW+mkt0QyI+D2b3SsEo/SXd32d/nO+cBGJ+lCJN0psZ9E6CEhkm7u8Mkw265sY84YIwiySG0dEpUx9fjx9d9nk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743609967; c=relaxed/simple;
	bh=Pjo9Cn3e3o3jc1zq/ExObbxuNm1gy3B7kVBUhAVhiPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p+joM/+Nr/24R0HsOkk9ptLdKEyDPZGy7FQ3zg5YJRdxkB9XkBoFEvDEX7GbaGS180rRTTTiaCHxjZ+xELt6mYvoDNq+Xko5RrBGRI7isOh+9umDtPzNO+VuKlSokFykJ6EBr14LiOR8oIeJjG8kgzVAv7swJKqtgUnCNK/o/e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 63940106F;
	Wed,  2 Apr 2025 09:06:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E0CAE3F63F;
	Wed,  2 Apr 2025 09:06:03 -0700 (PDT)
Date: Wed, 2 Apr 2025 17:05:55 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Matthew Bystrin <dev.mbstr@gmail.com>, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH] firmware: arm_scmi: add timeout in
 do_xfer_with_response()
Message-ID: <Z-1gY8mQLznSg5Na@pluto>
References: <20250402104254.149998-1-dev.mbstr@gmail.com>
 <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402-hidden-unyielding-carp-7ee32d@sudeepholla>

On Wed, Apr 02, 2025 at 11:59:47AM +0100, Sudeep Holla wrote:
> On Wed, Apr 02, 2025 at 01:42:54PM +0300, Matthew Bystrin wrote:
> > Add timeout argument to do_xfer_with_response() with subsequent changes
> > in corresponding drivers. To maintain backward compatibility use
> > previous hardcoded timeout value.
> > 

Hi Matthew, Sudeep,

this is something I had my eyes on since a while and never get back to
it....so thanks for looking at this first of all...

> > According to SCMI specification [1] there is no defined timeout for
> > delayed messages in the interface. While hardcoded 2 seconds timeout
> > might be good enough for existing protocol drivers, moving it to the
> > function argument may be useful for vendor-specific protocols with
> > different timing needs.
> > 
> 
> Please post this patch along with the vendor specific protocols mentioned
> above and with the reasoning as why 2s is not sufficient.

Ack on this, it would be good to understand why a huge 2 secs is not
enough...and also...

> 
> Also instead of churning up existing users/usage, we can explore to had
> one with this timeout as alternative if you present and convince the
> validity of your use-case and the associated timing requirement.
> 

...with the proposed patch (and any kind of alternative API proposed
by Sudeep) the delayed response timeout becomes a parameter of the method
do_xfer_with_response() and so, as a consequence, this timoeut becomes
effectively configurable per-transaction, while usually a timeout is
commonly configurable per-channel, so valid as a whole for any protocol
on that channel across the whole platform, AND optionally describable as
different from the default standard value via DT props (like max-rx-timeout).

Is this what we want ? (a per-transaction configurable timeout ?)

If not, it could be an option to make instead this a per-channel optional
new DT described property so that you can configure globally a different
delayed timeout.

If yes, how this new parameter is meant to be used/configured/chosen ?
on a per-protocol/command basis, unrelated to the specific platform we run on ?
 
Thanks,
Cristian
