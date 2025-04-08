Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8011C6B4;
	Tue,  8 Apr 2025 03:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084374; cv=none; b=p+Isr7kyYn0SzWRPsMdKqS+M2e1uroluPvaTPU87IoxGgUYlIR7OTBxYjoig1f3/nsd4llbnGiaNMlA+rDKJbUseEHUFZeJQYWzacWVm3U9XGZFsucSf/cVKMxXhP1AXH2QJv4liwzSHdam6tzr+Q+cbfQPFrjhrW2igi6JY0Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084374; c=relaxed/simple;
	bh=8IfM+I8emg8N3PNTp4ggTZrlRW4Na7phGokNQ6MLBq8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utCFOluqT+8QDDaSUV29+lYLXwTKLWpxr0hmi2siTsITDe58MXRCSgR37PMaX2rOAE7lVNg8VzA0tFUqxUodw5SWb/gOWQgEOvBJ86+zkue35eRmZXMd4O487r6YIBNQ0CEBw7bqtwgpB8fJDeCkU5lD3O4EoZzJlAWs2f34H+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=emvRTtUv; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="emvRTtUv"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1744084363;
	bh=wKOj8pk/+CdFokUBmpTIMsQBLj3hnpGnGC53w55JnGo=; l=1262;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=emvRTtUvjKeJ3lf9/PLnKaVGPE0VfNidpJT96dRHPjbpG1GGjQdaLhF2G3qS6Cohb
	 6qghS4grWh/NI5YvvDtcG44JSzKLVOO0KTGkd0WGivp5MD/eUCSx2WMp6Koq27fQbJ
	 5aswcy1l08rdIpR6/owFJvNIEBeKzGViHiQI3zH053ZRki2jfc0RqdEJRfx86WCbtz
	 aDpV0ORkdIXRzK4DH+mTFLViZRjcdETdobgUONRS+1c/rnM6VupIxxCTp5MM4nZEzX
	 KhHGFd4RmJnVyOO9xLVoLBZT7TiuB6kBQPc6Gm/wQK0u7fMAlEBhiuYj2K9Fkw0EWb
	 4Wd7EQtQn/2fg==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2132232:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Tue, 08 Apr 2025 11:52:13 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 8 Apr
 2025 11:52:13 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Tue, 8 Apr 2025 11:52:13 +0800
Date: Tue, 8 Apr 2025 11:53:34 +0800
From: ChiYuan Huang <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Liam Girdwood
	<lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
	<tiwai@suse.com>, Otto lin <otto_lin@richtek.com>, Allen Lin
	<allen_lin@richtek.com>, <devicetree@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] ASoC: codecs: Add support for Richtek rt9123
Message-ID: <Z/SdvomJQKwqte97@git-send.richtek.com>
References: <cover.1743774849.git.cy_huang@richtek.com>
 <cff65757c4665a81397ef5f559b277f96d4236c3.1743774849.git.cy_huang@richtek.com>
 <4e966f68-527e-4e2c-9043-0795ff094031@sirena.org.uk>
 <Z/Mf1VQ1Ay/Fw3kh@git-send.richtek.com>
 <17e8e4a6-135f-46b4-89d8-3ea0d3bf6e76@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <17e8e4a6-135f-46b4-89d8-3ea0d3bf6e76@sirena.org.uk>

On Mon, Apr 07, 2025 at 01:34:29PM +0100, Mark Brown wrote:
> On Mon, Apr 07, 2025 at 08:44:05AM +0800, ChiYuan Huang wrote:
> > On Fri, Apr 04, 2025 at 04:03:57PM +0100, Mark Brown wrote:
> 
> > > What's going on with the runtime PM stuff here?  Especially for the DAPM
> > > widget usually the ASoC core will be able to keep devices runtime PM
> > > enabled so long as they are in use so I'd expect this not to have any
> > > impact.  Why not just use a normal DAPM widget?
> 
> > That's because The RG 0x01 'RT9123_REG_AMPCTRL' is mixed with other volatile
> > status bitfield like as 'SW_RST', 'SYS_STATE'. That's why I use pm_runtime to
> > make sure the RG can really be accessed at that time. Actually, the
> > mixed RG bitfield  for 'RW' and 'RO' is a bad design.
> 
> You need some comments explaining what's going on here.  If the volatile
> fields are read only shouldn't you be OK, so long as the register is not
> cached you should be able to do a read modify write fine?  Unless the
> status bits are clear on read.

Okay, I'll left some comments to make it more clear for why special handling.
And yes, Since this register cannot be cached, to use pm_runtime can guarantee
the read modify write fine.

Is my understanding correct?
