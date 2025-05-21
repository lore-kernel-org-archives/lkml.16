Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C3E1DF991
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747840594; cv=none; b=gUrTW26kqnlnDQds8aN/vYrgb3uKsGj8It1kSDbI3Jzc7iO3Rs6cN7X3FRR2W6Bnjs1ewiM5fkO5664oQzJ4fr6UljlYhzYd+5xQ+Gu92CnTlX+Zs+6Ovmr+iViQoIFo4PvQPTmzc8ZxJio78PoND8c0RoGqy9NszKmDwP68+Ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747840594; c=relaxed/simple;
	bh=uIFp6FUN2+rM4RSf61UGlgnH3srvVhm65Sk5NDLSisw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MxSaPH+WQfrGrYZWyEF+FpShdKHj3VITzf6/NTLBd/iikq9LycsvF4Iaa2pS+O0l7lWEE9zj8ZdkGzf3q9g0qIUo9h5xcDpYM3f+Qkt8tgRIfYVvB0m/ZiMFFuAgI3litK1MubsIsOo3I7lfXJXLFieihrIMkdHdaLzchy9jmRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L1o2oCft; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L1o2oCft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747840592; x=1779376592;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=uIFp6FUN2+rM4RSf61UGlgnH3srvVhm65Sk5NDLSisw=;
  b=L1o2oCftoCIcV9HwhgV2R1rn0pP9AlGxKTbiwVY2zaSyD1PwC3/N+0My
   lyRaqJg6dswvS+z+wtzKmzSfjnhjF3I5A0ixsG0FJ0sPhUFddq/XS0zNw
   7aBdFMmbuNqZXx4/iizWmolwlg+NseUrnx0sMdfMa1CsuF/iEP3jjsnem
   AaltL2T/YccgODbghWYkAnCoo2ONq1Y4qr4D8zJZYiGGLJCwxRr7oJgTd
   QsWb335z98wvMiiDt/PTrydB7tNP7NtossH1YG/IJLczukoJor35g5eQb
   Z7kHRzw2rXlL+E08TmAljJb9zSuo5GVvh7EmTIKX4FZgQhW/8WhtGQ6PV
   w==;
X-CSE-ConnectionGUID: 69H6yMVoT5izM/lPCaaZVw==
X-CSE-MsgGUID: 5RW2a8vYQqqTKsHarl53Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49922238"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49922238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:16:24 -0700
X-CSE-ConnectionGUID: I2Qw2siATsuCKO+WX6xWcg==
X-CSE-MsgGUID: 3uzHabndQIS56fuWG+licQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="177272047"
Received: from iherna2-mobl4.amr.corp.intel.com (HELO [10.125.109.100]) ([10.125.109.100])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 08:16:24 -0700
Message-ID: <79975f50-7a98-4629-9ed8-c32596cab46a@intel.com>
Date: Wed, 21 May 2025 08:16:23 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 5/9] x86/mm: Change cpa_flush() to call
 flush_kernel_range() directly
To: Rik van Riel <riel@surriel.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, x86@kernel.org, kernel-team@meta.com,
 dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, hpa@zytor.com,
 nadav.amit@gmail.com, Rik van Riel <riel@fb.com>,
 Yu-cheng Yu <yu-cheng.yu@intel.com>
