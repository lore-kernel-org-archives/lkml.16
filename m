Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2A02153ED
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931236; cv=none; b=FUAdQyG5Xqk6g6n6bI1waVUZj2/HalkaILkuvcwqzX/pfBfpLozgav1NwnPBT7AZV+uUQ04s/k03/slFLelMqm7ZtnDeBgOFRDMZTgm76V+Afhm3JTVdeQMB9cIOMIbrn3amrOEZ4zgGOHBhRlT03ZJ8ObYnLUDEPwmve+eH+ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931236; c=relaxed/simple;
	bh=VMtWGZQmlxRjsBfICY6WknhUm1dc+SAzCwKYbEHznNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HgtpXpwBGW/6jP71yAHIWKtYqihYSO2IC6sy+gEmQBv7kjJPkNW6Liw53YmHLJPMe2sFf1QWNqcNdSByyPQ6SGCVTmFxjul15Dq9ofLAkn4l2p189JxfMP1XpFdlBNrxqJB9zO166FQqPZ/BBbI4FaMY3kFUuvSBqvIIg+KC6xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fGBv9h7C; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fGBv9h7C"
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e82314f9a51so567123276.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750931234; x=1751536034; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fj2QHa6OnGmzpYNyiPz5gZAKWryswlaFrYyygxh/pJQ=;
        b=fGBv9h7CXiGSscqe+y7pRZblpGDx/6tflIHILwTB7AWm2O1yjKSEfQi+S57cClKZyF
         HnaRczzacEiEHMWegPCwu8MS4T8njsN8HkucPxOfIVGnxS1mbQ+U5TBlEG4vh0nxlfVh
         2s1ocqR/hADjmY5ihkj2wUkZ56QXO3+jbO+ZCUThHF9v3r0bBv5xVMsGLHdvat6kNJEv
         UbenpHgs7NTg1JcUOlT7ITUIyRrQFLDb9NIJNSzXBf38RGtpZTA6UCOq/E9k88JL8CSX
         YeVFyGWEInpwWJimbiiv0anm4pFc45rntyfyfe3Or+mKkbPd+hm6h0XFQMoug6s57HeF
         ct1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750931234; x=1751536034;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fj2QHa6OnGmzpYNyiPz5gZAKWryswlaFrYyygxh/pJQ=;
        b=qR4+44tP9CiBUnenNyUAxamVk05CR7JJwEvehBYKIKXwiC5DtucpJRtCtsIH4g8IhN
         8jXyM4ocgpZl0lfYR86wyI3t2pwgGV9Hf9K2kPe88aQOsRT1NBd1R3tmBv/2F2QvCI1P
         sc3tUDGBfx2wlnaU3jmWytl090/neKSqdKLZ13+3fVcfuB4ycsnqpGlDXewRO9uvZKw/
         TKNg97FsiNOOTWlcf5OikkA/owt/iEDOgoPkEC4ODLk5ng+cK5qm0zWJNZLAHog6q3EL
         Vl8EcOufvjwega3cRkMO2lNM30GqkKWfy9T6ctQC/TvkA3v+VQe/LNMKrDykzqAjTg4k
         GJNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz5IVNtTa5Mbu1CDOz/lpVCxDGtGCRWR+oTaVQC2NsuWAkgkBU32imvlqGBzAK7vh6e8qy6Bzbql0ZM7k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6TTS2NY4e8atZvH9lgo2HE2ZXVpUeR1worP/1X9cm870dixHZ
	iN/g7G232lNyFA38W59Ddcmsa1v3SfD3OPYdhSKmYDb8nXqLsicbQCu+gYDkyW3or3uUzetM8ik
	XnxsMLjst+cSNVeliNkTMnIFtKJvsuVm14bdXAMQCIA==
X-Gm-Gg: ASbGncs2BMAnpcUVjWlRhACltkRqOyruy0BRVNtbry2NfpfvGxSOOY2SqEK09g/dvd3
	+ugCmFpGmYdbHwwz9bFyHsbEXlIhXle/R3YgLHmgfQ6ncNuyCjDYJkWcYW/TE7gZwegk7eQ741v
	TAqKFfoMb1j8jnY9ES9Z7DFJtjupcIIt9NMV43DEznxwG1
X-Google-Smtp-Source: AGHT+IEHwERgRwCBzB6vbsL1sIE76j7GbjeXErZ4zJp9hup79xC50wEIXLcWf5xeAXwh2fM3WvRP1rlkAgqjvq3ixUI=
X-Received: by 2002:a05:6902:2b91:b0:e84:2cec:1c9d with SMTP id
 3f1490d57ef6-e860177f71bmr7997438276.41.1750931233869; Thu, 26 Jun 2025
 02:47:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5011988.GXAFRqVoOG@rjwysocki.net>
In-Reply-To: <5011988.GXAFRqVoOG@rjwysocki.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 26 Jun 2025 11:46:37 +0200
X-Gm-Features: Ac12FXyIi7-z5quv_0KDUCEzalPBWfhqotEQ2Vp_aGtEe5qy39ECa_ySIUN3UIo
Message-ID: <CAPDyKFpBTz0M8DmWHLLm7x4c8G5PpQNv0Zj7mrZ9BewTBi1skg@mail.gmail.com>
Subject: Re: [RFT][PATCH v4 0/2] PM: sleep: Handle async suppliers like
 parents and async consumers like children
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Mario Limonciello <mario.limonciello@amd.com>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Saravana Kannan <saravanak@google.com>, Sudeep Holla <sudeep.holla@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 23 Jun 2025 at 14:55, Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
>
> Hi Everyone,
>
> These two patches complement the recently made PM core changes related to
> the async suspend and resume of devices.  They should apply on top of
> 6.16-rc3.
>
> They were sent along with the other changes mentioned above:
>
> https://lore.kernel.org/linux-pm/2229735.Mh6RI2rZIc@rjwysocki.net/
> https://lore.kernel.org/linux-pm/2651185.Lt9SDvczpP@rjwysocki.net/
>
> (and this is v4 because they have been rebased in the meantime), but they don't
> make any difference on my test-bed x86 systems, so I'd appreciate a confirmation
> that they are actually needed on ARM (or another architecture using DT).
>
> Thanks!

Hi Rafael,

I haven't yet got the time to test these, but the code looks good to
me, so feel free to add for the series:

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
