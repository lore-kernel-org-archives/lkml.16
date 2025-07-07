Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEE55191F98;
	Mon,  7 Jul 2025 11:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751889354; cv=none; b=MLfF8qrQOZL4fjFekNc+/K4WYBFjrtkj4u96wnxx33sNLMqSA1TRyx8xDIHzro6yXGOWvR8Bq0WcsE+AAA+8KoA8eXV8Ki3XWwU8EgkeRQC7HVIAMcKdFI91c6CsACXXSvmm2PNN7z/tpE+c71Ph1JwQLG8S5oGWdkBFnerg5cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751889354; c=relaxed/simple;
	bh=RCcOSQOjTIizrX78WjWaYbISpylDhgQ4eezd52RGlzg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=gl7gGOev0kFkq31LAJYJgpYL7WxLWryngDytJGjOJ6vQCH55A3Sicj7L573VxV08hs00VgKZqmsQFsj69qW3GYIqfEXJB8bktqOoPbjwSfJL7Mhi2gnsdxcieDS48laf+4Yrm5JOV7MAtiw8q52R6Asq9HEnzCU9XHR89aHu1Es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8a6324R; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8a6324R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751889353; x=1783425353;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=RCcOSQOjTIizrX78WjWaYbISpylDhgQ4eezd52RGlzg=;
  b=V8a6324R66w8edu4hEoNurjxbG0ADhwMvTJ69EQkH/lNwwD+8/jwQNtZ
   HUB3HhRk2nYLObj4E0k5Duo8RCxsqTdUu72sHhrY/DvP02GEjizcBG8c9
   d4Q/Uts0ztIwjzlL5FZpFAI72cdZETgKsi/wy3xKNLh554FvpfzQxEWvQ
   3zTSd/h2jCgLe+70XxtRAuQGpKuPmuWBKYrL1zvYdFFXmjwKo7Jm05P3V
   dQBKWRhBN2ioQzYw1ccA4OfcjYW6S+cAaEoPxklLesl9F81QH9klsI6cP
   eNIWuaEEHer8BYZGb/9NiBsVWvmO5HLdmA8I3YWMz0M3tZN8NHFYgRDXi
   g==;
X-CSE-ConnectionGUID: iYIIRleYTr2WfCOUlQ3vfg==
X-CSE-MsgGUID: f+Uhyuq0QLiKkSxjGJO3wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="65454760"
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="65454760"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 04:55:52 -0700
X-CSE-ConnectionGUID: f+wB1+5aTuCJNEWN6B7MBg==
X-CSE-MsgGUID: dbpasXQyTxyrfQZ+hNRX6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,294,1744095600"; 
   d="scan'208";a="154820889"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.104])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 04:55:50 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 7 Jul 2025 14:55:46 +0300 (EEST)
To: Eren Turhan <apole.dev@gmail.com>
cc: Hans de Goede <hansg@kernel.org>, platform-driver-x86@vger.kernel.org, 
    James Seo <james@equiv.tech>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/x86: hp-wmi: Add DMI support for HP Victus
 16-s0xxx (8BD5)
In-Reply-To: <20250704211911.366402-1-apole.dev@gmail.com>
Message-ID: <82d1840f-5a07-6d95-0b04-ef97bf7330fc@linux.intel.com>
References: <20250704211911.366402-1-apole.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 5 Jul 2025, Eren Turhan wrote:

> ---
>  Makefile  |    1 +
>  dkms.conf |    5 +
>  hp-wmi.c  | 2291 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 2297 insertions(+)
>  create mode 100644 Makefile
>  create mode 100644 dkms.conf
>  create mode 100644 hp-wmi.c
> 
> diff --git a/Makefile b/Makefile
> new file mode 100644
> index 0000000..5c135ae
> --- /dev/null
> +++ b/Makefile
> @@ -0,0 +1 @@
> +obj-m := hp-wmi.o
> diff --git a/dkms.conf b/dkms.conf
> new file mode 100644
> index 0000000..8351ef2
> --- /dev/null
> +++ b/dkms.conf
> @@ -0,0 +1,5 @@
> +PACKAGE_NAME="hp-wmi-custom"
> +PACKAGE_VERSION="1.0"
> +BUILT_MODULE_NAME[0]="hp-wmi"
> +DEST_MODULE_LOCATION[0]="/kernel/drivers/platform/x86"
> +AUTOINSTALL="yes"
> diff --git a/hp-wmi.c b/hp-wmi.c
> new file mode 100644
> index 0000000..2f41b4a
> --- /dev/null
> +++ b/hp-wmi.c

Hi,

Unfortunately this is not based on the correct git repo and branch. Please 
resubmit with platform-drivers-x86 repo as the base if you want to have 
support for this to be included into the mainline kernel and we will be 
happy to consider your patch.

You should also write full changelog for the change, it's not enough to 
rely solely on the text in the shortlog (in Subject).

-- 
 i.
