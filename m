Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDBD288CB2
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.202.254.214
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751885223; cv=none; b=VNR2nAtsaFEX0jf20y8jtMCcg4CLFzBNe+EEYQQab0nIX8UWVd2wW6pL/UxvXlSTu2FjqFlPaBnMLYLrF4TzCumEZ7UY42mYz1ChU15XqLdFBhscullOF+24MMRTwBI4ea94ag8RYqoh4ylzDB/drIzA9Witqz3qlzf3rLdu3Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751885223; c=relaxed/simple;
	bh=onI8DNifBfVyYsk55fegglgH7VCmiYY4qe/rdEmuQl0=;
	h=To:From:Subject:Date:Message-ID:References:Mime-Version:
	 Content-Type:In-Reply-To:Cc; b=jcVbG10v6Ip58jDQTDILolN1gdXHDQcSXVgqj+KTtYnbLNzMN2rL1+JhsXTqAO/sdelLJCqhuIVsrJ3V94eZo2p0Ppq8RDPuT8yhygKFJvu974IeVBhLkYd/kSZ1gfyl8+DmStoqNY8AQHYa/u1Skbs3775Rpte4i368QYWskSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=m.gmane-mx.org; arc=none smtp.client-ip=116.202.254.214
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=m.gmane-mx.org
Received: from list by ciao.gmane.io with local (Exim 4.92)
	(envelope-from <glk-linux-kernel-4@m.gmane-mx.org>)
	id 1uYjIG-0003RT-JM
	for linux-kernel@vger.kernel.org; Mon, 07 Jul 2025 12:41:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: linux-kernel@vger.kernel.org
From: =?UTF-8?Q?J=C3=B6rg-Volker_Peetz?= <jvpeetz@web.de>
Subject: Re: Linux 6.15.5
Date: Mon, 7 Jul 2025 12:41:47 +0200
Message-ID: <d7527ee9-fba1-49ad-9a71-6d955eeddc3e@web.de>
References: <2025070646-unopposed-nutrient-8e1c@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <2025070646-unopposed-nutrient-8e1c@gregkh>
Cc: stable@vger.kernel.org
Message-ID: <20250707104147.EJ_M4LBZ3cVDn3fvuEkz_rc2i0f0ElUuYZtjriwGRr4@z>

Hi,

upgrading from linux kernel 6.14.9 to 6.15.2 and also now with 6.15.5 I noticed 
that on my system with cpufreq scaling driver amd-pstate the frequencies 
cpuinfo_min_freq and cpuinfo_max_freq increased, the min from 400 to 422.334 
MHz, the max from 4,673 to 4,673.823 MHz. The CPU is an AMD Ryzen 7 5700G.
This in turn increases other values (scaling_min_freq, scaling_max_freq, 
amd_pstate_lowest_nonlinear_freq, etc.).

Bisecting this leads to

commit a9b9b4c2a4cdd00428d14914e3c18be3856aba71
From: Mario Limonciello <mario.limonciello@amd.com>
Date: Thu, 23 Jan 2025 16:16:01 -0600
Subject: [PATCH] cpufreq/amd-pstate: Drop min and max cached frequencies

Did you notice the increase at AMD? Is it intended?

Thanks,
Jörg.

