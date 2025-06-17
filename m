Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985462C08CD;
	Tue, 17 Jun 2025 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750153854; cv=none; b=qV6ZPk5/lPuIJv56TkmzKXocOVkUOEFMOAm+H46gnFJtmwDqqkbtL5EYxSBuLwJB6LJrGUVMIr+vfdcZgQsA8rso4/BvLCkZ7L9dUODIx8H8Q+B70c1Prd3JYH04MH65RvMX7mWoaT1Zxl4PsOAuo5yXhEJ1HcKpmvLSaST2RKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750153854; c=relaxed/simple;
	bh=q1yjPxJXKLdryIt38GRRT/giXd0/MkzlEEaOqBtmCAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuZqa+ZbH20TR8DXfQxe0PwiLHzakCSj62P9971wqO4OFpg+XYHD1oPy+r89WA4xPx71mTOhUnX1x/gxx1Fp3+mrh/qcWa8/rFpi0vLcgoTZBRecs4tEsSz27Y2aAa6Z5s7s1LMfjGYswqN3xn/qGGS7LksvwqYLWggVCxfSasA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeHok1Cz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeHok1Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750153852; x=1781689852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q1yjPxJXKLdryIt38GRRT/giXd0/MkzlEEaOqBtmCAg=;
  b=SeHok1CzuYQlK6THjPpPyuMKP0QJwguQszNdazc4l3+t1F5MvXRpXUMC
   ND5pLzv6GHntDiuekigsphJ0By0pr1SPy2xzaDbcI0IXEIV0laj73pQpN
   yXfEpOhTBRSRTLgUxjBagp4kncpKGCwQqmc0QXsbSHQXnmbVB/jUhFU/h
   JirJ+wxcCohucfhrA35it5yTYJCDa4f9ti+q8bvospp7+8WZTCin9gilz
   MBM/P09ZEkffvbWefc0ZFZyfsrhZO3DJocziLFfxz2ZilTUm68f+PdsbS
   zqSJP1Rx+xuG/f3Pq0FMuyw3lpMsrfjY4ZNbezouiIIMxq7VAhB9g6Loi
   g==;
X-CSE-ConnectionGUID: j73jUkNwS/GH5+ORKq6Cfg==
X-CSE-MsgGUID: YUHB0l3YTveHyuZ4nf3qYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52302917"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="52302917"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 02:50:51 -0700
X-CSE-ConnectionGUID: dF+nS/xTT0KJDY+DwP/xxA==
X-CSE-MsgGUID: ZvDK7tNjShe+8GtAL1GJVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153923847"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa004.fm.intel.com with SMTP; 17 Jun 2025 02:50:46 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 17 Jun 2025 12:50:46 +0300
Date: Tue, 17 Jun 2025 12:50:46 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev
Subject: Re: [PATCH 04/10] usb: typec: Expose alternate mode priorities via
 sysfs
Message-ID: <aFE6dnxet4_sm8b1@kuha.fi.intel.com>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
 <20250616133147.1835939-5-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616133147.1835939-5-akuchynski@chromium.org>

On Mon, Jun 16, 2025 at 01:31:41PM +0000, Andrei Kuchynski wrote:
> This sysfs attribute specifies the preferred order for enabling
> DisplayPort alt-mode, Thunderbolt alt-mode, and USB4 mode.
> 
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
> ---
>  Documentation/ABI/testing/sysfs-class-typec | 17 ++++
>  drivers/usb/typec/Makefile                  |  2 +-
>  drivers/usb/typec/class.c                   | 26 ++++++
>  drivers/usb/typec/class.h                   |  2 +
>  drivers/usb/typec/mode_selection.c          | 93 +++++++++++++++++++++
>  drivers/usb/typec/mode_selection.h          |  5 ++
>  include/linux/usb/typec_altmode.h           |  7 ++
>  7 files changed, 151 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/usb/typec/mode_selection.c
>  create mode 100644 drivers/usb/typec/mode_selection.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-typec b/Documentation/ABI/testing/sysfs-class-typec
> index 38e101c17a00..46eee82042ab 100644
> --- a/Documentation/ABI/testing/sysfs-class-typec
> +++ b/Documentation/ABI/testing/sysfs-class-typec
> @@ -162,6 +162,23 @@ Description:	Lists the supported USB Modes. The default USB mode that is used
>  		- usb3 (USB 3.2)
>  		- usb4 (USB4)
>  
> +What:		/sys/class/typec/<port>/altmode_priorities
> +Date:		June 2025
> +Contact:	Andrei Kuchynski <akuchynski@chromium.org>
> +Description:	Lists the alternate modes supported by the port and their
> +		priorities. The priority setting determines the order in which
> +		Displayport alt-mode, Thunderbolt alt-mode and USB4 mode will be
> +		activated, indicating the preferred selection sequence. A value of -1
> +		disables automatic entry into a specific mode, while lower numbers
> +		indicate higher priority. The default priorities can be modified by
> +		assigning new values. Modes without explicitly set values default to -1,
> +		effectively disabling them.
> +
> +		Example values:
> +		- "USB4=0 TBT=1 DP=2"
> +		- "USB4=-1 TBT=0"
> +		- "DP=-1 USB4=-1 TBT=-1"

No. If you want to disable entry to a mode by default, then you
deactivate that mode, so -1 is not needed. USB4 is also not an alt
mode, so this at the very least should be named differently.

But I'm not sure this is the correct way to handle the modes in
general. Can you please explain what exactly is the use case you are
thinking?

If you just need to prevent for example USB4 entry by default, then
you write usb3 (or usb2) to the usb_capability. The alt modes you can
deactivate by default, no?

I can appreciate the convenience that you get from a single file like
that, but it does not really give much room to move if for example the
user space needs to behave differently in case of failures to enter a
specific mode compared to successful entries.

Br,

-- 
heikki
