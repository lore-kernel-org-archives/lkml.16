Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF22213E6C
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 14:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738680964; cv=none; b=DYbOJRkrjlhhbLtIA85daV0K8MF1cVJRmNPmmijfGIY9QWyPrcshBuoJWV17NLsgwivIsHIOv5amaylMA63RcpU+hYRXfDDiHh+HKB1XMIA8NLodmOPlL2elIBwLSlTvkcNwzwRmWrfMgXigrns/mpIUowae39CFicHMJqjg5Q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738680964; c=relaxed/simple;
	bh=lWvcI4IKTyPX4KIFdrSOQ8l7JXem3VyelhrhHrg5wJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P1k2EcbJxEFzZqaJ+6UMQvdaw3f8DJegjh2MepyjoY4o8ydwa6n2WRKYJHgAcPR6sM7Esn07/GY6q6vBh3GpAsxPbjzorVVbM/oh+SJjmFJGuMKWopD9pLSv69i9FFmAOVcsHFrotmOrUhMffTibxmOmIDd7RfG5/DGuQAOyldw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yQj9tSQe; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yQj9tSQe"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-305d840926fso45159601fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 06:56:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738680960; x=1739285760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tcI59/ylMaOiA+KOTHyk8glFFCxU7tJyRlX4HuzUP7k=;
        b=yQj9tSQeUwwNnijjIqsJOMBVcAeLuFpc7KuwBFcgA3XjgusL9zze2eSxM3VCv2O9e+
         wKYhospKdAH3C9JFt+/CiRNf2J7rZGh886W1iNrBqGX70GTCOCeeS6I5uJT/AexvoMrQ
         0vDby+UClLa/m9NrCGlMbK5AKuD6yH5wz1MXOlEjnlezHuP8cY7otDxRHJUJbGA84rli
         iElcHkvVRmQithJRiPnsHURGD4Mad5pbpszzvWmyr73Jrl572qAo7WeQt1jPSWUb+sDi
         YMK1rk9LLUEtcYFC7TMkDf2qPeDIWOJDn/V2P/T3VBdrtx8kUuurelukgKMBkENFfcRF
         rZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738680960; x=1739285760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tcI59/ylMaOiA+KOTHyk8glFFCxU7tJyRlX4HuzUP7k=;
        b=XOvLJSoOnRkDoD48JGvyPYRNT1USQuucEEykjcm3xGjHH+oBBPUAI99akdgYq9XXKc
         8qZsRQoLcWF4egbbOu26r+VwTq2dt/UFmQZezY3brv4m1hsSH+1icEgcB7IX2GAwUMvi
         APYeu6QCCTzxF+yyZI8/P9v7lhA0xX0QPVlOoK6bh+ElRpBViJtZ1cxHRswT58vhtqy/
         4bCbkfOjdq6abqU9uMQBF0tzWM4mfvzvAAs1QFRnQQ8kWiyzrE9pRYDhDkITpUXqK/pq
         VuLgrMIwGmxR1HbQP9utdcaBkPGSmwMLUyAVSfISG7U01A+GIIXjS8z/BDK/Znd3i9If
         IcwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWR6ScFPBLVYurd+Ozth5vBCBJhhQ8srHLpGf7fJdDmKCtjKczFht5k0U1ouX9rgivpO0WvyMENtPv2a1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YykXfZP9RI38U5WtSpq0DGg/nqUt5VESH2M75HaiKu2diN1cHeq
	lvmNmLimhF5evjLhY2lTGyw8DEuaKox+tuUC+uDxW0jFYEwW1HOX4CIlGeDdFbw=
X-Gm-Gg: ASbGncsroSe7tEoNJ7eZuLGH35uh8rbTqqasbh9vrS78qzfZpODFetveYPXvvVUsHDj
	yhhO1NwfZF8sO2/OIkqMYivvfI5LQ1HsnQflrnMC4vO/77rFBxC+QVe3upRnifrU00dPyS2yksx
	RdPtrrX06PPj5OT6x4LySH9pJDCN5StA8tQz26iL9HjztAgAilIKyj4FUwXPvHTVmoLMoI+nbqH
	36M3i+y4J/rOB3PKGQfTvt8qiOjjkyptOK2immzOvey6ORixh8bYNHDnRFiegApARAYQ9R8uMcI
	QCYOXK51N96NfXRG9L6MgFNDxfxwX0GXhyBLKI4q97AMvM0hRujzsvykPIivksNVcqnd2XA=
X-Google-Smtp-Source: AGHT+IGzPs7wNbZHM4FrmAdMgv39U640+yjgkHLCeM46hTUawFjOD9hlvC8o3kXWlsf/6aExtNEdWw==
X-Received: by 2002:a05:651c:1608:b0:302:4130:e19c with SMTP id 38308e7fff4ca-307968eeaebmr94921821fa.19.1738680960096;
        Tue, 04 Feb 2025 06:56:00 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a3069cf1sm18364311fa.3.2025.02.04.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 06:55:59 -0800 (PST)
