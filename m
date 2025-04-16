Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CDD22D7A8;
	Wed, 16 Apr 2025 07:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789020; cv=none; b=jwnV7Ywmo7cwysdfsDIXV/KrZxzhMonfdB0LisUQedWqeqhjASXhEcbsDf4fgAmN+jclx81JW3+mGDko7GLNv5TiECrCqM2NCZevrC8wcSH5P5tlNrzbtc2VjAqFMpGcFMIXGmfIYYMBYvkWz62OVmzSdxz7Znk2y6vl4bKoLQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789020; c=relaxed/simple;
	bh=k12yYWnEtuAOb8FYj01ByawbqpUrWk4A5udTKrydTEs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=H68rqVN9F+CSESdhZKbqMccVgRbggOZ7jnncEb1N558YZcYCLlUfdY3eHxw6NusP8NT+Q/6aI7Xy0I4fGgA85PIXcuCE/kqNzo2qsnqOxWoGMHHmCnsyFHf7JUeOfc6fbDnwPEeihgINJvi8G/6B7u0nNpga5l4H5i7U+pR15wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aeYGFd4j; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aeYGFd4j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744789019; x=1776325019;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=k12yYWnEtuAOb8FYj01ByawbqpUrWk4A5udTKrydTEs=;
  b=aeYGFd4jusE6CmvKpa/HdG/UqmbrCy5MHY0eskc4eKfZgGdSW9QieEst
   +qKrzSlivROiWjveLpgaQ2JMV25jzUZQevm+fAOjUyVHePNECPmnJoeE3
   8ugft9cGHK0nvNE7R0HTx0e2YuYCf60V2FDhLepOei863ZypyinXIqOWK
   TWEEZl/jJQl7l4llJmm/mEofvmzHVqpf0ogs1mzuWLGYApX0e+TmghQpf
   q9rmA6ezpyiN9r6iK8qh82rDnenJ/XhK19QJbOBT56qCbd15wyOn70j7G
   m4zxfzgQul6hCdACgLxqiKEXRfo7DjgkLf1rIN+G2tLm/Oua8PEB7PB9P
   w==;
X-CSE-ConnectionGUID: CrGsPNGGTOOfVOYFee4Fxg==
X-CSE-MsgGUID: k53T0AnLSN+3IrNqwf4N8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63729594"
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="63729594"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:36:58 -0700
X-CSE-ConnectionGUID: 2GDZYhD5Tuu3ame4S8uWNQ==
X-CSE-MsgGUID: fPmLpTnpSIaidZAjcFFOrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,215,1739865600"; 
   d="scan'208";a="131274566"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.96])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 00:36:53 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Andy Shevchenko
 <andriy.shevchenko@intel.com>, David Airlie <airlied@gmail.com>, Joonas
 Lahtinen <joonas.lahtinen@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, Tvrtko Ursulin
 <tursulin@ursulin.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] scripts/kernel-doc.py: don't create *.pyc files
In-Reply-To: <8734e8r25j.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1744786420.git.mchehab+huawei@kernel.org>
 <432f17b785d35122753d4b210874d78ee84e1bb5.1744786420.git.mchehab+huawei@kernel.org>
 <8734e8r25j.fsf@intel.com>
Date: Wed, 16 Apr 2025 10:36:50 +0300
Message-ID: <87zfggpnfx.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 16 Apr 2025, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 16 Apr 2025, Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:
>> As reported by Andy, kernel-doc.py is creating a __pycache__
>> directory at build time.
>>
>> Disable creation of __pycache__ for the libraries used by
>> kernel-doc.py, when excecuted via the build system or via
>> scripts/find-unused-docs.sh.
>>
>> Reported-by: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Closes: https://lore.kernel.org/linux-doc/Z_zYXAJcTD-c3xTe@black.fi.intel.com/
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>> ---
>>  drivers/gpu/drm/Makefile      | 2 +-
>>  drivers/gpu/drm/i915/Makefile | 2 +-
>>  include/drm/Makefile          | 2 +-
>>  scripts/find-unused-docs.sh   | 2 +-
>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
>> index ed54a546bbe2..1469d64f8783 100644
>> --- a/drivers/gpu/drm/Makefile
>> +++ b/drivers/gpu/drm/Makefile
>> @@ -236,7 +236,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>>        cmd_hdrtest = \
>>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
>> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>> +		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>
> It doesn't work to put PYTHONDONTWRITEBYTECODE=1 as a parameter to
> kernel-doc...

Moreover, KERNELDOC is only defined in Documentation/Makefile. It's
empty here.

Also scripts/Makefile.build uses kernel-doc, which is probably the one
creating __pycache__ Andy sees.

>
> BR,
> Jani.
>
>
>>  		touch $@
>>  
>>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index ed05b131ed3a..bb873f9cc2aa 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -408,7 +408,7 @@ obj-$(CONFIG_DRM_I915_GVT_KVMGT) += kvmgt.o
>>  #
>>  # Enable locally for CONFIG_DRM_I915_WERROR=y. See also scripts/Makefile.build
>>  ifdef CONFIG_DRM_I915_WERROR
>> -    cmd_checkdoc = $(srctree)/scripts/kernel-doc -none -Werror $<
>> +    cmd_checkdoc = $(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none -Werror $<
>>  endif
>>  
>>  # header test
>> diff --git a/include/drm/Makefile b/include/drm/Makefile
>> index a7bd15d2803e..6088ea458f44 100644
>> --- a/include/drm/Makefile
>> +++ b/include/drm/Makefile
>> @@ -11,7 +11,7 @@ always-$(CONFIG_DRM_HEADER_TEST) += \
>>  quiet_cmd_hdrtest = HDRTEST $(patsubst %.hdrtest,%.h,$@)
>>        cmd_hdrtest = \
>>  		$(CC) $(c_flags) -fsyntax-only -x c /dev/null -include $< -include $<; \
>> -		$(srctree)/scripts/kernel-doc -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>> +		$(KERNELDOC) PYTHONDONTWRITEBYTECODE=1 -none $(if $(CONFIG_WERROR)$(CONFIG_DRM_WERROR),-Werror) $<; \
>>  		touch $@
>>  
>>  $(obj)/%.hdrtest: $(src)/%.h FORCE
>> diff --git a/scripts/find-unused-docs.sh b/scripts/find-unused-docs.sh
>> index ee6a50e33aba..d6d397fbf917 100755
>> --- a/scripts/find-unused-docs.sh
>> +++ b/scripts/find-unused-docs.sh
>> @@ -54,7 +54,7 @@ for file in `find $1 -name '*.c'`; do
>>  	if [[ ${FILES_INCLUDED[$file]+_} ]]; then
>>  	continue;
>>  	fi
>> -	str=$(scripts/kernel-doc -export "$file" 2>/dev/null)
>> +	str=$(PYTHONDONTWRITEBYTECODE=1 scripts/kernel-doc -export "$file" 2>/dev/null)
>>  	if [[ -n "$str" ]]; then
>>  	echo "$file"
>>  	fi

-- 
Jani Nikula, Intel
