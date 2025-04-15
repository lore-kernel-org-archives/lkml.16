Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971DA1A3160;
	Tue, 15 Apr 2025 15:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744729870; cv=none; b=qSW90V7JvVzVhywDvWWeCvZJnqAnYk1TsM9jd+4PiNfgDARson2StOVx4QR38pXawkMBq+izBN6B5HsPwDv6ReAInzKVWkJjqFRse2kqJNtirsjIhWO6+Y7IKt+XNe/PZDdniy1gqMaadnlZo+IeRdN4VVTl17monn6Te1Y4vro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744729870; c=relaxed/simple;
	bh=Nt/A3b4Mh8GC2vqI9DISVuLWhXvFm+arGoDnjmJkicE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=qvYF/M3Pyp6FrmwW+/fisUlNBDE46Wahlzg2/dcfaGj4l2hetPC86hEKOjW1O/pOnxtijIeGZ8drAsqERvcXGoNMacJAsYq/bCFGz46lfGpHeJBTlnfq8E0qZFvXeCcytEwDRxVXmDgpjnYOh1kEy9EoeaJ533pw21xxaXppyas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hv9PzQt5; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hv9PzQt5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744729866; x=1776265866;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=Nt/A3b4Mh8GC2vqI9DISVuLWhXvFm+arGoDnjmJkicE=;
  b=Hv9PzQt5KKN97xICYH6jHGle15IVK9PutJE+MS3IZUhnJTUKxOTe5jYU
   Oo6oNhIKJWd9AwRrt1CRoCAhUr+GktXC8n+OqBuXqgwetiSO/TIgtzTjU
   02SoAx89Hv11h9v2MwXbS78QwbX+4zbzOQ7NV6x+t4CgCPj7SzCnPbmw9
   Snjwwie2092EYJXNq5hbFj1Ph7d1GHMbDEJbFaTTmMvmDmO+Z8d/njW6L
   Ml8jCtJW7OPp0yeD0bEZxTMj4FXr3iaiGmWyK39ZJ2bow6cUaTc+wM0uD
   bDnb5Y3y0jLdMq5A8TfODO3+hAdo7+oN7AzHYLHqAyviqFs0ec1e5Chtg
   A==;
X-CSE-ConnectionGUID: LGYVbWwwQUyYId11ZDmeQQ==
X-CSE-MsgGUID: LQcCQ4pLS9u9eS0cU6kbXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="46258352"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46258352"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:11:06 -0700
X-CSE-ConnectionGUID: 1ROQrlIqSp6xHv7I9S/1uw==
X-CSE-MsgGUID: iBMG2o0sSmS4RiYfJNj+8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130471826"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.140])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 08:10:59 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 15 Apr 2025 18:10:53 +0300 (EEST)
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
cc: liu shouye <shouyeliu@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix inconsistent state
 on init failure
In-Reply-To: <331a55fe7334cf425ddb8826160b64a5af37c805.camel@linux.intel.com>
Message-ID: <6bf14a69-5a92-a9cc-b02f-e92de0296321@linux.intel.com>
References: <20250414092132.40369-1-shouyeliu@gmail.com>  <1feb5888-5ec8-67aa-9775-e1bea6b8b9fe@linux.intel.com>  <f673452d7afc4419120f2cdb32e5033c35f22229.camel@linux.intel.com>  <CAAscG3VHVdNDQGfsdBs_ht5H-WUtCBksMYPXLKW2D6Uqu3yeAA@mail.gmail.com>
 <331a55fe7334cf425ddb8826160b64a5af37c805.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323328-1180773517-1744729710=:942"
Content-ID: <71387e63-a36f-ad0d-ca40-b696f0e5801d@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1180773517-1744729710=:942
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Content-ID: <c5a981e6-d51f-734f-f536-470b05337777@linux.intel.com>

On Tue, 15 Apr 2025, srinivas pandruvada wrote:

