Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B484B1E8324;
	Mon, 26 May 2025 09:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748250665; cv=none; b=hXJa0ixmuDsHgkSWxZ7KWmAawi9tyzjnD5Dqm0g2qLwhb3XzVHi1+jv+JB05r1vTI9DeyOIj+j/NFuLSGRY6Y99vcwOM35y3dddASldG+nGI2Ul0A5OSlxFvTXYrTrrg1KbI4BkJVQaGCkUviP9KnxB6MJf8CI1OFykkDNCXkt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748250665; c=relaxed/simple;
	bh=vV4FBCFkwq6PyUFkRrLKn+LL8FlEQvtmUBn1sC+uQvQ=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=YRd7jXLKTqg5EZb8OSEdTsvf5dMksgh6lVj/Jc0tNYibblDuan/h6kLY1z7WdfWwxJyoUEZ729fezmyEu5h6lVJb0ozbSeeYhVl5ThFARGibq77HfIV3KKffupLMwwcMh1OpO+WNC520HMDmLVg30sFZ6FU66NjSLrcp+BW2MfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jgfLpO9Y; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jgfLpO9Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748250663; x=1779786663;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=vV4FBCFkwq6PyUFkRrLKn+LL8FlEQvtmUBn1sC+uQvQ=;
  b=jgfLpO9Y6PRBrZbmw03vQKdU51In3pfK3+3SVNoQAfzbvVt8wormfrZX
   X6WY9j8rtEpiJsE97HTr63JJHBukEnxYFMWZyhZDTDNoR+OqL6UsQiHyP
   F94j0j7I79cWC1YDmMGsAgK5iRyyusQIbZqZCXP7LF8gu6RY4qmq2PK5Q
   txt2sI+4IeJ9VcA7KJ232gQBz+H2Um4VKSU1FSWOCb9jFh4o+GVlWzEE3
   /woPWmS/ObvQQx3DnYn8Po8reVltl4IBDu5n+3vzPUhfKaEILbfCO568V
   /tdvXGe1LQuSNIDUFPMwY+TpUyr+ZJSc3u8uFaUpcaWBp7oTw6gB7x0rI
   Q==;
X-CSE-ConnectionGUID: ZjZCVgtGTXKx3aPj4E/XDA==
X-CSE-MsgGUID: bOtBtVvMQRKhgRbcmDsnFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="67628423"
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="67628423"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 02:11:02 -0700
X-CSE-ConnectionGUID: 578vrcYzTpClzj62Mmi7zw==
X-CSE-MsgGUID: bZeN2YJ5QsW5NogFl5qb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,315,1739865600"; 
   d="scan'208";a="142195432"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost) ([10.245.245.206])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 02:10:57 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 May 2025 12:10:53 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 0/6] platform/x86: Add Lenovo WMI Gaming Series
 Drivers
In-Reply-To: <755BCB57-A912-44BF-AD6C-6B9AFA33A340@gmail.com>
Message-ID: <b178447d-362e-1ef9-03a0-796dda036626@linux.intel.com>
References: <20250522015350.471070-1-derekjohn.clark@gmail.com> <2972c4c6-7080-e058-ec39-b8c1dc603f7a@linux.intel.com> <2c7ffaa6-e639-e215-42d0-78a2b185ad45@linux.intel.com> <755BCB57-A912-44BF-AD6C-6B9AFA33A340@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-796157268-1748250653=:932"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-796157268-1748250653=:932
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 25 May 2025, Derek J. Clark wrote:
> On May 25, 2025 2:41:51 PM PDT, "Ilpo J=C3=A4rvinen" <ilpo.jarvinen@linux=
=2Eintel.com> wrote:
> >On Mon, 26 May 2025, Ilpo J=C3=A4rvinen wrote:
> >
> >> On Wed, 21 May 2025, Derek J. Clark wrote:
> >>=20
> >> > Adds support for the Lenovo "Gaming Series" of laptop hardware that =
use
> >> > WMI interfaces that control various power settings. There are multip=
le WMI
> >> > interfaces that work in concert to provide getting and setting value=
s as
> >> > well as validation of input. Currently only the "Gamezone", "Other
> >> > Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, b=
ut
> >> > I attempted to structure the driver so that adding the "Custom Mode"=
,
> >> > "Lighting", and other data block interfaces would be trivial in late=
r
> >> > patches.
> >> >=20
> >> > This driver attempts to standardize the exposed sysfs by mirroring t=
he
> >> > asus-armoury driver currently under review. As such, a lot of
> >> > inspiration has been drawn from that driver.
> >> > https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-l=
uke@ljones.dev/#t
> >> >=20
> >> > The drivers have been tested by me on the Lenovo Legion Go and Legio=
n Go
> >> > S.
> >> >=20
> >> > Suggested-by: Mario Limonciello <superm1@kernel.org>
> >> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> >> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> >> > ---
> >> > v11:
> >> >   - Fix formmating issues.
> >>=20
> >> Thanks for the update, I've applied this now into the review-ilpo-next=
=20
> >> branch. BUT, this is very late in the cycle now and if there's a build=
=20
> >> issue (or LKP doesn't build test it in reasonable time), I'll have to =
drop=20
> >> this series and postpone it into the next cycle as I don't want to del=
ay=20
> >> the main PR to Linus too long.
> >>=20
> >> But lets hope for the best, I think some depends on issues were fixed=
=20
> >> earlier (IIRC), so hopefully it works good enough now. :-)
>=20
> >Hmpf, these give me a few new warnings related to this series:
> >
> >make W=3D1 drivers/platform/x86/
> >make C=3D2 drivers/platform/x86/
> >
> >...I really don't know why sparse complains about the lock context=20
> >imbalance though, those functions use guard().
>=20
> Hmm, I'll take a look at it.

Thanks.

> Is there a comprehensive list of all tests that need to be run? I'd like=
=20
> to improve my process to avoid these in the future.=20

There's some list in Documentation/process/submit-checklist.rst
but use reason with some of the items whether they're relevant, I think=20
very few patches would meet _all_ of those in the most literal=20
interpretation :-).

> >There's also a copy-paste error:
> >
> > * lwmi_gz_profile_get_get() - Get the current platform profile.
> >
> >..._get_get -> ..._set
> >Get -> Set
>=20
>=20
> Do you want me to submit v12 whenever it's ready,  or wait for the merge=
=20
> window to open? Trying to avoid too much noise on your end.

Just send v12 when it's ready. For pdx86, there's no need to avoid sending=
=20
during merge window (just don't assume anything gets applied during merge=
=20
window :-)).

--=20
 i.

--8323328-796157268-1748250653=:932--
