Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16F84B1E73
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 20:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747685033; cv=none; b=fq0aNK9mZrZGWKlA5u99MfmcneICk0EGAJaYDbMvIHZnHPOeyLZY6ZyfYlTsNSkzxnmTwfx1/S1pGWucB1RMlQJjHPbO5WiTVzrecj1b/adqdEgFFZX94uX9EQdy43evAp5VRksLi1T3TNj1obZdevqHsz17f0wPC33INCXNolI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747685033; c=relaxed/simple;
	bh=EqLwxJVbgW2ecK92/FYG4YVeOgBfW1zvuSftBl8Ttxc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT/r3SpHuWjHZTjj1qfcQVDusPG9Kch45jjq9ul29jrfYVQz8yU9amdj/ZevO9EnqvIuS0HralM7sE+1n12ND1TmWFqvdt2oPhl3qS79xEMhzhDGZ25DBniAVOisfuKm563xadKC86b+UUtjeWO3plmx7GyOkUp/+m03Nx4XFpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FPWsAQfj; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FPWsAQfj"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-231fc83a33aso23614645ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747685031; x=1748289831; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cbwzvSnj/Pe5rfAqdyUm19jDsv5CwuOGOQ67ehueUkQ=;
        b=FPWsAQfjitbApWczANsXXq3RKaQJSu+TAcb1bQYdDmrgIwsnJ1COzT8c1tYr7NCjGd
         aHTCYJMdzotz53hww1BoWzdTGZ/I48WZpLjTT6gU2TTEaxJsnmrylXUFPlLqe6tFDcs5
         1cusCZhd8OmE69QpLurp8Y2WxoEEY/dKbuyjY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747685031; x=1748289831;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cbwzvSnj/Pe5rfAqdyUm19jDsv5CwuOGOQ67ehueUkQ=;
        b=qpTzvd5otrKmbegwToSaSkKc+sEorJ7/0yVCgmxflI1WgXHdh9ZQB/usv8rreQKS1T
         rwP+go+z9yIJUjnPrjNCTnraOtPeP3+q2hmBEBmABpbKap9KOk1C/Y2X/N+yCW7RkZ5Z
         flDNsox9YvUyuuZ4JY2aQ9x5HVtua9sXXiSbFVg/Gh+65TrbdyHplbnlSGX0ABxsphuY
         c99lUcltW96tYuX+dseo2+tGKVFTdgOCflKe6GVlTW7SJcLjOn474tG6LKywvW9En6yJ
         kfTKDYCh0ZPMaNbW70p4L8P8dUb9ktvQ4qbW6m8ztoscHY6nWm5eu1J+8UGdz8rRrnCr
         vjgg==
X-Forwarded-Encrypted: i=1; AJvYcCXHLFLPyBMXFiQdLnDAReJCwstWJaYbBQun8MCALDOB46n/xogLUWp6qN7KXAqPpivGfpVunKUVmfLhiNA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw47GhbgkJXExdJrg120NcJEb9bsplLT1IoisYjN6CIcJndYe7c
	BbHospQvX2w/4lBUongBdCe+Sv9Xs2mcRlsE+7pxnQhX9MABe1B6L4RZE4N2FRWjZw==
X-Gm-Gg: ASbGncsM2pesMg+hJywNVQv7N8jNUa97PHSVn2E6Ex/SjYR7H9rfs2Tz1l9sKCMMryc
	J6G3WQWFNdKI1vquhKuuSmHEuW9Chm1CE5qfJV4uFtYmVNJlaktZtOHC974HsnuMyNXlPY2eqTh
	QegMmF599FmT/H4f+a5IlqG33GI3YniME3mECNP6yXWMA28+i0ZbMyH6Ds/03crRGaRYtTmOzGB
	DNFe1/i1Qu3kG6ZgKZ/cYWFGjhzrlFHR8AcaY3foHW4i+hFVWGKu2ikUecw96D8Tag3Kg/3TmYV
	SR/IOPJmkzClIkA9fXddTlFW2A8k9upGYcB0ALbFJtcQAn4oqh60VFjUgx+5bA1cXIn7DJy768H
	EjEOVcwFESAplwSvz4Y+KFakW
X-Google-Smtp-Source: AGHT+IErS9e6RSBXT2pW/pk4zdNSHk5nSRHMvO7tTzp6d6cj7O03GKefBpQUhfUVuc954nlDtpmekw==
X-Received: by 2002:a17:903:2301:b0:231:d160:adec with SMTP id d9443c01a7336-231de351d48mr192316705ad.11.1747685031132;
        Mon, 19 May 2025 13:03:51 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:379b:e49d:8d8d:4983])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-231ecd5ea41sm55316945ad.228.2025.05.19.13.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 13:03:50 -0700 (PDT)
Date: Mon, 19 May 2025 13:03:48 -0700
From: Brian Norris <briannorris@chromium.org>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Cc: heiko@sntech.de, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/1] Fixing a minor typo in YAML document
Message-ID: <aCuOpFdTQK3cqeP3@google.com>
References: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517020552.737932-1-jihed.chaibi.dev@gmail.com>

(CC a few more)

Hi Jihed,

On Sat, May 17, 2025 at 04:05:52AM +0200, Jihed Chaibi wrote:
> A small typo in the rockchip,rk3399 YAML document ;
> "less then" should become: "less than"
> 
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

The content is fine:

Acked-by: Brian Norris <briannorris@chromium.org>

(Feel free to include that line in your patch for v2 submission,
assuming you don't make massive changes.)

But you might consider looking through 'git log
Documentation/devicetree/bindings/memory-controllers/' to see what kind
of commit subjects are used. You should probably title it:

  dt-bindings: memory-controllers: rk3399-dmc: ...

Or something similar.

Since you suggested you're still learning the contribution process, I'd
suggest this as a good starter:

https://docs.kernel.org/devicetree/bindings/submitting-patches.html

and also its links out to other general documentation, like:

https://docs.kernel.org/process/submitting-patches.html

Regards,
Brian
