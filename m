Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF1B5C96
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 11:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750159755; cv=none; b=X5WMdc3OXZ35ouJUeH4Yg9uitjDTgVQ9KHBu+4R0ZCdykNN7BmV2Nwp3K9kNCLnLmm3n1b6fZ+5AaPACzrwWoW74pX5sxJgIVGS0LJZfyHEkE+XunTSuEsbzvf3xtslXQsVEYvt7si9NHuNsE4Aa89silr0AROqiCA/HHmX7/Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750159755; c=relaxed/simple;
	bh=3xcJ0cPhiXwOy9vyZg4oGHHyyRHelk2sChqNHBP/aBs=;
	h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=J5fAPHn1QBeZbpVKwxlUkMkJ2u7LoxL8eM/imPwGtShbILgqdN3prxnD09jvCP8AwxLvnGvNrQZy62dNXpjLgCFEq6KTaeNBpKC4FDZkfVpHCl+KeLO8sRjVHS5vkTQs4Qt7AfLYVWrK0vw2lY+Mf12rf316jpFsfziXpPf0Ugo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k9dXBrF0; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k9dXBrF0"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6face367320so54047246d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 04:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750159753; x=1750764553; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGJ/HiUb5eBipOSI0rw//oci8YTcU8Pjqz7ygAKFHRs=;
        b=k9dXBrF0SmsZMmtRvCQ2Epdwum8Lma2l4dabJeluER3L+s6vVzULXhseYi6qpRCyGt
         bsWBWeiDA2Vc82+xWMX9S/xd4Qxdctk5f2mGxUdxIMBAtGcxybz6iDksvhe1nbNHT6dS
         ALH30M4kJDP5cTaizivjFXQ1La0KqqmRj9O75W0o9W1KjwRxirRvbmIWy2m37QvkHzgH
         TcVw1H6+YWvdurPld1JEsBZIb7tXCanYNabddgmMVqO9389uS0PkPjlt1NwQuBu2zp1r
         nipriKiZiuBHHIb72vNBKvZAgMCKNS0DtsrtM6r0tdv8Ae8PLj9ywMOHJRqMMWl+7SgI
         38pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750159753; x=1750764553;
        h=content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aGJ/HiUb5eBipOSI0rw//oci8YTcU8Pjqz7ygAKFHRs=;
        b=b3fBY1H3/+c67pk5lawoGEMOO9xXs+KAJP7sHJ6q5RO5rsKi3NkipRBYq83drt11M9
         xXAN/w1MW45IdR/VvloqGEaw87D8eBu3g0jkmDpt3WlhwIP0pcfBziWyoH60D5H79nLE
         UrRObE+Sr4VVZ/cokZIOcymgglUN31l8fZN3YWiJG8IMs4J2E2sPSSArflDNM5d7ehuT
         p5LwaXiidv8oQyHRF/7M4WodDXawWkYu224RWlQp8qVpWYjcM2S8C927z6GB9S9+uUWE
         bXohhRdUg+mDdDGNkT/a3zcsPKYpbA4RSyHvSmNwHjx+n/0t+N2TDcc9gB/7srCt5dvV
         gLFA==
X-Gm-Message-State: AOJu0YyPxJHRjCnLwzVNtZ+gTWTvJ+gUBz7T3A/uZ4Ly+KpTuZT7Vc/+
	y4RYiRWrQocBFyu4cOYBxFZtRrElA3BM18ApTECc704LNZMPhPRunEc=
X-Gm-Gg: ASbGncvVDw+ZBJEeVpQ8XfQIvnCoHBHwkBzYr3VPEr3KrXPiCBDBLNZrqDW2D3+FK3z
	nFppCYIUJySndRjHqODMhODU3d4XyTVkKTrfHAwErFEcp+4vHkuiQh6cPxfiLp4MGSnQ5K5BdsS
	Z6q3HuflVlsF2Kird8WueYYUhhW/iV9D97k1OSjsVkxkQ7cUdbKx8wDtpLKVov0ImIL/FZxHb1U
	Bsjxj+L6sTVb9d2/mpKgcCjRoe/LI4emZz3JvY+SKwUF+tkXeWdxcJ5f4VF+lhgEr+CrnBRCag6
	ddatSCQ+GkrFnqXV6rA4zmNUCPg5tWmsgmeoc5rIVoUCROEsesFjwNncrdxl9MalEECJiKc8qPf
	lb0U55tW7dE07jZc=
X-Google-Smtp-Source: AGHT+IGq2C1yzKBdKiEGu19AoeKD/sPEyQ0mjtHqzC2KU/RUfvQ4isAYnCbaChB0Yzf2Yi7tAXcY6A==
X-Received: by 2002:a05:6214:4909:b0:6fa:cdc9:8aff with SMTP id 6a1803df08f44-6fb4777843fmr201308206d6.25.1750159752907;
        Tue, 17 Jun 2025 04:29:12 -0700 (PDT)
Received: from [120.7.1.23] (135-23-93-252.cpe.pppoe.ca. [135.23.93.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a72a4e7edasm59907621cf.67.2025.06.17.04.29.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 04:29:12 -0700 (PDT)
Subject: Re: Regression in 6.16-rc1 iwlwifi: IRQ issue
From: Woody Suwalski <terraluna977@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Korenblit, Miriam Rachel" <miriam.rachel.korenblit@intel.com>,
 johannes.berg@intel.com
References: <e8c45d32-6129-8a5e-af80-ccc42aaf200b@gmail.com>
Message-ID: <31460147-3df4-cb16-4537-ab3a0b5b9eb5@gmail.com>
Date: Tue, 17 Jun 2025 07:29:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:128.0) Gecko/20100101
 Firefox/128.0 SeaMonkey/2.53.21
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <e8c45d32-6129-8a5e-af80-ccc42aaf200b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Woody Suwalski wrote:
> Hi Miri,
>
> Just had a chance to try 6.16-rc1 on an older Dell XPS and noticed a 
> constant stream of warning messages
> similar to
>
> "wrong command queue 0 (should be 9), sequence 0x0 readp=40 writep=40"
>
> However actual WiFi connection seems functional.
>
> Is it something you have taken care of in -next already or have I 
> found a new problem?
> And if the latter - can you make a quick patch to test, or will you 
> need a full bisection to analyze?
>
> Thanks, Woody
>
>
Fixed by a patch from Johannes:

diff --git a/drivers/net/wireless/intel/iwlwifi/dvm/main.c b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
index dbfd45948e8b..66211426aa3a 100644
--- a/drivers/net/wireless/intel/iwlwifi/dvm/main.c
+++ b/drivers/net/wireless/intel/iwlwifi/dvm/main.c
@@ -1316,6 +1316,7 @@ static struct iwl_op_mode *iwl_op_mode_dvm_start(struct iwl_trans *trans,
  		     sizeof(trans->conf.no_reclaim_cmds));
  	memcpy(trans->conf.no_reclaim_cmds, no_reclaim_cmds,
  	       sizeof(no_reclaim_cmds));
+	trans->conf.n_no_reclaim_cmds = ARRAY_SIZE(no_reclaim_cmds);
  
  	switch (iwlwifi_mod_params.amsdu_size) {
  	case IWL_AMSDU_DEF:

Thanks, Woody

