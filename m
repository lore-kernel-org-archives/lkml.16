Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25128E5E3;
	Tue, 13 May 2025 13:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747144256; cv=none; b=l1tbsOgBxO1D/FH8qJbx1HI02jjGaYqIz39CVSbByAmOSvGDBmPjCd89zUITzBWjZibFhSRUQjiVHqLtma7k8DL4bo4WA3gEdwgeDFTh7RkJqcXsexPbk6KBJLbyo+82QJK/2WwOoWh2Yl+qPmdMeCZ4YnOb0oyS+cjj42h5MZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747144256; c=relaxed/simple;
	bh=8Md9VYH+GVWl7EBtiFSSM0L114z6V7Svzk31k5efaxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PLPBV+T0u1ziAkwlbAVNuvq1lbnq2WRsbiHZ0RDnz2y3cwo2BBeNOMH2soJild4MzZjDmY7EXbNbXz9l1EXRE+pyWbbe5faMhx1ZD0m7RP39LSS4D0uUoBTQK/ZyIpH6yQYJHqxhJ2H2irbgcHMewSckOqnaGC3eKyT1GW6oNO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZAbS59lA; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZAbS59lA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747144255; x=1778680255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8Md9VYH+GVWl7EBtiFSSM0L114z6V7Svzk31k5efaxU=;
  b=ZAbS59lArMBG+89bXqCYNeT+046Ahw4qdzhrZxjsLvq63n97ME6rLJyj
   YlOMiQgZok0JTsF1G2UaI93IjwLkg9UmPf9AAvL+iS8qBGLkocgMxb01P
   aP0dK8wJe2AcF2lmefQatJjJvhGAEfRhGhID3BarJyJWpgRGi7WdimAL+
   ptylvzBmYPrm0pr3A8GTpBgJkR3mYEq28/dc17PrmFf4KIB+4i1nyjX+s
   Uj2jMSuUDqBnrihTd+vjFA/k1xFk1g9jJjYAb4AmkYpNCb6cQvGKTK5v0
   wdev54xOOP2UFakcgNDEAlmLa8G+oB4rDk5zRWmTHBQHfWUKlSZJQmU8t
   w==;
X-CSE-ConnectionGUID: RDtQN4OUQrqxowOFv2559A==
X-CSE-MsgGUID: Sv0fM9e0QoWo+K9hbaa5lw==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48922778"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="48922778"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 06:50:54 -0700
X-CSE-ConnectionGUID: QX096WcgTW2hzK35NN/lbw==
X-CSE-MsgGUID: Hu1fWME+T0ubgMoZ+WzMNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="137451251"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa009.jf.intel.com with SMTP; 13 May 2025 06:50:51 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 13 May 2025 16:50:49 +0300
Date: Tue, 13 May 2025 16:50:49 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH v2] usb: typec: tcpm: Use configured PD revision for
 negotiation
Message-ID: <aCNOOXcAuA_1B-0Z@kuha.fi.intel.com>
References: <20250513130834.1612602-1-chou.cosmo@gmail.com>
 <aCNLeX1k34BSgPOV@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCNLeX1k34BSgPOV@kuha.fi.intel.com>

On Tue, May 13, 2025 at 04:39:09PM +0300, Heikki Krogerus wrote:
> On Tue, May 13, 2025 at 09:08:34PM +0800, Cosmo Chou wrote:
> > Initialize negotiated_rev and negotiated_rev_prime based on the port's
> > configured PD revision (rev_major) rather than always defaulting to
> > PD_MAX_REV. This ensures ports start PD communication using their
> > appropriate revision level.
> > 
> > This allows proper communication with devices that require specific
> > PD revision levels, especially for the hardware designed for PD 1.0
> > or 2.0 specifications.
> > 
> > Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> > ---
> > Change log:
> > 
> > v2:
> >   - Add PD_CAP_REVXX macros and use switch-case for better readability.
> > 
> > ---
> >  drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > index 8adf6f954633..48e9cfc2b49a 100644
> > --- a/drivers/usb/typec/tcpm/tcpm.c
> > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > @@ -313,6 +313,10 @@ struct pd_data {
> >  	unsigned int operating_snk_mw;
> >  };
> >  
> > +#define PD_CAP_REV10	0x1
> > +#define PD_CAP_REV20	0x2
> > +#define PD_CAP_REV30	0x3
> > +
> >  struct pd_revision_info {
> >  	u8 rev_major;
> >  	u8 rev_minor;
> > @@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
> >  	}
> >  }
> >  
> > +static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
> > +{
> > +	switch (port->pd_rev.rev_major) {
> > +	case PD_CAP_REV10:
> > +		port->negotiated_rev = PD_REV10;
> > +		break;
> > +	case PD_CAP_REV20:
> > +		port->negotiated_rev = PD_REV20;
> > +		break;
> > +	case PD_CAP_REV30:
> > +		port->negotiated_rev = PD_REV30;
> > +		break;
> > +	default:
> > +		port->negotiated_rev = PD_MAX_REV;
> > +		break;
> > +	}
> > +	port->negotiated_rev_prime = port->negotiated_rev;
> > +}
> 
> Do we need this? Couldn't you just add one to rev_major?
> 
>         port->negotiated_rev = port->pd_rev.rev_major + 1;
>         port->negotiated_rev_prime = port->pd_rev.rev_major + 1;
> 
> Or am I missing something?

Sorry, I mean minus one :-)

        port->negotiated_rev = port->pd_rev.rev_major - 1;
        port->negotiated_rev_prime = port->pd_rev.rev_major - 1;

-- 
heikki
