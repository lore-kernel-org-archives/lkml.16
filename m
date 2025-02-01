Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412281494A5
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 12:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738414070; cv=none; b=RSXtUlOBFKNxTiA8qHi8OqOZIYznTnxc92vzuROa7F5ERUSllmh95OUXM5WXcc4PHMk58D0wZYhM3/stCy1CiWwZ7ugojpxIdQs39Xi0ncbaxcsHIFOc23RHGjwpM2Ru5+S9TciM0k9AozWkQgLPt18UMVHItKzDZNyI05hk5Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738414070; c=relaxed/simple;
	bh=4RZ7OWUNYW5slaMOvnaTZEv0LT0QnKX108Pvk3JR9fI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGPqN/k7f2qRuyVzbVFtMx1JtAHe0zlxq+di8fHGnbNe0txOJC1c+sd51uT3ovdr4q3bO266j+VCs7DYPsiHoEqrB5vJev1cEd+T2oR1Nk1SXOAuSVTAvJjy1TBkBT2Vojs4221C5orM7vCtOiM8Ett3E6NvgBvv0JR5EgoLGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dR9aU7Ab; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dR9aU7Ab"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53ff1f7caaeso2866305e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 01 Feb 2025 04:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738414065; x=1739018865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E7U/QY0AwysjlkyJl/K85+VbcTx0/u5THnr6ChZjWiM=;
        b=dR9aU7AbxafwVrprWCUJ8NE/NHf8HV50uNkOdlz+V4sapnL5kQFmO6pEk87IXsE13s
         yc82VvDgDH8wYrR7yqJxt4R0TiLadmO6TOOGspSFN/qA343nXTnLh4qVjuapTD7v8Vzl
         vk4X7llsCDKpsYLsQQXZn68c5eqTrcUD69pa9Ul+7n0Wq7yC+oOF2wS9QV4mkIIfTp8v
         Soe2t8Fufd62LqavaXWA+cG0jROTGxzaKv7i7kXYV82mDQ3Yl/tuwvnfWDtmiUdUb7aO
         nu7qoWqW19JJPaJzeC6ycfLvqWW2tLO38F2sQS5j93z63vBtHQPPuvDvoMzjiII/Lpl0
         qPDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738414065; x=1739018865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E7U/QY0AwysjlkyJl/K85+VbcTx0/u5THnr6ChZjWiM=;
        b=cN4E64Ngl/pe5D8nS62vcq6EfWz/kpUGty+r26cCPY3edsj7IZEsuGUw9KnBrEx3os
         ymGtnxpcq5CvnHSDA3J+Hfzer6qf6Dvnn27E99MbS3GJhn5Y/QN0ObXQUw4zQ5U8++dR
         Gnw0Y1XoWBdJ9K4Isipt70+JZvp1SzL7STJvw2dwiyhqxcIouSMgAbNbXbfq56j7j6JJ
         N6qwjh2GpAi4vcrheVdhE3oYzbuUgKI4O96CwhtiGvIDIomrWUl1g5Gu9OK6as4c+cnA
         JtoVt7tMsPGeZ+jva6fhLK4v7RTNnYY5SJSZ5q2mEEVgm3+GxGoNnKtrUtahv6mxoNyr
         1GDg==
X-Forwarded-Encrypted: i=1; AJvYcCXfBWqCJ5TP0Jb9crtxt4DPJFs1AoLfARa0rve7hBU6KqRm94gppGk8PbFhDy8RgOmLwdB6BNC3DLrhqf0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAsweMwbBqfzNQwBabw3uQZVT/t+vJ7YCt/gqSJNypOnS03HNh
	cqRh/MZtsuLsQ8qzbUYEcDck3I0v6KdBmd+1NWFCjjQrvuGr1PIPi9/wDXQFpjE=
X-Gm-Gg: ASbGnctgiddnftuGaMEvfV5gKV4j/kfW/Y7QOsY7Fjb7iV/Z4IFrN4WtIei//Mb4P73
	RBi7VIlErtAnDM2lsjvrCmGBSnFNQbuANZNfjxuANNgYsnFeCgM6EEr2/o3seefTd1U0YoFWMYV
	2VyEhigHPIthIQ4Y6X/oFC+oqqy4tR/TZU4fkIDXUnFYR41G2e99kiv38liemyT50c1ennSiVuP
	i6396VYJJgeGMyShNDJnTJ1xbkTKcm42LR5tf6zsVBX1NFlzJ/rEkmcHWz0jQbUZf0zRpk3pzad
	QT3HbSy6L1An7VlaWu79DhnuNktgPzWjCpL3zQ2Ht4hNtFvoZ5QxAmnG21N0zLKj5z+FLiw=
X-Google-Smtp-Source: AGHT+IEy2qDiVDwdoHC9BRZ37NSRP2KIMWzIo3wkTY5DJjgfWOTjn3aNna7i19+0q/ldZYCNWbFmWw==
X-Received: by 2002:a05:6512:234c:b0:542:29ec:d5be with SMTP id 2adb3069b0e04-543e4be0016mr4629444e87.10.1738414065247;
        Sat, 01 Feb 2025 04:47:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb06desm741428e87.145.2025.02.01.04.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Feb 2025 04:47:43 -0800 (PST)
Date: Sat, 1 Feb 2025 14:47:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] Bluetooth: qca: add WCN3950 support
Message-ID: <whxrzliiyqsceodr452u7xf7zlo326vygiknpiydq67vp2le7f@kggswwh4hbef>
References: <20250201-rb1-bt-v1-0-ae896c4923d8@linaro.org>
 <20250201-rb1-bt-v1-2-ae896c4923d8@linaro.org>
 <13d5026c-3274-4b90-b941-22f08a8ebdc4@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <13d5026c-3274-4b90-b941-22f08a8ebdc4@molgen.mpg.de>

On Sat, Feb 01, 2025 at 01:15:29PM +0100, Paul Menzel wrote:
> Dear Dmitry,
> 
> 
> Thank you for the patch.
> 
> Am 01.02.25 um 10:18 schrieb Dmitry Baryshkov:
> > WCN3950 is another example of the WCN39xx BT/WiFI family of chips. It
> > requires different firmware files and has different current
> > requirements, so add it as a separate SoC type.
> 
> Is the firmware publicly available already? (In patch 4/4 you write, it is,
> and I found it [1].) I find such information helpful in commit messages, and
> also the firmware names:
> 
> •   qca/cmbtfw12.tlv
> •   qca/cmbtfw13.tlv
> •   qca/cmnv12.bin
> •   qca/cmnv13.bin

Ack, I will add it.

> Do you also have a datasheet name to review the vregs?

I have it, but I don't think it is public.

> 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/bluetooth/btqca.c   |  9 +++++++++
> >   drivers/bluetooth/btqca.h   |  1 +
> >   drivers/bluetooth/hci_qca.c | 25 +++++++++++++++++++++++++
> >   3 files changed, 35 insertions(+)
> 
> […]
> 
> The rest looks good.
> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=421017641e6a6ef389190ac3edf67885183f3de0

-- 
With best wishes
Dmitry
