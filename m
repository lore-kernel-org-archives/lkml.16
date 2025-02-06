Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E5F222594;
	Thu,  6 Feb 2025 21:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878092; cv=none; b=fJBTFImgVkjk9V3aarN0WCYC3nN/LeMBFr3yQ15CSwT8hLN/wW/3E6IftJmijnY8XkvDgZmofb0NgVw86E2RY0A3+hfvXFzLvIISUKOeP6yvYJt9Ymujx7zrcJJWSGKvF8obTMv4VNnjWiCI8MLdqisqWdSwBXyzd8MQtjEYGf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878092; c=relaxed/simple;
	bh=3OgHs6tzCrAw+gGCDLhhtpN/agDfB2Z70E0T/xuo+TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XLYY6e5WWYljEyU53ViN74p/ZZ8EUOD8JtNPlt1o7i77xOJ0BVbsrm3AHnEt15Wd/HGvlYe1cZk0rXWNxN3rKt27o/JMVlgCtoXsiU+UUmjacGfm3X7XkitWjrw5tyhO3uhClsP6wefZ4KAJoCFBIYw0oC0q+7ztpxMh3wTSuTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l5NBXOdv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l5NBXOdv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738878091; x=1770414091;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3OgHs6tzCrAw+gGCDLhhtpN/agDfB2Z70E0T/xuo+TU=;
  b=l5NBXOdvEmt50CBu7EhIPS5nDnbbFqktQfe/OOuK+GKmbohNTiDpcWWs
   +1K9yo1QEZQ2E948NANx2eQ8+r7XTZB0+nd/xDzaf0BbVHsHMRbfD5hek
   o0MO4QqpFxi1UyhxeA/NZEFwODwv8BGb0ZALTdv275UtmKEc/9KxB7kna
   KSqOAgT1W6jqPQBxvwtYQuDbf3cK4mOczSdnpi65oXav0R54sd3doAE4D
   kNuvyU3Bw2VnuOHuHHGiQqhcnjmI4x+qJBnF853cYmhGUGfcp8SyVQFZB
   WnrfmV6HrtM7kfRS7JpsFqnuzf2thfvn+Ap6rLtvlSz1W4q6In1q1wXMy
   g==;
X-CSE-ConnectionGUID: jVKHkCj9QZSnbmvsBk9qVg==
X-CSE-MsgGUID: CaHsI2tsRSW9fFDHjNMjYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42345047"
X-IronPort-AV: E=Sophos;i="6.13,265,1732608000"; 
   d="scan'208";a="42345047"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:41:28 -0800
X-CSE-ConnectionGUID: 6H771ns0SpuSxG9hNzP1oQ==
X-CSE-MsgGUID: Z+csMKT7SBO/Wvx19isNiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116528569"
Received: from dnelso2-mobl.amr.corp.intel.com (HELO [10.125.111.17]) ([10.125.111.17])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2025 13:41:27 -0800
Message-ID: <239de2b9-0787-4105-a481-418dbd4d861e@intel.com>
Date: Thu, 6 Feb 2025 13:41:29 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15] kasan: x86: arm64: risc-v: KASAN tag-based mode for
 x86
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>,
 Jessica Clarke <jrtc27@jrtc27.com>
Cc: Maciej Wieczor-Retman <maciej.wieczor-retman@intel.com>, luto@kernel.org,
 xin@zytor.com, kirill.shutemov@linux.intel.com, palmer@dabbelt.com,
 tj@kernel.org, andreyknvl@gmail.com, brgerst@gmail.com, ardb@kernel.org,
 dave.hansen@linux.intel.com, jgross@suse.com, will@kernel.org,
 akpm@linux-foundation.org, arnd@arndb.de, corbet@lwn.net,
 dvyukov@google.com, richard.weiyang@gmail.com, ytcoode@gmail.com,
 tglx@linutronix.de, hpa@zytor.com, seanjc@google.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, justinstitt@google.com,
 jason.andryuk@amd.com, glider@google.com, ubizjak@gmail.com,
 jannh@google.com, bhe@redhat.com, vincenzo.frascino@arm.com,
 rafael.j.wysocki@intel.com, ndesaulniers@google.com, mingo@redhat.com,
 catalin.marinas@arm.com, junichi.nomura@nec.com, nathan@kernel.org,
 ryabinin.a.a@gmail.com, dennis@kernel.org, bp@alien8.de,
 kevinloughlin@google.com, morbo@google.com, dan.j.williams@intel.com,
 julian.stecklina@cyberus-technology.de, peterz@infradead.org,
 kees@kernel.org, kasan-dev@googlegroups.com, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, llvm@lists.linux.dev,
 linux-doc@vger.kernel.org, "Shutemov, Kirill" <kirill.shutemov@intel.com>
References: <cover.1738686764.git.maciej.wieczor-retman@intel.com>
 <8bd9c793-aac6-a330-ea8f-3bde0230a20b@gentwo.org>
 <F974BA79-80D8-4414-9DFD-1EEF9395143C@jrtc27.com>
 <72837fcd-97a8-c213-0098-c8f308c3415d@gentwo.org>
 <29A74A26-E922-4A4F-9B4A-8DB0336B99DF@jrtc27.com>
 <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <94f81328-a135-b99b-7f73-43fb77bd7292@gentwo.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/6/25 11:11, Christoph Lameter (Ampere) wrote:
> I also see that KASAN_HW_TAGS exist but this means that the tags can only
> be used with CONFIG_KASAN which is a kernel configuration for debug
> purposes.
> 
> What we are interested in is a *production* implementation with minimal
> software overhead that will be the default on ARM64 if the appropriate
> hardware is detected. 

Ahh, interesting. I'd assumed that once folks had in-hardware tag checks
that they'd just turn on CONFIG_KASAN and be happy.  Guess not!

> That in turn will hopefully allow other software instrumentation
> that is currently used to keep small objects secure and in turn
> creates overhead.
OK, so KASAN as-is is too broad. Are you saying that the kernel
_currently_ have "software instrumentation" like SLAB
redzoning/poisoning and you'd like to see MTE used to replace those?

Are you just interested in small objects?  What counts as small?  I
assume it's anything roughly <PAGE_SIZE.
