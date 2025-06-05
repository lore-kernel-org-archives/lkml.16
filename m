Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1BAC8462
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105261; cv=none; b=cNhnbnIfXXfLUI+0oOJxKn6a4SV6GdFZvSo0bbk+LHxI/AHfhfzrQ/aIwhs2iqCpsjpWVAYLOrVLZJX1dT16b3Jog5sf0X8iCMbX7ZFIrNCHmhk54i79zJjQ+QzlSj+vpe9KyYJgYXTWzPiEP58u4bQ3pvKOMXCKdQKIVt/0r/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105261; c=relaxed/simple;
	bh=WBKeGzxGzzd9x0XUdV5HWMXtxw3JKDGOjRT4f4tNWF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lb8jrklgwPv7agF40/4GgKWKq+a0yZ/xjVclSCrG0Z5NOfoZ5vj8nu3WjCdoGH1VgDMrfCNKVXo+ApYvSYcX2bfYGSbRUpE6NCGTq9VvaQzlEDzwIMt3cFHud5j8bPV7E1WSabUsW3LWzr5+zDB2cVns8I/Tu17kqeCW3HtA8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=lpham7mT; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="lpham7mT"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5532a30ac41so681348e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 23:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749105258; x=1749710058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FSYAF2WstzvPvCo4AlPKEcAwzeUBhl4r57KbdFFm/JE=;
        b=lpham7mTESZl4ymp/NNBT2cDgtWiRaAzbJFkYJNvAOewq9680IxZM50qiej5AXg9SB
         FuGm1mq2cBZd6Q+8FmsefN+ZpdmznhQfVXJGPPgCDL2QQ3J+JPD6QH68vrnPvqSDHYJz
         qFGcqL7pnNkt+W+iOf8r3Vw2ARMUrj8d6NGO6YCxwCtOe0isA7x2ekwAKbKbdHPwFssl
         UKIOrvLfVu4Y5uPCUy3VQhkGhCPcf/Xr8F4bQURwZw5IGLJjWh3Cs/R6bJhHygYogMV3
         EaWdF4/jPOoAZlKxwvYIQ72FelITw+Z+f3yO0QQtC+J9W8+VE9KWYgfhAGmMOSMIHg7Q
         4yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749105258; x=1749710058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSYAF2WstzvPvCo4AlPKEcAwzeUBhl4r57KbdFFm/JE=;
        b=WljD7JsO42kcZvtttWWDJDW7mfUQGE8QPFIFZ/qYMbk0tZI91K4cDg4wynh7JCiiqE
         vPhLVNMJI1ZUvGlOtapa2psVeBeM3a5UK4xjn4emxqnD7kvSvqc1dqO9AhkOxe5QBgrK
         diksq1MLRTRgGszOeetU2bV6JfD6uRvtguW0jligfRrCeUn3TEbkz+4DVJ8+btwW0idE
         OcpMSwqATcqaikWIH0r1T75lbUPzQJS/uIEB3fEj+AQSX1/L0WNeiF5ZPFDA+JBX7hBK
         ucubxpGe3CzZ0zuQ5iLr6Wr1t8kh6KLlSOVffMUZOR0AGFplC5Wr6+c+rYVtpSl7Jwvc
         yoUA==
X-Forwarded-Encrypted: i=1; AJvYcCWfwC1Y3Zb9niFMFw6QwiLC9wBvlG9EcCaPV0wzlrRde8frhry6umLqLUgXJ0l8w6Tm4BJt+80C6BIXsHk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5BToIy1YYO2L/L9DRbkQBWfw7Tjm2u7PO8YYb1bk8UfhdWXbd
	fXCBPj1GILgf+sVyPf7e/RxkL6ActrdpGqTGPOUe5Axad/hz9dQVTz9iQH3aAvBjqXI=
