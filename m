Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D74C1F419A;
	Fri, 11 Apr 2025 14:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380685; cv=none; b=jw6wTnQr35M3s5J8Av2fvVXQ8k0zqPFJx8GPoa1fWyTT/qmAwnFVrdM7oyxrWQTESg49kz6supSxcsu8CKxDz6eFV2lGpPmxEQVJWAClnO2I4mmvVgNp2Z4e44KcozTy8dLUlKPq3E9c10oj+c2jlNKrJ1osNlG69/LleUSuUYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380685; c=relaxed/simple;
	bh=5zIdDFQZZqaS03ET2qI38HnNQNKwoScGOPOprS5OCeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQyqPmKW0I6xEQyGN5AAXXAkbJ9ELAMIPWlSzpHwW51qYk2m2mfxdWTFXEi+L27BKHcPOFg+kH72xlnTNwz1ApXDnlWjscQ08nfVdqT6jds5pgiqX/tICpQNXlVhK5U+Syv8bzbGM+kys04JLhiz1e/wuKmucD96KEm/ZULxcAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 208BE106F;
	Fri, 11 Apr 2025 07:11:22 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 694143F694;
	Fri, 11 Apr 2025 07:11:21 -0700 (PDT)
Date: Fri, 11 Apr 2025 15:11:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Sudeep Holla <sudeep.holla@arm.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (xgene-hwmon) Simplify PCC shared memory region
 handling
Message-ID: <20250411-knowing-ebony-rook-93d5df@sudeepholla>
References: <20250411112053.1148624-1-sudeep.holla@arm.com>
 <ef19ce31-fb9a-455b-8db9-f803154f8723@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ef19ce31-fb9a-455b-8db9-f803154f8723@roeck-us.net>

On Fri, Apr 11, 2025 at 07:03:37AM -0700, Guenter Roeck wrote:
> On 4/11/25 04:20, Sudeep Holla wrote:
> > The PCC driver now handles mapping and unmapping of shared memory
> > areas as part of pcc_mbox_{request,free}_channel(). Without these before,
> > this xgene hwmon driver did handling of those mappings like several
> > other PCC mailbox client drivers.
> > 
> > There were redundant operations, leading to unnecessary code. Maintaining
> > the consistency across these driver was harder due to scattered handling
> > of shmem.
> > 
> > Just use the mapped shmem and remove all redundant operations from this
> > driver.
> > 
> > Cc: Jean Delvare <jdelvare@suse.com>
> > Cc: Guenter Roeck <linux@roeck-us.net>
> > Cc: linux-hwmon@vger.kernel.org
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> >   drivers/hwmon/xgene-hwmon.c | 39 ++++---------------------------------
> >   1 file changed, 4 insertions(+), 35 deletions(-)
> > 
> > Hi,
> > 
> > This is just resend of the same patch that was part of a series [1].
> > Only core PCC mailbox changes were merged during v6.15 merge window.
> > So dropping all the maintainer acks and reposting it so that it can
> 
> Why drop my Ack ? To have me review it again ?
> 

I should have explained why. I assumed you would apply and hence would
sign off anyway. I was just trying to avoid you having to drop that when
applying with some tool. I wasn't expecting you to review again, sorry
for not making that clear.

> FWIW, I had expected that the patch will be picked up with the series.
> 

Yes, me too. But Jassi applied only mailbox changes and I noticed that
only in his pull request.

> Anyway, applied.
> 

Thanks!

-- 
Regards,
Sudeep
