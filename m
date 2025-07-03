Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152A72E2F12
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 11:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751543734; cv=none; b=hKc6bldS1GWJl8h9Avtda3FFN+B0534VKYRP5lufL/HRta/6LqlAXnHfDAPbVR/mkW/jbcZw1jZxRJzsltj4ByHpAKESpwLklty9zJhSV99zq70vvd/4wS1UPLsDcRXvXwUOi+2FbnfVWAPPqTn1fK3x7Nvgrivy9DgihEVYpuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751543734; c=relaxed/simple;
	bh=d9u2wghfe423Wq4JKczWOvxGwGiM2T4qtTPdsfzyQF0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eHFgg7uHhMplt6zrcexscFZgRSNBpc514Kat/c1/qLQZLzxI+NbuMC9hwSQG32ryGXlQ8S2Jb/7fDYrAhP4YCrxK30dx+lbn63uEkbZ0h69hzvwhCPwqTL6QqgxeYf3l3QagV5dG89+RDRPWyEFKBjXiI/VegPIaUVuoN7+k488=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0LCe8Td; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0LCe8Td"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751543732; x=1783079732;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=d9u2wghfe423Wq4JKczWOvxGwGiM2T4qtTPdsfzyQF0=;
  b=j0LCe8TdufL6A6KZ/tQos54ns9pbtP45dRmBGMcOc5uawALm0mr0vjDt
   aZ+8sJgFRlrWkmrbVY+hJWCA90mMqXqv2rcjB5iFC+T9l0YA981Db2Qkf
   Gm/69OPC7c555ebcuyFik4L14S1geyIglOqcsfwoOAsiEEEeJ6MHoRlOM
   UULoSwKmvHg9Vw6mh+uk0+zQna2bBJdzQ82kIIPKlWR5UV/C+LgW6Sxte
   aI9Hk68Ymhu+9L0uCWMHi/gx+2cFmLFai6ycZwuWX6/b+Kf0RosuFc14i
   qvEtp5FFfPutIkeDz/415tDY9dleDL846Q+9KDsZBBo1R0MD+16xeEwGF
   g==;
X-CSE-ConnectionGUID: 3V5W+h3PQ1eNJH6NKeZAAg==
X-CSE-MsgGUID: Pc6pTNKFTQCMqihDzoQwvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="56488077"
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="56488077"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 04:55:31 -0700
X-CSE-ConnectionGUID: kTc3x7ZIRqqIV+dhur8KLg==
X-CSE-MsgGUID: cI1+TJDBQVyM+MYJrwsdyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,284,1744095600"; 
   d="scan'208";a="185299030"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.246.73])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2025 04:55:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, Dibin Moolakadan
 Subrahmanian <dibin.moolakadan.subrahmanian@intel.com>, Imre Deak
 <imre.deak@intel.com>, David Laight <david.laight.linux@gmail.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Matt Wagantall
 <mattw@codeaurora.org>, Dejin Zheng <zhengdejin5@gmail.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, Ville
 =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH 2/4] iopoll: Avoid evaluating 'cond' twice in
 poll_timeout_us()
In-Reply-To: <20250702223439.19752-2-ville.syrjala@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702223439.19752-1-ville.syrjala@linux.intel.com>
 <20250702223439.19752-2-ville.syrjala@linux.intel.com>
Date: Thu, 03 Jul 2025 14:55:24 +0300
Message-ID: <514069318ce4ae0746af507aa24321ddfe4dc399@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, 03 Jul 2025, Ville Syrjala <ville.syrjala@linux.intel.com> wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>
> Currently poll_timeout_us() evaluates 'cond' twice at the end
> of the success case. This not desirable in case 'cond' itself
> is expensive.
>
> Avoid the double evaluation by tracking the return value in
> a variable. Need to use a triple undescore '___ret' name to
> avoid a conflict with an existing double undescore '__ret'
> variable in the regmap code.
>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Dibin Moolakadan Subrahmanian <dibin.moolakadan.subrahmanian@intel.co=
m>
> Cc: Imre Deak <imre.deak@intel.com>
> Cc: David Laight <david.laight.linux@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Matt Wagantall <mattw@codeaurora.org>
> Cc: Dejin Zheng <zhengdejin5@gmail.com>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  include/linux/iopoll.h | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/iopoll.h b/include/linux/iopoll.h
> index 0d8186d3df03..69296e6adbf3 100644
> --- a/include/linux/iopoll.h
> +++ b/include/linux/iopoll.h
> @@ -36,23 +36,30 @@
>  	u64 __timeout_us =3D (timeout_us); \
>  	unsigned long __sleep_us =3D (sleep_us); \
>  	ktime_t __timeout =3D ktime_add_us(ktime_get(), __timeout_us); \
> +	int ___ret; \
>  	might_sleep_if((__sleep_us) !=3D 0); \
>  	if ((sleep_before_op) && __sleep_us) \
>  		usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
>  	for (;;) { \
>  		op; \
> -		if (cond) \
> +		if (cond) { \
> +			___ret =3D 0; \
>  			break; \
> +		} \
>  		if (__timeout_us && \
>  		    ktime_compare(ktime_get(), __timeout) > 0) { \
>  			op; \
> +			if (cond) \
> +				___ret =3D 0; \
> +			else \
> +				___ret =3D -ETIMEDOUT; \
>  			break; \
>  		} \
>  		if (__sleep_us) \
>  			usleep_range((__sleep_us >> 2) + 1, __sleep_us); \
>  		cpu_relax(); \
>  	} \
> -	(cond) ? 0 : -ETIMEDOUT; \
> +	___ret; \
>  })
>=20=20
>  /**
> @@ -83,6 +90,7 @@
>  	s64 __left_ns =3D __timeout_us * NSEC_PER_USEC; \
>  	unsigned long __delay_us =3D (delay_us); \
>  	u64 __delay_ns =3D __delay_us * NSEC_PER_USEC; \
> +	int ___ret; \
>  	if ((delay_before_op) && __delay_us) { \
>  		udelay(__delay_us); \
>  		if (__timeout_us) \
> @@ -90,10 +98,16 @@
>  	} \
>  	for (;;) { \
>  		op; \
> -		if (cond) \
> +		if (cond) { \
> +			___ret =3D 0; \
>  			break; \
> +		} \
>  		if (__timeout_us && __left_ns < 0) { \
>  			op; \
> +			if (cond) \
> +				___ret =3D 0; \
> +			else \
> +				___ret =3D -ETIMEDOUT; \
>  			break; \
>  		} \
>  		if (__delay_us) { \
> @@ -105,7 +119,7 @@
>  		if (__timeout_us) \
>  			__left_ns--; \
>  	} \
> -	(cond) ? 0 : -ETIMEDOUT; \
> +	___ret; \
>  })
>=20=20
>  /**

--=20
Jani Nikula, Intel
