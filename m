Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26AC2CCA9
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 22:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751064495; cv=none; b=FcucdZ+KNA/qw75MlnIREfUTm724qRK8P39grNgd5/Qs5O/jz9l/08xeMJjWpxh4k65wIYUSSy+6KAjxmiaWEEbvuJYVUXSpVYrM9tS/ReQ5tw5++JHWvk758LYRIATv5HHn9e2XrgPl0K42UHTAHjbWsxU1Q/lq8mFzuVG7uxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751064495; c=relaxed/simple;
	bh=MVaKhxuAwq1QHCIPxGDtfereX0WbQ6VjSPI0Gx6oaIE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IvI70lcvkF8+5CXYW/QLZ7eFfSJfdTv2DTMEZOdDxGJZufOvE16ipPK216YSBqYhfuf2+QywDs6WVlL4JvMkDYwz3tfGJgObnyANL+vwg2MxqAPrl6v7c56WNeKtU8Hf0DhaWt743kT333LWM01VFPg6ozAXIwVqBKTIYZnoRBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TSMZyDTF; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TSMZyDTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751064494; x=1782600494;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MVaKhxuAwq1QHCIPxGDtfereX0WbQ6VjSPI0Gx6oaIE=;
  b=TSMZyDTFiLJAzu6TVwcLGO1qNxW+KwZIMcMwPdQj3tD1XKqs9TYBNOk4
   ThQtWx/XQziwfbOveOQic8ZMoXYSl73GQffCvWoAKv0+HNwMgXN5xhCmW
   j3Uq4wNqyospUvk2Rz274C6MUJmK/xinVo8M7Foo6IwzyR0QSXHhN8kL6
   4xDjeHUakD2+ehPV4B7Cdrr6PsjJ6vMhaaoLoIqAIYpaWBNDaLPMjEUsy
   oSM5Fvvqyz1CkRv7p5f5Io79Lv59bhYY8M/sauyXZc2tYhDMHOJXs5lKt
   rueUd/i2cAPDCwg/iWIFFqqvL/LTjeJTCIQjJHH/7V+UE3mfLWKo0GYvW
   w==;
X-CSE-ConnectionGUID: F7QMm05TQua0qD9DgillOA==
X-CSE-MsgGUID: EGZRT9wtShGYr2FR55xx2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53540279"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="53540279"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 15:48:13 -0700
X-CSE-ConnectionGUID: kyHzHpEjROGjwrNqqrmEew==
X-CSE-MsgGUID: B33XO9CeQVidH9ctUmilSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="153221707"
Received: from mgerlach-mobl1.amr.corp.intel.com (HELO [10.124.221.37]) ([10.124.221.37])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 15:48:13 -0700
Message-ID: <079dd4850554107056c536cbcb321572deaa8fde.camel@linux.intel.com>
Subject: Re: futex performance regression from "futex: Allow automatic
 allocation of process wide futex hash"
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Peter Zijlstra <peterz@infradead.org>, Sebastian Andrzej Siewior
	 <bigeasy@linutronix.de>
Cc: Chris Mason <clm@meta.com>, linux-kernel@vger.kernel.org, Thomas
 Gleixner <tglx@linutronix.de>
Date: Fri, 27 Jun 2025 15:48:12 -0700
In-Reply-To: <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
References: <3ad05298-351e-4d61-9972-ca45a0a50e33@meta.com>
	 <20250604092815.UtG-oi0v@linutronix.de>
	 <372d8277-7edb-4f78-99bd-6d23b8f94984@meta.com>
	 <20250604200808.hqaWJdCo@linutronix.de>
	 <aa6154d1-726c-4da1-a27b-69d2e8b449c6@meta.com>
	 <20250606070638.2Wk45AMk@linutronix.de>
	 <20250624190118.GB1490279@noisy.programming.kicks-ass.net>
Autocrypt: addr=tim.c.chen@linux.intel.com; prefer-encrypt=mutual;
 keydata=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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.4 (3.50.4-1.fc39) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-06-24 at 21:01 +0200, Peter Zijlstra wrote:
>=20
> How about something like this (very lightly tested)...
>=20
> the TL;DR is that it turns all those refcounts into per-cpu ops when
> there is no hash replacement pending (eg. the normal case), and only
> folds the lot into an atomic when we really care about it.
>=20
> There's some sharp corners still.. but it boots and survives the
> (slightly modified) selftest.
>=20
> ---
>  include/linux/futex.h                              |  12 +-
>  include/linux/mm_types.h                           |   5 +
>  kernel/futex/core.c                                | 238 +++++++++++++++=
++++--
>  .../selftests/futex/functional/futex_priv_hash.c   |  11 +-
>  4 files changed, 239 insertions(+), 27 deletions(-)
>=20
> diff --git a/include/linux/futex.h b/include/linux/futex.h
> index b37193653e6b..5f92c7a8ba57 100644
> --- a/include/linux/futex.h
> +++ b/include/linux/futex.h
> @@ -85,17 +85,11 @@ int futex_hash_prctl(unsigned long arg2, unsigned lon=
g arg3, unsigned long arg4)
>  #ifdef CONFIG_FUTEX_PRIVATE_HASH
>  int futex_hash_allocate_default(void);
>  void futex_hash_free(struct mm_struct *mm);
> -
> -static inline void futex_mm_init(struct mm_struct *mm)
> -{
> -	RCU_INIT_POINTER(mm->futex_phash, NULL);
> -	mm->futex_phash_new =3D NULL;
> -	mutex_init(&mm->futex_hash_lock);
> -}
> +int futex_mm_init(struct mm_struct *mm);
> =20
>  #else /* !CONFIG_FUTEX_PRIVATE_HASH */
>  static inline int futex_hash_allocate_default(void) { return 0; }
> -static inline void futex_hash_free(struct mm_struct *mm) { }
> +static inline int futex_hash_free(struct mm_struct *mm) { return 0; }

Minor nit.

futex_hash_free() is defined to return void for CONFIG_FUTEX_PRIVATE_HASH
config. But is now defined to return int for !CONFIG_FUTEX_PRIVATE_HASH and=
 !CONFIG_FUTEX configs.
But it seems like nobody is actually checking the return value.  It
seems to make more sense to keep the return value as void here so
the return value is consistent?

Tim

>  static inline void futex_mm_init(struct mm_struct *mm) { }
>  #endif /* CONFIG_FUTEX_PRIVATE_HASH */
> =20
> @@ -118,7 +112,7 @@ static inline int futex_hash_allocate_default(void)
>  {
>  	return 0;
>  }
> -static inline void futex_hash_free(struct mm_struct *mm) { }
> +static inline int futex_hash_free(struct mm_struct *mm) { return 0; }
>  static inline void futex_mm_init(struct mm_struct *mm) { }
> =20
>  #endif

