Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A711523AB96
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751270514; cv=none; b=mM+Vhd55/k5aWmZmsTogRTI7D7lGSh/1/4G6oVvr88F0wiFbzg8CpN5ralFUuqYt7rfPg2tiG2D22xXbcPAwPRISb0s6NKkztzfxP75MSE1bBfZH/rpl62UMNyU1iatWEbzamf73SRdE7G7S8kbuN5KmskJpgxdLc+4raTKOVKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751270514; c=relaxed/simple;
	bh=LpPq0O9dCSq2yJKRTchcrI01CNwc9RMMB1sOdqU8n48=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=hi2GuDrEunF+sOENqDH1MPYH9F7CxshA3jdm8Kkhf7js2O3ZWYj1RChRJD0kcpKUOoYHllTgZCvmQyW1TUz+uJilQJKSnrjhCkn3TVnchgC5hyrSoPxRLzx7EntRGkpmBXXKeN+10+PtbtrWdWhTxJ2cELUNXXKn5VFAhykdDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=PuMVrUKW; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="PuMVrUKW"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ae0a0cd709bso1040378166b.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1751270511; x=1751875311; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=PuMVrUKW32bEa9R7TQw7IHxfIrUhxO4ts7j1kHOE+OvGLv07I/8dBOcDKy5AwkQPsO
         Dm8P+rDqCOUjr1Xr12jvUEnRABphNKJNkYsbylIIe+oKVjipwSrCTDJe8AXHTW/p0PwX
         2fmZNg3f13y8TH7AnQcosPFDBBCNsvRu6q94CEUgt4nvkAU3BUlajfo9vKNbpwOQb1SU
         Q2qptM0wAmFx6VGpEv8a6dcns3XepjI7QEvfKvPQG3XXggWonB9PY6f8IyUt30asd1fl
         Wr5mPCnGzbC0S2BdxJA2rLNzLl0qORehS5OJQuPvOsMRJmJqIp5aR62vA0Bp9l+pI+xY
         kEtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751270511; x=1751875311;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZWXdKZSSjJqVCAXWFGblQxy/2StWwGGDnAv5AzCETw=;
        b=mJ6YG6TOOX6j/EdFd+25rVKQn7zm9lyQ6hKBHEgyQ880xX3EpF/wFvESjrCoVGa5Kv
         oLqq6qSq2rL/G3mc7LHriZnXc08Xg8diyoG+bTA3IqrVvbQaPAtwIxYxyvqMjyymKbyn
         YfcYo+ljMLzMQuwbPpV61Zm1lGE9nS0W/TAmtixO/6ARicHwzRx343yBi3Xb0mRhXYf8
         uOCBMTXvZVD9EjsEEfMPrdtWp2tJdq6EdL+lIV1lrAIxSktuxbqknfi004HnwRY4ApRk
         rkfu9VfdnNqOIgucaVVK39tG3zP/AegQRzQ/JQx5s1DbHqsZVG/BZGViWEh66MPjiHLx
         t+EA==
X-Forwarded-Encrypted: i=1; AJvYcCXs7NDetKf1wqegUe8KU7r5wizgOqBlS98O8YuWjnbc2MTbMstp1iaLPPKqtCwrbRyVVH3Y36P/bmmVm0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKhpTozvQT29ILSeFrIRD4GHb3ytis0MP1v7WtYfzl6hPrg/yU
	PNZwX57XnSeXqEkqxuSP5u/qnM3PuYHbTBfHcXigq2fzovJyPfp9vSYOMAlqEhHoJuo=
X-Gm-Gg: ASbGncu8lADRsGEm3Ea1L+4eIvpw7GngczAcVZHSIVorvNl6g6joxqlDvQzMqKS0tnX
	huT30HoZlG5anw6Dx+dTT3P9okuSiU2XteUR4ivxfRXvlKuhCitMQPkaJonANGmBk0Se1Qrw7A/
	g+G6353btE79xknoLj46vfuDEWjl007hSYVbcLUePD1Hjuj079mgPdUpv4I8IFI3sqY6biPSs8M
	54mZrOIxO3NczELrOMKgBbPAnh7bbA2Mhy77M6ZGwe6s32nb9OX8OVCBlHnQfYizhhhPhkkrpjj
	TaSvquT11l32h3G0bhTvSeJnw7fhZBsq1TH16hNsMbWv/jIYgVs/zNYlfiTeiB5UAhTWkltLZtf
	tSVV/zWDQirkJZ5UD9grRfd0QtZnVExNepAnAs7yBB2bBhiYT/zvLNb8i5auK4eaiwa3CaNDEbj
	YovyKxjA==
