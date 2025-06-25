Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D897429CB40;
	Wed, 25 Jun 2025 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845657; cv=none; b=Hs5gUeuWRZSZSHum1fDLE5znraU20YZ9D/Nm0RvG9vq5lXaI7ZBFAg5R5HE0rQH/GXT+Qg/WOCCGM+tcQYOqqRX/J30g8tMNjoSxJhaLueUj/B6nIrFvB5aUfstk6J6SSstsXxTR9PpAMc825W6lo9vUV8MK8OdeFDMSto1EDB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845657; c=relaxed/simple;
	bh=fR7aDb7e5eqlZtRdw/XMe7qKK2WE5nIpTj71W7BuQas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gR2GiEZEChJGcwYgg6IpFp5HZnZBMZZyzFlo8Ntrwwe5FUaCFaGiyitpmyU+pp9TSwa8ubTzbRJtj2ttC3ov6UFicU6Pm/DAk1z2virVFEhF/ayLHL9O64m6CGNeLf1XYLHwnR1Yg8LsrKCZoedXcKF0HUSMSEHBEVdOT6SVRFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XC2Gys5o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XC2Gys5o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BFCC4CEEA;
	Wed, 25 Jun 2025 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750845656;
	bh=fR7aDb7e5eqlZtRdw/XMe7qKK2WE5nIpTj71W7BuQas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XC2Gys5o+Cst1E4qPOsf7WEww25uNb9/xiC19FfMZZU9C9lDpAm9P7DTw7TTYQKcx
	 YIyf6TEz/1Q+2oM/36j46GA4tlfN8Zx1136/oX4LOMdcrvcpaszHdZjfChP31likJw
	 2Ou1kiKH/VwpTxmjAi2c0fYfnkK9vTeRoBFerPo+QbfMY0G3T150/ObPdj01Ti3NXA
	 GznPlj31MlbAeevOhYWvp3SNhKVizxqU4/15YR/x/EBwc82m/42a6J85dXJLCqv/7D
	 9TXt4Q7sBTFwKAYvnndZ2WgHk080iHyuJw62O5GsKYKsTV6/hTyRbKQ8cx9XnAXOa2
	 GZfdCc7fnZZ/A==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1uUMw3-000000000tU-2igY;
	Wed, 25 Jun 2025 12:00:55 +0200
Date: Wed, 25 Jun 2025 12:00:55 +0200
From: Johan Hovold <johan@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, laurentiu.tudor1@dell.com,
	abel.vesa@linaro.org, bryan.odonoghue@linaro.org,
	jens.glathe@oldschoolsolutions.biz
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: x1e80100-pmics: Disable pm8010
 by default
Message-ID: <aFvI114Bbw9Vw7Bj@hovoldconsulting.com>
References: <20250624225056.1056974-1-alex.vinarskis@gmail.com>
 <20250624225056.1056974-2-alex.vinarskis@gmail.com>
 <aFuq2JFZZhC1r3N4@hovoldconsulting.com>
 <CAMcHhXotN7mWwUkAAX8J6d4Yo8xSLV=_=DDJJ5Nhh=Cy98_JNg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXotN7mWwUkAAX8J6d4Yo8xSLV=_=DDJJ5Nhh=Cy98_JNg@mail.gmail.com>

On Wed, Jun 25, 2025 at 11:49:08AM +0200, Aleksandrs Vinarskis wrote:
> On Wed, 25 Jun 2025 at 09:52, Johan Hovold <johan@kernel.org> wrote:
> >
> > On Wed, Jun 25, 2025 at 12:41:20AM +0200, Aleksandrs Vinarskis wrote:
> > > pm8010 is a camera specific PMIC, and may not be present on some
> > > devices. These may instead use a dedicated vreg for this purpose (Dell
> > > XPS 9345, Dell Inspiron..) or use USB webcam instead of a MIPI one
> > > alltogether (Lenovo Thinbook 16, Lenovo Yoga..).
> > >
> > > Disable pm8010 by default, let platforms that actually have one onboard
> > > enable it instead.
> > >
> > > This fixes dmesg errors of PMIC failing to probe, and on Dell XPS 9345
> > > fixes the issue of power button not working as power off/suspend (only
> > > long press cuts the power).
> > >
> > > Fixes: 2559e61e7ef4 ("arm64: dts: qcom: x1e80100-pmics: Add the missing PMICs")

> > Not sure how this breaks the power button on the XPS, but sounds like
> > this one should be marked for stable backport:
> 
> I suspect it's because the power button "pmic_pwrkey" is coming from
> one of the PMICs (..spmi-0/...pmic@0). As pm8010 is on the same spmi
> bus, it appears failing to probe breaks communication on the entire
> bus? pm8010 is the last one in the list, so it could be that other
> PMICs were already initialized to correct voltage, that would explain
> why everything else still works. Just a theory though.

Ouch, would be good to confirm that for the future, but definitely
sounds like a fix we should backport in any case.

Johan
