Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA572701CC;
	Fri,  4 Jul 2025 07:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751613579; cv=none; b=BbXmpn4lZ4dX9mWjnAxmczZrdrKmsGdPVmq/+0RGWSEb3McaWJU8XAjQljV9x3J8VctM0Xt3WkUpWO1Z+kObQzMIAuFenlqajxDQJ2gAT9dpRIhb5gPsj2Gh1I8FYf4P4HHYRRQx9NDqHtajw+oTooblpZZQ6u25EuakGBx/5fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751613579; c=relaxed/simple;
	bh=UcHF3TjBqRux/88Tho98NKiNY0aNVil9tUeI0/ZZlA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaf7HRC9Ohx/mPqDvi23IkRr3byW/4x12B/5X6esJZ6UX6PvcJLNlqz76VVQJl8Gn7gJS2M0FhcNC/8vIkR+HXD7Ub1CYShl5tt48E8Z5aHmBsb18bc5ZlUEUR0iocy8BK3ulwbwTkQ9j6bq1gYL+ze+BESIinc9WEU+gLuEvoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: esmtpgz16t1751613527t9b4c4649
X-QQ-Originating-IP: sqjpDicPwX9V5zrS+U+79QAgeN+fW6ZtIOV9Dvj7kd8=
Received: from localhost ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 15:18:45 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14648494132943919214
EX-QQ-RecipientCnt: 13
Date: Fri, 4 Jul 2025 15:18:45 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
Message-ID: <958EB912F5B1E1BE+aGeAVcfUR_Uq_9Ct@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
 <20250703-primitive-puzzling-toucanet-2c4870@krzk-bin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250703-primitive-puzzling-toucanet-2c4870@krzk-bin>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: NOIkHYnr7VzdaQRd1sbAU/pNymJj5JEUd/zUTwVjjc9aq/fT5aKAUnJ/
	0blUPpdQY4daxVws1IwvifDyQCLnw2qLB9lJ5vHU10ZLqZ7d4S0+ksYIOLNpC5HZF2mafWw
	hk/fHbqIr8RQHJV2UHyurEZrGQTUl2lmVNl2mE6Ww7D1Wd8uoYODyb6ctHWGenFLik9ZEqz
	w+KsWTwcJvKqUewSqMssXdvAoLVyKkEO+g8/IpZK/YDf7y27jsHnXFnCbuAVjSxdcDq2OEe
	gfdYWZK1HFCXBOtJ2W299TAH0YN0lxFzmbpPM43iEivjyFHdJtWpcTaJ9UI+yuFHBTeVxSX
	0ga5mBTN+54CnFtolYuCz9S4R+7G/tgznlI8/LlnhAO8HR/ucg7BMGM8KFKwS6qFTPrb1yT
	5XNCjWa5oUD03TCx7KDj7TvXI3ixvntnnLrkWby6JYDSHlfpxQjHtIqiIesD0m81NVJbKpn
	Jeit1Z1zrRSVa60VRcwP8NhCwuevftmrl95GGZtvrEb2hqmONBxokoO2Te8cma+uzxgip7k
	2v5remsnN5MYTIAZAvuD6LVm0PSk90oDEpFGt61nfBEpGLgTnoXSw4ETQ5PHMIS+mxaIG/F
	vyQmW6B1p2z0L2RhlE5okMTuPiX3bAXp42PcEJ0gQMWLBwHxstoTt4XFBbAYnxWpzkxXDlJ
	fWndbbyFOEKGrKiAtM/QUEZDYonh/pp1EaGuSaFWQYL1xaOJJTiYxNHktpRB0UOZ6Xl7lIX
	BM6o4+yqxdboeZPZOyTff9EE/KR9eWgqSqf+1/YN2Mfgw8emX23ad4s53DvjMBNrTD1rbZW
	bzNEgNTbsnEXBXopmWhadbkEjwJOczQFIF1M7aZnyoATDY5b/3WQsn9uYOIHTQ9j0gt4/6U
	4rLq9tB9Y1f/OhiDB/n5jM2LnzJDSA9PxcxrSUuIM080GXPov6kPz3whQZ6Z9vifSrykA0f
	IMxb55vMijV7FYakTQpebiK6rwpxXrTtqOzQTJtAMCaRgQ3HYQ+t7IDXhfQs1w7PvWE7JN+
	F1+bZDHiYkQUGxD2piALtQpU2UlV9k1ed/DRo5DS45lVFbljMp8IEkwbpgKqe2Cg1CBUOtv
	w==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Thu, Jul 03, 2025 at 09:10:38AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jul 03, 2025 at 11:56:38AM +0800, Nick wrote:
> > From: Nick Li <nick.li@foursemi.com>
> > 
> > This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> > which can support both I2S and I2C interface.
> > 
> > Signed-off-by: Nick Li <nick.li@foursemi.com>
> > ---
> >  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > new file mode 100644
> > index 000000000..3a1aba9b8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> 
> Please run scripts/checkpatch.pl on the patches and fix reported
> warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
> patches and (probably) fix more warnings. Some warnings can be ignored,
> especially from --strict run, but the code here looks like it needs a
> fix. Feel free to get in touch if the warning is not clear.

OK, I will check the patches with option --strict, and fix the warnings/errors
in next version.

Thanks.

Best regards,
Nick

> 
> Best regards,
> Krzysztof
> 
> 
