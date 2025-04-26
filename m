Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23C48489
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 13:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745673524; cv=none; b=YvyGd8hs2VBHf2kxl/0JaReFVaX5hpz55hs9xfAEThtGCkge8rzCTVe74qpQyR7pV/GyPLUNAKYg/wPMqcPJRousQAhPR3uF44mJ+mfMZeNqobJnKXfBSQNlp3718kpsU0SrMwhYZvzhCXo7oXNHXdIzKCx5Gezzuq4GyAj/Bzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745673524; c=relaxed/simple;
	bh=MdgT0tGqkoeQE0xB895HRlJDVlQEA6L2dg1kQRViWko=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=qatKDl5Lji3s6L7yk3yTtV3R/yfIJ2ndvmnEYYtD95+VsOYEWWGGuP3QWb6rWbhLOpeyZMEVdp30aB+cV/d4iWSjy6wSaR1nWbdoPq+orPefa5oOuMU5UZsr09hDEyDiK+pvm77lIkBlmcNGft3VdaRWjWVB7tNvr4pSv+TsBqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=V5W0NePq; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="V5W0NePq"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53QDHpWk258336
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 26 Apr 2025 06:17:51 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53QDHpWk258336
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745673473;
	bh=Qv3GGTRjeWcaBJIwFfN0RXsQO5eLawdKPmX5aFVR03I=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=V5W0NePqEB+f5hz/U3L86eTDhx7bq5IW0ix9OjeA0rqaCFagn7CgSQnvaYBKQRPR+
	 DRyjQ9n+Pw1DKxTdVmmeYO2fp2FzZSFD5ciM3iszYM0SQnB3FPv+fqHJtlKND+pN99
	 9f4XKCbxluMqfDrmJvOcC5yGKzw21/u4PFS4Y+XlNRpDEwXmexDxAwbnYrf+6PVpcc
	 ovkXUlO6lBk/cBTWwQSnB8JauHZf3O0iiug1d7HdDNK4BiM+eXCL3IPshWwyS/12pF
	 A246qrgnqTKgwSs7odcmxAeZ0SKVkn01loluJEelcymYWBurrZLUhm6DNBOj+Rewp0
	 WSPvnPNQENA+Q==
Date: Sat, 26 Apr 2025 06:17:50 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <aAyiganPp_UsNlnZ@gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com>
Message-ID: <E130C6F4-5602-44E6-ABB0-B87B389C0026@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2025 2:08:17 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Arnd Bergmann <arnd@kernel=2Eorg> wrote:
>
>> From: Arnd Bergmann <arnd@arndb=2Ede>
>>=20
>> With cx8 and tsc being mandatory features, the only important
>> architectural features are now cmov and pae=2E
>>=20
>> Change the large list of target CPUs to no longer pick the instruction =
set
>> itself but only the mtune=3D optimization level and in-kernel optimizat=
ions
>> that remain compatible with all cores=2E
>>=20
>> The CONFIG_X86_CMOV instead becomes user-selectable and is now how
>> Kconfig picks between 586-class (Pentium, Pentium MMX, K6, C3, GeodeGX)
>> and 686-class (everything else) targets=2E
>>=20
>> In order to allow running on late 32-bit cores (Athlon, Pentium-M,
>> Pentium 4, =2E=2E=2E), the X86_L1_CACHE_SHIFT can no longer be set to a=
nything
>> lower than 6 (i=2Ee=2E 64 byte cache lines)=2E
>>=20
>> The optimization options now depend on X86_CMOV and X86_PAE instead
>> of the other way round, while other compile-time conditionals that
>> checked for MATOM/MGEODEGX1 instead now check for CPU_SUP_* options
>> that enable support for a particular CPU family=2E
>>=20
>> Link: https://lore=2Ekernel=2Eorg/lkml/dd29df0c-0b4f-44e6-b71b-2a358ea7=
6fb4@app=2Efastmail=2Ecom/
>> Signed-off-by: Arnd Bergmann <arnd@arndb=2Ede>
>> ---
>> This is what I had in mind as mentioned in the earlier thread on
>> cx8/tsc removal=2E I based this on top of the Ingo's [RFC 15/15]
>> patch=2E
>> ---
>>  arch/x86/Kconfig                |   2 +-
>>  arch/x86/Kconfig=2Ecpu            | 100 ++++++++++++++----------------=
--
>>  arch/x86/Makefile_32=2Ecpu        |  48 +++++++--------
>>  arch/x86/include/asm/vermagic=2Eh |  36 +-----------
>>  arch/x86/kernel/tsc=2Ec           |   2 +-
>>  arch/x86/xen/Kconfig            |   1 -
>>  drivers/misc/mei/Kconfig        |   2 +-
>>  7 files changed, 74 insertions(+), 117 deletions(-)
>
>While the simplification is nice on its face, this looks messy:
>
>> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
>> index a9d717558972=2E=2E1e33f88c9b97 100644
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -1438,7 +1438,7 @@ config HIGHMEM
>> =20
>>  config X86_PAE
>>  	bool "PAE (Physical Address Extension) Support"
>> -	depends on X86_32 && X86_HAVE_PAE
>> +	depends on X86_32 && X86_CMOV
>
>Coupling CMOV to PAE =2E=2E=2E :-/
>
>> +config X86_CMOV
>> +	bool "Require 686-class CMOV instructions" if X86_32
>> +	default y
>>  	help
>> -	  This is the processor type of your CPU=2E This information is
>> -	  used for optimizing purposes=2E In order to compile a kernel
>> -	  that can run on all supported x86 CPU types (albeit not
>> -	  optimally fast), you can specify "586" here=2E
>> +	  Most x86-32 processor implementations are compatible with
>> +	  the the CMOV instruction originally added in the Pentium Pro,
>> +	  and they perform much better when using it=2E
>> +
>> +	  Disable this option to build for 586-class CPUs without this
>> +	  instruction=2E This is only required for the original Intel
>> +	  Pentium (P5, P54, P55), AMD K6/K6-II/K6-3D, Geode GX1 and Via
>> +	  CyrixIII/C3 CPUs=2E
>
>Very few users will know anything about CMOV=2E
>
>I'd argue the right path forward is to just bite the bullet and remove=20
>non-CMOV support as well, that would be the outcome *anyway* in a few=20
>years=2E That would allow basically a single 'modern' 32-bit kernel that=
=20
>is supposed to boot on every supported CPU=2E People might even end up=20
>testing it =2E=2E=2E ;-)
>
>Thanks,
>
>	Ingo

Dropping CMOV would mean dropping P5 support=2E 
