Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81190283FE2;
	Mon, 16 Jun 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750089882; cv=none; b=YvKq3sKW6CqUIAEO9fe/SRSgPcw095GGv227vQdCraYb7Sj2foWn3axi9RIiYOcqI4NwR1mfsQpnW39cgZR/vKhhHdfkqheTkg1204OTH93WNIxQx7BFm+EH6u4ppzrOqmfAx01+1foxOzo5545jFaZoGqOApvIkDwLDzV5msiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750089882; c=relaxed/simple;
	bh=iqHAfcEE2L0JfOWWsbGPMexlJF+Oe7neMoL811q80vQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I7HccdFD/HTwLqrBvMHo7xJ2qgWVG7oWlEIGyguHTMXQNemtTULkhyHPKWOYFRfXzKadYMUtw0XEkVHpkGO0POSZzMS4PA3B1kl0IRIz0oAEaX+5cUtC5TBfL6TGgcgm5HieYUA8qZuWxb2ev5OhcQyCjGbXpw+FR7DWqt2Uwh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jTi0FrW/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jTi0FrW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750089880; x=1781625880;
  h=message-id:subject:from:reply-to:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=iqHAfcEE2L0JfOWWsbGPMexlJF+Oe7neMoL811q80vQ=;
  b=jTi0FrW/tIvCw0c0NggKCvd7rxUiDfCYx1g3I2Pd9Ndll7PLZ7jl+Ph9
   CI7VB7B1+qbdh/NK1HYkbpi3dOabXc1ZDvMXFt2/51js24eHwtRc4S0zL
   L1gDMVTi5KtKWRT+fdqH4BXGtEFdqtDM0QOFEe3gchL2+Zztucjl8672o
   F88t0vcbjU8MTVeZJLrXVt1w1PTFPxmDBIk4paibhLoKrakS+fDvF0Klr
   XnHHI54gDD7HDF9BIY1ykUsGs3HYiv0uzHhjfqMTSLDuBfLonejS1MPwP
   Wz4B3/p5y8ntckk8YHbByH/K9nX+FJug2Q9SIgZ/aiKByan5f8i+sISW7
   g==;
X-CSE-ConnectionGUID: aT9PN3aHQJS8H9l/5RZLjw==
X-CSE-MsgGUID: CjspogxdS4STnRPS+kiXGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52158458"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52158458"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 09:04:40 -0700
X-CSE-ConnectionGUID: InfjtWltTwShIGwz3jDgow==
X-CSE-MsgGUID: BfKjf7qGQiO8P1edaxT9Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="148351165"
Received: from spandruv-desk2.amr.corp.intel.com ([10.124.223.117])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 09:04:40 -0700
Message-ID: <f50a036f94000bad3de9f10e8a26240a2306c638.camel@linux.intel.com>
Subject: Re: [PATCH 04/15] platform/x86/intel/vsec: Add device links to
 enforce dependencies
From: "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org,  srinivas.pandruvada@linux.intel.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
 xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Date: Mon, 16 Jun 2025 09:04:38 -0700
In-Reply-To: <31ed1609-5da1-722e-5182-5c199a3bcb1f@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
	 <20250430212106.369208-5-david.e.box@linux.intel.com>
	 <31ed1609-5da1-722e-5182-5c199a3bcb1f@linux.intel.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Ilpo,

On Tue, 2025-05-20 at 16:51 +0300, Ilpo J=C3=A4rvinen wrote:
> On Wed, 30 Apr 2025, David E. Box wrote:
>=20
> > New Intel VSEC features will have dependencies on other features, requi=
ring
> > certain supplier drivers to be probed before their consumers. To enforc=
e
> > this dependency ordering, introduce device links using device_link_add(=
),
> > ensuring that suppliers are fully registered before consumers are probe=
d.
> >=20
> > - Add device link tracking by storing supplier devices and tracking the=
ir
> > =C2=A0 state.
> > - Implement intel_vsec_link_devices() to establish links between suppli=
ers
> > =C2=A0 and consumers based on feature dependencies.
> > - Add get_consumer_dependencies() to retrieve supplier-consumer
> > =C2=A0 relationships.
> > - Modify feature registration logic:
> > =C2=A0 * Consumers now check that all required suppliers are registered=
 before
> > =C2=A0=C2=A0=C2=A0 being initialized.
> > =C2=A0 * suppliers_ready() verifies that all required supplier devices =
are
> > =C2=A0=C2=A0=C2=A0 available.
> > - Prevent potential null consumer name issue in sysfs:
> > =C2=A0 - Use dev_set_name() when creating auxiliary devices to ensure a
> > =C2=A0=C2=A0=C2=A0 unique, non-null consumer name.
> > - Update intel_vsec_pci_probe() to loop up to the number of possible
> > =C2=A0 features or when all devices are registered, whichever comes fir=
st.
> > - Introduce VSEC_CAP_UNUSED to prevent sub-features (registered via
> > =C2=A0 exported APIs) from being mistakenly linked.
> >=20
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---

...

>=20
> > +		return ret;
> > +	}
> > +
> > =C2=A0	ret =3D auxiliary_device_add(auxdev);
> > =C2=A0	if (ret < 0) {
> > =C2=A0		auxiliary_device_uninit(auxdev);
>=20
> Don't you need to tear down the device link on failure?

Not necessary according to the doc:


 * If DL_FLAG_STATELESS is set in @flags, the caller of this function is
 * expected to release the link returned by it directly with the help of ei=
ther
 * device_link_del() or device_link_remove().
 *
 * If that flag is not set, however, the caller of this function is handing=
 the
 * management of the link over to the driver core entirely and its return v=
alue
 * can only be used to check whether or not the link is present.


I've tested this with repeat modprobe [-r] and kmemleak detect.

I addressed the rest of you comments across the series and will send V2 sho=
rtly.

Thanks.

David

