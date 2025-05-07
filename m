Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDC828B3FA;
	Wed,  7 May 2025 14:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746627493; cv=none; b=ZQkozgDADvW1kHZNPh62+2CYaiPxI9pQvYf9qs5P679riTCvKFZ9UoPp5NFvPzbhYjnDaHQOi3/UlEm8IgoqBpGr9uWH+FWKantmbxcqyiN7/kSWjKceFnsqE85owjxqehvWN85yCRp2jvCGbUUBjHt0eTv0TitckOYtRq4i8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746627493; c=relaxed/simple;
	bh=RhzIpbYDl8eyELJNnv6wzq/l+1FmLCElb3y7Y9HVaUY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AzI8QYOpREze4zLezNIb8ZpNwJp9a97E4jSTMrfYy0QFjOqh5XJO1/LyvVcu/Q9H6zAUgQnx/32WZgVs/zYRP8dPOZnUk7riqhkNCSgTZGDG7IWZBKAlji3UPcokg1Gb76F6RpKgaiaZj4BmKT9dDTaguxSE7lYRO67Xc/Dxxpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7RyfflU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7RyfflU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746627492; x=1778163492;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=RhzIpbYDl8eyELJNnv6wzq/l+1FmLCElb3y7Y9HVaUY=;
  b=D7RyfflU4b4SxdXTd+d+sHQ8aIRrqz0U7hr1peLWGzydnfSrGjeWDS10
   l+0k2iHLEbc6lIX4FU/aV2OaQyQjWVvYTTwvZl0xho9DP8NlGdW5tWGwi
   +HmREzC3f3XezsY2oWJfa0+MoeHFyHbLRoEWCvJ44FFzZrUclorDpCyyi
   bZA/TTO8qvc3R0md89WuxYRWMx/VkuHLbMnJO/ixNRt37pri7iWPTBFna
   JUZBgXmdFtRNcyYqgUiNT5oRpyAeRE4XI/rVo9j1ramatOhVLw95ZQtBG
   GOiWFoU+B7XmOZD/K1lm0ec1n1bBIjzcnXzjrlf2X7mRjW9hsH3YAw2tk
   g==;
X-CSE-ConnectionGUID: xz49VLD3SA++xV2nI5v2/Q==
X-CSE-MsgGUID: veBGodXST3O50P8k1r37uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48263815"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="48263815"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:17:57 -0700
X-CSE-ConnectionGUID: ZxOHtIKiQYS+qT5Z5hQaTg==
X-CSE-MsgGUID: RLjhfDswR9m5aDVQ8JS4xQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="136492492"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.111.226])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 07:17:57 -0700
Message-ID: <06d57c763f54082c01ab7f1ced896910b0e8a680.camel@linux.intel.com>
Subject: Re: [PATCH v2 1/5] platform/x86/intel-uncore-freq: Add attributes
 to show agent types
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org,  LKML <linux-kernel@vger.kernel.org>
Date: Wed, 07 May 2025 07:17:56 -0700
In-Reply-To: <d80e1c91-64c4-8942-921a-91c78b6cbf05@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com>
	 <20250428170316.231353-2-srinivas.pandruvada@linux.intel.com>
	 <d80e1c91-64c4-8942-921a-91c78b6cbf05@linux.intel.com>
