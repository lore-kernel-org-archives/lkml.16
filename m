Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E1C28982A;
	Wed,  7 May 2025 13:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746623358; cv=none; b=lpNgvFB8UU5QlW6qc62KI8QRvNZrNCzAQY+v0vb4kg9ii6YRa6yhSlxuq5PRnVJKmX8mP1hD/19Umo0+8IqgEiSte5NrJ8MhqkAkG7Qy73Xx/yRCTykhmKAlnNObup/wT/aP2TNmDyezegZQNm5TNuIdRQRwZEMWRxgBkj+RFoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746623358; c=relaxed/simple;
	bh=kMgdzLabAxL6YnP/fjeNcPYjDESyaG+EhzaI9fwEYGU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=k7323D7sQVG8LEKd743fF2xtlp3h2L3wKSv34ntYioE79rTh3P8CvDWIAhqkN5ESRNdEuBtFDOgQ2TBqiBtlkfsyUiJ6X2BjHIHDbBqTrbctGVNYuGrqdilNX4XUnNa1RD3CCxL/Xc0t/iERinttXMYuQxodpmwd7Q5jUKLpic8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n9ucu/DO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n9ucu/DO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746623356; x=1778159356;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=kMgdzLabAxL6YnP/fjeNcPYjDESyaG+EhzaI9fwEYGU=;
  b=n9ucu/DO6/ix/9hOBLJ+e4CO/KS9Ioqi9yTxPMOrOOuL4PXc76EXOXNr
   vsNDcAcGGgYBi5MA4EqoyzTHiREZ9+QYfAUhNf1V6I6kp8Xedxd/bv0LU
   +DoQjBlA3SFK1SvsW8h9SR4UrvbYp6puc2MicZf3ogfYmBdYwvS8CYL4j
   qn8L7oyO1peTdg7BWERK8T0+X8ot9ezRAsXNfNf1WTEzl1ctvKuDWhj4t
   DuZBnKHkOBjbKs2hxLE37SPVfvwaWQq6gKTipwwkBiv53V6hJreExYSIH
   SDwy7+M0rLzZvDfEmtTh+sl5kxAiQlWo9U9rKFoGOEHmwkYmGe1lM17Ul
   w==;
X-CSE-ConnectionGUID: tXsct6ByTXiKsWW4S2otRg==
X-CSE-MsgGUID: uv6y4czrQpG26oAZ2O+Lmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="47451592"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="47451592"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:09:15 -0700
X-CSE-ConnectionGUID: cSqpTXqLQoiRwUgKlM9RlA==
X-CSE-MsgGUID: TllN34sVS6+442M8ka57Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="140000252"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.30])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 06:09:12 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 7 May 2025 16:09:09 +0300 (EEST)
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] Documentation: admin-guide: pm: Add documentation
 for die_id
In-Reply-To: <20250428170316.231353-6-srinivas.pandruvada@linux.intel.com>
Message-ID: <5b93214c-458c-c062-7a7b-45750f368c35@linux.intel.com>
References: <20250428170316.231353-1-srinivas.pandruvada@linux.intel.com> <20250428170316.231353-6-srinivas.pandruvada@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1427501539-1746623171=:949"
Content-ID: <e2fe5a41-0d7d-9ca1-9ee8-e62ba848a524@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1427501539-1746623171=:949
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <8e1b33c4-a768-500f-4c74-e5f8c1eff9a4@linux.intel.com>

On Mon, 28 Apr 2025, Srinivas Pandruvada wrote:

> Add documentation to describe die_id attribute.
>=20
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
> v2:
> Change "attributes" to "attribute"
>=20
>  .../admin-guide/pm/intel_uncore_frequency_scaling.rst        | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.=
rst b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
> index 84608dad84bd..d7ffda6a8095 100644
> --- a/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
> +++ b/Documentation/admin-guide/pm/intel_uncore_frequency_scaling.rst
> @@ -91,6 +91,11 @@ Attributes in each directory:
>  ``domain_id``
>  =09This attribute is used to get the power domain id of this instance.
> =20
> +``die_id``
> +=09This attribute is used to get the Linux die id of this instance.
> +=09This attribute is only present for domains with core agents and
> +        when the CPUID leaf 0x1f presents die ID.
> +
>  ``fabric_cluster_id``
>  =09This attribute is used to get the fabric cluster id of this instance.
> =20
>=20

For patches #2-#5,

Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>

It would have been nice to use cleanup.h in #3 but there's no good=20
alternative for no_free_ptr() that doesn't have __must_check (IIRC,=20
somebody proposed a solution to this relatively recently but I don't see=20
that in linux/cleanup.h currently so lets forget that for now).

--=20
 i.
--8323328-1427501539-1746623171=:949--
