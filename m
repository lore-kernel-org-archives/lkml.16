Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10DB4158DAC;
	Mon, 31 Mar 2025 16:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743437205; cv=none; b=MZ7/HWD1drDaDEZCDaQumdSEcvoltdCUBm16lvRf4N5t7d0y2of3iIDF5wct6C+gx/hZYc/rIrLMNIlhZ6G4bv9Q4m5l1QTlEZTpA4lKEyg9bFyHRamv0/MN/YdxHhlX4eRXPkotXrofn7sKX8ZrcK6miz6SZ2j9P9OyNXfu8Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743437205; c=relaxed/simple;
	bh=cUb/RshRxrSgIc+BtCKbzmSJr0YO9OhGNmoUs7cC7Pw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=NSWHRoRKONUbcQDAhrQgSxHEJs4NZTlHve5TA+31f8dNLa2xYw/JTuDW0NS3VJptQG8iuo1QYWfys9E4R6XJdnJITSj3bc5Y2WWfLw8JUNewjazFmoTR+bJ/8IjsENsE+j9rtaFtl4IQOq/+w3gobcuEOkmCDgbkLfY1925ygIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtlV08uz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtlV08uz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743437203; x=1774973203;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=cUb/RshRxrSgIc+BtCKbzmSJr0YO9OhGNmoUs7cC7Pw=;
  b=GtlV08uzHh3SLM6LxmsjM5IfRApkXwypGiFfv96zCX8Dml8rPrV/0tFp
   Li4rbSpGuVLytgFRTcaod5ZnEPLcEmb9SoE4OhC/mz9txhVKkzz3sbv7G
   LTOHPe1Yv4XXbCrjWPD+IkblNHhUmaTOIgGixqD3VQZPXBWptNMHDeIv1
   pTyAca4erJoh2EOlzQ7FUAvl6rHDUDzAUWSY9Bq+4HgZaX0h3dcP0Zfhn
   c7ZXKCBDe+4v8qxxY1O4rN/PhlCkxwxK4iWqk/lRJTOjwSW+aVFMooZOV
   k3HEd+bKFkAOPuTqJnlRx9EeVjVAGBbFxnlFGoLAf49FhyOWN4Ht/NNLs
   w==;
X-CSE-ConnectionGUID: E2QGwm4UT5GSLixDiJvWwg==
X-CSE-MsgGUID: PtRE4SEnSt+r7F/sor0Zbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="54929745"
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="54929745"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:06:42 -0700
X-CSE-ConnectionGUID: ZoEHd8JzSreqGWEGlbOM9A==
X-CSE-MsgGUID: /dk3cqSDQjKLrFZOnPNing==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,291,1736841600"; 
   d="scan'208";a="126109242"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.34])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 09:06:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 31 Mar 2025 19:06:36 +0300 (EEST)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 03/12] platform/x86: alienware-wmi-wmax: Improve
 internal AWCC API
In-Reply-To: <D8S7MF97YEGI.21PR2NBB42QRS@gmail.com>
Message-ID: <663611d4-3def-248e-1db7-54be7202677f@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-3-17b57f787d77@gmail.com> <45699e14-6d51-8116-b252-a7a20ffe8e8b@linux.intel.com> <D8S7MF97YEGI.21PR2NBB42QRS@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1980786461-1743437196=:929"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1980786461-1743437196=:929
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Fri, 28 Mar 2025, Kurt Borja wrote:

> On Fri Mar 28, 2025 at 11:51 AM -03, Ilpo J=C3=A4rvinen wrote:
> > On Thu, 13 Mar 2025, Kurt Borja wrote:
> >
> >> Inline all AWCC WMI helper methods and directly return the newly
> >> introduced __awcc_wmi_command() helper to simplify implementation.
> >>=20
> >> Drop awcc_thermal_control() in favor of awcc_op_activate_profile().
> >>=20
> >> Add awcc_op_get_resource_id(), awcc_op_get_current_profile() and a new
> >> failure code.
> >>=20
> >> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> >> ---
> >>  drivers/platform/x86/dell/alienware-wmi-wmax.c | 150 +++++++++++++++-=
---------
> >>  1 file changed, 91 insertions(+), 59 deletions(-)
> >>=20
> >> diff --git a/drivers/platform/x86/dell/alienware-wmi-wmax.c b/drivers/=
platform/x86/dell/alienware-wmi-wmax.c
> >> index 80aefba5b22d6b4ac18aeb2ca356f8c911150abd..b9dbfdc8096c571722b3c7=
ac3e73989e235e2eb9 100644
> >> --- a/drivers/platform/x86/dell/alienware-wmi-wmax.c
> >> +++ b/drivers/platform/x86/dell/alienware-wmi-wmax.c
> >> @@ -32,6 +32,7 @@
> >>  #define AWCC_THERMAL_MODE_GMODE=09=09=090xAB
> >> =20
> >>  #define AWCC_FAILURE_CODE=09=09=090xFFFFFFFF
> >> +#define AWCC_FAILURE_CODE_2=09=09=090xFFFFFFFE
> >>  #define AWCC_THERMAL_TABLE_MASK=09=09=09GENMASK(7, 4)
> >>  #define AWCC_THERMAL_MODE_MASK=09=09=09GENMASK(3, 0)
> >>  /* Some IDs have a BIT(8) flag that we ignore */
> >> @@ -443,8 +444,7 @@ const struct attribute_group wmax_deepsleep_attrib=
ute_group =3D {
> >>  };
> >> =20
> >>  /*
> >> - * Thermal Profile control
> >> - *  - Provides thermal profile control through the Platform Profile A=
PI
> >> + * AWCC Helpers
> >>   */
> >>  static bool is_awcc_thermal_profile_id(u8 code)
> >>  {
> >> @@ -463,72 +463,107 @@ static bool is_awcc_thermal_profile_id(u8 code)
> >>  =09return false;
> >>  }
> >> =20
> >> -static int awcc_thermal_information(struct wmi_device *wdev, u8 opera=
tion,
> >> -=09=09=09=09    u8 arg, u32 *out_data)
> >> +static int __awcc_wmi_command(struct wmi_device *wdev, u32 method_id,
> >> +=09=09=09      struct wmax_u32_args *args, u32 *out)
> >
> > Why did you put __ into the name?
> >
> > Some people oppose __ prefix altogether, I don't entirely agree with th=
eir=20
> > stance but I don't really understand what the underscores here signify.
> >
> > Normally I see __ being used in three main cases:
> > - non-__ variant does some locking around the call too the __ func (tho=
ugh=20
> >   many funcs use _locked postfix these days).
> > - func is "dangerous" and caller has to really know what he/she is
> >   doing / be careful for some reason.
> > - non-__ variant exists and somebody cannot come up better name for the
> >   internally called function (not very good use case, IMHO)
>=20
> Oh - I didn't know. Andy also mentioned this prefix is used for
> non-atomic versions of some functions like __set_bit().

I mentioned locking which relates to atomicity, however, here you don't=20
have two variants, one without locking and the other with it so it becomes=
=20
very non-obvious what __ means. (I know you posted v7 without it, so=20
this is just a clarifying comment.)

> > I don't see any of those apply here, this looks just an ordinary wrappe=
r=20
> > function, thus the question.
>=20
> I did it to indicate it's a "private" method, so it's not used directly.
> But ofc that's not the convention here, so I'll drop it.

We have "static" for that. And it's called by something anyway or it would=
=20
be dead code :-).

--=20
 i.

--8323328-1980786461-1743437196=:929--
