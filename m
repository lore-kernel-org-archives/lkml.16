Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2A12B9BF;
	Tue, 10 Jun 2025 17:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749576031; cv=none; b=s0VLg/AznrkUO0XnkijBshOoR6oAT5D1Ey7bYMdomPTYLNyIJaHqYoEE3hlPPO+QTW/13sHsPDpfh5bu4DCtVXy56VWNKjo8oB+3Se4lGy4F3xUzICTLnrKjq6x7RPqbdcpux90L7l7sSokGYNdf79kp3BtxUymC6YRTfdKVnxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749576031; c=relaxed/simple;
	bh=dd8LGqw6KmzT3EDtpgY8yDX/k549FfFF0W7Z5EZLhls=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eA4fIO8ooOECseFZjux265+DtVN8sNabCuKudHD9hOC8D4XvHCd/aBSa2nyyd+ah/lnLhccDfLABZNNYXQfQ0z5j8L5w+hptFUp/0gk9YxWLXGfUHLbndMPlrlOJ7X379vuB3cc2NVw/rITAS5Bpz/i65O5pb6OsVB7ho/ggTtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMh/EgV2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMh/EgV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749576030; x=1781112030;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dd8LGqw6KmzT3EDtpgY8yDX/k549FfFF0W7Z5EZLhls=;
  b=BMh/EgV23AWpkjZuImufWIa29yX2X6lfIrM6mcPSaBmLCnyZQHjYR7Ch
   e8Bl6NQLRL95gQQt4oepQQUoNyWYSnIFnpHeDDvox5jKYhndfAbsouC+1
   yu2sFcwNGpeqFmpa1F/SN8a8QwP36V35E3xqDj2A1UHwYBHDco/1hQzTs
   MxgwX8eD/tyHz9nZhkA0UtOboX9Qn1NUZ0ULxFdvb6YF7kDlSKTy/TO5F
   pJWnZhx8mdC+Pacj0VUs61W32LIGhBOXDX3XVQvsJHelIIZdd0XnyITNj
   JjUAGrqbcDbNHBLmQ6yNvfDuqmYqyUc2fO6/+dUCSsCox0x7Q/l1DV9Y2
   A==;
X-CSE-ConnectionGUID: 2CYfSR3KRMi57+AggvzaIQ==
X-CSE-MsgGUID: wMEpefWiTPeJ9vlWi468Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="77104857"
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="77104857"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 10:20:29 -0700
X-CSE-ConnectionGUID: OtbOoN3+Q8yXYU2rH9RjMQ==
X-CSE-MsgGUID: GUxQ3FJCQtmTTr0KUooG0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,225,1744095600"; 
   d="scan'208";a="184083403"
Received: from spandruv-desk1.amr.corp.intel.com ([10.124.220.120])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 10:20:29 -0700
Message-ID: <825016aa048b95b4e5db9c26e9046d82fc4b6a84.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: avoid non-literal
 format string
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
 Ilpo =?ISO-8859-1?Q?J=E4rvinen?=
	 <ilpo.jarvinen@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tero Kristo
 <tero.kristo@linux.intel.com>,  Peter Zijlstra <peterz@infradead.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Jun 2025 10:20:28 -0700
In-Reply-To: <20250610093459.2646337-1-arnd@kernel.org>
References: <20250610093459.2646337-1-arnd@kernel.org>
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
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-10 at 11:34 +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> Using a string variable in place of a format string causes a W=3D1
> build warning:
>=20
I am not able to reproduce with W=3D1 with gcc 15.1.1 20250521 (Red Hat
15.1.1-2).

$touch drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
common.c
$ make -j128 W=3D1
  DESCEND objtool
  CALL    scripts/checksyscalls.sh
  INSTALL libsubcmd_headers
.pylintrc: warning: ignored by one of the .gitignore files
  CC [M]  drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
common.o
  LD [M]  drivers/platform/x86/intel/uncore-frequency/intel-uncore-
frequency-common.o


But verified the change:

Tested-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

Thanks,
Srinivas

> drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c:61:40: error: format string is not a string literal
> (potentially insecure) [-Werror,-Wformat-security]
> =C2=A0=C2=A0 61 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 length +=3D sysfs_emit_at(buf, l=
ength,
> agent_name[agent]);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> ^~~~~~~~~~~~~~~~~
>=20
> Use the safer "%s" format string to print it instead.
>=20
> Fixes: b98fa870fce2 ("platform/x86/intel-uncore-freq: Add attributes
> to show agent types")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> =C2=A0.../x86/intel/uncore-frequency/uncore-frequency-common.c=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2
> +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency-common.c b/drivers/platform/x86/intel/uncore-
> frequency/uncore-frequency-common.c
> index 0f8aea18275b..65897fae17df 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> common.c
> @@ -58,7 +58,7 @@ static ssize_t show_agent_types(struct kobject
> *kobj, struct kobj_attribute *att
> =C2=A0		if (length)
> =C2=A0			length +=3D sysfs_emit_at(buf, length, " ");
> =C2=A0
> -		length +=3D sysfs_emit_at(buf, length,
> agent_name[agent]);
> +		length +=3D sysfs_emit_at(buf, length, "%s",
> agent_name[agent]);
> =C2=A0	}
> =C2=A0
> =C2=A0	length +=3D sysfs_emit_at(buf, length, "\n");
