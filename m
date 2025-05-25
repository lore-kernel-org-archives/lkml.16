Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216C3FE5;
	Sun, 25 May 2025 21:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748209321; cv=none; b=n8ViPFTpItzp3vkT4V4BA4q3ZDw80ZJOJw+NieX/SfSKaav77XigoDbvEahCrHQoimg+FQ/fd5+xl6PXAyNAUYcbV+PP+lEa54DzHV7q4wNZNIs+PhJuJyahpE2Bkz99YUGwJKEEBDZ/olGVCxWvJyMpnMA4fF96ujebcSX1Ll8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748209321; c=relaxed/simple;
	bh=4sAW3FRGh5aGR1Ta9xW7XMGAVO8e/cRFXMUfT3C1aQc=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=VVrENyPG0ZpfZGaCdQMnEpkCX8Qf4D8LShqILhtyR+4oW7DCvcfjuZxn5gIyK/Dt/vZh1rCfi5KWjxL+/ZY0iVLxTnrVL+89bTB9onBpwXUYjd3qXECGac0WJVnrSNDNUXZ/RaDbs5qma0cr3mtErZTD46pXbXYk5U6Uig+PrS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=laZMt8Kv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="laZMt8Kv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748209320; x=1779745320;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4sAW3FRGh5aGR1Ta9xW7XMGAVO8e/cRFXMUfT3C1aQc=;
  b=laZMt8Kv/H4dHGLBBopjxU9EEY2ZmG6awLlke+CS0lZidsLE2cUfYXWi
   bKkhL2J8sdfc1o/MIqMULjTolp4MlvMIuHC3VEJJ5lluW5vNTAOBEnNVy
   UHgo3dU739zJqC/OlKhTiAOXiQpTon10OOXhoHqZdwoogdX4T0C0AN3Sn
   YHkuBaPT3kyJ/kTcumGpfD8xdXo4au6lOMnveLMbAFUzCv+FbWSV0+l20
   Kmq+f03OzXv6iakp4wFCpD3PAc3pbVQZMlbxaYirNfOmVB9/1Gbxdb7Z0
   IWKoyjRcd5JsDrJrjunMWnqtLi0vs6nr60odChLSh2G+Grg8mfkQ4vcf6
   Q==;
X-CSE-ConnectionGUID: S/3iqDN9RP+xQHQs1Q15wA==
X-CSE-MsgGUID: YjSYxgs/RSy0A/dpXs0x0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="53988069"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="53988069"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:41:59 -0700
X-CSE-ConnectionGUID: UIng33J2R1CWdzr23onQqA==
X-CSE-MsgGUID: 65tmZsiJSqiect0lJPjORQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="143019411"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:41:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 May 2025 00:41:51 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 0/6] platform/x86: Add Lenovo WMI Gaming Series
 Drivers
In-Reply-To: <2972c4c6-7080-e058-ec39-b8c1dc603f7a@linux.intel.com>
Message-ID: <2c7ffaa6-e639-e215-42d0-78a2b185ad45@linux.intel.com>
References: <20250522015350.471070-1-derekjohn.clark@gmail.com> <2972c4c6-7080-e058-ec39-b8c1dc603f7a@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-1724577038-1748209311=:933"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1724577038-1748209311=:933
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Mon, 26 May 2025, Ilpo J=E4rvinen wrote:

> On Wed, 21 May 2025, Derek J. Clark wrote:
>=20
> > Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> > WMI interfaces that control various power settings. There are multiple =
WMI
> > interfaces that work in concert to provide getting and setting values a=
s
> > well as validation of input. Currently only the "Gamezone", "Other
> > Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> > I attempted to structure the driver so that adding the "Custom Mode",
> > "Lighting", and other data block interfaces would be trivial in later
> > patches.
> >=20
> > This driver attempts to standardize the exposed sysfs by mirroring the
> > asus-armoury driver currently under review. As such, a lot of
> > inspiration has been drawn from that driver.
> > https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-luke=
@ljones.dev/#t
> >=20
> > The drivers have been tested by me on the Lenovo Legion Go and Legion G=
o
> > S.
> >=20
> > Suggested-by: Mario Limonciello <superm1@kernel.org>
> > Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> > Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> > ---
> > v11:
> >   - Fix formmating issues.
>=20
> Thanks for the update, I've applied this now into the review-ilpo-next=20
> branch. BUT, this is very late in the cycle now and if there's a build=20
> issue (or LKP doesn't build test it in reasonable time), I'll have to dro=
p=20
> this series and postpone it into the next cycle as I don't want to delay=
=20
> the main PR to Linus too long.
>=20
> But lets hope for the best, I think some depends on issues were fixed=20
> earlier (IIRC), so hopefully it works good enough now. :-)

Hmpf, these give me a few new warnings related to this series:

make W=3D1 drivers/platform/x86/
make C=3D2 drivers/platform/x86/

=2E..I really don't know why sparse complains about the lock context=20
imbalance though, those functions use guard().

There's also a copy-paste error:

 * lwmi_gz_profile_get_get() - Get the current platform profile.

=2E.._get_get -> ..._set
Get -> Set



--=20
 i.

--8323328-1724577038-1748209311=:933--
