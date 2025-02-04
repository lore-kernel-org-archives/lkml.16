Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C31720FA81;
	Tue,  4 Feb 2025 14:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738679283; cv=none; b=DtnftwcDRO56C1h/NsfLeoXuPodeMzTzj/K9WS+Je967tNNtt3faxKa3SIHXn5yk5LVfv6DhzRjcb/dk0eVLwNa16SYjurKW4iDqtVEP7RuGnfcGn+FzTT1Emapo9nFsUMYMdeHHpaSVnvJTgjFST2pC/oryHfkmVyGQDYwVkGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738679283; c=relaxed/simple;
	bh=W7l5hHgZSVuFn3MlA6YyHRtoNwMSFk/yKhVrN3b1Vqo=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=j7wAK1PGapwakVOwRb80VIQ5bHzKq5GfXkUu28nfJXLHbpaw78DhcCuCSYWJkZV+fjQXkJVCZDMXZk1nFsfGRj5g0VrGTXJ5bgzLdlSNNJ9vG3va3+GOyYsuZ/PMbwfZWvbrbZr60HfGjU5EcW6HB00n93glhVOB9CtK81KTiVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RLincpun; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RLincpun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738679282; x=1770215282;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=W7l5hHgZSVuFn3MlA6YyHRtoNwMSFk/yKhVrN3b1Vqo=;
  b=RLincpunJWQlXmzBlUpeRbhKUBVDF+R+UWTpzNnjNDV4wZCzsQ369aFJ
   MHO3nD1ll37rtgFOPBwUX+TgtwWPDbPZBfXBp5SZH9IC6FCy85XPX4BUd
   fHBGjOp1swJZkNdt7xalCOfWLQqmIwp1VU5c0QxdM0OOUnF7dL3FLQqTO
   v6kAgx+35psK6jO8eWkW9N+9eNVJNuO7ju5vswnK28M8T3BtGPbEccJdn
   VP6mmCUp/E8jlNyoXd2LhziPqVMS8SoS0Kq+w4FoexL+I39GyR4DTtHeU
   nTiH9C8oAPafj4Y2qpuSMBWwoF8TXqK2QPbYqxUuxEwIXPGiXHrky/giE
   w==;
X-CSE-ConnectionGUID: scGOjmL8RMqZ61FxHfPVbg==
X-CSE-MsgGUID: nRHLXb1UTDGWVLvajGdurQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50598511"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50598511"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:28:01 -0800
X-CSE-ConnectionGUID: E2cYbvGPReufX8+HBWjUMw==
X-CSE-MsgGUID: WAfN/7eEROWL4s2DeYGpDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="115642506"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.75])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 06:27:58 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Feb 2025 16:27:54 +0200 (EET)
To: Armin Wolf <W_Armin@gmx.de>
cc: james@equiv.tech, markpearson@lenovo.com, jorge.lopez2@hp.com, 
    jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, corbet@lwn.net, 
    linux-doc@vger.kernel.org
Subject: Re: [PATCH 4/7] platform/x86: hp-bioscfg: Use wmi_instance_count()
In-Reply-To: <cbea0f2a-a66f-4ed8-9b19-6010b188f69f@gmx.de>
Message-ID: <b7375996-cf85-d1c3-fd29-585bb22a99c1@linux.intel.com>
References: <20250203182322.384883-1-W_Armin@gmx.de> <20250203182322.384883-5-W_Armin@gmx.de> <a02aa367-2ce8-ba6d-adc7-b91552566142@linux.intel.com> <cbea0f2a-a66f-4ed8-9b19-6010b188f69f@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-937537166-1738679274=:1609"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-937537166-1738679274=:1609
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 4 Feb 2025, Armin Wolf wrote:

> Am 04.02.25 um 11:37 schrieb Ilpo J=C3=A4rvinen:
>=20
> > On Mon, 3 Feb 2025, Armin Wolf wrote:
> >=20
> > > The WMI core already knows the instance count of a WMI guid.
> > > Use this information instead of querying all possible instances
> > > which is slow and might be unreliable.
> > >=20
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 13 +++++--------
> > >   1 file changed, 5 insertions(+), 8 deletions(-)
> > >=20
> > > diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > > b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > > index 0b277b7e37dd..63c78b4d8258 100644
> > > --- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > > +++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
> > > @@ -388,16 +388,13 @@ union acpi_object *hp_get_wmiobj_pointer(int
> > > instance_id, const char *guid_strin
> > >    */
> > >   int hp_get_instance_count(const char *guid_string)
> > >   {
> > > -=09union acpi_object *wmi_obj =3D NULL;
> > > -=09int i =3D 0;
> > > +=09int ret;
> > >=20
> > > -=09do {
> > > -=09=09kfree(wmi_obj);
> > > -=09=09wmi_obj =3D hp_get_wmiobj_pointer(i, guid_string);
> > > -=09=09i++;
> > > -=09} while (wmi_obj);
> > > +=09ret =3D wmi_instance_count(guid_string);
> > > +=09if (ret < 0)
> > > +=09=09return 0;
> > >=20
> > > -=09return i - 1;
> > > +=09return ret;
> > >   }
> > Hi Armin,
> >=20
> > While it is the existing way of doing things, I don't like how the erro=
r
> > is not properly passed on here. And if the error handling is pushed
> > upwards to the calling sites, then this entire function becomes useless
> > and wmi_instance_count() could be used directly in the callers.
>
> The thing is that for the hp-bioscfg driver, a missing WMI GUID is not an
> error.
> In this case 0 instances are available.
>=20
> I would keep this function for now.

Okay, fine.

--=20
 i.

--8323328-937537166-1738679274=:1609--
