Received: from out.smtpout.orange.fr (out-14.smtpout.orange.fr [193.252.22.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7A71C5F39
	for <linux-kernel@vger.kernel.org>; Sun,  2 Feb 2025 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.252.22.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738492921; cv=none; b=uLfnu306vJBOCltED+ThqaQr6XzMsfhNjtnAR3li2F22qXF6GM8tpITqrWVZFqvFPO1kCKC5qPrCGjrNnOxncdBdSOkgWT/oXQkclPZyh5cHmEJPn1/NEG6Sce9Oqkkg2ZQUdTKp1wgPoDrl27uHX/cN5VHu4NhGc1cVG3Rvn6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738492921; c=relaxed/simple;
	bh=SPFSk2DIP7LHxpSAFJ9zmWjQs4Pfydq84VunG5VRcKk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DjX8hkll029YMwRDyFpYjEF33yKYampMrTbyKAHOnjpuqGR4gKP+9X6MG5SmT5okmpnIcvh+UiSVII6RyY48eZS5UR0t037qXCVELkeZwQtjhe3O66u73NnUc7d2S6/Czzw05wfe7Vq3zczgzMwuExxE32tmMZqIvMMNiW9WLgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dIc9Mpnt; arc=none smtp.client-ip=193.252.22.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dIc9Mpnt"
Received: from [172.16.82.72] ([124.33.176.97])
	by smtp.orange.fr with ESMTPA
	id eXP2tVMex6yOueXP7tWCnE; Sun, 02 Feb 2025 11:40:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1738492845;
	bh=lnYvLulxE9IhcSF1/3Dn61cRsmTg1esYKzlS2Lt+4ig=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dIc9MpntZBYxGiq4TvJgbaSmtTXm9DRh3tE2Xj4rvYGH+qo53tyh9KJxKcsXkSIOa
	 jJS+m9Gg2etvT5yaiREjTckVDMNd+P8nEG+YuU0YwtCrsWzO9j+u3+gtcJEZJ9uuin
	 GCyU/H5oFew7MOijn2IHC/6suN861s9+RYFaryN0v54Dyhv3M/EaHYlx1Gt3CYFbKf
	 ytfoilxHMaCOhUfZkQ3ZcirDM/rUsmKsMbAr5m+1tk+Eod39sIphkZIn/H4utqtN88
	 Bi+jjVcuU/QGgKmBO6w40SbOkR5Wx8BXxE97QnxI7wEY5Urq1si7oSipUDySYR/jqF
	 FF5De6LG/3YpA==
X-ME-Helo: [172.16.82.72]
X-ME-Auth: bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 Feb 2025 11:40:45 +0100
X-ME-IP: 124.33.176.97
Message-ID: <38f88be1-1d28-4dbf-b123-d9956f3b49df@wanadoo.fr>
Date: Sun, 2 Feb 2025 19:40:35 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Fixed-type GENMASK/BIT
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20240208074521.577076-1-lucas.demarchi@intel.com>
Content-Language: en-US
From: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Autocrypt: addr=mailhol.vincent@wanadoo.fr; keydata=
 xjMEZluomRYJKwYBBAHaRw8BAQdAf+/PnQvy9LCWNSJLbhc+AOUsR2cNVonvxhDk/KcW7FvN
 LFZpbmNlbnQgTWFpbGhvbCA8bWFpbGhvbC52aW5jZW50QHdhbmFkb28uZnI+wrIEExYKAFoC
 GwMFCQp/CJcFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AWIQTtj3AFdOZ/IOV06OKrX+uI
 bbuZwgUCZx41XhgYaGtwczovL2tleXMub3BlbnBncC5vcmcACgkQq1/riG27mcIYiwEAkgKK
 BJ+ANKwhTAAvL1XeApQ+2NNNEwFWzipVAGvTRigA+wUeyB3UQwZrwb7jsQuBXxhk3lL45HF5
 8+y4bQCUCqYGzjgEZx4y8xIKKwYBBAGXVQEFAQEHQJrbYZzu0JG5w8gxE6EtQe6LmxKMqP6E
 yR33sA+BR9pLAwEIB8J+BBgWCgAmFiEE7Y9wBXTmfyDldOjiq1/riG27mcIFAmceMvMCGwwF
 CQPCZwAACgkQq1/riG27mcJU7QEA+LmpFhfQ1aij/L8VzsZwr/S44HCzcz5+jkxnVVQ5LZ4B
 ANOCpYEY+CYrld5XZvM8h2EntNnzxHHuhjfDOQ3MAkEK
In-Reply-To: <20240208074521.577076-1-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Lucas and Yury,

On 08/02/2024 at 16:45, Lucas De Marchi wrote:
> ove the implementation of REG_GENMASK/REG_BIT to a more appropriate
> place to be shared by i915, xe and possibly other parts of the kernel.
> 
> For now this re-defines the old macros. In future we may start using the
> new macros directly, but that's a more intrusive search-and-replace.
> 
> Changes from v2:
> 
> 	- Document both in commit message and code about the strict type
> 	  checking and give examples how it´d break with invalid params.
> 
> v1: https://lore.kernel.org/intel-xe/20230509051403.2748545-1-lucas.demarchi@intel.com/
> v2: https://lore.kernel.org/intel-xe/20240124050205.3646390-1-lucas.demarchi@intel.com

What is the status on this series? I read it and I think this is great.
So I am a bit sad to see it stalled for nearly one year.

With the -next development windows opening very soon, wouldn't it be a
good idea to revive this topic?


Yours sincerely,
Vincent Mailhol

