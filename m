Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7E732165E2
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 21:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748469207; cv=none; b=AnkgA82ijZxFaOZ0dRk0Do0b+2iUSJwlewmZ7Xf3F1jBFvN+0adxbewf2l/FDb0k+i9LnNS8eQ2OxUZgWr9OJgEb7D1ccb35yqgKaddKPn/FQpJSstMi1mr8UmyR10pCT86B69/4N1dCZh/rOdZU87BcUEXeSuI6Y6zk7vZa4lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748469207; c=relaxed/simple;
	bh=ugZzrN5hkE7bV73Xx7y6ZySUoSVTU+STDA8S7G9uHc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rG2OslWfJQs/37GeiPhdo7Vlpx0E5J6q90IKuL/Rr+yGs4WcQoT6vkZLPMEAlMiGT5Wgzw24qdRZDNHh8Lq1rSg5qHyI2X75/H1vUoGZoDpGkwtkyLAbSIVKnxQaJHT2jtWxULmSWggAP87ynPW5wavlaHEWyvjHG7cRoE5ka9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyAsrvqd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyAsrvqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748469206; x=1780005206;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ugZzrN5hkE7bV73Xx7y6ZySUoSVTU+STDA8S7G9uHc4=;
  b=eyAsrvqdQ+wUCFSLngurtxnojiD2DfBIQUKQixhpfTlae3cIqODkF+rP
   Poiq1o2eUA7Z11RlTFmyEov5RdjO6tWlNz1l46m7MXBw5nYW2C2S17/k6
   cxX0C6xcbRdbSh9ic2Sy46Mz+qZFuOuW8rDhMvsf5VpuExqAH78+mDrh1
   nk0vshalmnL3g2gxHqKLhscxGVW5n7RSb2/f8IZMp3lVmaFSjS3rFRMbi
   Auh6T/OJIE48v1i8NKcSzFUVhJDgDw2DsFJQ/kH+ouGT7ckASUfLyNL9m
   atmiZqa0p2Li6Bdh1xmlEnMF9c2b+jSK6MIR+GVJ5G/zViuRbqUELvWNu
   g==;
X-CSE-ConnectionGUID: +QvkjPl4S825V6rYyMLI3w==
X-CSE-MsgGUID: 5wiyzMxRQsqhczTEk93MEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="61918103"
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="asc'?scan'208";a="61918103"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 14:53:25 -0700
X-CSE-ConnectionGUID: XDNgAupbR5OpYXKY9JKgZw==
X-CSE-MsgGUID: OAQjGB/QQcGdQN3zuHjcLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,322,1739865600"; 
   d="asc'?scan'208";a="148138037"
Received: from josephbr-mobl1.amr.corp.intel.com (HELO desk) ([10.125.146.30])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 14:53:24 -0700
Date: Wed, 28 May 2025 14:53:18 -0700
From: Gupta Pawan <pawan.kumar.gupta@linux.intel.com>
To: Juergen Gross <jgross@suse.com>
Cc: Xin Li <xin@zytor.com>, Zijlstra Peter <peterz@infradead.org>,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Hansen Dave <dave.hansen@linux.intel.com>,
	alexandre.chartre@oracle.com,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Zhang Tao1 <tao1.zhang@intel.com>
Subject: Re: [Bug Report] Linux v6.15-rc7 boot failure on Xen-4.17
Message-ID: <20250528215318.6xkflhrrhcigmn3m@desk>
References: <607917bc-6788-425a-8051-181a078ddb49@suse.com>
 <C28A8745-02AD-489E-B2F3-6DE81C511783@zytor.com>
 <081152ba-79b5-477e-8248-02bf289ff9ce@citrix.com>
 <227db775-f4ce-4dd3-ba14-30232ab3ab6f@suse.com>
 <1b8e565e-2ed6-4f1d-9138-fbf12662c404@suse.com>
 <1226c371-5d44-4206-973f-3c10152c4195@zytor.com>
 <400ee15a-12fa-4477-ba03-123eb8e07dc2@zytor.com>
 <760c96da-a8da-49be-bc4e-b82a8b2a1623@suse.com>
 <a71e7aba-759b-47aa-9170-a4045c52239a@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4gp2exwv34uty6o4"
Content-Disposition: inline
In-Reply-To: <a71e7aba-759b-47aa-9170-a4045c52239a@suse.com>