Autocrypt: addr=srinivas.pandruvada@linux.intel.com; prefer-encrypt=mutual;
 keydata=mQGNBGYHNAsBDAC7tv5u9cIsSDvdgBBEDG0/a/nTaC1GXOx5MFNEDL0LWia2p8Asl7igx
 YrB68fyfPNLSIgtCmps0EbRUkPtoN5/HTbAEZeJUTL8Xdoe6sTywf8/6/DMheEUzprE4Qyjt0HheW
 y1JGvdOA0f1lkxCnPXeiiDY4FUqQHr3U6X4FPqfrfGlrMmGvntpKzOTutlQl8eSAprtgZ+zm0Jiwq
 NSiSBOt2SlbkGu9bBYx7mTsrGv+x7x4Ca6/BO9o5dIvwJOcfK/cXC/yxEkr1ajbIUYZFEzQyZQXrT
 GUGn8j3/cXQgVvMYxrh3pGCq9Q0Q6PAwQYhm97ipXa86GcTpP5B2ip9xclPtDW99sihiL8euTWRfS
 TUsEI+1YzCyz5DU32w3WiXr3ITicaMV090tMg9phIZsjfFbnR8hY03n0kRNWWFXi/ch2MsZCCqXIB
 oY/SruNH9Y6mnFKW8HSH762C7On8GXBYJzH6giLGeSsbvis2ZmV/r+LmswwZ6ACcOKLlvvIukAEQE
 AAbQ5U3Jpbml2YXMgUGFuZHJ1dmFkYSA8c3Jpbml2YXMucGFuZHJ1dmFkYUBsaW51eC5pbnRlbC5j
 b20+iQHRBBMBCAA7FiEEdki2SeUi0wlk2xcjOqtdDMJyisMFAmYHNAsCGwMFCwkIBwICIgIGFQoJC
 AsCBBYCAwECHgcCF4AACgkQOqtdDMJyisMobAv+LLYUSKNuWhRN3wS7WocRPCi3tWeBml+qivCwyv
 oZbmE2LcxYFnkcj6YNoS4N1CHJCr7vwefWTzoKTTDYqz3Ma0D0SbR1p/dH0nDgN34y41HpIHf0tx0
 UxGMgOWJAInq3A7/mNkoLQQ3D5siG39X3bh9Ecg0LhMpYwP/AYsd8X1ypCWgo8SE0J/6XX/HXop2a
 ivimve15VklMhyuu2dNWDIyF2cWz6urHV4jmxT/wUGBdq5j87vrJhLXeosueRjGJb8/xzl34iYv08
 wOB0fP+Ox5m0t9N5yZCbcaQug3hSlgp9hittYRgIK4GwZtNO11bOzeCEMk+xFYUoa5V8JWK9/vxrx
 NZEn58vMJ/nxoJzkb++iV7KBtsqErbs5iDwFln/TRJAQDYrtHJKLLFB9BGUDuaBOmFummR70Rbo55
 J9fvUHc2O70qteKOt5A0zv7G8uUdIaaUHrT+VOS7o+MrbPQcSk+bl81L2R7TfWViCmKQ60sD3M90Y
 oOfCQxricddC
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-05-07 at 16:02 +0300, Ilpo J=C3=A4rvinen wrote:
> On Mon, 28 Apr 2025, Srinivas Pandruvada wrote:
>=20
> > Currently, users need detailed hardware information to understand
> > the
> > scope of controls within each uncore domain. Uncore frequency
> > controls
> > manage subsystems such as core, cache, memory, and I/O. The UFS
> > TPMI
> > provides this information, which can be used to present the scope
> > more
> > clearly.
> >=20
> > Each uncore domain consists of one or more agent types, with each
> > agent
> > type controlling one or more uncore hardware subsystems. For
> > example, a
> > single agent might control both the core and cache.
> >=20
> > Introduce a new attribute called "agent_types." This attribute
> > displays
> > a list of agents, separated by space character.
> >=20
> > The string representations for agent types are as follows:
> > 	For core agent: core
> > 	For cache agent: cache
> > 	For memory agent: memory
> > 	For I/O agent: io
> >=20
> > These agent types are read during probe time for each cluster and
> > stored
> > as part of the struct uncore_data.
> >=20
> > Signed-off-by: Srinivas Pandruvada
> > <srinivas.pandruvada@linux.intel.com>
> > ---
> > v2:
> > No change
> >=20
> > =C2=A0.../uncore-frequency-common.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 24
> > ++++++++++++++++
> > =C2=A0.../uncore-frequency-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++=
+-
> > =C2=A0.../uncore-frequency/uncore-frequency-tpmi.c=C2=A0 | 28
> > +++++++++++++++++++
> > =C2=A03 files changed, 68 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency-common.c b/drivers/platform/x86/intel/uncore-
> > frequency/uncore-frequency-common.c
> > index 4e2c6a2d7e6e..cfa3039a0e39 100644
> > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> > common.c
> > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> > common.c
> > @@ -43,6 +43,28 @@ static ssize_t show_package_id(struct kobject
> > *kobj, struct kobj_attribute *attr
> > =C2=A0	return sprintf(buf, "%u\n", data->package_id);
> > =C2=A0}
> > =C2=A0
> > +static ssize_t show_agent_types(struct kobject *kobj, struct
> > kobj_attribute *attr, char *buf)
> > +{
> > +	struct uncore_data *data =3D container_of(attr, struct
> > uncore_data, agent_types_kobj_attr);
> > +	int length =3D 0;
> > +
> > +	if (data->agent_type_mask & AGENT_TYPE_CORE)
> > +		length +=3D sysfs_emit_at(buf, length, "core ");
> > +
> > +	if (data->agent_type_mask & AGENT_TYPE_CACHE)
> > +		length +=3D sysfs_emit_at(buf, length, "cache ");
> > +
> > +	if (data->agent_type_mask & AGENT_TYPE_MEMORY)
> > +		length +=3D sysfs_emit_at(buf, length, "memory ");
> > +
> > +	if (data->agent_type_mask & AGENT_TYPE_IO)
> > +		length +=3D sysfs_emit_at(buf, length, "io ");
>=20
> Is this set going to get expanded soon?

Unlikely, as this list is adding every frequency scaled subsystem.

But I will try to change to loop. No issue.

Thanks,
Srinivas


>  It would feel more future proof to
> do this mapping using a loop and array. You also chose the quick and
> dirty=20
> approach wrt. trailing spaces as getting rid of the extra space is a
> bit=20
> tedious when open coding the mapping like that ;-).
>=20

