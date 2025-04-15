Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD491624CE
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708153; cv=none; b=LMMq2Cip+0YQXOIqB9SZITrIi849fNAEDHrTAoTWGv0RtV9asP1zX37N9Bs9gEv20HzG8f3xQTom/EXtxOLTbpVfZ5jQ48Wtrh27+bPiZZujokaAJZnuGcl7yLS3AotSMh9r2V78vzsLaWqRu4CrH1g7LJGHvCez9ehDcqveUUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708153; c=relaxed/simple;
	bh=oMGn+Uvpm63tpBWdMLqAzsaYy5MGQUBVh3XFJ4N+pY4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rGoMGxpp5r5zU5sAmmudSFrMpJFQcmxd99IIHZvBr+C7uqo2G8pVjxM8bo7iXK+0Tf4oi/0pMlpRzUe/znsSGJAp5pyuKjYfsYevQp/10quyXrdZEdMD5tybEdrLtiGYzL90VrBU/9WKZpeP+XBdIVKr/pnJkR2alfxXdRrcdsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7mNn46J; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7mNn46J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744708152; x=1776244152;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version:content-transfer-encoding;
  bh=oMGn+Uvpm63tpBWdMLqAzsaYy5MGQUBVh3XFJ4N+pY4=;
  b=A7mNn46JOiz3E2uPfIa6QaaF41QmaSSbVgFtT69ypj3b3oWhHgqU/I03
   Tm8rCcVym5DKYkwaZu8wJ7M6gxaJnm5y1uiLSzESzzf9c09ejGYfyValA
   x4PPWqP+1fyYYzuPuPj51oD3Vrlhe6u6xedxQpD8yIkDJyGC7U1flUyDg
   +yZVfZio/gIKY0CYKFjv0ukYb+smpkqOZD7uPKn+8Pu4TpTXdyTwcSSci
   0wRCNjg3S7cB1zJ5UcY7nlo4FpugSsWlHJUX7UKkW83gFE2dz0zJekOZk
   scSqqZnaDHBhaWsT5DNa9PydZE8KrfuHvin3RdC3aYXU5s1BUUA/r8IKj
   Q==;
X-CSE-ConnectionGUID: 4zResP5dQ1qQdyQ+tzlxIw==
X-CSE-MsgGUID: eZ1SjwOBRiqhF8BENXQZHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46370514"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="46370514"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:08:04 -0700
X-CSE-ConnectionGUID: PWdu4CxjQrGoEVn4JNCM2Q==
X-CSE-MsgGUID: Ko5iN2FuRuy0a2/a9weotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; 
   d="scan'208";a="130595799"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.35])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2025 02:08:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chen Linxuan <chenlinxuan@uniontech.com>
Cc: Chen Linxuan <chenlinxuan@uniontech.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>
Subject: Re: [RFC PATCH 4/7] drm/i915/pxp: fix undefined reference to
 `intel_pxp_gsccs_is_ready_for_sessions'
In-Reply-To: <CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <31F42D8141CDD2D0+20250411105142.89296-1-chenlinxuan@uniontech.com>
 <20250411105459.90782-1-chenlinxuan@uniontech.com>
 <8921351F23CD8948+20250411105459.90782-4-chenlinxuan@uniontech.com>
 <87sem9svmn.fsf@intel.com>
 <CAC1kPDMuAmfoJfL4wjrBEcK+rpgbWk7kYEWJjvps=2UJ6-_WHw@mail.gmail.com>
Date: Tue, 15 Apr 2025 12:07:56 +0300
Message-ID: <87mschssgj.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Tue, 15 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
> Jani Nikula <jani.nikula@linux.intel.com> =E4=BA=8E2025=E5=B9=B44=E6=9C=
=8815=E6=97=A5=E5=91=A8=E4=BA=8C 15:59=E5=86=99=E9=81=93=EF=BC=9A
>>
>> On Fri, 11 Apr 2025, Chen Linxuan <chenlinxuan@uniontech.com> wrote:
>> > On x86_64 with gcc version 13.3.0, I compile kernel with:
>> >
>> >   make defconfig
>> >   ./scripts/kconfig/merge_config.sh .config <(
>> >     echo CONFIG_COMPILE_TEST=3Dy
>> >   )
>> >   make KCFLAGS=3D"-fno-inline-functions -fno-inline-small-functions -f=
no-inline-functions-called-once"
>>
>> The change looks good, but I'm guessing the real explanation is that you
>> have CONFIG_DRM_I915_PXP=3Dn and that appears to be broken.
>>
>> Fixes: 99afb7cc8c44 ("drm/i915/pxp: Add ARB session creation and cleanup=
")
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>
>> But how do you want this merged?
>>
>
> As patch 5 has been merged into rdma-next, I think it's OK to merge
> this single patch into your tree.

Thanks. I amended the commit message a little, and resent this to
intel-gfx [1], and will merge it via drm-intel-next.

BR,
Jani.



[1] https://lore.kernel.org/r/20250415090616.2649889-1-jani.nikula@intel.com



--=20
Jani Nikula, Intel
