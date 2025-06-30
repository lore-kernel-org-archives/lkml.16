Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA441CDFCE
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273395; cv=none; b=dAY/7LiiMhSgoNfq3Zxs5jb85+89eQ+yq/GIPDF9K/g+upCX1rHjrqaK6/rNMhU8YceRYbtdH7q+w9nC6tS/a+uzRdR8zrW0nKCISoCOpZ0uCU0nHHuz0UmKpMuGk4HSFUucwpf0V1sC2OJlxuMHv1zfw+KcKkWn0OjJUmnllZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273395; c=relaxed/simple;
	bh=/T1XmqLkHGmZ4HU8CZhuAPLKatyDiVqkgbmpJsILy3E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSjRl95Z1PNeIpKFwyuv8OEIVWtu6cM26zNxVGCwti8e8MIqyhMtpgQBx95KLkkB1QB6rX4gQnFOarriZV/MaEJWtByQEF8s26vLMOLkM5XCyH0vb9kDi8Px8DTIu9kNnB9q3lqbkf/vOGXg9aS5Weqf4VAsqljkFARpwPjUgnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.2.196] (p5dc55466.dip0.t-ipconnect.de [93.197.84.102])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 17BD061E64787;
	Mon, 30 Jun 2025 10:49:17 +0200 (CEST)
Message-ID: <16a1a6de-e2e2-4fed-9ca0-7bca50c7169c@molgen.mpg.de>
Date: Mon, 30 Jun 2025 10:49:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] Panel flickering on Dell XPS 13 9360 with
 drm-fixes-2025-06-28 merged (Linux 6.16-rc4)
To: Imre Deak <imre.deak@intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 regressions@lists.linux.dev
References: <e8c595d4-716f-474c-99ae-c95a56e65d3d@molgen.mpg.de>
 <aGI_tO6btgJluwUu@ideak-desk>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <aGI_tO6btgJluwUu@ideak-desk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Imre,


Thank you for your reply.


Am 30.06.25 um 09:41 schrieb Imre Deak:
> On Sun, Jun 29, 2025 at 11:04:31PM +0200, Paul Menzel wrote:

>> Just a heads-up, that very likely, merging of branch *drm-fixes-2025-06-28*
>> causes flickering of the panel of the Intel Kaby Lake laptop Dell XPS 13
>> 9360. 6.16.0-rc3 works fine, and with 6.16-rc3-00329-gdfba48a70cb6 the panel
>> flickers. I try to bisect, but maybe you already have an idea.
> 
> One possibility is:
> a3ef3c2da675 ("drm/dp: Change AUX DPCD probe address from DPCD_REV to LANE0_1_STATUS")

Yes, that is the one my bisection pinpointed.

> Could you open a ticket for this and provide a drm.debug=0x10e log with
> 6.16-rc4 and try if the following commits in drm-tip fixes the issue?:
> 
> 5281cbe0b55a ("drm/edid: Define the quirks in an enum list")
> 0b4aa85e8981 ("drm/edid: Add support for quirks visible to DRM core and drivers")
> b87ed522b364 ("drm/dp: Add an EDID quirk for the DPCD register access probe")
> ed3648b9ec4c ("drm/i915/dp: Disable the AUX DPCD probe quirk if it's not required")
> 
> I also pushed these to:
> https://github.com/ideak/linux/commits/dpcd-probe-quirk

I created issue *[Regression] Panel flickering on Dell XPS 13 9360 with 
drm-fixes-2025-06-28 merged (Linux 6.16-rc4)* [1], and will try your 
proposed fixes later.

[…]


Kind regards,

Paul


[1]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14558
