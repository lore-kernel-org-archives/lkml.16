Received: from mail.postale.io (mail.postale.io [3.136.239.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993F1248F6F;
	Tue, 24 Jun 2025 11:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.136.239.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764386; cv=none; b=fDhWRhIXgUSIgCTp34fWIQ8Chn0n6QaKpWQalaYuvo3XywieKWfuIjMYYYWFfptstrYSn+j1brKoAn8BNNMnXekEIPnY0ed5NjdwxzcYEThy0wCXo5aSYgCw/O60ifhEfAPF4FrYLp1K/5qf1LGvcTVWWCc00dUzy2DSCKFJQI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764386; c=relaxed/simple;
	bh=OiyPzE5YteeFr9c/E1WyDFT3/gY3tdhgCQousmGSZ98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jo0UNG8eJoWsXGauKAGQkXr0Ot6uEx8Y65y46caTlZsz96FscuuviSax/lkGh+RtuaKRbdjyRONupDm6KHHIJxX2tVj3juZRuHUevIuRXAXkNHRHcYd1d0XX/VFQqoQKmgdnnMCcNds3lCRuf8MBRzVoJJ8yi/u4avW6HX+kUs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl; spf=pass smtp.mailfrom=glxys.nl; dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b=gtTUdhzb; arc=none smtp.client-ip=3.136.239.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=glxys.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=glxys.nl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=glxys.nl header.i=@glxys.nl header.b="gtTUdhzb"
Authentication-Results: mail.postale.io;
	auth=pass (plain)
Message-ID: <cec23f4a-6d97-499e-3f28-18d44fde00f2@glxys.nl>
Date: Tue, 24 Jun 2025 19:25:59 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3] ALSA: hda: add MODULE_FIRMWARE for cs35l41/cs35l56
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
Cc: simont@opensource.cirrus.com, david.rhodes@cirrus.com,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, lkp@intel.com,
 oe-kbuild-all@lists.linux.dev, patches@opensource.cirrus.com,
 perex@perex.cz, rf@opensource.cirrus.com, tiwai@suse.com, me@glxys.nl
References: <002901dbe4ef$57d0cce0$077266a0$@opensource.cirrus.com>
 <20250624101716.2365302-2-me@glxys.nl> <87cyatl8q3.wl-tiwai@suse.de>
From: GalaxySnail <me@glxys.nl>
In-Reply-To: <87cyatl8q3.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received: from localhost (Unknown [127.0.0.1])
	by mail.postale.io  with ESMTPSA id B9A404E8-8EB8-49D7-8565-CCE15A8B9C73.1
	envelope-from <me@glxys.nl>
	tls TLS_AES_128_GCM_SHA256 (authenticated bits=0);
	Tue, 24 Jun 2025 11:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=glxys.nl; s=s20221125375;
	h=from:subject:date:message-id:to:cc:mime-version;
	bh=OiyPzE5YteeFr9c/E1WyDFT3/gY3tdhgCQousmGSZ98=;
	b=gtTUdhzbZtoUCWsgQr0rTsfC0J+iMFAM3ihuu+nDiRW5Ea1zoZlgi93LXYZLJ+43MYrKe7H/+3
	kajSb/j7gbacJu7LMOHriT0yfiv85J7pdkpQSqH/DgaKtNlE33hBpOEONT+0KvSFDw2hJcaNOzWU
	k3X6OKeSV/F1m/RiF/x0U=

On 2025/6/24 18:44, Takashi Iwai wrote:
> On Tue, 24 Jun 2025 12:17:17 +0200,
> GalaxySnail wrote:
>>
>> add firmware information in the .modinfo section, so that userspace
>> tools can find out firmware required by cs35l41/cs35l56 kernel module
>>
>> Signed-off-by: GalaxySnail <me@glxys.nl>
> 
> Signed-off-by is a legal requirement, and it must be a known identity,
> no anonymity.  Could you resubmit with a proper name?

GalaxySnail is not an anonymous identity, it's the consistent name I
use for all my open-source contributions.

Here's my GitHub account: https://github.com/GalaxySnail
and here's my AUR account: https://aur.archlinux.org/account/GalaxySnail

> thanks,
> 
> Takashi

