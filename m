Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8A903A1BA;
	Wed, 25 Jun 2025 14:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750863209; cv=none; b=uyTnfIg0Lz0TCi12SXnNPhJ1VZKMhKFMN0HQgahXt9h6NQXWz4jyAnMIR3qCv3u5+6tpUJ8hiX1vG5BxYbvO9C5eQ+X7tzAhejRD0JzMyFKYlO9F2IZlR8KJC7n2vjHOpHDIA+Qrr1Tz+Ia9Fn8MHhvMAHrMG1epN3m289cBl+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750863209; c=relaxed/simple;
	bh=BZTfedCKdq6x+7eR+NF9rZHR9g2/RXBYOmiF0RhPWvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bq9qo00NgVF/74w+/1KE/YoNc3R6Nx1G909PGkZS2KgZXoxVFmFoPY1PE2gBtL4vh+EA/nOEJPXRMvLx9l/1gIfWfgnaD+R7mtbiZ3ttX+jFd4PouQ0mlk6jcWI/mewMfCzJiU4Pylk8T/KVPM0l/mSZynvVsX3Ix7wmpE0LEIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C070D106F;
	Wed, 25 Jun 2025 07:53:08 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F42D3F58B;
	Wed, 25 Jun 2025 07:53:24 -0700 (PDT)
Date: Wed, 25 Jun 2025 15:53:21 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, souvik.chakravarty@arm.com
Subject: Re: [RFC PATCH 0/7] Introduce SCMI Telemetry support
Message-ID: <aFwNYf2T8USGW2au@pluto>
References: <20250620192813.2463367-1-cristian.marussi@arm.com>
 <20250624102233.mdvffjvilozfz25f@lcpd911>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624102233.mdvffjvilozfz25f@lcpd911>

On Tue, Jun 24, 2025 at 03:52:33PM +0530, Dhruva Gole wrote:
> Hey Cristian,
> 

Hi Dhruva,

thanks for leaving your feedback.

> On Jun 20, 2025 at 20:28:06 +0100, Cristian Marussi wrote:
> > Hi all,
> > 

[snip]

> > 
> >  2. an alternative and surely more performant API based on chardev file_ops
> >    and IOCTLs as described fully in:
> > 
> > 	include/uapi/linux/scmi.h
> > 
> >    This, in a nutshell, creates one char-device /dec/scmi_tlm_0 for-each
> >    SCMI Telemetry instance found on the system and then:
> > 
> >    - uses some IOCTLs to configure a set of properties equivalent to the
> >      ones above in SysFS
> >    - uses some other IOCTLs for direct access to data in binary format
> >    - uses a .read file_operations to read back a human readable buffer
> >      containing all the enabled DEs using the same format as above
> > 	<DE_ID> <TIMESTAMP> <DATA_VALUE>
> >    - (TBD) uses .mmap file_operation to allow for the raw unfiltered access
> >      to the SCMI Telemetry binary data as provided by the platform
> > 
> > This initial RFC aims at first to explore and experiment to find the best
> > possible userspace API (or mix of APIs) that can provide simplicity of use
> > while also ensuring high performance from the user-space point of view.
> 
> I think the IOCTL based API and then a userspace tool that can use these
> sounds good for now.
>

Definitely better for performance...

> > 
> > IOW, nothing is set in stone as of now (clearly) some of the alternative
> > options going ahead are:
> > 
> >  A. shrinking the gigantic SysFS above to keep only a few of those knobs
> >     while keeping and extending the chardev API
> > 
> >  B. keeping the gigantic FS for readability, but moving to a real
> >     standalone Telemetry-FS to overcome the limitations/constraints of
> >     SysFS, while keeping the chardev/IOCTL API for performance
> >     (not sure anyway the gigantic FS would be acceptable or makes sense
> >     anyway)
> > 
> >  C. keeping the gigantic FS but move it to debugfs so as to provide it
> >     only for test/debug/devel, while keeping only the chardev/IOCTLs as
> >     the production interface
> 
> 
> As for this series, I would support the motion to move this to debugFS.
> Similar to how we have /sys/kernel/debug/scmi/0/raw ...
> I think grouping telemetry too under the same debug/ interface makes more
> sense to me.
> 

... indeed all of this was initially prototyped under debugfs in

	/sys/kernel/debug/scmi/0/telemetry

The thing is, of course, anything there is doomed to be axed in a
production system....so you would loose the human-readable and easily
scriptable API...while moving to sysfs is probably less of acceptable
for a number of reasons (like multi value files...)