> On Tue, 2025-04-15 at 14:39 +0800, liu shouye wrote:
>=20
>=20
> srinivas pandruvada <srinivas.pandruvada@linux.intel.com> =E4=BA=8E2025=
=E5=B9=B44=E6=9C=8815=E6=97=A5=E5=91=A8=E4=BA=8C
> 00:08=E5=86=99=E9=81=93=EF=BC=9A
>       On Mon, 2025-04-14 at 13:41 +0300, Ilpo J=C3=A4rvinen wrote:
>       > On Mon, 14 Apr 2025, shouyeliu wrote:
>       >
>       > > When uncore_event_cpu_online() fails to initialize a control
>       CPU
>       > > (e.g.,
>       > > due to memory allocation failure or uncore_freq_add_entry()
>       > > errors),
>       > > the code leaves stale entries in uncore_cpu_mask after that
>       online
>       > > CPU
>       > > will not try to call uncore_freq_add_entry, resulting in no sys
>       > > interface.
>       >
>       > Please add () after any name that refers to a C function (you're
>       not
>       > even
>       > being consistent here as you had it in some cases but not here).
>=20
> ok,I will modify it in the next version
>=20
>       >
>       > Please try to split the very long sentence a bit and make it more
>       > obvious
>       > what causes what as the current wording is a bit vague, did you
>       mean:
>       > uncore_event_cpu_online() will not call uncore_freq_add_entry()
>       for
>       > another CPU that is being onlined or something along those lines?
>       >
>       > Will this change work/matter?
>       Documentation/core-api/cpu_hotplug.rst
>       > says
>       > about cpuhp_setup_state():
>       >
>       > "If a callback fails for CPU N then the teardown callback for CPU
>       > =C2=A00 .. N-1 is invoked to rollback the operation. The state se=
tup
>       > fails,
>       > =C2=A0the callbacks for the state are not installed and in case o=
f
>       dynamic
>       > =C2=A0allocation the allocated state is freed."
>       >
>=20
> Yes, cpuhp_setup_state() will fail and which will result in clean up.
> So any fail of any fail uncore_event_cpu_online() will result in no sys
> entries.
>=20
> I think here the intention is to keep sys entries, which will not
> happen with this patch.
>=20
> For confirmation on 6.14 kernel, I forced failure on CPU 10:
>=20
> [595799.696873] intel_uncore_init
> [595799.700102] uncore_event_cpu_online cpu:0
> [595799.704240] uncore_event_cpu_online cpu:1
> [595799.708360] uncore_event_cpu_online cpu:2
> [595799.712505] uncore_event_cpu_online cpu:3
> [595799.716633] uncore_event_cpu_online cpu:4
> [595799.720755] uncore_event_cpu_online cpu:5
> [595799.724953] uncore_event_cpu_online cpu:6
> [595799.729158] uncore_event_cpu_online cpu:7
> [595799.733409] uncore_event_cpu_online cpu:8
> [595799.737674] uncore_event_cpu_online cpu:9
> [595799.741954] uncore_event_cpu_online cpu:10
> [595799.746134] Force CPU 10 to fail online
> [595799.750182] uncore_event_cpu_offline cpu:0
> [595799.754508] uncore_event_cpu_offline cpu:1
> [595799.758834] uncore_event_cpu_offline cpu:2
> [595799.763238] uncore_event_cpu_offline cpu:3
> [595799.767558] uncore_event_cpu_offline cpu:4
> [595799.771832] uncore_event_cpu_offline cpu:5
> [595799.776178] uncore_event_cpu_offline cpu:6
> [595799.780506] uncore_event_cpu_offline cpu:7
> [595799.784862] uncore_event_cpu_offline cpu:8
> [595799.789247] uncore_event_cpu_offline cpu:9
> [595799.793540] intel_uncore_init cpuhp_setup_state failed
> [595799.798776] intel_uncore_init failed
>=20
>=20
> Thanks,
> Srinivas
>=20
>=20
>=20
> Registering the CPU hot-plug callback function during booting can be hand=
led
> correctly. I think the problem occurs during runtime.
> The original code may have problems when the CPU hot-plug modifies the
> management CPU during runtime:
> Assume that the CPUs of package 1 are 8-15, and the uncore driver has bee=
n
> registered at boot time;
> 1. Offline all CPU No.8-15
> 2. Try online CPU No. 8, the code executes cpumask_set_cpu() successfully=
, but
> fails in the uncore_freq_add_entry() process. At this time, the mark of C=
PU No.
> 8 is added to uncore_cpu_mask, but no sys interface is generated,cpu No.8
> online fails;
> 3. Try online CPU No. 8 again, cpumask_any_and() judges success, and the =
CPU
> No.8 online is successful at this time;
> 4. Assume that the attempt to online CPU No. 9-15 is successful at this t=
ime,
> but there is no sys interface =E2=80=94=E2=80=94=E2=80=94=E2=80=94unexpec=
ted behavior 1.
> 5. Offline CPU No. 9-15, and offline No.8, will eventually call
> uncore_freq_remove_die_entry()=E2=80=94=E2=80=94=E2=80=94=E2=80=94unexpec=
ted behavior 2 is generated, which may
> cause a crash.
>=20
>=20
>=20
> I see the case in 2 socket server. So good to fix. Thanks for this.

