Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ADC1A8401;
	Wed, 23 Apr 2025 13:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745416379; cv=none; b=Krep/E2jgpzrVMQ0PEjM8sXs47kokX6DUJpo+gG2g9xvAZRNf7hZAvxiyxR5OB5BsjD20DXU3OsF+okhu8HNMlEaF52IzI7RPF/P57kzGCinTsJJQfX/5ifPRKawXlO+g/R82pzT+nakRf824zzew1b0E53x5fXZeafXqntQIC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745416379; c=relaxed/simple;
	bh=Tx/ug54lKiJM6dSAtkIrdL/FzrV2DTw6PSXKQN8n3jo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QaePPBcs9I9N0tKjhjBrvEdQub9z/FXcbpScigHaBVoNmhi2LVACDvg0t0Cs8uCTf3iAhZ6nkwsER6XtBlzcjvyqsecaO9XfoJBvfc71eNr82R7tybcy3WSIiBMQPoypWKYyYCEwcpKUVONziViP6HcBVqREK+vyyT/vIevDYDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AtB2lW/y; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AtB2lW/y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745416379; x=1776952379;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Tx/ug54lKiJM6dSAtkIrdL/FzrV2DTw6PSXKQN8n3jo=;
  b=AtB2lW/yuhQfMYfxnyEnIh01uT+zFIsdmueu3sMwM0yV2DRIAgDBQ9v3
   SPSyWWCi94fokyC42UoGWl2x1f0nGadTOGG6Y5aVEqzMs63aG3kNAb+h8
   LM87e7ybV8X0PBkZSlZAoKIGmlqPCuq0oETNH40pN4yPskqm0gqhdeDQv
   1gOu9sfBZaMNPHqEo29B9Url8dFG0plbTnXBUdJAXt93DdIq1yxlL0bSg
   am21Sfo8aETCKmpx8f1pNXYUTs5EMt6q/z51FtaOduXqX5df+Wcfc0cD8
   NMBCGJvUvZVjgnHRcstKPw94V+Lx9ZpI5Ri1xfiwLRQBXB/jd+uWYtimO
   w==;
X-CSE-ConnectionGUID: h9RHlDtrSD61g+iR3R5qOQ==
X-CSE-MsgGUID: rD2l4eeURJOh+bwgIFXlBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="46245458"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="46245458"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:52:58 -0700
X-CSE-ConnectionGUID: U2Niu++rT2acv9S+huh7dQ==
X-CSE-MsgGUID: +9/glV+CR06JlEBRGzU3TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132203491"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.111.228])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 06:52:57 -0700
Message-ID: <381befc68d7ee003c9903c3b16472513e1a5a0eb.camel@linux.intel.com>
Subject: Re: [PATCH 5/5] Documentation: admin-guide: pm: Add documentation
 for die_id
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 23 Apr 2025 06:52:57 -0700
In-Reply-To: <7b09613c-2aba-469f-bc33-358b787e29b0@oracle.com>
References: <20250422213427.1943328-1-srinivas.pandruvada@linux.intel.com>
	 <20250422213427.1943328-6-srinivas.pandruvada@linux.intel.com>
	 <7b09613c-2aba-469f-bc33-358b787e29b0@oracle.com>
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

On Wed, 2025-04-23 at 14:40 +0530, ALOK TIWARI wrote:
>=20
>=20
> On 23-04-2025 03:04, Srinivas Pandruvada wrote:
> > +``die_id``
> > +	This attribute is used to get the Linux die id of this
> > instance.
> > +	This attributes is only present for domains with core
> > agents and
>=20
> typo attributes ->attribute

Thanks for the catch. Will update in next rev.

-Srinivas

>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when the CPUID leaf 0x1f pr=
esents die ID.
> > +
> > =C2=A0 ``fabric_cluster_id``
> > =C2=A0=C2=A0	This attribute is used to get the fabric cluster id of
> > this instance.
> > =C2=A0=20
>=20
>=20
> Thanks,
> Alok

