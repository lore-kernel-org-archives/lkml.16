Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9422798EF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356541; cv=none; b=iZ7HCYD84NhizDpyAEN98g1xO5QgxDijEMwEo6ibaX8wszGzaPMh9g8Rl6FSEegQZHEdx02GObFo/sfgiHUluBcPeN8ye5ooJq+YkbD1sf9z8IFNE+G3aGmnW2sBllJbNPj2Wi1ORpLPi7sh87PQE346Gq/QiWfvFaGa9zY6z8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356541; c=relaxed/simple;
	bh=cja1fI2Ef3oVRN3ln1uZZNmEEcLeGhxoGld828CPx80=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EvRlQ8LNogw6WVVgnEhOKkETlBOvCSZMJS0epLc10vU4CAug78r2DaY/fjCiXx5iNq6+1l2cqoAwuvno+6CxShI5NkMKr+atbzv9BVRo1TWPzzDiMLMo0qeh2BxCeNzuJdil38H6ltzjBrtP7O+A5AATWOtlCDHVQKu9uS/PIcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xvPqjRMn; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xvPqjRMn"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7da099de49so2074510276.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 07:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748356539; x=1748961339; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yj61DsrMeMWCwZPL0JbzQgDWQkQXCn/QcX+T8FgoNzQ=;
        b=xvPqjRMndl8VaAuVu28EhZ3fiuY1ORRfSQL0nHxMFtK1z/+H19fDl3DxJ5xWXeogld
         RLwlB2hUdcNGLyafkf/Jv4SEtLYkU7oOdGKG3EUZLiqMxN6ssGaJMbwWXm7Ig8lVCJN2
         7hDiKkLS1+cBo2J/01XBPXB1TTTxECskge+1IQjnNdzysbu6vPlFksSoIz04GjCQrpyM
         59TDBOlGjYWt6drZFxxqGTH4ci+9UdBpXT36qtk0jFetQNyieOsQBeHyh885eX1xUnPH
         bzDG3+Si3d2PlruJA89w3byT2BQe6wwcWp5TOpJK2PblyliJn6xSADqATpSC0jYcsdWX
         vMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748356539; x=1748961339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yj61DsrMeMWCwZPL0JbzQgDWQkQXCn/QcX+T8FgoNzQ=;
        b=Hx1IBfOk2c9J62G90zCu9r9FO5ut0MMLJsBzBsVcoZ4ZLnT5lvYYxjFqBCd0UjSaS1
         mALefCH2xIPDbY5C0Oh1WXXY5V0ViPeALIA1RSj+rm0d1Ph4hiPRw1BLGse+qtKKwsxa
         ldsdoay+bIlYZyWSVm9AIiVtvGw94R+7Tqp/wGOi/rxh4K8APW5yWim0vI9nOHa9sFLy
         Jyt525D0u+Ow5ezomhotOywnxzDORSPrk/mgb4/AviYUq7gyuWVZw9XAlV067Xp6gXrA
         H6pJxLsR41Qt1kEkpNw6GMvXc7ClfYFB6MLcBSBRx5932lJFuaZon+C8LbA6XI4eti6Z
         ysXg==
X-Forwarded-Encrypted: i=1; AJvYcCWgK9VNV11lgKfGCIw5U++n/86/tcb8tLuqz+sN9B1ahjexZC2pwajGdAGbH6ACHAoMFgEm3B+u+MGQsfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFkSRwNfAQlj3kzkcMXpBTfvi4q6LHqcuvxzTUD3RjP3PZjyGf
	TTTzHwRmt5M3UbTi0/Ule41S+rxY2U1h5HGRQLOHNk1Uq5eBhLH1s5NOEhHwa+qupYYSlri4ctu
	ZoWC2RWvlM6deQAtxqS0UCjK9/tJa54GG++LD6oKYAQ==
X-Gm-Gg: ASbGnctvi5+U2WSWMxjvcyaCQ1UEZVRAdcTSh7khuPLh3v1XYee/n25wtt6HfM4VSPa
	tL43ELOShIGY98EiQjQyYgxeDS14Efu1eXA5SJSQxoh8izen6OskU1UR/K7oC1dGzknB3lCbDH7
	zn2wOhp5IQpsOkIYYv2rTzPt//TnBWB74vXg==
X-Google-Smtp-Source: AGHT+IEza78A9ENnR5O8Dofyx/Pw9tLHJHiZMGvlW4NPAPac1rNHq3hR3Ihr49/HMPreqV7/1zrs+KoKNzJJUGDnh9A=
X-Received: by 2002:a05:6902:100f:b0:e7d:c9f4:ed80 with SMTP id
 3f1490d57ef6-e7dc9f4ef2bmr2892226276.34.1748356538436; Tue, 27 May 2025
 07:35:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523105745.6210-1-quic_sartgarg@quicinc.com> <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
In-Reply-To: <d0d3c2c0-d5ab-484d-835b-3a76055cad55@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 May 2025 16:35:02 +0200
X-Gm-Features: AX0GCFuCVqmDKFBGxj-r9MWTg0HcX-1n2QZgpIUWBloETdc9Q6k3WIWR9wYHE2g
Message-ID: <CAPDyKFoKh6KLtn6-Rvttt9zKh2fk7T28t_jC7KC8peYE+RkL5Q@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] Add level shifter support for qualcomm SOC's
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sarthak Garg <quic_sartgarg@quicinc.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mmc@vger.kernel.org, quic_cang@quicinc.com, quic_nguyenb@quicinc.com, 
	quic_rampraka@quicinc.com, quic_pragalla@quicinc.com, 
	quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 20:25, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/23/25 12:57 PM, Sarthak Garg wrote:
> > Add level shifter support for qualcomm SOC's.
> >
> > - Changed from v1
> >     - As suggested by Krzysztof Kozlowski redesigned logic to use
> >     compatible property for adding this level shifter support.
> >     - Addressed Adrian Hunter comments on V1 with resepect to
> >       checkpatch.
> >     - Cleared the bits first and then set bits in
> >       sdhci_msm_execute_tuning as suggested by Adrian Hunter.
> >     - Upated the if condition logic in msm_set_clock_rate_for_bus_mode
> >       as suggested by Adrian Hunter.
>
> During internal review I suggested we could introduce a generic quirk,
> perhaps called "max-hs-frequency" which would update this
> currently-constant value:
>
> ---------------- drivers/mmc/core/sd.c ----------------
> if (status[13] & SD_MODE_HIGH_SPEED)
>         card->sw_caps.hs_max_dtr = HIGH_SPEED_MAX_DTR;
> -------------------------------------------------------
>
> (50 MHz)
>
> which I believe is where it comes from

I agree that a DT property for the mmc controller would make sense.

Although, this seems limited to SD UHS-I speed modes, so perhaps
"max-sd-uhs-frequency" would be a better name for it?

Kind regards
Uffe