X-Gm-Gg: ASbGncsGj/MZF1w+tHAa+8y3sFBnSlaSBMLtdI+3dfyqJY4ZM8qauhXnCJ+5Onhl/e0
	sWrhuCJOhkJMPYgV9IU0fvdfDXT+eNIcGCj3BaOeisHeAgpelwHyLw5YKkoMrgbbN0y1cveJJB2
	KqhLiXkWlB3A/WyKn9G0m43oRr5MUe43uajH48GsraL7CMY/blQ2qmsmjhT2ZR5ICXffo2qSheE
	VVk00lYspEJ/CBBhhR00ziuTFBmMndvZCEbVucQBO1ekhRpzHO4kFwdpQ6lawvJYX15U9SEXzWw
	hGJk8KsQ158eTn7IYq2cptdBUpcaI2nEU7Nny60/iYYcaMly51oGrNumeovgncejviwDhXvdKb2
	Kq73P9DbTf2JIx5oClRl6wGM6j4lee1U1XEZK9qDshEaC
X-Google-Smtp-Source: AGHT+IEeoLpgJuAlO/Hd+Yo0ndJOTyX+6xSjbYLZNp63nindH9o3ENze5fCiwM3W+rGkVaSW9Rgplw==
X-Received: by 2002:ac2:4c4d:0:b0:54b:117b:b54b with SMTP id 2adb3069b0e04-55357bd6e59mr1492888e87.54.1749105257542;
        Wed, 04 Jun 2025 23:34:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553510f7402sm1025889e87.185.2025.06.04.23.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:34:17 -0700 (PDT)
Date: Thu, 5 Jun 2025 09:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, David Collins <david.collins@oss.qualcomm.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	kernel@oss.qualcomm.com, devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 2/8] power: supply: core: Add state_of_health power
 supply property
Message-ID: <3ldf7w5cpv4wt63kvewl2a32abx4uohvir7zgefpqly5rytkcn@p5fslnvpnjn3>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-2-9e377193a656@oss.qualcomm.com>
 <6oixvnhihgjucqaovkayzm6cpi35jfmtwmm67wa6h4nlmhr6w5@ggb7auvjzos2>
 <cd2964b0-e28e-4ddb-b319-9b65fb78b73c@oss.qualcomm.com>
 <p5nxjuexggzxttislcaum7vomawnq5fncos7itfib6ysvy6a4k@d5ywmfpqyk3s>
 <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <994cb636-50b3-40f8-baaf-0b1afa2e7f53@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 02:08:30PM +0800, Fenglin Wu wrote:
> 
> On 6/3/2025 6:35 PM, Dmitry Baryshkov wrote:
> > > > > +What:		/sys/class/power_supply/<supply_name>/state_of_health
> > > > > +Date:		May 2025
> > > > > +Contact:	linux-arm-msm@vger.kernel.org
> > > > > +Description:
> > > > > +		Reports battery power supply state of health in percentage.
> > > > > +
> > > > > +		Access: Read
> > > > > +
> > > > > +		Valid values: 0 - 100 (percent)
> > > > What does it mean that battery has 77% of health?
> > > I will update this to explain it better:
> > > 
> > > Reports battery power supply state of health in percentage, indicating that the maximum charge capacity has degraded to that percentage of its original designed capacity.
> > Which basically means that we don't need it in the first place, as we
> > can read capacity_full and capacity_full_design (or energy_full /
> > energy_full_design) and divide one onto another.
> 
> Hmm, it is true in general to quantify how the battery performance has
> degraded over time. However, estimating and calculating for battery state of
> health is much more complicated I think. I am not an expert, but as far as I
> know, different battery management systems might have different algorithms
> to calculate the battery health and report it in as percentage. For example,
> in Qcom battery management firmware, a "soh" parameter is provided as the
> battery health percentage based on the real-time calculations from learning
> capacity, resistance estimation, etc.

Ack, this is more than just full / full_design. Please consider
expanding ABI description (though in the vendor-neutral way).

-- 
With best wishes
Dmitry
