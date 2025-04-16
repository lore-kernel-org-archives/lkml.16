Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DAA230BCF;
	Wed, 16 Apr 2025 20:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836015; cv=none; b=XOqn4IGS9OkVRUW304fsRjvTmGZWJqvCx5F0pCVzjJgSHxm5Odl2cQC2Yvv/+TaJHeMpsW8xN9U7w+PGHJbCt6P1T3gYqIM4U/ILssx9fA/BcASPg4jEFyQ/8IbQ+nqqd0JGNPDG7GV9kO8887hy0PZkmQ349jF9lUIKzqkS+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836015; c=relaxed/simple;
	bh=5cGCg9jze7BCSmIxo9og5z3xt+NER9dHesKxa23q78Y=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dSp0GBMLj9oLkUnsJKOMWd+Be/gZa4p/Xing7U/hM4wR/Yz2T18ODcKKXtbi8L27chP7QNKMQ1ykCnHVhKRzYjPMny8dfyMfnp6OVQB2V3sinYkrx0Na1o68EWvPLgzqApCc01EqGD8taV8mJKSefWUzUCMFs1Z9QX7x6UfAdK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+ObKBqV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+ObKBqV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744836014; x=1776372014;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=5cGCg9jze7BCSmIxo9og5z3xt+NER9dHesKxa23q78Y=;
  b=f+ObKBqVBPgGJHrbD1m6k+m4DCgIEJnWUYpzcqagWPby+d6qSiEl5vHG
   pFRT9acfV9xqda1zC0cZeI7boqiZxLUBWpagpiwB2jpxgvRhUU5r0R9Su
   eRmBA33O6Q4uczDjFn3nSRzpZn9h1t+YoTgEh4dWiJNoJFgehll6U2aBG
   DOzL/wS6//yh47m3zPrmJJskXr5XCtteTbKIZ9zpuoBPqP3LiuCVxTkG1
   OUZYD8SIr5EFxWbUwlNi4WuJbePidM3vLRFDNBvlDZrw8ZA4PjE0UXPf1
   sMpH3NHtK6O0tZfDuPEuEAqX0WlDPvwnDxdGQ20p2ACzEmpVWPA2MwiHj
   A==;
X-CSE-ConnectionGUID: WFykIn71QPuf/fRQYCWlAQ==
X-CSE-MsgGUID: B2L8bG0KQYOg6aNtVZarTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46534759"
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="46534759"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 13:40:13 -0700
X-CSE-ConnectionGUID: TO8T7NIJReGJA1L3xX0wXg==
X-CSE-MsgGUID: yydc5MUwQGKQLT/WUf1CVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,217,1739865600"; 
   d="scan'208";a="131571537"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.110.5])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 13:40:13 -0700
Message-ID: <da00e02b7ae32331794314b4d877987a6f2b1cf2.camel@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86/intel-uncore-freq: Fix missing uncore
 sysfs during CPU hotplug
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: shouyeliu <shouyeliu@gmail.com>, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Shouye Liu <shouyeliu@tencent.com>
Date: Wed, 16 Apr 2025 13:40:12 -0700
In-Reply-To: <20250416033842.67394-1-shouyeliu@gmail.com>
References: <20250416033842.67394-1-shouyeliu@gmail.com>
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

On Wed, 2025-04-16 at 11:38 +0800, shouyeliu wrote:
> From: Shouye Liu <shouyeliu@tencent.com>
>=20
> In certain situations, the sysfs for uncore may not be present when
> all
> CPUs in a package are offlined and then brought back online after
> boot.
>=20
> This issue can occur if there is an error in adding the sysfs entry
> due
> to a memory allocation failure. Retrying to bring the CPUs online
> will
> not resolve the issue, as the uncore_cpu_mask is already set for the
> package before the failure condition occurs.
>=20
> This issue does not occur if the failure happens during module
> initialization, as the module will fail to load in the event of any
> error.
>=20
> To address this, ensure that the uncore_cpu_mask is not set until the
> successful return of uncore_freq_add_entry().
>=20
Fixes: dbce412a7733 ("platform/x86/intel-uncore-freq: Split common and
enumeration part")

> Signed-off-by: Shouye Liu <shouyeliu@tencent.com>
Cc: stable@vger.kernel.org

Thanks,
Srinivas

> ---
> =C2=A0.../x86/intel/uncore-frequency/uncore-frequency.c=C2=A0=C2=A0 | 13 =
+++++++++--
> --
> =C2=A01 file changed, 9 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-
> frequency.c
> index 40bbf8e45fa4..bdee5d00f30b 100644
> --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency.c
> @@ -146,15 +146,13 @@ static int uncore_event_cpu_online(unsigned int
> cpu)
> =C2=A0{
> =C2=A0	struct uncore_data *data;
> =C2=A0	int target;
> +	int ret;
> =C2=A0
> =C2=A0	/* Check if there is an online cpu in the package for uncore
> MSR */
> =C2=A0	target =3D cpumask_any_and(&uncore_cpu_mask,
> topology_die_cpumask(cpu));
> =C2=A0	if (target < nr_cpu_ids)
> =C2=A0		return 0;
> =C2=A0
> -	/* Use this CPU on this die as a control CPU */
> -	cpumask_set_cpu(cpu, &uncore_cpu_mask);
> -
> =C2=A0	data =3D uncore_get_instance(cpu);
> =C2=A0	if (!data)
> =C2=A0		return 0;
> @@ -163,7 +161,14 @@ static int uncore_event_cpu_online(unsigned int
> cpu)
> =C2=A0	data->die_id =3D topology_die_id(cpu);
> =C2=A0	data->domain_id =3D UNCORE_DOMAIN_ID_INVALID;
> =C2=A0
> -	return uncore_freq_add_entry(data, cpu);
> +	ret =3D uncore_freq_add_entry(data, cpu);
> +	if (ret)
> +		return ret;
> +
> +	/* Use this CPU on this die as a control CPU */
> +	cpumask_set_cpu(cpu, &uncore_cpu_mask);
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int uncore_event_cpu_offline(unsigned int cpu)

