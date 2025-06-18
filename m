Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF251A239D
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266623; cv=none; b=THInko5nbqVFliv80Tp0d6WWRzyiyoWWtRnEdn8eoGcT2CeQS2vx+djxEbJl8SYdgu34xK7iT3kiB7OLkrXr2P/jTlLAz3zFCmYwdPY13V5956wCiceEKW6lO6jgOoVvkauvk7fDvY1AipNvRcy9gDDgl6ZpOTMGyYWaN6x3N0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266623; c=relaxed/simple;
	bh=9rZfw0yC1mMKOdQSHhiqzJH4+9Y1RTlTe8k08k6VRpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tb6a3W/WOzY+Q2f2dlenDjyC+2yWjAWlMCFTiwOTPz/eIRnCoOd+M+OZZGxA/mkOeC/obP3J/9VPC1D5tbhCLfyxz7Q8E0NgYNEr0jgeSSx/WByp4awGR8Fyfi4P655nDLrkXftJIfurOQkFuRufu+S+SBwddXI6lxl/PEpLpcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eIpA8sdb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eIpA8sdb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2352400344aso70034815ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 10:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750266621; x=1750871421; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Xa1298jF35/sOdo+o9vBrTqwC2PJyB6+a8mwD4AE2o=;
        b=eIpA8sdby3yxvmswgedNh17o1oQJXGZZhJJO+JoD7kUrC5QkVeh4/6ExKe0prWxpn9
         croerYlMzTM5odLyvGq2omrjtUs7557d8+SdUBQdRw2B1twZCXcHXhGCpsdbUXbHcWSz
         HVdr78uIGyLTEtcDwHUUdAQpsl2zao9ybGtHM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266621; x=1750871421;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Xa1298jF35/sOdo+o9vBrTqwC2PJyB6+a8mwD4AE2o=;
        b=qdmhwpY/qfN6yuhhkd25pu4pj8ovDJHB5DUAH1CTP0nJVF8AVrWv4cwlrFkkThVnyq
         nylCqGym1R4PO5yUDuns04/6fCrf1aGfUtZcUlOerZdFcMUaG1b6vKPsnNqElHokTpb6
         TF/FXG+hofRPc+fZt20uudciA9iPLBzDhorCmRskV6NOEqQ8j8oShGnDZh2l5jMrkU7C
         mlsnF8KU0y1QhrjegSj+7Vm3hudYtH+cjM/wQlTbrjOBW0uqWR6kVVM5/JXZUIogYswb
         9pp2cmBZ1X4vA0rG3CJRwvOhxIsCkJGvlZZXpFehor1vwAdgvJf0E3KrQi/fwS1GWOl5
         gSfg==
X-Forwarded-Encrypted: i=1; AJvYcCVODJYjFGEuz/oPFO0phgeS7SWAaCKlzvALgwam/nxZoj4sBKg/X4Qhr7dsBPZURj9N0N+t+NdnaMArr+M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYukaULsOO5A9ftJx4gNJjWWQd7v7Q1v/GK07cuM72FodoKC5J
	3QkNREUFcsQv/3HnBApgwglPAs6E8Icq80UXB/qgvNhOILWjVcW5ZjPqFia6CX0+GQ==
X-Gm-Gg: ASbGncvm/Roo6A2EdcxCU3Fur3q3nk3XCmipVgSnOLU6NejII4ybjRlOIbjBVlUArws
	+n2r8feRs59gAe6JsOrZklcRH6mtAGmeeFUCxAZoDmghWWra1L64qm2dqdTEoNxEPVJLQGtug5z
	4Ti1nCgdrJvY5kgHOjkYAfJb8/hSKZnqWasskBcEevc5VtDs2c2vzRJeZ7rsO/SQsb8+Gku0Rp0
	xX7Mopv36kBzgtPhDM6GHZu4KL4SlNIIV+jL5SSeGiMpGurX7HWiXr15C7eujpfhmtWnHPN4+1+
	l/j963w78SLQPR0Ke8+V4FsN929MihcxFe1wfltdmSOtTCbVOPaqxGgeb1nSbWO0d/jxJ4AYone
	hWUBw45aFd/rJ3ONQHq1P2dyn
X-Google-Smtp-Source: AGHT+IFa8oC0c6uxCVyVidCsDPY/1MalYH5CgxGL6T3A7jk6DfXYzAwqepCxodCaF77auI3vwyhPTA==
X-Received: by 2002:a17:903:2ac7:b0:224:1af1:87f4 with SMTP id d9443c01a7336-2366afe7f87mr314071925ad.22.1750266617023;
        Wed, 18 Jun 2025 10:10:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:8f3f:43b2:851d:4290])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2365d8a19d7sm103032875ad.83.2025.06.18.10.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 10:10:16 -0700 (PDT)
Date: Wed, 18 Jun 2025 10:10:14 -0700
From: Brian Norris <briannorris@chromium.org>
To: Johan Hovold <johan@kernel.org>
Cc: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aFLy9lFYnhA918TO@google.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
 <CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com>
 <aEnUHv8xMTDYgps9@google.com>
 <aEsfJj35W7HQlTOH@google.com>
 <aFKSLblsjXoMxK2W@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFKSLblsjXoMxK2W@hovoldconsulting.com>

On Wed, Jun 18, 2025 at 12:17:17PM +0200, Johan Hovold wrote:
> On Thu, Jun 12, 2025 at 11:40:38AM -0700, Brian Norris wrote:
> > For the record, I was reminded that DWC/pcie-qcom does not, in fact,
> > support irq_chip::irq_set_affinity(), which could perhaps be a unique
> > factor in his systems' behavior.
> 
> No, we use the GIC ITS for the NVMe interrupts on X1E so that should
> not be involved here.

Huh, interesting callout. I had looked at trying that previously on
another DWC-based platform, for the same reasons noted in that
switchover.

Anyway, all I can tell you is that Alex's logs clearly showed:

  set affinity failed(-22)

for what looked like the NVMe interrupts during CPU unplug / migration.

Brian
