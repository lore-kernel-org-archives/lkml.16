Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2B3347B4;
	Wed, 16 Apr 2025 08:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744791045; cv=none; b=G8/4fxG+QfeoudJFEVVuXaM4fTcLEmkGbezIKnvFNnlVa1c7jCVeKEGPgqx5hB2WYZsbmNnt2Vi60e2185HYN8DPlB5NvvnbSt6L+KkBFS/EpPzBwE0ViP18RPX4T3ftm4Kpr4aXdHOmXZKp1jljCewKBOf2rIdVCzcj6gfI/60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744791045; c=relaxed/simple;
	bh=YJBGQPXmTvvacUHZfftSUhM1bPMLymQ2kVfFzgrbmtY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zzn3XjncXqhQB/M5NAVG0WfVA2z7OkLkals7urrOUBWasw4c4fyOF+I+dHUYku09MqXLi6iB2td6iAd3HvyZZ87aJacBwXr9NY8LTwlZKLDYJooleWkNGxnErUon5wANbdCgX7xLtKAXN6tG631akQ3Anap/3V/HMpX5lUq4GXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L3zF+zh4; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L3zF+zh4"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-700b17551cdso62392467b3.0;
        Wed, 16 Apr 2025 01:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744791042; x=1745395842; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DZyqpE9X4wd/22zjOlPfUmaMFF9uMRXc0xTpLR2rnoY=;
        b=L3zF+zh4q11LNqUst2cKv2bZo2zRa4pQAT3F0dbK7WGNwSZN3mb70crx6PRoKrbGcY
         Gm7GL8ajfp07nJr2/hv3Z69OIC0cezhW1ckPiJU2Dj7guLx984/3sEavW/szGxT102Qi
         Ug0L+r4pfY1gyhbMbmdwf4qnSt6jal/Of8epAVkJD4lIH+g7OmVH4hPVhr02KYkALs8L
         b/2NZOOwbB/Pvn8lEJ3vAT8Kjqmq97D2Qx4anmqC1nJxT2WFeYxjI5QsCYUrPkf7QPnv
         8n0aNR72QgX7LhMqM0gP8DRorW/v5gzwnow8ZVFyYIOIQX/7hYW9jK8u0xuU1LcuYka+
         kFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744791042; x=1745395842;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DZyqpE9X4wd/22zjOlPfUmaMFF9uMRXc0xTpLR2rnoY=;
        b=n7PuFHW/ug9rpa9as/1Ftlz7ZMhQ9yVWMNDA742v+kPw5JancCrXKGtX+h8LmhOtEN
         A4YKoAmDWKKRpGG4IoaMSR2g4sZbjsgMKrRfYxbiAZgKnkvU8mzsiU+R176Q+UB1wBdm
         e5ccVYi3F23OkIWZ16rptYC9VAWGQCxHvzbQDMz/LrHVW5dGXDSS5d2S2477g54EeFKm
         9gaMfMJpi4+JAVs+0coPCdG17C9fYcK8a75vZTo0eD2kPDKpmV1LJZ553FxFD4Tk3vT3
         QZ89C3a577GPOroZrfhtJ6sHv1JF4WESraj+bLC8dZ9tN53GTm8XaTEpdKzV9trlTeqZ
         vg1w==
X-Forwarded-Encrypted: i=1; AJvYcCVa9JFd+I4+gFg/gV+wCqUY61KveQQsqn1BWWJtTy+ZBJdNmy9e0kAFHuuvEFpIlTCLyWMcVvK9tFvF@vger.kernel.org, AJvYcCWEwIy5viphd4BT35xLpjVQFZyDR8xW8Vdt5/fmYnW1smhFsC4LvdixTJqQPxQpEamFdQPzWKs4cg16aQIe@vger.kernel.org
X-Gm-Message-State: AOJu0YwrxByT5Xj8WiZLFIut+WpTFmoB+vVTyDVvu4OJrkSSVPszDf+D
	rQh3BuLrTqb8Je17vLLVIHQVa27/TetCIJbXsyO4D5fnFZp7Cxo8f0JfKoJs/ATJUjU4NUr8jzw
	udZCVClnQCz5WO+rU8Cz8RManvlxqRApU
X-Gm-Gg: ASbGncuMdNOO31xTOeQdq+EGQzz1nF9YPSTpciKgPze9k6wnSti1/zSWB4W6diSFac6
	zNwkRu/NjDv8H64zQgVdGiFeWmse89NJ5TqnDM/9QL7gtF+cvEzJhjZSwhANwNhhUKqdSTDciwU
	sjgUDpq+MtRt7NgrCC60GwcOk=
X-Google-Smtp-Source: AGHT+IERtVAn7G4y4UbpvpqL8S24+SOdCyTdCfzaf2Z6DYy23J0VPJjeu/lO0dtLZZUkOahWYWdUR/bt4CV1jcqAR3E=
X-Received: by 2002:a05:6902:2510:b0:e6d:e9b1:3f0 with SMTP id
 3f1490d57ef6-e7275f057admr1041947276.31.1744791042046; Wed, 16 Apr 2025
 01:10:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250416001818.2067486-1-william@wkennington.com> <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
In-Reply-To: <2d3d4240-65ab-4fd1-a86a-503bb40f34a6@kernel.org>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 11:10:31 +0300
X-Gm-Features: ATxdqUFzBhTkR5fO7-JutV7OU1OIYCLydgKtsG_teNYEMHlsAIQ9RZ1odpqCxNw
Message-ID: <CAP6Zq1hg+cjZnz68YvtDLjWOHRfUBWc_e98g3LtBMqNpA+sG2w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nuvoton: Add USB Hosts
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "William A. Kennington III" <william@wkennington.com>, Avi Fishman <avifishman70@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, openbmc@lists.ozlabs.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

Thanks a lot for your review.

Can we send one patch that includes all nodes that are existing
NPCM8xx drivers in the kernel, or do you prefer a patchset that
contains patches for each NPCM8xx driver?

Thanks,

Tomer

On Wed, 16 Apr 2025 at 09:52, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 16/04/2025 02:18, William A. Kennington III wrote:
> > The npcm 8xx chip has 2 EHCI and 2 OHCI hosts with driver support
> > already existing in the kernel.
> >
> > Signed-off-by: William A. Kennington III <william@wkennington.com>
> > ---
> >  .../dts/nuvoton/nuvoton-common-npcm8xx.dtsi   | 28 +++++++++++++++++++
>
> Please do not send 10 separate patches, but one patchset for given
> subsystem.
>
> >  1 file changed, 28 insertions(+)
>
>
>
> Best regards,
> Krzysztof
