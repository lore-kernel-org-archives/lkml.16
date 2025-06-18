Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D7227C175
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 07:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750230236; cv=none; b=nUk57yrnhwt0eD50sy9odmBp4Mf5b8bBq1bdB20qtn5OKasVwhSe/IWxn9oJqnCCxULYFKcOHsWrhdmtkIrC2/icd/Zflo6QCrtW9wMFaE+TGvXYArtzJPG+iqxLwJgBlRH/n0Z/WO1aZ+jfadxwNr1vRyCmlpqpu+TNag+F+ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750230236; c=relaxed/simple;
	bh=YTRncpT+pH/DA059ht1IJN3RghiNoIRzzEBOOswj34o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y0Sw6WHzx0FaXn+SRud9R87a/iWEdlapcMoneLuT9LUiMLexH2mdPTAPEq3j+Kf3H7D5wf4nIbpSIEg19vU+mr+Xkbthfz1JkKTc/JHwti/S41vF6+XS+jY0LwBa6wswm1GYr2L5+MGIf12ruLVso/0I4zxGxaS8AFo7an7S8Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UN0FseCZ; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UN0FseCZ"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so13218454a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750230233; x=1750835033; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NsSw9Ikhx1yd4yP2XgeO0QluSRqaGYOHCHE2Dlqaxqc=;
        b=UN0FseCZEI4vvSBSx5iRsegDliFMO71LF1uINhi7k1uNZqreXqFEPEcasDsmaNXEBT
         jHX7JGLYeC/lrUw/YL0b5ww2VHWjkuim9IsXycqxQg1fbTHycmqQuCUCEfMtZXomy4kx
         FIx+zUATesruGqcZh72w1DhUqb82mWe3Z0cL75vxAzJ64V3drArvCg/8JJA9wY9Rtflh
         vZBt9WlYlCzrgx7fk1VlUVsmB6r7Aa1un0jR/DlGEGIAqEPXGn4qxp7Zwn4Vk51gRJ9Z
         zwG1KZdBXw/tulfNjFlrKtTVqhTlQxP7m/4tC/+5Wb8IyNekqrO25XhlXY24EXgGrVHZ
         pKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750230233; x=1750835033;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsSw9Ikhx1yd4yP2XgeO0QluSRqaGYOHCHE2Dlqaxqc=;
        b=uffq+ssaCeQ5lPwLyCh1QgvWecwuFH42MeJP6pjGXOJyLkjJPjDXKjhcVpnIcxEhmY
         8gZi72tl1vL6R+Mq0ATzDV1cAk4d/c0bwBkv2eMX2++nrgUn/0Ivqyf+2wYD4W5bK244
         zGzxbOkQECw8Ky6j1Ja40g17tIso9AAxrTwyo5pGAh09clt+VlZix0LqzHEYWdMNb/SE
         m7zN5aK4aBuGg/X1wjSuv1aszJFFe8kBS7lZs5CBy3DG8l55jAcx0dPhDTHqhUkT2ES4
         euoch3GmQF5SUeJDgjsV1gYXrAAlVMTQ8k7subBq1A3M5gu66xAtrrelDoMcidBVPBd5
         IxvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUco/Ia2RJzJQdL3ySVQvQzsBI+/0Os6Eefzwf8kH3HkZna3frGT7oftgVH5rV2sHpPRa72jqq73vIzjBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhxHQgp5lBFmDVB9Zj+6D7sisWRC3FxzwMnpI5mJwEkVcbKQi
	Hgl7MnVXbHtokZ+2bLky7DeGILhMCyzPCjsPThEsD1XMrY6egJlfD9nZ8T57ysve67qHseFTj8/
	qpNfjfS9Qt+PTq9W2cMQ6S5wblKflLy1i5WrDZpDD9Q==
X-Gm-Gg: ASbGncvDhLb4jxmkRRkqDFJUS8CnBywpen8dUK0CnohHEYR2aK9vDRgsZ4rrkgkc4cN
	y+GjTBUZg6REHjwPOYpoFJwCQcBTbcTWGm6CRWmBOOyDNP/vyHi5YhJH1Y/issYp4LqaWuilWnZ
	hl8wT1N9Dbf/nqsKHXgtfVKH1HWm8ZePiYSUS1rl3WPh9TzRNnRJECXYCz2uVQkY44dekp76LR
X-Google-Smtp-Source: AGHT+IHZIY+jTr8Ag9cGKvAkzAQTgh3aN4XZtrTOHox02khq2ojP89RYQg2Ii3JN3DtRgBOVdwEsPu7UQKPCCMm4jKs=
X-Received: by 2002:a17:907:3f87:b0:ad4:c55e:ef8b with SMTP id
 a640c23a62f3a-adfad4f162cmr1618569266b.48.1750230232877; Wed, 18 Jun 2025
 00:03:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613140514.2781138-1-vincent.guittot@linaro.org> <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
In-Reply-To: <20250617092208.GQ1613376@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 18 Jun 2025 09:03:41 +0200
X-Gm-Features: Ac12FXwFg5KajJ_3u1HGhrqguItEjuVfvP2W9_6jOJj07pz8BWOClOQWy1OZrR0
Message-ID: <CAKfTPtA-2YjQ-9jgrAZPT6v0R5X04Q5PoZ6Pa0TzAZji3=jiyg@mail.gmail.com>
Subject: Re: [PATCH 0/4] sched/fair: Manage lag and run to parity with
 different slices
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@redhat.com, juri.lelli@redhat.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 11:22, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Fri, Jun 13, 2025 at 04:05:10PM +0200, Vincent Guittot wrote:
> > Vincent Guittot (3):
> >   sched/fair: Use protect_slice() instead of direct comparison
> >   sched/fair: Limit run to parity to the min slice of enqueued entities
> >   sched/fair: Improve NO_RUN_TO_PARITY
>
> Ah. I wrote these here patches and then totally forgot about them :/.
> They take a different approach.
>
> The approach I took was to move decision to stick with curr after pick,
> instead of before it. That way we can evaluate the tree at the time of
> preemption.

Let me have a look at your patches

>
>