--4gp2exwv34uty6o4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:19:19AM +0200, Juergen Gross wrote:
> On 28.05.25 10:57, J=C3=BCrgen Gro=C3=9F wrote:
> > On 28.05.25 10:26, Xin Li wrote:
> > > On 5/28/2025 12:27 AM, Xin Li wrote:
> > > > On 5/27/2025 11:49 PM, Juergen Gross wrote:
> > > > > On 28.05.25 07:11, J=C3=BCrgen Gro=C3=9F wrote:
> > > > > > On 27.05.25 21:29, Andrew Cooper wrote:
> > > > > > > On 27/05/2025 8:21 pm, Xin Li wrote:
> > > > > > > > > On May 27, 2025, at 11:36=E2=80=AFAM, J=C3=BCrgen Gro=C3=
=9F <jgross@suse.com> wrote:
> > > > > > > > >=20
> > > > > > > > > =EF=BB=BFOn 27.05.25 19:54, Xin Li wrote:
> > > > > > > > > > On 5/27/2025 10:46 AM, Pawan Gupta wrote:
> > > > > > > > > > > > Attached is the serial console log and my kernel co=
nfig.
> > > > > > > > > > > Serial logs aren't telling much. I
> > > > > > > > > > > do not have a Xen setup to test,
> > > > > > > > > > > without
> > > > > > > > > > > Xen the config that you provided is booting a KVM gue=
st just fine.
> > > > > > > > > > Yeah, as I replied to Juergen, the same kernel binary b=
oots fine as
> > > > > > > > > > "native".
> > > > > > > > > > Unfortunately when booting as dom0 on Xen, it keeps reb=
ooting w/o
> > > > > > > > > > helpful log.
> > > > > > > > > What about booting Xen on bare metal, i.e. no KVM being i=
nvolved?
> > > > > > > > The same exact problem happens on Intel Simics.=C2=A0
> > > > > > > > And I got to see it=E2=80=99s a NX page fault in dom0
> > > > > > > > kernel during apply alternatives.
> > > > > > >=20
> > > > > > > In which case it's likely that there's an opencoded PTE updat=
e, rather
> > > > > > > than using the hooks (which are suitably paravirt'd).
> > > > > >=20
> > > > > > I'd suspect a bug when NOT using 2M pages for execmem.
> > > > > >=20
> > > > > > I'll have a look.
> > > > >=20
> > > > > Could you have a try using "nohugevmalloc" dom0 kernel boot param=
eter?
> > > > >=20
> > > >=20
> > > > Tried in a KVM guest, still the same problem, and nothing new in the
> > > > serial log.
> > >=20
> > > Attached is a dom0 log with stack traces.
> > >=20
> > > But I really did NOT change anything to make it happen...
> >=20
> > Thanks.
> >=20
> > I think this might be related to Xen not advertising X86_FEATURE_PSE.
> >=20
> > This will use PAGE_KERNEL page protection for execmem_alloc() page prot=
ection,
> > while with X86_FEATURE_PSE PAGE_KERNEL_ROX is being used.
> >=20
> > For the kernel (so not in a module) there is no execmem_restore_rox() c=
all
> > involved, so the NX bit will be kept for kernel side ITS thunks.
> >=20
> > Peter, can you confirm my suspicion?
>=20
> I just made a small test on my (rather old) system:
>=20
> I verified that kernel 6.15 is booting fine as Xen dom0 (ITS mitigation
> not needed due to old cpu). Then I modified alternative.c to apply the
> ITS mitigations nevertheless, which made the kernel crash as Xen dom0.
>=20
> With the following additional modification boot was working again:
>=20
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index bfa444a7dbb0..fac4f9d26132 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -1090,7 +1090,7 @@ struct execmem_info __init *execmem_arch_setup(void)
>                 pgprot =3D PAGE_KERNEL_ROX;
>                 flags =3D EXECMEM_KASAN_SHADOW | EXECMEM_ROX_CACHE;
>         } else {
> -               pgprot =3D PAGE_KERNEL;
> +               pgprot =3D PAGE_KERNEL_EXEC;
>                 flags =3D EXECMEM_KASAN_SHADOW;
>         }

I am not sure if returning a RWX page post-boot is a good idea.

Another option that might work is to set the executable permission when we
know that the allocated page is for kernel ITS thunk, and not modules?

---
diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index ecfe7b497cad..706464103856 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -211,6 +211,14 @@ static void *its_alloc(void)
 		its_mod->its_page_array[its_mod->its_num_pages++] =3D page;
=20
 		execmem_make_temp_rw(page, PAGE_SIZE);
+	} else if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) ||
+		   !cpu_feature_enabled(X86_FEATURE_PSE)) {
+		set_memory_x((unsigned long)page, 1);
+	}
+#else /* CONFIG_MODULES */
+	if (!IS_ENABLED(CONFIG_ARCH_HAS_EXECMEM_ROX) ||
+	    !cpu_feature_enabled(X86_FEATURE_PSE)) {
+		set_memory_x((unsigned long)page, 1);
 	}
 #endif /* CONFIG_MODULES */
=20

--4gp2exwv34uty6o4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEhLB5DdoLvdxF3TZu/KkigcHMTKMFAmg3hc4ACgkQ/KkigcHM
TKPl1RAAtkZFX2/jJR+KggHc8b+LOcmHse1yWTBonCGgYLb0pkSNugT0f/qceVEe
Aa0C8YfylUpTSDSPIJa9E5voi205DIcujBh63qtYj0KCTpufqlZ3NIHeUDKFqLrN
erh6mZMqWf8Qa8oLsl1J/meoK9Sn/H+FNI8KRc4AEjHM5xlPN0EG1nHCfsbkJtHm
qDEOremUX7x1YiPgEXqtfjA8FmF3pIhsP+qbzAG+C076Gk3wq42y3U+/FFrYUum1
9Tp9VdnSRyr/1QhzuqWG9zFCF4QglIPf3oHV6ZVdvAT8lvQS1qmMKcKIA144HtD/
yQlJ1G69ueO2M2Cod8iHE+VUdWUN+NiC6Q895bkubavlb7Z1D1CYyXPXMrwrTClA
cBQznUORSouIf/YjKH2c6tIjPQRl5XhzWSIHRK9W4vz0qn1HyXk+vJzfahikuvB7
WvlxVKO+ZsyP8UokKiGShO7c9bOuvJVT/EU+B8NGauzCfy14z0Hhpa0ffsGv+o85
KMkBqo369YIALwd6ZXExpmMe6rG3xgFJhlGRbuQUxxg5Jnrug1dccwzy71ZmHpbT
whAOzXgwArpD8TKTT8KbJ6wdu3QxTbyw5qGLfJFDIRbpAYIoW9Se1c6tXn8exhPk
xyxl9WlUZ8qDmPmf1Foy5CNLFqv+N0bkobSawHsFQ/J6JUgLQb4=
=hi94
-----END PGP SIGNATURE-----

--4gp2exwv34uty6o4--
