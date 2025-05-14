Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B921CC4F;
	Wed, 14 May 2025 08:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210355; cv=none; b=WHNphrm8t7DfOXLfYWlQK8tl7602KYw5yaivbxdYmqgHlUgZXdb4Lm/vdE5s8/tTeIAu2Nvr70F55A/1dy8m/lXXmemishxfhrZGjoSjPXny05WHmQply3wfChOjGJN2m99XzR/Dr0HH0bWYQ05GXPUHe5cTzDi3RjY1kcjKv80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210355; c=relaxed/simple;
	bh=ec+sa40LuHPteGzuo7nO5Z0yW/UhCJxWskwBNgf3WUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlusERg28MSwnbwjYOAXLgBnCKA7H2G6Q5PmvXAWj9VufEn1Qsljqq0+fRR0nk5Wa5T8qjkrAfblE5TFC4kuOg5qw47nVdp5gq5pbWV2ehdHzlfqqr195YouPZUIrQHEQu3uRTtyDdRoJ6ogVfrX30dCsA9p/Xd9RrsPbtrmDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JtOZrvw5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JtOZrvw5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747210353; x=1778746353;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ec+sa40LuHPteGzuo7nO5Z0yW/UhCJxWskwBNgf3WUc=;
  b=JtOZrvw5ykgwVn97/Cm4mwNlLSmtygmwIcbrL0+uX6p8onKftPq09aS9
   Hm4NmgMg0MsbcaeIh+3DPGElpP5E8qh5TRW40E85I6hQ+1p1ZV22zp8fi
   vhdz00+GZvzDn665GHJ7P+GdxcJf6F8ta9m5UQPfgHPgg/3wtuHOUo3KY
   fMTzhpEmqxQRED2uhViU41YceIHrhLnrQ4GZsBETVcouQXROu1G+WLJeu
   ucaoBK2NHNuNmAG/LjzY5bWOiESTSrtkGZVtAw27GLly1n6OseALhQyx0
   1iFK2jVFxiy24Nr3bkrdylhceCJohB+7gytdUGDzK7VCPMSe7d3Uikinc
   Q==;
X-CSE-ConnectionGUID: w9C4Wc4WSAaKhdhE6rekpQ==
X-CSE-MsgGUID: a0xnmxQLSPCyMSNkK7LPvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52901075"
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="52901075"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 01:12:33 -0700
X-CSE-ConnectionGUID: NcLBzkazTOKwsbob2udQzg==
X-CSE-MsgGUID: xBXOTszMRC+r6/R6cUpNRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,287,1739865600"; 
   d="scan'208";a="137844045"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa006.fm.intel.com with SMTP; 14 May 2025 01:12:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 14 May 2025 11:12:29 +0300
Date: Wed, 14 May 2025 11:12:29 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: badhri@google.com, gregkh@linuxfoundation.org,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	cosmo.chou@quantatw.com
Subject: Re: [PATCH v2] usb: typec: tcpm: Use configured PD revision for
 negotiation
Message-ID: <aCRQbRCHFdFOCNw2@kuha.fi.intel.com>
References: <20250513130834.1612602-1-chou.cosmo@gmail.com>
 <aCNLeX1k34BSgPOV@kuha.fi.intel.com>
 <aCNOOXcAuA_1B-0Z@kuha.fi.intel.com>
 <CAOeEDyuFmFqacy1N8TtpuJRdv-3K2f1DzXNwR1MpyNn4Nrug7A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOeEDyuFmFqacy1N8TtpuJRdv-3K2f1DzXNwR1MpyNn4Nrug7A@mail.gmail.com>

On Tue, May 13, 2025 at 10:14:32PM +0800, Cosmo Chou wrote:
> On Tue, May 13, 2025 at 04:50:49PM +0300, Heikki Krogerus wrote:
> >
> > On Tue, May 13, 2025 at 04:39:09PM +0300, Heikki Krogerus wrote:
> > > On Tue, May 13, 2025 at 09:08:34PM +0800, Cosmo Chou wrote:
> > > > Initialize negotiated_rev and negotiated_rev_prime based on the port's
> > > > configured PD revision (rev_major) rather than always defaulting to
> > > > PD_MAX_REV. This ensures ports start PD communication using their
> > > > appropriate revision level.
> > > >
> > > > This allows proper communication with devices that require specific
> > > > PD revision levels, especially for the hardware designed for PD 1.0
> > > > or 2.0 specifications.
> > > >
> > > > Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>
> > > > ---
> > > > Change log:
> > > >
> > > > v2:
> > > >   - Add PD_CAP_REVXX macros and use switch-case for better readability.
> > > >
> > > > ---
> > > >  drivers/usb/typec/tcpm/tcpm.c | 29 +++++++++++++++++++++++++----
> > > >  1 file changed, 25 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> > > > index 8adf6f954633..48e9cfc2b49a 100644
> > > > --- a/drivers/usb/typec/tcpm/tcpm.c
> > > > +++ b/drivers/usb/typec/tcpm/tcpm.c
> > > > @@ -313,6 +313,10 @@ struct pd_data {
> > > >     unsigned int operating_snk_mw;
> > > >  };
> > > >
> > > > +#define PD_CAP_REV10       0x1
> > > > +#define PD_CAP_REV20       0x2
> > > > +#define PD_CAP_REV30       0x3
> > > > +
> > > >  struct pd_revision_info {
> > > >     u8 rev_major;
> > > >     u8 rev_minor;
> > > > @@ -4665,6 +4669,25 @@ static void tcpm_set_initial_svdm_version(struct tcpm_port *port)
> > > >     }
> > > >  }
> > > >
> > > > +static void tcpm_set_initial_negotiated_rev(struct tcpm_port *port)
> > > > +{
> > > > +   switch (port->pd_rev.rev_major) {
> > > > +   case PD_CAP_REV10:
> > > > +           port->negotiated_rev = PD_REV10;
> > > > +           break;
> > > > +   case PD_CAP_REV20:
> > > > +           port->negotiated_rev = PD_REV20;
> > > > +           break;
> > > > +   case PD_CAP_REV30:
> > > > +           port->negotiated_rev = PD_REV30;
> > > > +           break;
> > > > +   default:
> > > > +           port->negotiated_rev = PD_MAX_REV;
> > > > +           break;
> > > > +   }
> > > > +   port->negotiated_rev_prime = port->negotiated_rev;
> > > > +}
> > >
> > > Do we need this? Couldn't you just add one to rev_major?
> > >
> > >         port->negotiated_rev = port->pd_rev.rev_major + 1;
> > >         port->negotiated_rev_prime = port->pd_rev.rev_major + 1;
> > >
> > > Or am I missing something?
> >
> > Sorry, I mean minus one :-)
> >
> >         port->negotiated_rev = port->pd_rev.rev_major - 1;
> >         port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
> >
> > --
> > heikki
> 
> It seems to be the PATCH v1:
> https://lore.kernel.org/all/20250508174756.1300942-1-chou.cosmo@gmail.com/
> 
> if (port->pd_rev.rev_major > 0 && port->pd_rev.rev_major <= PD_MAX_REV + 1) {
>         port->negotiated_rev = port->pd_rev.rev_major - 1;
>         port->negotiated_rev_prime = port->pd_rev.rev_major - 1;
> } else {
>         port->negotiated_rev = PD_MAX_REV;
>         port->negotiated_rev_prime = PD_MAX_REV;
> }

Okay, sorry I missed that. I still don't like the extra definitions,
but I don't have any better idea (I guess macro is not an option?).

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

thanks,

-- 
heikki