All this extra information that this discussion has brought into light=20
should be included into the changelog (including the fact that this can=20
only occur after they were first setup without errors as the it would=20
have rolled back otherwise).

--=20
 i.

>=20
> Also I suggest to look why the addition of one entry failed on your serve=
r system.
>=20
> Thanks,
> Srinivas
>=20
>=20
>=20
>             > >
>             >
>             > Fixes tag?
>             >
>             > > Signed-off-by: shouyeliu <shouyeliu@gmail.com>
>             >
>             > The correct format for tags is documented in
>             > Documentation/process/5.Posting.rst:
>             >
>             > tag: Full Name <email address>
>=20
> ok,I will modify it in the next version
>       >
>       > > ---
>       > > =C2=A0.../x86/intel/uncore-frequency/uncore-frequency.c=C2=A0=
=C2=A0=C2=A0 | 12
>       > > ++++++++----
>       > > =C2=A01 file changed, 8 insertions(+), 4 deletions(-)
>       > >
>       > > diff --git
>       a/drivers/platform/x86/intel/uncore-frequency/uncore-
>       > > frequency.c
>       b/drivers/platform/x86/intel/uncore-frequency/uncore-
>       > > frequency.c
>       > > index 40bbf8e45fa4..1de0a4a9d6cd 100644
>       > > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-
>       > > frequency.c
>       > > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-
>       > > frequency.c
>       > > @@ -146,15 +146,13 @@ static int
>       uncore_event_cpu_online(unsigned
>       > > int cpu)
>       > > =C2=A0{
>       > > =C2=A0=C2=A0 =C2=A0struct uncore_data *data;
>       > > =C2=A0=C2=A0 =C2=A0int target;
>       > > +=C2=A0 =C2=A0int ret;
>       > > =C2=A0
>       > > =C2=A0=C2=A0 =C2=A0/* Check if there is an online cpu in the pa=
ckage for
>       > > uncore MSR */
>       > > =C2=A0=C2=A0 =C2=A0target =3D cpumask_any_and(&uncore_cpu_mask,
>       > > topology_die_cpumask(cpu));
>       > > =C2=A0=C2=A0 =C2=A0if (target < nr_cpu_ids)
>       > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>       > > =C2=A0
>       > > -=C2=A0 =C2=A0/* Use this CPU on this die as a control CPU */
>       > > -=C2=A0 =C2=A0cpumask_set_cpu(cpu, &uncore_cpu_mask);
>       > > -
>       > > =C2=A0=C2=A0 =C2=A0data =3D uncore_get_instance(cpu);
>       > > =C2=A0=C2=A0 =C2=A0if (!data)
>       > > =C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>       > > @@ -163,7 +161,13 @@ static int
>       uncore_event_cpu_online(unsigned
>       > > int cpu)
>       > > =C2=A0=C2=A0 =C2=A0data->die_id =3D topology_die_id(cpu);
>       > > =C2=A0=C2=A0 =C2=A0data->domain_id =3D UNCORE_DOMAIN_ID_INVALID=
;
>       > > =C2=A0
>       > > -=C2=A0 =C2=A0return uncore_freq_add_entry(data, cpu);
>       > > +=C2=A0 =C2=A0ret =3D uncore_freq_add_entry(data, cpu);
>       > > +=C2=A0 =C2=A0if (!ret) {
>       > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use this CPU on th=
is die as a control CPU */
>       > > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cpumask_set_cpu(cpu, =
&uncore_cpu_mask);
>       > > +=C2=A0 =C2=A0}
>       > > +
>       > > +=C2=A0 =C2=A0return ret;
>       >
>       > Please reverse to logic such that you return early on error,
>       which is
>       > the
>       > usual error handling pattern.
>=20
> ok,I will modify it in the next version=C2=A0
>       >
>       > > =C2=A0}
>       > > =C2=A0
>       > > =C2=A0static int uncore_event_cpu_offline(unsigned int cpu)
>       > >
>       >
>=20
>=20
>=20
>=20
--8323328-1180773517-1744729710=:942--
