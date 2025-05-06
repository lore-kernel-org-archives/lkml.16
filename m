Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0FCF9D6;
	Tue,  6 May 2025 20:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746563608; cv=none; b=Bmp7Q9K5WAhNnKZ70OoJChqsRO6vCJwBqs//bC/d0u2hxJ0RknAoW3tteip8ho73hONzUpiOQxqltlWgff2WvAIMp3R1+/rytCIrOlyi6zHnVKv1Xbdy/d7Bld6Pb1pg+iqUfRaD4Mu/+srnuUFP4p85H0i+PcmEf/6JxVzt5K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746563608; c=relaxed/simple;
	bh=GU/0QWzYrVSXft65qatATHb9UdRCKocqAo8RojTRjHU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4vEnIHtwBckMJVjMwJqo0SjnPjsNDs+vDwQAnTYz4IvpLuluWeH6hS9h1qFzsJUNHt+BxEupZiHyjMQHmfP1JZXrEZgWAtLkGs990DrRMDdr4m/QF5VyAeXlt43/hGvNxA7+73Va8RHnlDOi3qBZuqJ6Db9rLTDBakm6EoduOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tp/MS5JM; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tp/MS5JM"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so708148366b.0;
        Tue, 06 May 2025 13:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746563605; x=1747168405; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zgHemNWtqa8k4AyF6DtlkqCjI8OhMDy1+rer4Kv1t4w=;
        b=Tp/MS5JMppH7tRQuSHcwGnO+5SqCroaE4xUZ71iDZ9B9o+CnNACoLgBvID5+R8tuPG
         xAJ0gSpSp7AMJ37B8FcY0D4+0G3SSEMGUGDxzpwoaTCRzjOlHWdIKiPxq9Ny2z68gVQn
         IfsCwZi48YWtclukgV5kAqXpsI29nGu5XZfSIyZCcoJEIO0s6aEWxg/Aoeqa/dkTULwr
         iNgGsKJZUdkWLY8jnLsjYZPAbH9mlJpJjbIsIz7UiOPRChEhdzPYGoqp18qSfKgvBs+u
         S0ZqcSL86xVhcCcgnFl6CkqtTRwOmHdpsZs0An0MFi7+rPRoGA0qPbMwAN84S3zQaltc
         I6/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746563605; x=1747168405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgHemNWtqa8k4AyF6DtlkqCjI8OhMDy1+rer4Kv1t4w=;
        b=f2xjQHVXgR3T6nbHTV1NHw0sdbO6NX+b+eTc+U40raldO5pVp0w2q/+KSRnPIONs6M
         ZTMabCmxSoF4yPjaYaa8VC3b8DMg9HOptLaX7z/0uE6CePeAtvpdqWIcxdE2a7AuAJPO
         GAafJaAkM0WyDd72fdwVoMzGC45qO4O9mjD4pi9FOeZurrtuN+ViveXvcb9rad61kf+i
         F/+hIj0RiqeJ9UC2jNGMk15tqTqSlrIY2sJ5ulAQjuc7+sRlYOOV+2sHDB//Lu2FnZG0
         oo+vAYILpGChsCYXn5eKxUwi0XDE2VH0Dgp8G8IATNaKgmFa3HIO7M4szEpnWvTEHvEL
         LKDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmTcAGMoEP5bNLc/qxSfWjkiM7XpBFpYtSHrTN6gvZn7gMrSnBsuQuu2I1O6fjMqwCNDuSw/izVms+@vger.kernel.org, AJvYcCXxjHVIET21IQGjpQ+lP7Dzit1C184hIHz+qDroxkOs+jgX9TaGQfX6Jj6UA8hHuPfxTh7OwcPTVRNeva86@vger.kernel.org
X-Gm-Message-State: AOJu0YzFdz3YCgDLQfhqh+67sXz6SRaVlsIQC5IR14+NO34F2UCJPC7f
	eHebHljHyqMF6yNL/NjC6PM79BFfAub5qGcnS0NkaV4NTWPmKDWOIMSHrg==
X-Gm-Gg: ASbGncuBZk5pPcXO9sXZtETQY3cQM5ZzwxCnkdVgSlgvmLFG1SLzS7fMA43Vo2Ya6BR
	+Bdnz80bKY4kAvBzG84j8mEzHy+hcGTEwnReNJMa7oHiRs/zgI5ep6MM1EpuVJdLqdBR0jKZ7uR
	2/Ngu1WhSfmaD9geuRkHaWEEHLRvacOM01C3jRr6Qn95AGlLiuqWU3DS2LJ4NdIx0eKPmhQqV3z
	aY9bErwgomJ9J+6zCy/Osxz3eDwFj+XiQEjREzJ5q2xIRWd1MahQMi2p9DqF/CGesgG3+Zzl/zo
	qhL4UPz4FQEs3PM1/5P1cRhrrLVr9NhSxD2gStyecNKuVQJJN915FO2u2LNckQaL6VP10eqTLpJ
	AaMuL
X-Google-Smtp-Source: AGHT+IHQmjfRpINHsgz9ShdGUI4kDJEPSLEEfjV+MOKkEjV1f+crGBhCrNB3BbnYjWe8s6Rm/a27nw==
X-Received: by 2002:a17:907:7207:b0:acb:32c5:43ff with SMTP id a640c23a62f3a-ad1e89f8dc3mr78243466b.0.1746563604672;
        Tue, 06 May 2025 13:33:24 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad189540da0sm759259366b.165.2025.05.06.13.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:33:24 -0700 (PDT)
Date: Tue, 6 May 2025 22:33:22 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v8 0/9] mfd: bcm590xx: Add support for BCM59054
Message-ID: <aBpyEo8SHFq7SDf4@standask-GA-A55M-S2HP>
References: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-bcm59054-v8-0-e4cf638169a4@gmail.com>

On Wed, Apr 30, 2025 at 09:07:04AM +0200, Artur Weber wrote:
> Add support for the BCM59054 MFD to the bcm590xx driver (mfd and
> regulator) and fix a couple of small bugs in it that also affected
> the already supported BCM59056.
> 
> While we're at it - convert the devicetree bindings to YAML format
> and drop the bcm59056 DTS in favor of describing the PMU in users'
> DTS files, as is done for most other MFDs.
> 
> The BCM59054 is fairly similar to the BCM59056, with the primary
> difference being the different number and layout of regulators.
> It is primarily used in devices using the BCM21664 and BCM23550
> chipsets.
> 
> This patchset has been tested on a Samsung Galaxy Grand Neo
> (baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
> Testing on a BCM59056 would be appreciated.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---

Other than the already applied patch 3, the whole series is

Reviewed-by: Stanislav Jakubek <stano.jakubek@gmail.com>