... so for these reasons I would also be tempted by a variation of B:

 - a standlone full-fledged filesystem to overcome sysfs limitations,
   but stripped down a bit to avoid the full-depth of the above sysfs
   tree (say dropping the DEs dedicated subdirectories), and augmented
   with some dedicated file and related IOCTL/file_operations based binary
   interface as described in the current uapi, so as to avoid additional
   dedicated char-devices to cope with

> > 
> > ... moreover we could also additionally:
> > 
> >  D. generalize enough one of the above choices to make it abstract enough
> >     that other non-SCMI based telemetry can plug into some sort of geenric
> >     Telemetry subsystem
> 
> To my knowledge, I don't see that many users of firmware based telemetry similar to how
> SCMI telemetry is being proposed. So maybe at the moment a whole new
> telemetry subsystem might be an overkill.
>

Yes...and  indee  this would be a nice to have, BUT at the moment being SCMI
the one and only user of this new subsystem, I would NOT even have
enough non-SCMI use-cases to look at in order to generalize and abstract
some common features...
 
> > 
> >  E. explore completely different APIs to userspace (netlink ?)
> > 
> >  F. additionally serve some of the DEs in some existent Kernel subsystem
> >     (like HWMON/IIO/PERF...) under the constraint discussed above (i.e.
> >     userspace has to tell me which DEs can fit into which subsys)
> 
> Perhaps in the future...
> 
> As a user, having used hwmon in the past, and also looking at the SCMI spec example
> of capturing the output of a sensor which measures the temperature of a PE
> 
> Here's some points that support that:
> 
> * HWMON is a well-established interface for exposing sensor data (temperature,
> voltage, current, power, etc.) to userspace via sysfs.
> 
> * Many userspace tools (e.g., lm-sensors, monitoring dashboards) already 
> understand HWMON.
> 

Absolutely, but, just to be clear, here I am talking about adding some of
the discovered Telemetry DEs also as additional sensor devices to HWMON,
BUT any existing sensor discovered via the SCMI Sensor protocol (0x15)
which is currently fed into HWMON or IIO will STILL be handled by those
subsystems....

> * Well-known/architected SCMI DEs (like temperature, voltage, power)
> directly map to HWMON sensor types.
> 

...well the thing is, while you can be sure that a DE is a temperature
you cannot automatically be sure of WHAT it is really measuring (name is
also optional) OR if it fits (or you want it to fit) into HWMON or IIO
subsystems...IOW there are NO well-known/architected DE beside a few
general events in the 0xA000-0xA013 range...

> However I can see that we may hit a limitation with that with the amount
> of flexibility in SCMI telemetry, it may not always fit well in hwmon.
> 
> But, I think we can still leverage hwmon for telemetry related to power/
> sensor related info.
> 

Absolutely, but as of now I think Kernel needs some sort of feedback/config
info from userspace to identify WHAT is fine to be registered with HWMON/IIO/PERF
etc etc...since userspace is where the precise semantic decription of what-the-hell
0x1234 ID represents on the specific platform...
(so that is the reason for still NOT having this mechanism in this series...)

> The question about how do we differentiate between the above subsystems
> is still open. Do we expect telemetry to purely come from the firmware
> once the kernel is booted up already and is limited in the scope of what
> it knows about the system its running on?
> Or, can we somehow use DT to specify the subsystem we are interested in
> based on the telemetry "number" and some compatible?
> 

I dont think DT is a viable option for this kind of descriptions...I was
more thinking about an extension of (whatever we choose as) API which
a userspace app can use to select which DEs is approriate for a specific
kernel subsystem (f anything)

> > 
> >     NOTE THAT, this latter solution CANNOT be the only solution, because
> >     all of the above subsystem (beside PERF) expose a SysFS-based userspace
> >     interface (AFAIK), so, using their standard well-known interfaces WON'T
> >     solve the performance and scalability problem we have in our SysFS.
> > 
> > Beside all of the above, the specification is still in ALPHA_0 and some
> > features are still NOT supported by this series...
> > 
> > ...and of course any form of documentation is still missing :D
> > 
> > Based on V6.16-rc2.
> > 
> > Any feedback welcome,
> > 
> > For whoever had the gut to read till here :P ...
> 
> Hehe.. somehow managed to read it all :P
> 

...congratulations ! (I have no prizes to distribute, though :P)

Thanks
Cristian,
