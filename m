Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C857F23D299;
	Tue, 15 Apr 2025 22:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744755064; cv=none; b=nBdi4jXVT4qReV9I8HJYiqrFYrYrXSZ0qXi8kGI08SV5Fx17ukyvqkLuouRd4QgrxtDQkGialbxfVYEzVCwVbde52t5vSYE96HD2pfigi3VixekPdzp5u5raGuv553PcOPksUwq+OhvB0BwcTVF13MpBLMSLRI4+iBjQticPoz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744755064; c=relaxed/simple;
	bh=dt8XI7DCFfm7NOj00QHltD7p1Eeh/MijT536gPJBCxw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sVLauI4GKwlTg3KGqHpdn2kL8vzUAQ3WuSzWbQ5lK4mDfO+TyLULSOtDLrJcc8YCQG/rMU5C4YKgtfOZ0nmtpuyY5PmseOKrfHndgwa5ac1VXiwTbjY3jgIgX3Nq6b5OybxfYnAhkt0CC7KanyKrHdoVA9j1AGLFyW7+TYc6R0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fCi4KMRX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fCi4KMRX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744755062; x=1776291062;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=dt8XI7DCFfm7NOj00QHltD7p1Eeh/MijT536gPJBCxw=;
  b=fCi4KMRX7UayWBZNGasnZwE7X3bs4X5hLtP/uwSkdaFa1GZ7xj9vCR6d
   DO3jPaLV1dYS8q2QN2ZCNPmV3wgQdTxi8Sa45XtDSjrFXD4DolWrjNmAD
   BHyDntct7u1fifSOFpgVclS8/nze8mkVVr39Sl/s0daHVPa6765YMHLQ6
   HIRmHxCB96LJlSg0F5U4xBgmKZMt8H4+UFIc8wUEdrp1q/REM4TWX+Ofn
   b4fs4jg73GOwE9HEpj+hlyhs3Too89o27ND4mT3bU9T2/yXlmjUHEssIo
   ar6SQigJ4TX62LpXvNud0M+3qV99uodRZsrdhB39jC5EjKRnZ8Xn43t3V
   Q==;
X-CSE-ConnectionGUID: 3NMUIIrgQjO8T70x3NKyjg==
X-CSE-MsgGUID: OAlDQzJXTSa3KQV8U5cskg==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63823276"
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="63823276"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 15:11:01 -0700
X-CSE-ConnectionGUID: hU378wh8TMOjCAuN4A9bUw==
X-CSE-MsgGUID: hjQL1h3xTP+OycAg9HO6WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,214,1739865600"; 
   d="scan'208";a="134363789"
Received: from spandruv-desk1.amr.corp.intel.com ([10.125.109.108])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 15:11:01 -0700
Message-ID: <4d1ecb87636ce1398cf8a2282e5497f6a92334bd.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix inconsistent state
 on init failure
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: liu shouye <shouyeliu@gmail.com>, Hans de Goede <hdegoede@redhat.com>, 
	platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Date: Tue, 15 Apr 2025 15:11:00 -0700
In-Reply-To: <6bf14a69-5a92-a9cc-b02f-e92de0296321@linux.intel.com>
References: <20250414092132.40369-1-shouyeliu@gmail.com>
	  <1feb5888-5ec8-67aa-9775-e1bea6b8b9fe@linux.intel.com>
	  <f673452d7afc4419120f2cdb32e5033c35f22229.camel@linux.intel.com>
	  <CAAscG3VHVdNDQGfsdBs_ht5H-WUtCBksMYPXLKW2D6Uqu3yeAA@mail.gmail.com>
	 <331a55fe7334cf425ddb8826160b64a5af37c805.camel@linux.intel.com>
	 <6bf14a69-5a92-a9cc-b02f-e92de0296321@linux.intel.com>
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

On Tue, 2025-04-15 at 18:10 +0300, Ilpo J=C3=A4rvinen wrote:
> On Tue, 15 Apr 2025, srinivas pandruvada wrote:
>=20
> > On Tue, 2025-04-15 at 14:39 +0800, liu shouye wrote:
> >=20
> >=20
> > srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
> > =E4=BA=8E2025=E5=B9=B44=E6=9C=8815=E6=97=A5=E5=91=A8=E4=BA=8C
> > 00:08=E5=86=99=E9=81=93=EF=BC=9A
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 On Mon, 2025-04-14 at 13:41 +0300, Ilpo =
J=C3=A4rvinen wrote:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > On Mon, 14 Apr 2025, shouyeliu wrote:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > When uncore_event_cpu_online() fails=
 to initialize a
