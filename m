Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B96017BA5;
	Thu, 26 Jun 2025 11:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750937876; cv=none; b=D+xDiVyEyigeUCar+U+WZJ+ECjaur3Uk2DrRt1Oa1MiMyCV1cpUePUH3vGGwT1WwxXzWmcrVLmp/Sk8PDgFPDFoV5j9zlxRV4LNw1oK5rTAkhFY5uCWjj72LoqqFyh8M11Q/x0Rau3CdlHxYF5pMkqoeL7/89PRG81tNb+ph1ME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750937876; c=relaxed/simple;
	bh=OxSp24ehYJCWG4GRUU+sW1cFcYh5GDIP0beTpX6pq5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gXwkwXjzDeU7dZZP9U5SNg/TAFw2mniTf/jLhfvDA1na9chdFOPEhYuAGIDwHhqrpxGZpaPgf0xcsPFbxyN/NYWwHxU6KCyTRN1S62jDtvd9eM+ri7r4NWe592W/7C2e8JKF+H9VIdpynBNSNHg73qcJ0Q0S1CYcZNz/R9rXK/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECAB01758;
	Thu, 26 Jun 2025 04:37:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 45B633F63F;
	Thu, 26 Jun 2025 04:37:52 -0700 (PDT)
Date: Thu, 26 Jun 2025 12:37:49 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Philip Radford <Philip.Radford@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	Sudeep Holla <Sudeep.Holla@arm.com>,
	Cristian Marussi <Cristian.Marussi@arm.com>,
	Luke Parkin <Luke.Parkin@arm.com>
Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and trace
Message-ID: <aF0xDdajKkoa4dXU@pluto>
References: <20250619122004.3705976-1-philip.radford@arm.com>
 <20250620084634.GB27519@nxa18884-linux>
 <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAWPR08MB9966E79130C52CA8460AC4B7897CA@PAWPR08MB9966.eurprd08.prod.outlook.com>

On Fri, Jun 20, 2025 at 10:27:52AM +0100, Philip Radford wrote:
> 
> 
> > -----Original Message-----
> > From: Peng Fan <peng.fan@oss.nxp.com>
> > Sent: Friday, June 20, 2025 9:47 AM
> > To: Philip Radford <Philip.Radford@arm.com>
> 
> Hi,
> Thanks for the review.
> 

Hi,

> > Cc: linux-kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; arm-
> > scmi@vger.kernel.org; Sudeep Holla <Sudeep.Holla@arm.com>; Cristian
> > Marussi <Cristian.Marussi@arm.com>; Luke Parkin <Luke.Parkin@arm.com>
> > Subject: Re: [PATCH 0/4] firmware: arm_scmi: Add xfer inflight debug and
> > trace
> > 
> > On Thu, Jun 19, 2025 at 12:20:00PM +0000, Philip Radford wrote:
> > >Hi all,
> > >
> > >This series adds a new counter to the Arm SCMI firmware driver to track
> > >the number of in-flight message transfers during debug and trace. This
> > >will be useful for examining behaviour under a large load with regards
> > >to concurrent messages being sent and received. As the counter only gives
> > >a live value, printing the value in trace allows logging of the in-flight
> > >xfers.
> > 
> > Just a general question, is this counter count in flight messages
> > for a scmi instance or it is per transport? I ask because
> > one scmi instance could have multiple mailboxes. If counting based
> > on scmi instance, it may not be that accurate.
> > 

... so that is a good point ...
...thanks Peng for pointing out this first of all...

So, in general all of these counters are per-instance, we don't have any
finer per-channel granularity....we could in the future split them out
to be per-channel counters, but I wonder if it would be worth the
effort: because, as I see it, errors reported by these counters are more
of a alarm-bell than a triage tool, in the sense that I would expect
that seeing a lot of errors of some kind on an instance should just act
as a warning that something is NOT right somewhere, so that you can
investigate further by enabling the already existent and more comprehensive
SCMI trace events to fully inveestigate the problem...since SCMI full event
traces DO also include the used-channel beside a lot of other info about
the xfer transactions.

Moreover, in the specific case of tracking inflight xfers, note that
the counter added in this series tracks the pool of xfers allocated in
tx_minfo(A2P) free-lists (i.e. commands...P2A msgs hardly can be lost),
BUT this structure is per-instance (NOT per-channel), so even if you had
say a few more dedicated per-protocol channels defined on a system,
all the A2P transactions will pick their xfers from the same per-instance
pool... (..because the max_inflights is meant to cap the maximum number
of outstanding transactions that the server has to cope with...)

Thanks,
Cristian
