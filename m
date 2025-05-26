Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8311A2BB13
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748254361; cv=none; b=EpNDKfOG48qFyH6puEl2KKA65L1vv4+Mmtdl35kL3r18P6HbGrW7EJ+HT9q1EA4miAH5dTw512FbeMmgYtpPeyMjLrp55v1LfMvvw+WMtkmGcc/3JBFi4aJockdvtr7L+XMM9LYXLzge1ZkE54vW7VL7GHidbmq8RJfGfJpS4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748254361; c=relaxed/simple;
	bh=wNDOt/KgMMP7lsIAa87g1prMRWTJTTagQvC31pmgO2A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lZbZWA3C8QqOzG3C/wDfnHyUTHJAgHdMFosYi79kicUQezKKEsFdET6wJv+Z9TDqpBVzsXS9w6q4Ae089Y8SkeAtHDINiNTLX3/HcZ3P6DatQ6qX4PV4uM4xhpACXlCB7F6uBYBT+qq6+QYp5fk5tbgWz7AWW/jXx2/x1GdmH/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bu/4jCXL; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bu/4jCXL"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e7db7334738so336064276.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748254358; x=1748859158; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wNDOt/KgMMP7lsIAa87g1prMRWTJTTagQvC31pmgO2A=;
        b=bu/4jCXLBfgyWSxXuOjtGpgjGvbDvjib9BCju7rEnPC1PEy7+yBMb6hsDiSYy3zI8p
         A5cT1MpgVYgKvL/wgX/IPmlOXoRZ6RJcZMaCY5oFRh1TM/Zmd+AZdh//QMb0SESMbFPp
         yFWwdPXQVYm/Y8nEFFg2+7K6gTdu972XrnI07lduhghtk4BZBKM8/rijmoz5jUwRFY++
         59iA16et8pymKvoVaM93JuF+pO/WLAIrivstrKJpeBJj3rfDKtRt1z8sKYlYMBeZ1ZYz
         9To3HGlBHRGUb3fOkRK9lpnD3hprjjgjY8Ieu6fm5gLEiJ1JeYgWd1oUFObdqwYuHuBe
         XUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748254358; x=1748859158;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNDOt/KgMMP7lsIAa87g1prMRWTJTTagQvC31pmgO2A=;
        b=FPcbCxxkj8fANYpAz5kdjwDpeBpLKjqZ/GJseXLhYK2qMZ0yhnW4mhbzw56ZbLUjlq
         T+3C9OCe/UZdkr+VHWWBnTLhHGCKcd2QcH3IysxqPkvZlbw8Vabugr+n/Z3IB1krB3pj
         BbL7UmeDZ3hb0yKDZ4pp9ZRXjB/4/7wvQ8KcXk2piP1XWjlIxU0vVUSsIET63yr3ZH13
         V9PY6r7ULKlC7ZaGnUTYU6ec4V9NrYOQuA8EMdzGBwzqcCXr5CxOcKOZJqIjfQIa9o4p
         8FF2Fvi5rLF+Sap0EPJD/iMcnZZYCGJn3cUAb9JgMMl8AYnLr08P/0Xj040ZO9ZZgQVM
         6AzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEh85SnUmnlA/BqsyPPyc4lMvREFlXE0HS9IjQioGmE5Iw850dB0Nly52jRQsU4L+WpbODKog+PvA1YjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV2IXovK572MTBj2KgVM2YFVtFYt/IEhdeq4YufkvKZ6qjcUdr
	qZMDhuijTOFwgCs+Im67Lllad+ncIS6IEwXx3pyLSrHxsFOFvO1Aey5RPgCJ4BqxJuJpNppcJEn
	WF3GhtPOA0FBlkNgU1WJIl5KfovkJdUL8vQWwW154Pg==
X-Gm-Gg: ASbGnctWeQ7LKQDJGLGD/3XfQTwa1M2UJlqzzCW9P8YpPV5Px025ZHANcSkomIDCUYf
	bCF0kuEBVmf82knZRvLED6tPHtbJ8xTLUvNtJBXQdULPcrUl/Ef4b4DCYhVdrWSLetqAHLFpbBw
	9TxAXdEvTV1dWGjNVUABeixFpUnKDx3JDM15XuzBaBFDdb
X-Google-Smtp-Source: AGHT+IHi2XOZ9dRIdDcFBl3BRRFnnGCoagXOgAmEZ2Ih20GPqbGzZkP+XJCYm0HJs1gaCBhpq5GmobfeIAleVXtAPSQ=
X-Received: by 2002:a05:6902:1082:b0:e7d:b5bc:aa7c with SMTP id
 3f1490d57ef6-e7db5bcabb1mr1985809276.16.1748254358450; Mon, 26 May 2025
 03:12:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
 <20250523134025.75130-10-ulf.hansson@linaro.org> <4a0ec467-b81e-4282-8e09-b7adc67eba97@oss.qualcomm.com>
In-Reply-To: <4a0ec467-b81e-4282-8e09-b7adc67eba97@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 May 2025 12:12:02 +0200
X-Gm-Features: AX0GCFuhoe61jaT4ElHv6kD_woYqu09-YjR-85TQ3dhfrASylj73JDHmzoEBPqk
Message-ID: <CAPDyKFo+DDuBiic78hdN6JVSO1iQbJTvJgPwYaO8Y8soaJyEhg@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Saravana Kannan <saravanak@google.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Michael Grzeschik <m.grzeschik@pengutronix.de>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@linaro.org>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Johan Hovold <johan@kernel.org>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Michal Simek <michal.simek@amd.com>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Konrad,

On Fri, 23 May 2025 at 21:42, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/23/25 3:40 PM, Ulf Hansson wrote:
> > To make sure genpd tries to power off unused PM domains, let's call
> > of_genpd_sync_state() from our own ->sync_state() callback.
> >
> > Cc: Bjorn Andersson <andersson@kernel.org>
> > Cc: Konrad Dybcio <konradybcio@kernel.org>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
>
> note: the subject is wrong - this driver is rpmpd, the other
> one is rpm*h*pd (patch 10 has the correct subject)

Thanks for spotting this!

BTW, would it be possible for you to run some tests on QC HW for this?
Any help would be greatly appreciated.

Kind regards
Uffe