> > control
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > (e.g.,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > due to memory allocation failure or
> > uncore_freq_add_entry()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > errors),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > the code leaves stale entries in unc=
ore_cpu_mask after
> > that
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 online
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > CPU
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > will not try to call uncore_freq_add=
_entry, resulting in
> > no sys
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > > interface.
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > Please add () after any name that refe=
rs to a C function
> > (you're
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 not
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > even
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > being consistent here as you had it in=
 some cases but not
> > here).
> >=20
> > ok,I will modify it in the next version
> >=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > Please try to split the very long sent=
ence a bit and make
> > it more
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > obvious
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > what causes what as the current wordin=
g is a bit vague, did
> > you
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mean:
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > uncore_event_cpu_online() will not cal=
l
> > uncore_freq_add_entry()
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > another CPU that is being onlined or s=
omething along those
> > lines?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > Will this change work/matter?
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Documentation/core-api/cpu_hotplug.rst
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > says
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > about cpuhp_setup_state():
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > "If a callback fails for CPU N then th=
e teardown callback
> > for CPU
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > =C2=A00 .. N-1 is invoked to rollback =
the operation. The state
> > setup
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > fails,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > =C2=A0the callbacks for the state are =
not installed and in case
> > of
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dynamic
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 > =C2=A0allocation the allocated state i=
s freed."
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 >
> >=20
> > Yes, cpuhp_setup_state() will fail and which will result in clean
> > up.
> > So any fail of any fail uncore_event_cpu_online() will result in no
> > sys
> > entries.
> >=20
> > I think here the intention is to keep sys entries, which will not
> > happen with this patch.
> >=20
> > For confirmation on 6.14 kernel, I forced failure on CPU 10:
> >=20
> > [595799.696873] intel_uncore_init
> > [595799.700102] uncore_event_cpu_online cpu:0
> > [595799.704240] uncore_event_cpu_online cpu:1
> > [595799.708360] uncore_event_cpu_online cpu:2
> > [595799.712505] uncore_event_cpu_online cpu:3
> > [595799.716633] uncore_event_cpu_online cpu:4
> > [595799.720755] uncore_event_cpu_online cpu:5
> > [595799.724953] uncore_event_cpu_online cpu:6
> > [595799.729158] uncore_event_cpu_online cpu:7
> > [595799.733409] uncore_event_cpu_online cpu:8
> > [595799.737674] uncore_event_cpu_online cpu:9
> > [595799.741954] uncore_event_cpu_online cpu:10
> > [595799.746134] Force CPU 10 to fail online
> > [595799.750182] uncore_event_cpu_offline cpu:0
> > [595799.754508] uncore_event_cpu_offline cpu:1
> > [595799.758834] uncore_event_cpu_offline cpu:2
> > [595799.763238] uncore_event_cpu_offline cpu:3
> > [595799.767558] uncore_event_cpu_offline cpu:4
> > [595799.771832] uncore_event_cpu_offline cpu:5
> > [595799.776178] uncore_event_cpu_offline cpu:6
> > [595799.780506] uncore_event_cpu_offline cpu:7
> > [595799.784862] uncore_event_cpu_offline cpu:8
> > [595799.789247] uncore_event_cpu_offline cpu:9
> > [595799.793540] intel_uncore_init cpuhp_setup_state failed
> > [595799.798776] intel_uncore_init failed
> >=20
> >=20
> > Thanks,
> > Srinivas
> >=20
> >=20
> >=20
> > Registering the CPU hot-plug callback function during booting can
> > be handled
> > correctly. I think the problem occurs during runtime.
> > The original code may have problems when the CPU hot-plug modifies
> > the
> > management CPU during runtime:
> > Assume that the CPUs of package 1 are 8-15, and the uncore driver
> > has been
> > registered at boot time;
> > 1. Offline all CPU No.8-15
> > 2. Try online CPU No. 8, the code executes cpumask_set_cpu()
> > successfully, but
> > fails in the uncore_freq_add_entry() process. At this time, the
> > mark of CPU No.
> > 8 is added to uncore_cpu_mask, but no sys interface is
> > generated,cpu No.8
> > online fails;
> > 3. Try online CPU No. 8 again, cpumask_any_and() judges success,
> > and the CPU
> > No.8 online is successful at this time;
> > 4. Assume that the attempt to online CPU No. 9-15 is successful at
> > this time,
> > but there is no sys interface =E2=80=94=E2=80=94=E2=80=94=E2=80=94unexp=
ected behavior 1.
> > 5. Offline CPU No. 9-15, and offline No.8, will eventually call
> > uncore_freq_remove_die_entry()=E2=80=94=E2=80=94=E2=80=94=E2=80=94unexp=
ected behavior 2 is
> > generated, which may
> > cause a crash.
> >=20
> >=20
> >=20
> > I see the case in 2 socket server. So good to fix. Thanks for this.
>=20
> All this extra information that this discussion has brought into
> light=20
> should be included into the changelog (including the fact that this
> can=20
> only occur after they were first setup without errors as the it would
> have rolled back otherwise).
>=20

May be something like this:

"
Fix missing uncore sysfs during CPU hotplug

In certain situations, the sysfs for uncore may not be present when all
CPUs in a package are offlined and then brought back online after boot.

This issue can occur if there is an error in adding the sysfs entry due
to a memory allocation failure. Retrying to bring the CPUs online will
not resolve the issue, as the uncore_cpu_mask is already set for the
package before the failure condition occurs.

This issue does not occur if the failure happens during module
initialization, as the module will fail to load in the event of any
error.

To address this, ensure that the uncore_cpu_mask is not set until the
successful return of uncore_freq_add_entry().
"

Thanks,
Srinivas

