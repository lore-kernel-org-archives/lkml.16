Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D069E1534EC;
	Fri,  6 Jun 2025 14:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749220114; cv=none; b=ZASnx9XHrUNfhUrDNSgHX0JX2OoR0vAWBUBsnOnlo7Ut8hrZFtLYYRBg+aOWjM3wHvbV7IRwRKTcO21aL1WJwTnRsuCwSs9tS8XJYR3Owqx07Tb3wlVVectX9ZLhoqXKhWU7QppEmU0mY1XSIXSQpdJuvLQArhJzGsjO3uYorFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749220114; c=relaxed/simple;
	bh=53Ex4c46jHWyz2mMEelxLlc4ZhhiL9qpn6AzizAK0oM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ILcAMW59K8Oilvv0/YFYx1GLSZOIkGnV6WlkmUqW6FdoppJ6uc/tXTOb2mOcWRKCxrHTy7SOdyyZLnA4bkV1es4dpB3XuZmEKPifeU2nxWjDmnLP8z0IdsNg1/1Dw32vjRL3PX64ARpHY3L6Sm4dlj0vUYhEOxry622AGmZvrNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mgv5Fpav; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mgv5Fpav"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749220113; x=1780756113;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=53Ex4c46jHWyz2mMEelxLlc4ZhhiL9qpn6AzizAK0oM=;
  b=Mgv5FpavyX0R7X45pnbCUQcgDXy07cK2Fn5r0367De7G1Ib+eLiZCO9o
   ZvVMMR/We7Fr8y9udDirtMW5zjAtEXlMBkqu0TXVDqKiuW4Ir7DaClAZO
   Imc7j7NaoM4dcVEEV/jrd0EC5lG4T6XKiIDQt2DvxW1alau7GlHAYA6w6
   IqXN8igzYZvQ+8I5d0f9wZ4ru4bafOv1qOcv8MYJNlC0TWXfy3vGF2vXd
   47bUie/X6RrRB6hW9jgsmFFwVaB2vgqTWq/5ovEc4tITXcIn9hGHmjMtM
   dzhIqIAh+ncyFloQVXb9eT/yrTEzab/SBwZY3IL+jYWRv6VvY3GGOmp0D
   Q==;
X-CSE-ConnectionGUID: CzJg8o+IRsC8cuwlGAvSNw==
X-CSE-MsgGUID: 5aTyCbw8QnOqnKPbKupagw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51076071"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="51076071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 07:28:28 -0700
X-CSE-ConnectionGUID: /NzKoUHWRDua3ANvn/f/1w==
X-CSE-MsgGUID: wwcVO4s3SNqWDhf7i+2Ymg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; 
   d="scan'208";a="150851783"
Received: from spandruv-desk1.amr.corp.intel.com ([10.124.222.159])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2025 07:28:28 -0700
Message-ID: <67fea61ec40d0e54d4674ab83728e84120d9fb9d.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel: power-domains: Fix error code in
 tpmi_init()
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Greg KH	 <gregkh@linuxfoundation.org>, Ingo Molnar <mingo@kernel.org>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Date: Fri, 06 Jun 2025 07:28:26 -0700
In-Reply-To: <aEKvIGCt6d8Gcx4S@stanley.mountain>
References: <aEKvIGCt6d8Gcx4S@stanley.mountain>
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

On Fri, 2025-06-06 at 12:04 +0300, Dan Carpenter wrote:
> Return -ENOMEM instead of success if kcalloc() fails.
>=20
> Fixes: e37be5d85c60 ("platform/x86/intel: power-domains: Add
> interface to get Linux die ID")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by:Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>


> ---
> =C2=A0drivers/platform/x86/intel/tpmi_power_domains.c | 4 +++-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c
> b/drivers/platform/x86/intel/tpmi_power_domains.c
> index 0c5c88eb7baf..9d8247bb9cfa 100644
> --- a/drivers/platform/x86/intel/tpmi_power_domains.c
> +++ b/drivers/platform/x86/intel/tpmi_power_domains.c
> @@ -228,8 +228,10 @@ static int __init tpmi_init(void)
> =C2=A0
> =C2=A0	domain_die_map =3D kcalloc(size_mul(topology_max_packages(),
> MAX_POWER_DOMAINS),
> =C2=A0				 sizeof(*domain_die_map),
> GFP_KERNEL);
> -	if (!domain_die_map)
> +	if (!domain_die_map) {
> +		ret =3D -ENOMEM;
> =C2=A0		goto free_domain_mask;
> +	}
> =C2=A0
> =C2=A0	ret =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
> =C2=A0				"platform/x86/tpmi_power_domains:onl
> ine",
