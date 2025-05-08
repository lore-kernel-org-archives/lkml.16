Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40E62222D9;
	Thu,  8 May 2025 14:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746714466; cv=none; b=LBi4quKFp14FAduKLDCrwL3noq27kYSrwkAq3UqtjW5t4x0AbR7qsJ7dEETjQdxRYd4Ow7Y0LqlzGfAHFRKsgeViGpJB75Z9ptG6nkoCd8YBqra8Q0HeKW/6HGUM8aEQLSAu3+MT/RiRLvjR6be3Z4YXwzc2Ygo8IrHtnjcCV8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746714466; c=relaxed/simple;
	bh=imBtFIIv6sTlsgn+RcpBBQmVjn8hLyA7l3y4aXEQvO4=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mLROr223TCA+PCvj46J9H/lHMwKr5vy7AFeWVBDh8PiZKPKnSazf9+TZIVOxrKUWnqPAyD3w954J4Eqh29ck9uij6hfvbWjh0oWCnV7iRD3yKoKnAW+tKpMcjRfQuhl3o41tEscDLjyaYX+in9DKyNzIXMfZZh5zjBivgIMo9M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=faxvOZU+; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="faxvOZU+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746714465; x=1778250465;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=imBtFIIv6sTlsgn+RcpBBQmVjn8hLyA7l3y4aXEQvO4=;
  b=faxvOZU+XNOUoeHlvO9ehubgNVuSLL6bPkSUp0K1X10s0IfLInOc23Nq
   BaKdhKRBKbSFXTqA0r0WztLySm72clVxKtRKiT8A4xpwEprfCc8re1aM0
   ke+4/Y6BeQTFoF5XbYsQzUJrbhJZ2h4myOkRvFUrXhTjL3qQi7Z6MS1mE
   SkZVQclgX2QgpxiFcJv18RCFeWEwwSSky8xe+WMJrChZq3G6D2AvUXas3
   6PJQc7iL6XwhwCBCJmeK3J9/PqB5Z20cjcqdwgxMnZJ/LlA8fUIbWY22o
   HN704f0OGPZxOwXi4K4SGPv/T6Lf+xKszyyW2UCqCsArKWTHdUx1JM71d
   A==;
X-CSE-ConnectionGUID: 97wt4hx3R2urzDxdpNZahQ==
X-CSE-MsgGUID: 1OuXtnbNQ5Ct3kkRSgF7xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48666357"
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="48666357"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:27:44 -0700
X-CSE-ConnectionGUID: Gby/xMVvQ5SLYM8T0t9O/w==
X-CSE-MsgGUID: y9OM4uPATc+g2pOsSv43zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,272,1739865600"; 
   d="scan'208";a="137304624"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.196])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2025 07:27:40 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 8 May 2025 17:27:37 +0300 (EEST)
To: Mark Pearson <mpearson-lenovo@squebb.ca>
cc: Hans de Goede <hdegoede@redhat.com>, ikepanhc@gmail.com, 
    Armin Wolf <W_Armin@gmx.de>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    LKML <linux-kernel@vger.kernel.org>, 
    "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, 
    ibm-acpi-devel@lists.sourceforge.net
Subject: Re: [PATCH 1/2] platform/x86: Move Lenovo files into lenovo subdir
In-Reply-To: <6d4f3523-0d3a-4f1a-bec9-d053fad8a509@app.fastmail.com>
Message-ID: <2640c7dc-5870-f57d-e1cd-535f5c48d950@linux.intel.com>
References: <mpearson-lenovo@squebb.ca> <20250507190456.3004367-1-mpearson-lenovo@squebb.ca> <09a628d3-5903-5d5d-b874-5e77bbdf939a@linux.intel.com> <6d4f3523-0d3a-4f1a-bec9-d053fad8a509@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1638176208-1746714457=:922"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1638176208-1746714457=:922
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 8 May 2025, Mark Pearson wrote:
> On Thu, May 8, 2025, at 10:01 AM, Ilpo J=C3=A4rvinen wrote:
> > On Wed, 7 May 2025, Mark Pearson wrote:
> >
> >> Move all Lenovo specific files into their own sub-directory as part
> >> of clean-up exercise.
> >> Longer term goal is to break-up thinkpad_acpi to improve maintainabili=
ty
> >> and perhaps share more functionality with other non thinkpad Lenovo
> >> platforms.
> >>=20
> >> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> >> ---
> >> Some questions that I didn't want to put in the commit comment:
> >>=20
> >>  - I didn't know if now was a good time to propose this change. I
> >>    realise it could cause headaches for anybody with patches being
> >>    worked on.
> >
> > Don't worry too much about other changes, if you don't recall anything=
=20
> > immediately, there likely isn't anything that significant. If we always
> > postpone useful reorganizations in fear that some hypothetical work wou=
ld=20
> > have to rebase, it never gets done :-).
> >
> >>    Please let me know what makes it easiest for maintainers
> >>    and other developers. If there is a particular branch that would be
> >>    better to do this against also let me know.
> >
> > Once I've merged fixes branch into for-next (I should do that at latest=
=20
> > early next week if not already this week), it should be pretty=20
> > straightforward to handle such move without conflicts.
> >
>=20
> OK - thanks. If there's anything I can do to help let me know.
>=20
>=20
> >>  - Should I be updating the MAINTAINERS file? I'm still not sure what
> >>    the protocol there is. I'm very happy to help review anything in th=
e
> >>    lenovo directory, but I didn't want to make assumptions.
> >
> > You should certainly update MAINTAINERS in the same patch to the new=20
> > paths. If you want to make other changes, put them such as add your nam=
e=20
> > into some entry or create a generic LENOVO entry, put those into own=20
> > patch after the move please.
> >
>=20
> OK - I'll submit a v2 with that change. Thanks for the guidance

Yes but please wait until I've done the merge so you can base v2 on top of=
=20
it. Thanks.

> >>  - I have tested on multiple platforms but I don't have any ideapads I
> >>    can use.
> >
> > Given it's just moves file to new place, the threat of breaking somethi=
ng=20
> > that isn't detected by simple build test, isn't that high.
> >
> Agreed - thanks for the review.
>=20
> Mark
>=20

--=20
 i.

--8323328-1638176208-1746714457=:922--
