Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0392620127D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 19:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749668898; cv=none; b=fsL5DLHE9Ql2Zc628Oi05/ZdAWvtHXKd2kqI6BMzIJqZ8XOz2joSiQCXuZn/uMAcCZFsbXWiqHLSEDsdG4M1/lZK5RX6o9eMkfzylB30KMu3+arEs+xYVyBFfF5gBqwbYZpl8rumGjs2yfwKlAOHKCrkVqHwEBViHAPPLNZx6Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749668898; c=relaxed/simple;
	bh=Qb+rw+/+v6vkARv8Ptja+GP0pY6S9kxgJsfkBLogMiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kE7xyPX9mTlZWkPGJs1dCH/2fb0jt0dbx/eKKPwRCQkMw5k9KlueLx0nggwhvvnSFiryc9b1BY+UDBNt0uhYDhkpeZJPXfNYLSAAtSMMj3kPrlgFleRJRq4LM+c3GHwo81kTr6vFconHiot0L6BkHvC9bD6L64KcovV0wc+nUms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f2c/JIY1; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f2c/JIY1"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235e1d4cba0so1557655ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749668896; x=1750273696; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d5WV78r9hsFDa0FOY/UalZ2/FYtYwT6NjQmp0SNoQZk=;
        b=f2c/JIY1bUKRNFZhWb23QqqnxPQsexIZYsD/t4In9f3109cbn1JifIwZNxAjrB0eyI
         maiiCbpWyBwHe6U268zUMuXNeScAh/HQAsrp3LcBmvSHAQ9eGCaltgBTM7//Nf1B3vA2
         U7KPkUWAboFVLav+9Ajp80F4vWnwyvIcOqFfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668896; x=1750273696;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d5WV78r9hsFDa0FOY/UalZ2/FYtYwT6NjQmp0SNoQZk=;
        b=u1NaNutIldk9Ojf8vXmXwFd3VZZoqnp9Yk9rvyyZoyJjAdXF5F4ZKE0lg17KMK+gob
         pe6uWgWGDFZIgSUYtjMrR0lUrSudUH68cqnA4puQJXYJDIbOgpr45N1kZcCurocJwLmq
         erWZJazuOoJWsj+3CeBVeR3pbPA22GHY/NwkXELK/y8G6A8qmbu3kC9mbHTrj0Ss7U4t
         8zK/LS43ikfpPSrCrWnvpPhcqhKPSW7Vz2kLGU3W2HXl+S9/ArHaAJqT3eaV/Cu2QYZ8
         sT1zTifyOlsSaHe8t+xtFsVG44Ov6+yULRyfIc2jjBHTaq2fK29b7le58PAQN79JFdlU
         XcUA==
X-Forwarded-Encrypted: i=1; AJvYcCVrcEvT3NyMniInWP31INuG8/S+qbZTnokjUFeo0i9ThFRKR/d/1GkNxxr+vauePEbNyUa6bV3Do/RCFGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzpSk4VNNYXYFcqofPBwrQFjaxSnKn31yeJ4NNHLhmQm07H8PgG
	455qBXhbYSBtwVGx5gK7FiBHhI88blXOQOwfRSqIrcBZDNMF4OEoIhkJgxepbngYKA==
X-Gm-Gg: ASbGnctt6KBG52PKqPyvIakKfYWMnbnZiRty/SsiyUs8qiOOdqcYdF2x1FpZR4CyyMT
	BFmQLF7MbZlchV7/3pWFFsyIx0GP8iZH7R2li2RSumKGkb3Cit1wAbcXUzNROZh8iry3za8A3BA
	V1fjb2qnQkutSa9GgoRZMPOCCiBTfvD7K99yxQIUxOYS9zDp6pGYU/1WS5QLO150Sl0nG1yMPap
	8bBeNePjtjapTizsI3qUR8H7Sz8N4hzkjmyyt4V0AnUFiQI+HEOLOPGNjbfb1lZbRTDA54zHCam
	Ew1iTWI1nECIo2C1UbiCRFBteaPHv1XAIXyzz8L3AYYh6/1wAHc/hTzTpYEZOVXzD3mAPXqdhp1
	A7lAFUnlvU5LLv/ugPtABTQo5
X-Google-Smtp-Source: AGHT+IGUdxhmprcVIjSuN4yZNd+FHL+5/zfrk/Oy7uV844JlySkH+ZJtP4VdG03ApE+R0C4tAE7OvA==
X-Received: by 2002:a17:902:cec3:b0:234:8c64:7875 with SMTP id d9443c01a7336-2364d8cc697mr3722255ad.38.1749668896237;
        Wed, 11 Jun 2025 12:08:16 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:4ad1:78dc:7f25:dde3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-236035068ddsm90940625ad.237.2025.06.11.12.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 12:08:15 -0700 (PDT)
Date: Wed, 11 Jun 2025 12:08:14 -0700
From: Brian Norris <briannorris@chromium.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Tsai Sung-Fu <danielsftsai@google.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
Message-ID: <aEnUHv8xMTDYgps9@google.com>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
 <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
 <aEcWTM3Y1roOf4Ph@google.com>
 <CAMcHhXqq9DHgip3rr0=24Y-LEBq5n4rDrE6AsWyjyBmsS7s+-A@mail.gmail.com>
 <aEiQitCsXq9XSBcZ@google.com>
 <CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMcHhXrT-y3EotxrcCZ0Pj8Sic6wsPSmRiW7NSzdG=9iH8xqKg@mail.gmail.com>

Hi Alex,

On Wed, Jun 11, 2025 at 08:56:40AM +0200, Aleksandrs Vinarskis wrote:
> Yes. Dell XPS 9345 is arch/arm64/boot/dts/qcom/x1e80100.dtsi based,
> and Asus Zenbook A14 is arch/arm64/boot/dts/qcom/x1p42100.dtsi based,
> which is a derivative but has a slightly different PCIe setup. So far
> both laptops would behave in the same ways.

Thanks. So that's what I suspected, a DWC/pcie-qcom PCIe driver, and
seemingly standard NVMe on top. pcie-qcom doesn't seem to do anything
weird regarding MSIs or affinity, so I wonder why I can't reproduce the
same symptoms on other NVMe setups so far. I can see some of the NVMe
queue MSIs left disabled (queue 0 / CPU 0 doesn't hit the same bugs,
since we don't hotplug CPU 0), but operations seem to function OK even
when missing a few queues. Maybe that's an implementation-specific
behavior that exhibits differently depending on the exact disk in
question.

Anyway, I think we've probably honed in on the bugs, so this might just
be a curiosity.

> > Thanks for the testing. I've found a few problems with my proposed
> > patch, and I've come up with the appended alternative that solves them.
> > Could you give it a try?
> 
> Just tested, and it appears to solve it, though I see some errors on
> wakeup that I don't remember seeing before. I will test-drive this
> setup for a day to provide better feedback and confirm if it is
> related to the fixup or not.

That's promising, I think. Do feel free to forward info if you think
there's still a problem though. I'll await your feedback before spinning
patches.

Brian
