Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E2254F81;
	Thu,  3 Apr 2025 09:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671334; cv=none; b=uBv72roADsnc7s83XtC/aTmdOXhh3h3eME88oE2NmtjNQimNUCjFL0pyP1czCi2U5YIyABbe4inT8ZKa+hA7ifjob/smdFHj4QnQ9Y/fHtr5zAPv0u/2X7P3I9z8QwWfxTDm2/fel8eqKteL4bft/r47Uf6t5jzuNXkM14GleTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671334; c=relaxed/simple;
	bh=YTgrlubY33iEUDlhjjWqFLZbQX3gOvthO8SzT191QUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0sE7pUSxJLcKDzB01I/JTQBYgjp+R2jZd2zHlsJFaTRKnbb5dWaA5OnokeJ2AO359BiOcEs8XebZBbTwkd/6MCPQUFEB2wFHN9HYbRiCvjPGepOr86fgk0YUc1gyNla9+qhoTzdG6XdMJ9URCyuO+vPNtZyp1wDWIYujtnbWvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CC059106F;
	Thu,  3 Apr 2025 02:08:54 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9F7603F63F;
	Thu,  3 Apr 2025 02:08:49 -0700 (PDT)
Date: Thu, 3 Apr 2025 10:08:41 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, quic_sibis@quicinc.com,
	dan.carpenter@linaro.org, maz@kernel.org
Subject: Re: [RFC PATCH 3/3] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk:
 Ignore FC bit in attributes
Message-ID: <Z-5QGXj0wXMvtasf@pluto>
References: <20250401122545.1941755-1-cristian.marussi@arm.com>
 <20250401122545.1941755-4-cristian.marussi@arm.com>
 <Z-5F8eTaZB2gLTNs@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-5F8eTaZB2gLTNs@hovoldconsulting.com>

On Thu, Apr 03, 2025 at 10:25:21AM +0200, Johan Hovold wrote:
> On Tue, Apr 01, 2025 at 01:25:45PM +0100, Cristian Marussi wrote:
> > Some platform misreported the support of FastChannel when queried: ignore
> > that bit on selected platforms.
> > 

Hi Johan,

thanks for the review.

> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > ---
> > Match features has to be set-up properly before upstreaming this.
> > Ideally the out-of-spec firmware should be matched with a quirk matching
> > pattern based on Vendor/SubVendor/ImplVersion....but it is NOT clear if the
> > platform at hand will ship with future fixed firmwares where the ImplVersion
> > field is properly handled.
> > If we cannot be sure about that, we should fallback to a compatible match.
> > ---
> >  drivers/firmware/arm_scmi/driver.c | 8 ++++++++
> >  drivers/firmware/arm_scmi/quirks.c | 3 +++
> >  drivers/firmware/arm_scmi/quirks.h | 3 +++
> >  3 files changed, 14 insertions(+)
> > 
> > diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
> > index 4266ef852c48..212456305bc9 100644
> > --- a/drivers/firmware/arm_scmi/driver.c
> > +++ b/drivers/firmware/arm_scmi/driver.c
> > @@ -1904,6 +1904,13 @@ struct scmi_msg_resp_desc_fc {
> >  	__le32 db_preserve_hmask;
> >  };
> >  
> > +#define QUIRK_PERF_FC_FORCE						\
> > +	({								\
> > +		if (pi->proto->id == SCMI_PROTOCOL_PERF ||		\
> > +		    message_id == 0x5 /* PERF_LEVEL_GET */)		\
> 
> This should be logical AND and PERF_LEVEL_GET is 0x8 (currently
> fastchannel is enabled for all PERF messages).

...right...not sure how I botched this condition completely...my bad...
(even the comment is wrong :P...)

...I experimented with multiple version of this...so I suppose this is why...
...I will post a fixed V1 once I hacve a bit more feedback on the list...

> 
> > +			attributes |= BIT(0);				\
> > +	})
> > +
> >  static void
> >  scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> >  			     u8 describe_id, u32 message_id, u32 valid_size,
> > @@ -1924,6 +1931,7 @@ scmi_common_fastchannel_init(const struct scmi_protocol_handle *ph,
> >  
> >  	/* Check if the MSG_ID supports fastchannel */
> >  	ret = scmi_protocol_msg_check(ph, message_id, &attributes);
> > +	SCMI_QUIRK(perf_level_get_fc_force, QUIRK_PERF_FC_FORCE);
> 
> This is cool and I assume can be used to minimise overhead in hot paths.
> Perhaps you can have concerns about readability and remembering to
> update the quirk implementation if the code here changes.

My main aim here was to be able to define the quirk code as much as
possible in the proximity of where it is used...so that is clear what it
does and dont get lost in some general common table....and the macro was
a way to uniform the treatment of the static keys...

...but I am still not sure if all of these macros just degrade visibility
and we could get rid of them...would be really cool to somehow break the
build if the code "sorrounding" the SCMI_QUIRK changes and you dont update
(somehow) the quirk too...so as to be sure that the quirk is taking care of
and maintained...but I doubt that is feasible, because, really, how do you
even deternine which code changes are in proximity enough to the quirk to
justify a break...same block ? same functions ? you cannot really know
semantically where some changes can impact this part of the code...
..I supppose reviews and testing is the key and the only possible answer
to this..

> 
> Does it even get compile tested if SCMI_QUIRKS is disabled?

It evaluates to nothing when CONFIG_ARM_SCMI_QUIRKS is disabled...
...so maybe I could add a Kconfig dep on COMPILE_TEST ....if this is what
you mean..

> 
> >  	if (ret || !MSG_SUPPORTS_FASTCHANNEL(attributes)) {
> >  		dev_dbg(ph->dev,
> >  			"Skip FC init for 0x%02X/%d  domain:%d - ret:%d\n",
> > diff --git a/drivers/firmware/arm_scmi/quirks.c b/drivers/firmware/arm_scmi/quirks.c
> > index 83798bc3b043..78d51bd0e5b5 100644
> > --- a/drivers/firmware/arm_scmi/quirks.c
> > +++ b/drivers/firmware/arm_scmi/quirks.c
> > @@ -70,6 +70,8 @@ struct scmi_quirk {
> >  	__DEFINE_SCMI_QUIRK_ENTRY(_qn, _comp, _ven, _sub, _impl)
> >  
> >  /* Global Quirks Definitions */
> > +DEFINE_SCMI_QUIRK(perf_level_get_fc_force,
> > +		  "your-bad-compatible", NULL, NULL, 0x0);
> 
> At first I tried matching on the SoC (fallback) compatible without
> success until I noticed you need to put the primary machine compatible
> here. For the SoC at hand, that would mean adding 10 or so entries since
> all current commercial devices would be affected by this.
> 

Ah right...I tested on a number of combinations BUT assumed only one
compatible was to be found...you can potentially add dozens of this
definitions for a number of platforms associating the same quirk to all
of them and let the match logic enabling only the proper on...BUT this
clearly does NOT scale indeed and you will have to endlessly add new
platform if fw does NOT get fixed ever...

> Matching on vendor and protocol works.
> 

That is abosutely the preferred way, BUT the match should be on
Vendor/SubVendor/ImplVersion ... if the platform properly uses
ImplementationVersion to differentiate between firmware builds...

...if not you will end up applying the quirk on ANY current and future
FW from this Vendor...maybe not an issue in this case...BUT they should
seriously thinking about using ImplementationVersion properly in their
future FW releases...especially if, as of now, no new fixed FW release
has ever been released...

> >  /*
> >   * Quirks Pointers Array
> > @@ -78,6 +80,7 @@ struct scmi_quirk {
> >   * defined quirks descriptors.
> >   */
> >  static struct scmi_quirk *scmi_quirks_table[] = {
> > +	__DECLARE_SCMI_QUIRK_ENTRY(perf_level_get_fc_force),
> >  	NULL
> >  };
> 
> Johan

Thanks for having had a look !
Cristian