References: <20250520010350.1740223-1-riel@surriel.com>
 <20250520010350.1740223-6-riel@surriel.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 xsFNBE6HMP0BEADIMA3XYkQfF3dwHlj58Yjsc4E5y5G67cfbt8dvaUq2fx1lR0K9h1bOI6fC
 oAiUXvGAOxPDsB/P6UEOISPpLl5IuYsSwAeZGkdQ5g6m1xq7AlDJQZddhr/1DC/nMVa/2BoY
 2UnKuZuSBu7lgOE193+7Uks3416N2hTkyKUSNkduyoZ9F5twiBhxPJwPtn/wnch6n5RsoXsb
 ygOEDxLEsSk/7eyFycjE+btUtAWZtx+HseyaGfqkZK0Z9bT1lsaHecmB203xShwCPT49Blxz
 VOab8668QpaEOdLGhtvrVYVK7x4skyT3nGWcgDCl5/Vp3TWA4K+IofwvXzX2ON/Mj7aQwf5W
 iC+3nWC7q0uxKwwsddJ0Nu+dpA/UORQWa1NiAftEoSpk5+nUUi0WE+5DRm0H+TXKBWMGNCFn
 c6+EKg5zQaa8KqymHcOrSXNPmzJuXvDQ8uj2J8XuzCZfK4uy1+YdIr0yyEMI7mdh4KX50LO1
 pmowEqDh7dLShTOif/7UtQYrzYq9cPnjU2ZW4qd5Qz2joSGTG9eCXLz5PRe5SqHxv6ljk8mb
 ApNuY7bOXO/A7T2j5RwXIlcmssqIjBcxsRRoIbpCwWWGjkYjzYCjgsNFL6rt4OL11OUF37wL
 QcTl7fbCGv53KfKPdYD5hcbguLKi/aCccJK18ZwNjFhqr4MliQARAQABzUVEYXZpZCBDaHJp
 c3RvcGhlciBIYW5zZW4gKEludGVsIFdvcmsgQWRkcmVzcykgPGRhdmUuaGFuc2VuQGludGVs
 LmNvbT7CwXgEEwECACIFAlQ+9J0CGwMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAAoJEGg1
 lTBwyZKwLZUP/0dnbhDc229u2u6WtK1s1cSd9WsflGXGagkR6liJ4um3XCfYWDHvIdkHYC1t
 MNcVHFBwmQkawxsYvgO8kXT3SaFZe4ISfB4K4CL2qp4JO+nJdlFUbZI7cz/Td9z8nHjMcWYF
 IQuTsWOLs/LBMTs+ANumibtw6UkiGVD3dfHJAOPNApjVr+M0P/lVmTeP8w0uVcd2syiaU5jB
 aht9CYATn+ytFGWZnBEEQFnqcibIaOrmoBLu2b3fKJEd8Jp7NHDSIdrvrMjYynmc6sZKUqH2
 I1qOevaa8jUg7wlLJAWGfIqnu85kkqrVOkbNbk4TPub7VOqA6qG5GCNEIv6ZY7HLYd/vAkVY
 E8Plzq/NwLAuOWxvGrOl7OPuwVeR4hBDfcrNb990MFPpjGgACzAZyjdmYoMu8j3/MAEW4P0z
 F5+EYJAOZ+z212y1pchNNauehORXgjrNKsZwxwKpPY9qb84E3O9KYpwfATsqOoQ6tTgr+1BR
 CCwP712H+E9U5HJ0iibN/CDZFVPL1bRerHziuwuQuvE0qWg0+0SChFe9oq0KAwEkVs6ZDMB2
 P16MieEEQ6StQRlvy2YBv80L1TMl3T90Bo1UUn6ARXEpcbFE0/aORH/jEXcRteb+vuik5UGY
 5TsyLYdPur3TXm7XDBdmmyQVJjnJKYK9AQxj95KlXLVO38lczsFNBFRjzmoBEACyAxbvUEhd
 GDGNg0JhDdezyTdN8C9BFsdxyTLnSH31NRiyp1QtuxvcqGZjb2trDVuCbIzRrgMZLVgo3upr
 MIOx1CXEgmn23Zhh0EpdVHM8IKx9Z7V0r+rrpRWFE8/wQZngKYVi49PGoZj50ZEifEJ5qn/H
 Nsp2+Y+bTUjDdgWMATg9DiFMyv8fvoqgNsNyrrZTnSgoLzdxr89FGHZCoSoAK8gfgFHuO54B
 lI8QOfPDG9WDPJ66HCodjTlBEr/Cwq6GruxS5i2Y33YVqxvFvDa1tUtl+iJ2SWKS9kCai2DR
 3BwVONJEYSDQaven/EHMlY1q8Vln3lGPsS11vSUK3QcNJjmrgYxH5KsVsf6PNRj9mp8Z1kIG
 qjRx08+nnyStWC0gZH6NrYyS9rpqH3j+hA2WcI7De51L4Rv9pFwzp161mvtc6eC/GxaiUGuH
 BNAVP0PY0fqvIC68p3rLIAW3f97uv4ce2RSQ7LbsPsimOeCo/5vgS6YQsj83E+AipPr09Caj
 0hloj+hFoqiticNpmsxdWKoOsV0PftcQvBCCYuhKbZV9s5hjt9qn8CE86A5g5KqDf83Fxqm/
 vXKgHNFHE5zgXGZnrmaf6resQzbvJHO0Fb0CcIohzrpPaL3YepcLDoCCgElGMGQjdCcSQ+Ci
 FCRl0Bvyj1YZUql+ZkptgGjikQARAQABwsFfBBgBAgAJBQJUY85qAhsMAAoJEGg1lTBwyZKw
 l4IQAIKHs/9po4spZDFyfDjunimEhVHqlUt7ggR1Hsl/tkvTSze8pI1P6dGp2XW6AnH1iayn
 yRcoyT0ZJ+Zmm4xAH1zqKjWplzqdb/dO28qk0bPso8+1oPO8oDhLm1+tY+cOvufXkBTm+whm
 +AyNTjaCRt6aSMnA/QHVGSJ8grrTJCoACVNhnXg/R0g90g8iV8Q+IBZyDkG0tBThaDdw1B2l
 asInUTeb9EiVfL/Zjdg5VWiF9LL7iS+9hTeVdR09vThQ/DhVbCNxVk+DtyBHsjOKifrVsYep
 WpRGBIAu3bK8eXtyvrw1igWTNs2wazJ71+0z2jMzbclKAyRHKU9JdN6Hkkgr2nPb561yjcB8
 sIq1pFXKyO+nKy6SZYxOvHxCcjk2fkw6UmPU6/j/nQlj2lfOAgNVKuDLothIxzi8pndB8Jju
 KktE5HJqUUMXePkAYIxEQ0mMc8Po7tuXdejgPMwgP7x65xtfEqI0RuzbUioFltsp1jUaRwQZ
 MTsCeQDdjpgHsj+P2ZDeEKCbma4m6Ez/YWs4+zDm1X8uZDkZcfQlD9NldbKDJEXLIjYWo1PH
 hYepSffIWPyvBMBTW2W5FRjJ4vLRrJSUoEfJuPQ3vW9Y73foyo/qFoURHO48AinGPZ7PC7TF
 vUaNOTjKedrqHkaOcqB185ahG2had0xnFsDPlx5y
In-Reply-To: <20250520010350.1740223-6-riel@surriel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 18:02, Rik van Riel wrote:
> The function cpa_flush() calls __flush_tlb_one_kernel() and
> flush_tlb_all().
> 
> Replacing that with a call to flush_tlb_kernel_range() allows
> cpa_flush() to make use of INVLPGB or RAR without any additional
> changes.

Yeah, the pageattr.c flushing code has gone through some twists and
turns over the years but it does indeed look like it has converged to be
awfully close to the other flushing code. It used to do wbinvd() and a
full flush, but the wbinvd() disappeared at some point.

I don't immediately see any downsides to doing this. You could probably
even hoist this up to the top of the series. I think it's a good cleanup
on its own.

Also, I'd make the point in the subject and changelog that this isn't
just changing one function to call another, it's removing some
duplicated functionality and consolidating it to existing common code.

Maybe this for the subject:

	x86/mm: Have cpa_flush() use common TLB flushing infrastructure

One super nit:

> +	start = fix_addr(__cpa_addr(cpa, 0));
> +	end = fix_addr(__cpa_addr(cpa, cpa->numpages));

Please vertically align the fix_addr()'s.
