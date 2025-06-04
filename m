Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DEF33DF
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 12:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749041518; cv=none; b=sjs7Uo5NWbtzjwkA5o7zAbTCtxLecUt3K2cv0nW708QCHxKtiCURB2c9YPm53voX6Ud/4sHA/idD2HNOUuJ/skvGgmMLpRhvs9nrRwjBPkvqzJeE4bkyCXHygcS/qgSR6hmfbHvV1yo6eTAzPkIcpc91ndfbRm83qeSLU+nJESQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749041518; c=relaxed/simple;
	bh=6DsbJp3huQy2CaTfbfR0iFAPFfUmFh8cI/ypYNf0QLM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gSZg5lkrFVrS8uGwB3M92Y6lUKs6nEuCENxI2ri6t3BeRRnejq300YK6EoiB5iCw/Ot1oz2BaOEzSVsOfYdVQnRBgoXhLwrGlwFn2ipkvBLJHsA+UvM4Jy6zkdHmTtBWrAsY/rBHAwHwBE8eGA/bdAFFk8Ib0afQPASnZ6n6wao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPHmtb7S; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPHmtb7S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749041516; x=1780577516;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=6DsbJp3huQy2CaTfbfR0iFAPFfUmFh8cI/ypYNf0QLM=;
  b=BPHmtb7Sar2stI48Cto7l7e13FLo5W3o5xqXPrYfUfrwY2KlfLFV70t7
   1zQxUJfHSkekmkBed89xFgmGUoyH5BFajR/wa1V0k7yfNuIOPZP22JjLD
   u1HfcKPNkj6+M+qApscDOUAgLGgeOEIemLl4AegKmiZlsJnOr48S5rf+8
   /x6OmfT+y1zEaE93UkY2NFBZkusqE33QKDhQEeS6FmeYMJO71vbx/gRfX
   HKxGpIXM0GxCAiAmAE6G/7G6z++JfBOv9dGNZl95M1QGY4RW7cE3Pju3C
   edHqb3bIrIoYqP2vdjysImrKS+ONsmC6h2Ti79uYxoKRtkTHguW2pMqZn
   A==;
X-CSE-ConnectionGUID: 98sV05tTQmGf232Zpe7MrQ==
X-CSE-MsgGUID: Y9oDDTDWQyaM3X71oeCsGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="51265010"
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="51265010"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:51:56 -0700
X-CSE-ConnectionGUID: QffnyYzYSLeykVg1A7rVNQ==
X-CSE-MsgGUID: SnEBvwtpQSq+xiFL8jzcsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,209,1744095600"; 
   d="scan'208";a="145140884"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.121]) ([10.245.245.121])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 05:51:53 -0700
Message-ID: <6b3a37712330ec4b17968075f71296717db54046.camel@linux.intel.com>
Subject: Re: [PATCH v2] drm/ttm: Fix compile error when CONFIG_SHMEM is not
 set
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Matthew Wilcox	
 <willy@infradead.org>, linux-mm@kvack.org, Andrew Morton	
 <akpm@linux-foundation.org>, Christian Koenig <christian.koenig@amd.com>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost	 <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Date: Wed, 04 Jun 2025 14:51:49 +0200
In-Reply-To: <20250604085121.324be8c1@gandalf.local.home>
References: <20250604085121.324be8c1@gandalf.local.home>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2025-06-04 at 08:51 -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
>=20
> When CONFIG_SHMEM is not set, the following compiler error occurs:
>=20
> ld: vmlinux.o: in function `ttm_backup_backup_page':
> (.text+0x10363bc): undefined reference to `shmem_writeout'
> make[3]: ***
> [/work/build/trace/nobackup/linux.git/scripts/Makefile.vmlinux:91:
> vmlinux.unstripped] Error 1
> make[2]: *** [/work/build/trace/nobackup/linux.git/Makefile:1241:
> vmlinux] Error 2
> make[1]: *** [/work/build/trace/nobackup/linux.git/Makefile:248:
> __sub-make] Error 2
> make[1]: Leaving directory '/work/build/nobackup/tracetest'
> make: *** [Makefile:248: __sub-make] Error 2
>=20
> This is due to the replacement of writepage and calling
> swap_writeout()
> and shmem_writeout() directly. The issue is that when CONFIG_SHMEM is
> not
> defined, shmem_writeout() is also not defined.
>=20
> The function ttm_backup_backup_page() called mapping->a_ops-
> >writepage()
> which was then changed to call shmem_writeout() directly.
>=20
> Even before commit 84798514db50 ("mm: Remove swap_writepage() and
> shmem_writepage()"), it didn't make sense to call anything other than
> shmem_writeout() as the ttm_backup deals only with shmem folios.
>=20
> Have DRM_TTM config option select SHMEM to guarantee that
> shmem_writeout()
> is available.
>=20
> Link:
> https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
>=20
> Suggested-by: Hugh Dickins <hughd@google.com>
> Fixes: 84798514db50 ("mm: Remove swap_writepage() and
> shmem_writepage()")
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> Changes since v1:
> https://lore.kernel.org/all/20250602170500.48713a2b@gandalf.local.home/
>=20
> - Instead of adding a shmem_writeout() stub, just make CONFIG_DRM_TTM
> =C2=A0 select CONFIG_SHMEM (Hugh Dickins)
>=20
> =C2=A0drivers/gpu/drm/Kconfig | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index f094797f3b2b..ded28c71d89c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -188,6 +188,7 @@ source "drivers/gpu/drm/display/Kconfig"
> =C2=A0config DRM_TTM
> =C2=A0	tristate
> =C2=A0	depends on DRM && MMU
> +	select SHMEM
> =C2=A0	help
> =C2=A0	=C2=A0 GPU memory management subsystem for devices with multiple
> =C2=A0	=C2=A0 GPU memory types. Will be enabled automatically if a
> device driver

Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>

Thanks,
Thomas


