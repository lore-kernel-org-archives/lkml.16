Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0515F1DAC92
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751394111; cv=none; b=gdaUnh3ghGZg+/bJdyoKyzdp31ln8BAOvMAdnrF19xSZ8lFDE14JkXKGpOmVKLl4EV6J6eXAOMq5kfggH/TI9ZqmOJHHwOFeQ3077RvGIuSaW9KNecGlmUDfHtLKvTtgSuEwyItijNzM7oko7ZC4ymlWdMt/EDYMMJzKlRP67+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751394111; c=relaxed/simple;
	bh=/0iJBVR02jp37VuAafJ7AuWu4zYV4ay0z9SBj/41vLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTsL9A4dOLkiy55QBduJlN1xLPt+iuIZVrGPfqQSEoGiA0gevnEEeSdkScsqItsyr+zkF3vRaMK6azUab49zRwiAguJatkI0nXcgyUdKAOso9OxfISYL8lOBRGjRfI3VE/JSO/IC9d4QkNTBUNxYztHC6HO4mrh4OaJRbZ8xRUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mE9+G5p1; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mE9+G5p1"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-74b27c1481bso1713651b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751394109; x=1751998909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5QHb5QMnCyf1ixMGPEq1YYVlFE4mdK/TuEdnUZ7pL8k=;
        b=mE9+G5p1V3qKpkKKo/MkHwQmLdwW5CbUu0EwpgarGgURXhTUBGiQ7QTNW4a6AkfFdl
         /zsaLq+aG1182QuFEAVOCVgpVKfq1g/yDce2HlfZ+CQT/0CxGtvEh+HbPTSxxWFY2vyy
         OO8hWkOUxKBp0pfsKYn0IQF6ZKFLcHHSGPx8XkC2qgFT95Ty4ZgkLEnyj1tOAliCIJDm
         yGWa7PHiLnD4jT1zohGoIuvCFs6SbwPR5k+YYfAeo8yetwxG4Zy59JoZkadLteOT1bO8
         NiToHN77IVQu+P2wz/MQCVCdB6I41lN3CPTniQbZuZ4nvay42Ml5HseMb77R4ZyoatkB
         AZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751394109; x=1751998909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5QHb5QMnCyf1ixMGPEq1YYVlFE4mdK/TuEdnUZ7pL8k=;
        b=duf01WCFMQA5+s8cTtD9+eQOaW9z1yPqvydGFIgdSqpBHxSWtHtaB5VpKgszsjQ3Cg
         bL3069RiLLkJIZUFLQ0jOuq6v+TIfHJhCIXwsVNYPX2Yb6d5T7szaOo2EGx7SXC8ukl/
         aqdwozqbtsAzAkVt84sPOLOvXZKjZ+lGjj4/q9O35gGlVtTTqEsOrAsmP4le1XgkES0b
         fOlylq1kn7RFkK99yjBOIqyHxZ2lRvFGjR9KOYPwxXY7Mb/djq8nJJ+WhMMeWv1HxwPE
         qvzAN3dm3dEyDd8h52OeveFPdH+M/Fulnj9xh8ynOzF0bvCY79ffrqvNWygGjVbm1Eqq
         2eLw==
X-Forwarded-Encrypted: i=1; AJvYcCX2v8jNlIuCYBzOLybCqy7iw7PgbxmImgByYmHpfHtplhD8rO7DurkgMFwJbZAe2zrb0gfv25BvJbnLb98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJphlSuQSso/VlEV7ehxQrXaB+xMsu11oh2Um0ai6D6X2mZsZp
	vtMWcCUBIP2kgWCHgAlaw4z8NHXpWecS1K+SvtJ/iXPObvtEvwi/UVIFuPzycf7cnA==
X-Gm-Gg: ASbGncuBjC9FBbIvV6340/GVfDn+HLL7bfnbCZhSSkfLnHlephY7pCLIEgUw/Ndqcte
	9BtTk3q9UBMRIQQifMQlQsmTToaZH9zBm0R/lOISzZ5bINV/0dqwJ/hsLBBOiYv84gHVIjxG/PK
	9xi4rzq8sxMeCOFjVUZOdgFMgtvrGk9zB3z71cOSnQ/1fLzu9nUH4jr1aN1o4qrnX0jnIO92wPi
	CFiGDoY5achfu/3JUny7m/P48Y5gTbKg06MCHNUPf5+LqA9+6i+l+QhwqdhbSTo5GWHYNs75jEr
	QxI+wEK2iXCUf7wLriabKYtaEU11R7DhOKooFvmX1CMSyBma36Hr0gdk2PqR4cPZP7V7JAxJ6gP
	9nBV9CAdjbzcJNUMaTV68Ih70xYY=
X-Google-Smtp-Source: AGHT+IFT0hH3Zk3DfXjOeWqqGBpHUpAxwE5lOf7WjFh0UeT7y+ZsuOyfA7fRcSglkCBF0+s+7klyww==
X-Received: by 2002:a05:6a00:464f:b0:740:b394:3ebd with SMTP id d2e1a72fcca58-74af6e791dfmr26589635b3a.7.1751394108946;
        Tue, 01 Jul 2025 11:21:48 -0700 (PDT)
Received: from google.com (96.41.145.34.bc.googleusercontent.com. [34.145.41.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af557460fsm13133161b3a.93.2025.07.01.11.21.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 11:21:48 -0700 (PDT)
Date: Tue, 1 Jul 2025 11:21:44 -0700
From: William McVicker <willmcvicker@google.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lorenzo.pieralisi@linaro.org>,
	Hans de Goede <hansg@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC] timer: of: Create a platform_device before the
 framework is initialized
Message-ID: <aGQnOMDyBckks78k@google.com>
References: <20250625085715.889837-1-daniel.lezcano@linaro.org>
 <aGMjfxIvbCkyR5rw@google.com>
 <27644998-b089-44ae-ae5f-95f4d7cbe756@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27644998-b089-44ae-ae5f-95f4d7cbe756@app.fastmail.com>

On 07/01/2025, Arnd Bergmann wrote:
> On Tue, Jul 1, 2025, at 01:53, William McVicker wrote:
> >> @@ -1550,6 +1553,8 @@ typedef void (*of_init_fn_1)(struct device_node *);
> >>  		_OF_DECLARE(table, name, compat, fn, of_init_fn_1_ret)
> >>  #define OF_DECLARE_2(table, name, compat, fn) \
> >>  		_OF_DECLARE(table, name, compat, fn, of_init_fn_2)
> >> +#define OF_DECLARE_PDEV(table, name, compat, fn) \
> >> +		_OF_DECLARE(table, name, compat, fn, of_init_fn_pdev)
> >
> > To support auto-module loading you'll need to also define the
> > MODULE_DEVICE_TABLE() as part of TIMER_OF_DECLARE_PDEV().
> >
> > I haven't tested the patch yet, but aside from my comment above it LGTM.
> 
> The patch doesn't actually have a module_platform_driver_probe()
> yet either, so loading the module wouldn't actually do anything.

Probing with TIMER_OF_DECLARE() just consists of running the match table's data
function pointer. So that is covered by Daniel's patch AFAICT. However, it's
not clear if this implementation allows you to load the kernel module after the
device boots? For example, will the Exynos MCT timer probe if I load the
exynos_mct driver after the device boots? My guess is you'd need to register
the device as a platform device with a dedicated probe function to handle that.

--Will

<snip>
