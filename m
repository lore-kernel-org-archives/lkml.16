Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95545242D73;
	Tue, 29 Apr 2025 17:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745947786; cv=none; b=JVXMPpqtQwqXfH8YvwTjHzVif4NfIMe+NucvwL+bznWhaebD6TcKTN3Z2/hAO/DqBRJc0oNnk+4EBG/baX36znZSzMkdhqz8nnfkLQDizqLO4v7PqDGc19nZh9fKlfQDpUGSGMvEN+BblhY5NIBb24waO75xybul1mNw8MvvD2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745947786; c=relaxed/simple;
	bh=kb1LQkEATwQDObUTfn7dlIuzugD4bFxDOqpPi+yOLKA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=g+i9hHOHPtl4xCzTqu3tYFEiVwohNUv41WyPXuT+Pq9NTY1wM9wWM9reF90kZbqkHYtysVC9sMPp3spMsLYwL27fI7EhgHCTdyPrnZ6o+EPegK4byU+xtx0PhhikZcknvDiogOI+bs7A47FuR1ZCLNXK7nIjKMbv1XhjhgF2VJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fnQ/yhe4; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fnQ/yhe4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745947786; x=1777483786;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=kb1LQkEATwQDObUTfn7dlIuzugD4bFxDOqpPi+yOLKA=;
  b=fnQ/yhe4DL6HOEln7OHLsYulC6SjwkG3idsdSEWzRmgKFRAidqZwix0a
   fmjKaEfbvw6jWs8PvrGYFzhrvRemcVdBcUeKCIYH6cShYv1iGd0Q3uWEU
   ZARR+UScz7uJ9ZkgmuXs9OpiVUexuRon4AcYAPdSxDQ7tFHuPE5O041Ha
   hh7uG6T+7uX/FEWVs+5gkXhXCCfN85zL4V0FRpJK2KhRqPtQ7B1V4LTSP
   nBWVaUQ7GXsi1gV57LRNdJilvzc3Ac2fXSki3Xs4wMtVs+jso1vQm8wzW
   00v7cgMwAOmCaF54RZxmJUPPYf8xaO8l3qZfziN7lnCql9/N9orMdMctl
   w==;
X-CSE-ConnectionGUID: A540W1YGSIu5Wa5hQslO2g==
X-CSE-MsgGUID: FIhZjxk2QR2jGx2XBoQmMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="57784002"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="57784002"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:29:45 -0700
X-CSE-ConnectionGUID: 1MxlXQjRSVSOFrgzSDqt1w==
X-CSE-MsgGUID: qcN81ltcTty7e55AGrlXng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="137905858"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.109.167])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 10:29:44 -0700
Message-ID: <07604feedc23ae2b404f8e9c0cfc1c19e2eb27e8.camel@linux.intel.com>
Subject: Re: [PATCH 1/2] platform/x86: ISST: Support SST-TF revision 2
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 platform-driver-x86@vger.kernel.org,  LKML <linux-kernel@vger.kernel.org>
Date: Tue, 29 Apr 2025 10:29:44 -0700
In-Reply-To: <f45da867-1090-51cc-b405-c4a639adb5ab@linux.intel.com>
References: <20250417170011.1243858-1-srinivas.pandruvada@linux.intel.com>
	 <20250417170011.1243858-2-srinivas.pandruvada@linux.intel.com>
	 <f45da867-1090-51cc-b405-c4a639adb5ab@linux.intel.com>
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

On Tue, 2025-04-29 at 17:23 +0300, Ilpo J=C3=A4rvinen wrote:
> On Thu, 17 Apr 2025, Srinivas Pandruvada wrote:
>=20
> > SST-TF revision 2 supports a higher number of cores per bucket, as
> > the
> > current limit of 256 cores may be insufficient. To accommodate
> > this, a
> > new offset, "SST_TF_INFO-8," is introduced, allowing for a higher
> > core
> > count. Utilize this offset instead of the current "SST_TF_INFO-1"
> > offset,
> > based on SST-TF revision 2 or higher, and if there is a non-zero
> > core
> > count in any bucket.
> >=20
...

> > +	if (feature_rev >=3D 2) {
> > +		bool valid =3D false;
> > +
> > +		for (i =3D 0; i < SST_TF_INFO_8_BUCKETS; ++i) {
> > +			_read_tf_level_info("bucket_*_mod_count",
> > turbo_freq.bucket_core_counts[i],
> > +					=C2=A0=C2=A0=C2=A0 turbo_freq.level,
> > SST_TF_INFO_8_OFFSET,
> > +					=C2=A0=C2=A0=C2=A0 SST_TF_NUM_MOD_0_WIDTH
> > * i, SST_TF_NUM_MOD_0_WIDTH,
> > +					=C2=A0=C2=A0=C2=A0 SST_MUL_FACTOR_NONE)
> > +
> > +			if (!valid &&
> > turbo_freq.bucket_core_counts[i])
>=20
> I'd just drop !valid from this check.
>=20
> > +				valid =3D true;
> > +		}
> > +
> > +		if (valid)
>=20
>=20
> Should this be named instead to something like has_tf_info_8 ? (As
> this is=20
> not really valid/invalid check but whether this new info exists or
> not.)
We can.

Thanks,
Srinivas

>=20
> > +			goto done_core_count;
> > +	}
> > +
> > =C2=A0	for (i =3D 0; i < TRL_MAX_BUCKETS; ++i)
> > =C2=A0		_read_tf_level_info("bucket_*_core_count",
> > turbo_freq.bucket_core_counts[i],
> > =C2=A0				=C2=A0=C2=A0=C2=A0 turbo_freq.level,
> > SST_TF_INFO_1_OFFSET,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 SST_TF_NUM_CORE_0_WIDTH * i,
> > SST_TF_NUM_CORE_0_WIDTH,
> > =C2=A0				=C2=A0=C2=A0=C2=A0 SST_MUL_FACTOR_NONE)
> > =C2=A0
> > +
> > +done_core_count:
> > +
> > =C2=A0	if (copy_to_user(argp, &turbo_freq, sizeof(turbo_freq)))
> > =C2=A0		return -EFAULT;
> > =C2=A0
> >=20
>=20

