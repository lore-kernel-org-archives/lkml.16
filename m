Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A29288CB9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749669874; cv=none; b=NyYM2jbogKjyVtFUi+gFXssjqwno4BZd9603as+pJH8K8wrPhR3tbR/8ZdPF3NaDY5LuVpoaog0+mEikfPFLIFJaD0rplUpehtTdUleWJVfnUpzoquYY2rVp4SHONLDLYQ7fGu5+bA3yTXoo6hCZfWoRbXxw1CCMEFQySgo9inI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749669874; c=relaxed/simple;
	bh=Oj6mOpbQNNQUmKpOQd5ub8h1VvyLQefjGHPExrAtD9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YyYjJFyN9MvmdLGcEapx9Zu5TThM1QQNrh6ENMnRF/uWc2ask0UnyZcwbOZpsniXDEGigalzlQS1wh+nY26Gy17oUGqnrP3G9dPSc75Ks8l0pgUPUUTjXhuh7hHMKFPzuhS08MIt1CF6ld4Ij1pMnH5lGQV1GxDZnX2rm+jl3jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d53hIuN0; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d53hIuN0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749669873; x=1781205873;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Oj6mOpbQNNQUmKpOQd5ub8h1VvyLQefjGHPExrAtD9k=;
  b=d53hIuN0452gyHF4penFsxYAhxQVQMrR/dHF1NgtTas99nwzh/1aUw8d
   rV1rLA/7qlHmrgnnBFg2LHTjQiij7iNUOfHVyWduDvTW+M2fkax0AQQHH
   HQZ2vMW9MRqZ4yDesz0O29ceQuvl2LrQ/Dz3S7uXJKjYM4ok99jxtlcfN
   78mVtxkQ/64OhVSFn7/E4aNNW3tKeaUxjrh06SHPRvUuCj7Bj/JRLgAOx
   nkxo8pt2z/OWr28RNfnyVI6r0IlvWyq0Vhp0rBLg7F41b1pO3OWbEmw+Z
   qqRjVXgXMwvnCETpUJippTf/8HVBu0Q34BYfgkjYxRZ3ZteWgljjxwCM6
   w==;
X-CSE-ConnectionGUID: 6uDxuuysSs+bOzNpNFFy0A==
X-CSE-MsgGUID: vod8lpMmSZWQTqf8SRh3Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51744859"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="51744859"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 12:24:32 -0700
X-CSE-ConnectionGUID: 5UNwygBlRT+PpJit7uKbmQ==
X-CSE-MsgGUID: 0ZG5AQz7SUehtVJuR20vIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147185086"
Received: from agladkov-desk.ger.corp.intel.com (HELO [10.125.111.167]) ([10.125.111.167])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 12:24:31 -0700
Message-ID: <46022480-eef7-4670-ab1d-6d781eee95d5@intel.com>
Date: Wed, 11 Jun 2025 12:24:31 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] x86/cpu: Mark Ice Lake model 7D and 9D as unreleased
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org
Cc: tony.luck@intel.com, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>
References: <20250611-icelake-cleanup-v1-1-0f82472dbc8f@linux.intel.com>
 <df2d4900-b543-47c4-977e-8604d2482744@citrix.com>
Content-Language: en-US
From: Dave Hansen <dave.hansen@intel.com>
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
In-Reply-To: <df2d4900-b543-47c4-977e-8604d2482744@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/11/25 11:52, Andrew Cooper wrote:
> What if Intel suddenly find there's a >50% gross market opportunity
> selling ICX-NNPI and release this model after all?  (Ok fine, unlikely,
> but the point stands).

Intel has been _treating_ these models as if they don't exist. If Intel
changes its mind, it's going to have an awful lot of work to do like
updating the "affected CPU list" documentation or the other random CPU
model lists in the kernel that are missing ICX-NNPI.

Removing a CPU from this list will be a small matter compared to the
rest of the work that has to be done.

> What about unallocated model numbers?

One thing I considered was just taking model 7D and 9D and removing them
from the kernel. Basically making them the same as unallocated model
numbers.

But in general, we expect that folks will boot old kernels on new
hardware. We also expect the kernel to do its best there and not whine
or complain because there's nothing wrong going on.

But model 7D and 9D are different. I think we really do want the kernel
to complain. It's totally unexpected that someone will run Linux on one
of those CPUs. We want the kernel to complain loudly.

> What about A0 stepping of released models?

Can we detect A0 steppings deterministically? Do we want Linux running
on them without or without complaint?

I don't think there are any hard rules across all CPUs that would let us
reliably detect A0 steppings. Even if we could, the vast majority of
folks running Linux on them are doing internal CPU company testing on
them and we aren't going to help those folks much by scaring them with
warnings.

> What about Cannon Lake which did technically ship to customers, but
> for most intents and purposes doesn't exist.

Is there a _reason_ to mark them as unreleased? Are they getting (or did
they get) microcode updates? Are they covered in the mitigation
documentation?