Date: Tue, 4 Feb 2025 16:55:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Johan Hovold <johan@kernel.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Dikshita Agarwal <quic_dikshita@quicinc.com>, 
	quic_vgarodia@quicinc.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	p.zabel@pengutronix.de, hverkuil@xs4all.nl, sebastian.fricke@collabora.com, 
	bryan.odonoghue@linaro.org, neil.armstrong@linaro.org, nicolas@ndufresne.ca, 
	u.kleine-koenig@baylibre.com, stefan.schmidt@linaro.org, lujianhua000@gmail.com, 
	linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org
Subject: Re: [RFC PATCH v10 1/2] media: iris: introduce helper module to
 select video driver
Message-ID: <hpcf7olw3ody7ns4ibdeoc5qrkmh3fgeqbhjd4eqwfuanevzoa@plenabtrjqi5>
References: <20250128080429.3911091-1-quic_dikshita@quicinc.com>
 <20250128080429.3911091-2-quic_dikshita@quicinc.com>
 <5070e1f1-914b-4654-88ef-3566e3eee9ca@kernel.org>
 <f1344e49-61b6-4115-ae88-55b4a3cfed28@quicinc.com>
 <Z6B822-6UTxQfX46@hovoldconsulting.com>
 <tqbm672pi223ipcw7btiemlb745weeeiy4gnazzeghozhq2emj@wppbkms6hir5>
 <Z6HehbKL88LW1lxC@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6HehbKL88LW1lxC@hovoldconsulting.com>

On Tue, Feb 04, 2025 at 10:31:49AM +0100, Johan Hovold wrote:
> On Mon, Feb 03, 2025 at 05:16:50PM +0200, Dmitry Baryshkov wrote:
> > On Mon, Feb 03, 2025 at 09:22:51AM +0100, Johan Hovold wrote:
> > > On Fri, Jan 31, 2025 at 10:44:28AM -0800, Abhinav Kumar wrote:
> 
> > > > Solution: If the user prefers iris driver and iris driver has not probed 
> > > > yet, and if venus tries to probe ahead of iris we keep -EDEFERing till 
> > > > iris probes and succeeds. Vice-versa when the preference is venus as well.
> > > 
> > > This sounds wrong too.
> > > 
> > > Look, first you guys need to explain *why* you want to have two drivers
> > > for the same hardware (not just to me, in the commit message and cover
> > > letter).
> > >
> > > That's something that really should never be the case and would need to
> > > be motivated properly.
> > 
> > I think it has been written several time (not sure about this commit):
> > to provide a way for a migration path _while_ people are working on Iris
> > features. Being able to A/B test Venus and Iris drivers and to report
> > possible regressions or lack of those on the common platforms supported
> > by those (sm8250 at this moment).
> 
> You don't need a module parameter for that.
> 
> And we're still waiting to hear the answers to all of Hans' questions. I
> still haven't seen anyone explaining why any of this is needed. You
> could have just continued letting Venus support 8250 so presumably there
> is some benefit in using Iris instead. Which? And is that potential
> benefit important enough to not just wait until Iris is up to par
> feature wise?

Because that's exactly opposite of what Iris developers are trying to
do: SM8250 and SM8550 belong to two different generations of the FW
interface. By supporting both of them in the Iris driver the developers
can verify that the internal driver abstractions are good enough. It has
been discussed in one of the threads (or in telcos) related to the first
iterations of this driver. We definitely don't want to end up in Venus
situation, where the abstractions were added afterwards and in some
cases they are not the best ones.

The plan is to use sm8250 as a "bridge" between two drivers, verifying
that they are on par during development, then drop sm8250 from Venus
driver. Then move sc7280 support too, drop all HFD_VERSION_6XX support
from Venus, cleanup the remnants.

I think most of that information should have been a part of the main
Iris series. If it is not, please comment there, so that those commit
messages can be updated.

> 
> I'm sure you have some answers, but you need to provide them as part of
> the series.
> 
> > > Second, if the reasons for keeping both drivers are deemed justifiable,
> > > you need to come up with mechanism for only binding one of them.
> > > 
> > > I already told you that module parameters is not the way to go here (and
> > > the msm drm driver's abuse of module parameters is not a good precedent
> > > here).
> > > 
> > > If this is a transitional thing (which it must be), then just add a
> > > Kconfig symbol to determine which driver should probe. That's good
> > > enough for evaluating whatever needs to be evaluated, and doesn't
> > > depend on adding anti-patterns like module parameters (and helper
> > > modules for them).
> > 
> > No, Kconfig complicates A/B testing. What you usually want to do is to
> > boot a kernel, then go over a bunch of files testing that they work with
> > both drivers. Kconfig implies booting abother kernel, etc.
> 
> No, I'm pretty sure you'd even want to reboot in between so as not to
> rely on state left behind by the other driver.

As a quick test I'd definitely do not want to reboot. Both drivers
completely shut down the firmware running on the core, so there is no
intermediate state left between driver probes.

> Unbinding and rebinding drivers is not part of any normal work flow
> expect possibly during development. And a developer can easily compare
> Venus and Iris for 8250 without a module parameter too.

Yes, we are talking about development. And yes, modparam helps. If you'd
like to do two separate kernel builds, that's fine.

-- 
With best wishes
Dmitry
