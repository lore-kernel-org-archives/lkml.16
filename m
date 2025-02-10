Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AE9231A26;
	Mon, 10 Feb 2025 14:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739196460; cv=none; b=PKxRVMFt5PbiQsBPsU1UP/nreb5fR9N7bmoblwaE/1DHYfvffGUqTkr999DhOnLPPZ5x2r8ZHXkcFpRk7zW/SMJkDXnDfY3GuXqdHhx/WbeMe8b20m774RRSqpvL2wWmfwLiUoYHE4t6wI5tDh7XCX3zXKFfHjvkG6+WgZYkVGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739196460; c=relaxed/simple;
	bh=XwSYNhVbOfSulcnrTNMkbediCB2ZsjYWDP6Iqs5aXDw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=RM58UhwnrVQPaVD+VkScTiNUecqxe9n2Jx5XOV3AohbChPVMlZ7ITzjjqiQt8ZPW82ZZsl8xtFZopAH/RWqLjbroJrq4TFGKgjyDesgZ82XA+InaA7pQ/3WxdkMIVmXy3i+1M1wZtQ5fGR15uJo43974RqDirAUnNwHkYZBOIPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+UzHjGt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+UzHjGt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739196458; x=1770732458;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=XwSYNhVbOfSulcnrTNMkbediCB2ZsjYWDP6Iqs5aXDw=;
  b=S+UzHjGtXHb5YFGCGpM6Vt2jMWwBgIW0DQjpY1FRPNizLtpUxPyCewHD
   pzry6ZmGGfP+0vzWeCoeiShmtejoRbKjsyIVXs6rt0olkV7bx3cq0FoHk
   FL+0XH5JTtcdzOtn32rKfrdkrP21ijoIiZGV+5/gp4IcBrM5eMCAp0lwR
   4M3BzVuyeq4+LelcND4Um/9BsmOh0niSd70JP+pa2nEN80dn3JceBRNhf
   7IiqdbaFoOidWjbeAfU434WcehDrOxqTeHDKmO1ncpCk60g7660cW5GrW
   yisGAPbqbVTDHrd1/3jzDIWp6bW7cOUU7q2Xnqz3DEtVIeNRaJtiD/177
   A==;
X-CSE-ConnectionGUID: BsE7/uL/Q0+mv/wgeLtY2g==
X-CSE-MsgGUID: CxM3J1mZT4ub4t5yAz8Fiw==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="50416611"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="50416611"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:07:37 -0800
X-CSE-ConnectionGUID: apRFwDyPT0aryd3XND7vsg==
X-CSE-MsgGUID: rmivH04SSaC6tthq/RTPCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116787704"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.72])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 06:07:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 10 Feb 2025 16:07:31 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v9 11/14] platform/x86: Split the alienware-wmi driver
In-Reply-To: <D7OT982LY0H1.1P6XUU7YTDDMB@gmail.com>
Message-ID: <a360d20e-4c14-18db-64d0-99149cd89d0e@linux.intel.com>
References: <20250207140743.16822-1-kuurtb@gmail.com> <20250207140743.16822-12-kuurtb@gmail.com> <85e378b4-a434-efe1-fd16-416fc3ce3691@linux.intel.com> <D7MBDPIDK7XS.3DONIQK22EIBH@gmail.com> <c314c485-7a6f-b10a-2d80-45a8c5fb331e@linux.intel.com>
 <D7OT982LY0H1.1P6XUU7YTDDMB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1272725192-1739195375=:936"
Content-ID: <0b03cdd4-eb34-784b-0786-981b9e737f6f@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1272725192-1739195375=:936
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <0c930be4-3019-5d9a-e24c-b27e2f3b2a3a@linux.intel.com>

On Mon, 10 Feb 2025, Kurt Borja wrote:

> On Mon Feb 10, 2025 at 6:53 AM -05, Ilpo J=E4rvinen wrote:

> > It is one of the reasons why I prefer to have move patches do as little=
=20
> > extra work as possible because I can use pipelines to verify the pre an=
d=20
> > post content is identical.
> >
> > I usually starting by diffing - and + lines in the diff which is how I=
=20
> > came across this one too. In the best case there are no code line chang=
es=20
> > at all but all changes are in the boilerplate, it gives very high=20
> > confidence on the move being done correctly. When a rebase conflicts,=
=20
> > everyone (me included), might introduce unintended changes to move-only=
=20
> > patches so I tend to check even my own move patches in similar fashion =
to=20
> > avoid making stupid mistakes.
>=20
> Speaking of this. Let's say I want to add a new model to the DMI list,
> how should I go about it?=20
>=20
> If I base it on the fixes branches it's going to conflict when merging
> with Linus, and even worse, it would need to be manually added to
> alienware-wmi-wmax.c every time it happens.
>=20
> My solution is to just base the added models on the for-next branch. Of
> course users wouldn't get this until v6.15 but I'd prefer not to give
> you or some other maintainer extra work.
>=20
> Another solution is to make two patches one for for-next and one for
> stable, but I don't know if people do this to begin with.
>=20
> What do you think about this?

It is possible for me to merge the fixes branch containing the new model=20
into for-next to avoid Linus having to deal with such conflicts. However,=
=20
it only moves the stable conflicts problem by one kernel release because=20
after 6.14 is released, all new additions will be based on the 6.15 code=20
anyway so any patch going into stable will have to deal with the conflicts.

If you so prefer, it is fine for me if you want base them on for-next=20
after such a major restructuring, I won't complain. But as you said,=20
there's a small delay until stable will pick them up. They do actually=20
start to pick the patches into stable right after 6.15-rc1 (and=20
sometimes even during the merge window), not only after 6.15 release.

You do get a FAILED mail from the stable maintainers if a patch they=20
wanted to apply doesn't apply without conflicts and then can send them
a backported version.

--=20
 i.
--8323328-1272725192-1739195375=:936--
