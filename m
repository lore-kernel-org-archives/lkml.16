Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40793132103;
	Mon, 30 Jun 2025 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751284960; cv=none; b=RPZqOwfl6+UGFAO4JEam45cB4X+dvo3fwEzbMPYPbAatNgaZjLZGYMbglKLTK9s5uk8eHgHpI76ED9r+2+iVXfcS2OqqY2DBIcm/3CUZGb3Boq/qne+BPDSZ1EFKo0XrPbD2IvF0YmGN7aCsfDOh+HP3aCF4FtY6OdDjEcxuDKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751284960; c=relaxed/simple;
	bh=5RekfwTXo10Yx1EOOfiQMD/0763vyzPSeZCffoefbLo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=SEzhQB2fME/2rHF6H1CWpz2Pd4dtVHCZ32Yz7fF/4ZBzfxCkNYA7ksIe33ICeGPA73TloYt5ccbFuLNV/O7AG5JdDPSMow/JGrcO2EjScBPs4KBWkwZO16Y+fI5qtyS26J9X+qS3U3mpuqkRDldDpwKu5FU2rb+mIBFJHsKr5WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtR3ylAk; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtR3ylAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751284959; x=1782820959;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=5RekfwTXo10Yx1EOOfiQMD/0763vyzPSeZCffoefbLo=;
  b=dtR3ylAk+/0x+guWAGZSrMrdoO9PxW0U0bD2zD5KRj0fTsU1IfUB/3DB
   WH1c9i40Ekd9tAH0Yh92ffVuZL2n9B8EMVht7PoOhSwccyatPpi8dbi0G
   iiBAE32xR63E+envq9EuVscUk8MR1cQ0yc6YSacs/34vieqZAQhQOYS2p
   2vI82s67e2YA3btB5JBlgkNOC8TKLg8VgbjGxIVs0z8mfeJE3VkJ4ZVFy
   xsdS3MUqKbWo0FxrwtV9T7TMe/gTbfW7zOi9hAuPwt7m2V1oFmpqMqAIN
   7XOG4Ykk9N1TsT+VO5y6b6hr1MvPeyAH0/5MY5nvotG934mheGP0AKvGE
   g==;
X-CSE-ConnectionGUID: eNpg4jHPSSibD/E75xRVqA==
X-CSE-MsgGUID: QLNkvJeaS1+Z467b8spirg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="52738402"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="52738402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:02:38 -0700
X-CSE-ConnectionGUID: qM69tFEsRty/eWLGgeV66A==
X-CSE-MsgGUID: fg83FO30Qy69tKOyy4Vp3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; 
   d="scan'208";a="184361294"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.65])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 05:02:35 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 30 Jun 2025 15:02:33 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH V2 03/15] platform/x86/intel/vsec: Create wrapper to walk
 PCI config space
In-Reply-To: <20250617014041.2861032-4-david.e.box@linux.intel.com>
Message-ID: <1b2fc196-fc27-f782-e7d6-86b72d950fe7@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com> <20250617014041.2861032-4-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1815301493-1751284953=:7079"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1815301493-1751284953=:7079
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 16 Jun 2025, David E. Box wrote:

> Combine three PCI config space walkers =E2=80=94 intel_vsec_walk_dvsec(),
> intel_vsec_walk_vsec(), and intel_vsec_walk_header() =E2=80=94 into a new=
 wrapper
> function, intel_vsec_feature_walk().  This refactoring simplifies the pro=
be
> logic and lays the groundwork for future patches that will loop over thes=
e
> calls. No functional changes.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>=20
> Changes in v2:
>   - No changes
>=20
>  drivers/platform/x86/intel/vsec.c | 31 ++++++++++++++++++++++---------
>  1 file changed, 22 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/int=
el/vsec.c
> index 59fb6568a855..f01651f498ca 100644
> --- a/drivers/platform/x86/intel/vsec.c
> +++ b/drivers/platform/x86/intel/vsec.c
> @@ -349,6 +349,27 @@ int intel_vsec_register(struct pci_dev *pdev,
>  }
>  EXPORT_SYMBOL_NS_GPL(intel_vsec_register, "INTEL_VSEC");
> =20
> +static void intel_vsec_feature_walk(struct pci_dev *pdev, bool *have_dev=
ices,
> +=09=09=09=09    struct intel_vsec_platform_info *info)
> +{
> +=09/*
> +=09 * Both DVSEC and VSEC capabilities can exist on the same device,
> +=09 * so both intel_vsec_walk_dvsec() and intel_vsec_walk_vsec() must be
> +=09 * called independently. Additionally, intel_vsec_walk_header() is
> +=09 * needed for devices that do not have VSEC/DVSEC but provide the
> +=09 * information via device_data.
> +=09 */
> +=09if (intel_vsec_walk_dvsec(pdev, info))
> +=09=09*have_devices =3D true;
> +
> +=09if (intel_vsec_walk_vsec(pdev, info))
> +=09=09*have_devices =3D true;
> +
> +=09if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
> +=09    intel_vsec_walk_header(pdev, info))
> +=09=09*have_devices =3D true;

Should have_devices be named something more specific in this function or=20
perhaps be simply the return value for this function?

IMO, the name of the function could be better too, having "walk" in the=20
name feels unnecessary internal detail compared to what this function=20
tries to do on a more abstract level.

> +}
> +
>  static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_d=
evice_id *id)
>  {
>  =09struct intel_vsec_platform_info *info;
> @@ -372,15 +393,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev=
, const struct pci_device_id
>  =09priv->info =3D info;
>  =09pci_set_drvdata(pdev, priv);
> =20
> -=09if (intel_vsec_walk_dvsec(pdev, info))
> -=09=09have_devices =3D true;
> -
> -=09if (intel_vsec_walk_vsec(pdev, info))
> -=09=09have_devices =3D true;
> -
> -=09if (info && (info->quirks & VSEC_QUIRK_NO_DVSEC) &&
> -=09    intel_vsec_walk_header(pdev, info))
> -=09=09have_devices =3D true;
> +=09intel_vsec_feature_walk(pdev, &have_devices, info);
> =20
>  =09if (!have_devices)
>  =09=09return -ENODEV;
>=20

--=20
 i.

--8323328-1815301493-1751284953=:7079--
