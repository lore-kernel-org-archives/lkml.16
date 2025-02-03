Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367A7204C06;
	Mon,  3 Feb 2025 13:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738588719; cv=none; b=hbW79XT7gIPdz0Q13JyOkjSCjOwrygIaJGaRCnEgyy1vY7ofJz9GsePwKnVk2F87KBBm7k3e9UEXoBVtqMz+6Ghfhv435OIrNRdfcBLe8nQfRLfcESt4KPM8gZ2jlUFM3go4wU4x0/C7vqrK2MiicOI/6bh8zx+JSyuIyJE67C8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738588719; c=relaxed/simple;
	bh=viXhNRMd570i39E6keRKiGVIaJj5Icv6DctE4uefxgw=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=oslwKyYCfonXS8sON4JVC8U/6RYb3Fwd9YG/5TGHbUyw+MYdOYo8SKRwMlqWDKkwxF+MRFx49Kx1j3I48zp7w3BRcbRLGSs4JN/HxHPe8HVUNRxHcCkD7Ii+R64p0mTuKdk4td+VqkEbnLRtmg3G8Lb72bvyVfjjipd0tR+Exlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NXBR4/JR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NXBR4/JR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738588718; x=1770124718;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=viXhNRMd570i39E6keRKiGVIaJj5Icv6DctE4uefxgw=;
  b=NXBR4/JRYOZykwmYN7K66vrJgQ538ulgdJOvMhKDgD5/39KZmljgg9SI
   3JC/PTgKU5AxPmJ+5/JdiCvgTZeAxn6dDHEqML53PoxUjBh8bPohjuJQo
   cKTxr9VrgekGtdaE5XNheUfWBnw0MUBDMV7eugh9EmA1vFfTo7UrHnmmw
   7ynOqCHdlwdRoxfFWHIl4BtRqVX246C+x/DKRrrxzYKwNk3AnLygP7+YK
   4BLOw37hv77O0SwKn/2n7A2Didk5ARJC+LM7V3c2KI6iAo3uf3hMN81pI
   i2GaiymQK+CbfckZ8ozxvgTT1n+lyWNV7aChfPfeh7u4vQuMh/4UoMI2z
   w==;
X-CSE-ConnectionGUID: l6Aq8E93SNqxP1cFznYzCA==
X-CSE-MsgGUID: fewUe93zQKyxnsUjka6QEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="43002569"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="43002569"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:18:38 -0800
X-CSE-ConnectionGUID: +ewDqooiQDqFGv6rEBQOzw==
X-CSE-MsgGUID: pBr7nZcjRsSLGd+o5lCK1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115320487"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:18:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 15:18:31 +0200 (EET)
To: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
cc: Sybil Isabel Dorsett <sybdorsett@proton.me>, 
    Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
    Hans de Goede <hdegoede@redhat.com>, ibm-acpi-devel@lists.sourceforge.net, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Fix invalid fan speed on ThinkPad X120e
In-Reply-To: <d20f933c-8041-bc8d-13c2-98d89ccfa524@linux.intel.com>
Message-ID: <cc7c8e94-4340-3d1e-03b4-2f738067d24f@linux.intel.com>
References: <20250131203854.6608-1-sybdorsett@proton.me> <69e279a3-7fd5-9dc3-680d-7415022dc5e4@linux.intel.com> <20250203130232.3481-1-sybdorsett@proton.me> <d20f933c-8041-bc8d-13c2-98d89ccfa524@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-781718710-1738588711=:934"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-781718710-1738588711=:934
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 3 Feb 2025, Ilpo J=C3=A4rvinen wrote:

> On Mon, 3 Feb 2025, Sybil Isabel Dorsett wrote:
>=20
> > On ThinkPad X120e, fan speed is incorrectly reported in ticks
>=20
> I'd drop "incorrectly".
>=20
> > per revolution rather than RPM.
> >=20
> > Recaculate the fan speed value reported for ThinkPad X120e
>=20
> Recalculate
>=20
> With those two changed, feel free to add:
>=20
> Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

Err, you also need to add the correct prefix to the shortlog in the=20
subject, thanks.

--=20
 i.

--8323328-781718710-1738588711=:934--
