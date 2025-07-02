Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BC6233723;
	Wed,  2 Jul 2025 08:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444618; cv=none; b=pjWo2M3yy6EPwAm6XstJ1APjHyzAdrPBcCFt8y7G2jz56KvZHMaOB70RyjRy35tdRfJgJ2CX7nf3FsViUZ/xZrO+IUqUXCKuX9F+wOWTPHsYKTFGEnYmKqi6IBfVqb7qSyDH8eIDq74aV1WWAJdA1yYDwT4RmavbekwBPv2qGBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444618; c=relaxed/simple;
	bh=HBWjIeHT2TPx6GxRmnniI2Bkgont5Fgc3phV6Wo21uE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SOw9eIYjud03S6kZZC4tccLEjBXHD92b0zvwpG4saDLiouYSv2U/PDWxtA6SZGOHSYsK/cVL7+ms4ObtvFP3AGG9lq3K+7dcpNZOdM+Nwfdedh3HEfSvBVZYahpgpKbINHSd4+jVCvYtyZ0FJakFzfthPzPQK48g8RibQXHIJJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ts5Ndxmv; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ts5Ndxmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751444617; x=1782980617;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=HBWjIeHT2TPx6GxRmnniI2Bkgont5Fgc3phV6Wo21uE=;
  b=Ts5NdxmvSq1lssn0L5V5f6Cg5pftbfXqzT0uTVkhUTa5E9lBoMv7RLhz
   uVk8A+8Kdttm17ve5XJmC5nvFh2DmJLpfb+vnm3mQC3xDzTdLceqLIF6H
   M8gesEUAQM/Bjwb81neg0cZeI1+vZYpwK+ClSw+l06b5xT3774aRn++DY
   6L0ua2x97DX7PHSNedUFW6b/ilsAhkTgfhkGf9eoU/MzwB5NEewjAs70r
   cBK2lnlBXZryNId8zP1punoU2tPus0r/WC2KlWD+dlbYIZSsh0nIMteh0
   /ubouYybXvJIetM0XiLdOnSerBBqyHA+QkuIubXN6FNYEFa5IAMLRGACa
   g==;
X-CSE-ConnectionGUID: av93zIewQN+quNUbKsLm+Q==
X-CSE-MsgGUID: ypv88JdsSWuayApenIfD/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="53871416"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="53871416"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:23:35 -0700
X-CSE-ConnectionGUID: 6eHzCsT7R2Cc1UlwpOveoQ==
X-CSE-MsgGUID: SRDxKhSaQLiW8WSuocYl2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="154164230"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.246.29])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:23:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Mauro Carvalho Chehab
 <mchehab+huawei@kernel.org>, Akira Yokosawa <akiyks@gmail.com>, Jonathan
 Corbet <corbet@lwn.net>
Subject: Re: [PATCH 6/7] docs: kdoc: Remove a Python 2 comment
In-Reply-To: <20250701205730.146687-7-corbet@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250701205730.146687-1-corbet@lwn.net>
 <20250701205730.146687-7-corbet@lwn.net>
Date: Wed, 02 Jul 2025 11:23:29 +0300
Message-ID: <829b4b1ed00f6e97626ff551148b6e47212ae673@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 01 Jul 2025, Jonathan Corbet <corbet@lwn.net> wrote:
> We no longer support Python 2 in the docs build chain at all, so we
> certainly do not need to admonish folks to keep this file working with it.

I feel old.

Acked-by: Jani Nikula <jani.nikula@intel.com>

>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  Documentation/sphinx/kerneldoc.py | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
> index 51a2793dc8e2..2586b4d4e494 100644
> --- a/Documentation/sphinx/kerneldoc.py
> +++ b/Documentation/sphinx/kerneldoc.py
> @@ -25,8 +25,6 @@
>  # Authors:
>  #    Jani Nikula <jani.nikula@intel.com>
>  #
> -# Please make sure this works on both python2 and python3.
> -#
>  
>  import codecs
>  import os

-- 
Jani Nikula, Intel
