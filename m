Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A62F2F4301;
	Wed, 18 Jun 2025 17:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750268807; cv=none; b=b2QWLxBhQdXjC5TaCglL+K5FXHWQ3w/LKz9D3eBSo0VGxrH68WZpNJGSQbz/LoJmW8uYN6MrHzGLLel+KA5ldcEfWf+WiFGQg4PXFqViqm7artIkKgzlHQ0J2tfUipV/9BvNYXeLM8yLCcYag6CxhYjUsbCIr8Y2TLx+AJmTZXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750268807; c=relaxed/simple;
	bh=CX3CVwC+8hJczoghG3urZ1kcfu4HjXWGEcQWKQNEuQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=usR05sAXzXaJrgcvBNv87sbngrRTMmigvWRJSAWaNqY9mc6ZGoxJVJhXZo0LtwVvaeFRFSas5P9n2qCXRljDyzFObtfthIMBrcf4NtlISSN1J0zgeq1swLNXMbv5cFT7hMiIqpmJSodnhKIq+BNWRpxa217ZhJJtiPCSaL4TmUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WO3KGe+6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WO3KGe+6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750268805; x=1781804805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CX3CVwC+8hJczoghG3urZ1kcfu4HjXWGEcQWKQNEuQA=;
  b=WO3KGe+6cvH3b04+YRNsr6Qlb5nZp89in9dUhRfqaPcKMWucNYO4LXnS
   BHaBmInSXYV/tbxcGmp2o0Jxh2QFziCHE2srb0Wh03lEcO2rehAB6FkO0
   /X6NN89EWJVswYC+81qdMYNi6xSxl0ZGdkdePQaJp/3WULvpqXmy9WCkC
   6dwngi8jP6f1SvOChk92iJ4sgPrIMb8DYyCT47pgiE6SuG0/qwwcWpQ4L
   1kZLuHfaOa+MgTNEn78f90msijswEyJS6poONNR9Snvap6uW6anj5+BtR
   lGMRzSluZH8FCHw1xEr0xyMTC4nXkJ48MMo81jaVRG4nDuo9xe5H90XAN
   Q==;
X-CSE-ConnectionGUID: bYsQENp7QY+tW6VVPUJL5Q==
X-CSE-MsgGUID: pfQfPUQjSHO+V+CsGK2UvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11468"; a="63856734"
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="63856734"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 10:46:44 -0700
X-CSE-ConnectionGUID: ESfDO2g2QGiLU6Mzwp161w==
X-CSE-MsgGUID: YjB0iG07RZKToR9caSShAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,246,1744095600"; 
   d="scan'208";a="149827039"
Received: from smile.fi.intel.com ([10.237.72.52])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 10:46:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98.2)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1uRwru-00000007oal-16HD;
	Wed, 18 Jun 2025 20:46:38 +0300
Date: Wed, 18 Jun 2025 20:46:38 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC 1/2] lib/vsprintf: Add support for pte_t
Message-ID: <aFL7frrstgpzzgan@smile.fi.intel.com>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
 <20250618041235.1716143-2-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618041235.1716143-2-anshuman.khandual@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 18, 2025 at 09:42:34AM +0530, Anshuman Khandual wrote:
> Add a new format for printing page table entries.

> Cc: Petr Mladek <pmladek@suse.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-mm@kvack.org

Please. move these to be after the '---' cutter line below. Just leave SoB tag
alone. This will have the same effect w/o polluting commit message.

> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---

(somewhere here is a good place for all your Cc: tags)

...

> +        %ppte

I believe you can take %pte.

...

> +Print standard page table entry pte_t.
> +
> +Passed by reference.
> +
> +Examples for a 64 bit page table entry, given &(u64)0xc0ffee::

What does this mean?

> +        %ppte   0x00c0ffee

Can it be ever 64-bit?

...

> +			spec.field_width = 10;
> +			spec.precision = 8;
> +			spec.base = 16;
> +			spec.flags = SPECIAL | SMALL | ZEROPAD;

Do not duplicate code we have already in the file.

> +			if (sizeof(pte_t) == sizeof(u64)) {
> +				u64 val = pte_val(*pte);
> +
> +				return number(buf, end, val, spec);
> +			}

Ditto.

> +			WARN_ONCE(1, "Non standard pte_t\n");

(almost) Ditto,

> +			return error_string(buf, end, "(einval)", spec);

Ditto.

> +		}
> +		fallthrough;

Please, avoid this, it makes code much harder to read and maintain.
See above how.

-- 
With Best Regards,
Andy Shevchenko