X-Google-Smtp-Source: AGHT+IEoVXPzL2X+o6hUB2pvWTzo7iX7ErTJsBfZFxmXtG6Mqo+mQVeD6+zkAYVim486K1lU9hLB1w==
X-Received: by 2002:a17:906:4783:b0:ae0:a464:99d with SMTP id a640c23a62f3a-ae0d27309d1mr1642905366b.17.1751270496717;
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Received: from localhost (2001-1c00-3b8a-ea00-c4de-d39d-05f4-c77a.cable.dynamic.v6.ziggo.nl. [2001:1c00:3b8a:ea00:c4de:d39d:5f4:c77a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c01641sm630119466b.77.2025.06.30.01.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:01:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Jun 2025 10:01:35 +0200
Message-Id: <DAZPKV5DQ1EK.2D4TQE5MIH4K9@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/10] Add clock drivers for SM7635
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Konrad Dybcio"
 <konrad.dybcio@oss.qualcomm.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Michael Turquette" <mturquette@baylibre.com>, "Stephen Boyd"
 <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250625-sm7635-clocks-v1-0-ca3120e3a80e@fairphone.com>
 <68056b4a-b1c3-401f-8720-8e0c3cda6249@oss.qualcomm.com>
 <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>
In-Reply-To: <DAXEWQ93VELV.3HJXPNWASYBT7@fairphone.com>

Hi Konrad,

On Fri Jun 27, 2025 at 5:14 PM CEST, Luca Weiss wrote:
> On Fri Jun 27, 2025 at 5:10 PM CEST, Konrad Dybcio wrote:
>> On 6/25/25 11:12 AM, Luca Weiss wrote:
>>> Document and add the clock drivers for GCC, CAMCC, DISPCC, GPUCC and
>>> VIDEOCC on the SM7635 SoC.
>>>=20
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>> Luca Weiss (10):
>>>       dt-bindings: clock: qcom: document the SM7635 Global Clock Contro=
ller
>>>       clk: qcom: Add Global Clock controller (GCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Camera Clock Contro=
ller
>>>       clk: qcom: Add Camera Clock controller (CAMCC) driver for SM7635
>>>       dt-bindings: clock: qcom: document the SM7635 Display Clock Contr=
oller
>>>       clk: qcom: Add Display Clock controller (DISPCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 GPU Clock Controlle=
r
>>>       clk: qcom: Add Graphics Clock controller (GPUCC) driver for SM763=
5
>>>       dt-bindings: clock: qcom: document the SM7635 Video Clock Control=
ler
>>>       clk: qcom: Add Video Clock controller (VIDEOCC) driver for SM7635
>>
>> We had a massive yak shaving patchset go in this season, please move
>> the magic settings in .probe to qcom_cc_driver_data {}
>
> Okay cool, I found them
> https://lore.kernel.org/linux-arm-msm/174970084192.547582.612305407582982=
706.b4-ty@kernel.org/

For camcc, gpucc and videocc it seems quite simple to follow these
changes.

For dispcc I don't know what to do with this line.

	/* Enable clock gating for MDP clocks */
	regmap_update_bits(regmap, DISP_CC_MISC_CMD, 0x10, 0x10);

Do I just keep the regmap references in this probe function and just
move the clk_lucid_ole_pll_configure & qcom_branch_set_clk_en to the
config struct?

And similar for gcc, I can move the qcom_branch_set_clk_en calls there
but the qcom_cc_register_rcg_dfs needs to be kept.

Does that sound okay, or what exactly is the desired outcome of the
requested changes?

Regards
Luca

>
>>
>> Konrad

