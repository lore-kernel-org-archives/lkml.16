Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57F21C6B4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 02:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744080826; cv=none; b=CdFqaOJLoQR4CNe07LPfpj4cHZUYp3ZkyOHSrNCgydeLXvSpe2Jvv9Nbw8KpMuqLpSuUjMsP3UJiXYR+U2BtUESUvVYF7H1RItjbzDg2GVv91yde3Up6Al/lUOZquTOE1DKgi2jiWs0O6Hn+en4KlREyoCEkRzCTngu98WRjZN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744080826; c=relaxed/simple;
	bh=JSnTV4PmMT7b+okjFJJLObktyI4t4Kd1JhMVGXGauQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFqpcBWsKjMU0Gv+rQLXUoBGh4zVx2J8EH+MlXQBANdGOHYXs9YxTqRVkz/5q/Ripf9La9FPd27v/YpItjtDzpAMJIyE/+4/M9XYfyvqhphez/b0kh503gZvRuNURQAPOToCdOZTUX08ggwdADLV5kteS3xlSMEW5KTYutaCIyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O7Id3WKD; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O7Id3WKD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5e5b6f3025dso7315781a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 19:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744080823; x=1744685623; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JSnTV4PmMT7b+okjFJJLObktyI4t4Kd1JhMVGXGauQI=;
        b=O7Id3WKDUkmOrnYfVOFRa9O4VxY2ubc4Ow255sRNU4s9JgKsU6hIkin+zo4nI3X/+4
         RiTvED4CH/GOUF4hfps+OlMYFfW8LGblBuYczal28lngKFzoH2NR81C2kSsbWy8/l2p6
         h434YTHEtMxwg8H1toZ+3VFeTcPBbHQHn7yo6Rb9EJDP/ATHxOdtkEpLdBA7Ls6unHjs
         N5+UbFaYRu7PkuIjebheUgxKh/k8zpzwNdPQIErAJoWwwAb0bi+lmcHfCZzHTw653xV9
         f4ag++Mm9MPpRgZ9YvPrr7rwNluGQ+3uDwP5CVdgSZq5MGGg0N5QUmeCtmaHmpF5kd0J
         DmnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744080823; x=1744685623;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JSnTV4PmMT7b+okjFJJLObktyI4t4Kd1JhMVGXGauQI=;
        b=T6vkrdgB1djXRQ4+3Lvk9Rup4ywBGGEzZs7aC8p52gC45PTWBSyrLETsVnvduVxEm9
         1KwW4oSHfRlOVANC7GZ4s0KozkUJS3oaS3Gh/lJe+XW2CXspSWkgCxG9fAQxLgzbdUG7
         oZ0MHf2JR+ODULA2Ai9ekfjF8k49gNjole9ai1+ockdTYAFASgCSPurZgJaR3OIbPdh4
         B9ygM36+5MuXmsSHXiKiAqiltEFCuKCAxMyndJla9IEGnEGjuHrK8du1XEGRZjSYR32O
         u0+IJh70Jq3OCnbIohGexVq2l5wIMBc5wmcCPT3pGUrcMTdI18j5fD3kELbTLg3tdrfS
         ceRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCkSRaNwzBMXUKnHIRgU8jM8Eyi6VeHqiQk1g4sd6/zBn8dccr74I7yD6EbDepYEjZg2gadb0dkaqOn+A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyNheCFp2aAhQ+uUlToDKBNdnrC+5eGtBEeTksCN14wEVdhHs+
	1AV/PErEhHDnoJZsjoQMUlwy+Wmn02XA9aruM3OpXUkDkhUtg/uFG+wPSRqlt9y2pU0S2tUdAyk
	bKFVHzmmZWdpBYnYfSjeWFjPfO2ZC3bwxze5k
X-Gm-Gg: ASbGncv6jCHojt4wgQPwwRKIAtqs7d4t/KE2twLCkz5dDDHcTwHflRrkaT1MyEaiKRn
	wx0iQzew+gvWMWCaQA2wfIMJK0WMg0EUpKLZBB40PAvMk91t9htQJ7juLetyR1eoNtH1mNr3VPg
	OoH7P/1THYbYDM0/u5Q+sj6g==
X-Google-Smtp-Source: AGHT+IHlcqYNcX8B0/Zx2AdzDvmOwtgNyjDp1ePH/T4zUMJaUxzHPwxKSgSniNlHyTwL30urRwEANvNnHX51MtR0z+Y=
X-Received: by 2002:a17:907:7d86:b0:ac4:5f1:a129 with SMTP id
 a640c23a62f3a-ac7e720cb38mr1042124066b.15.1744080823170; Mon, 07 Apr 2025
 19:53:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402202728.2157627-1-dhavale@google.com>
In-Reply-To: <20250402202728.2157627-1-dhavale@google.com>
From: Sandeep Dhavale <dhavale@google.com>
Date: Mon, 7 Apr 2025 19:53:32 -0700
X-Gm-Features: ATxdqUFEJuSyV6HyEV28vR135wtROOrYXjKc0PsrH0NPUtiodTsokitMORsBsAo
Message-ID: <CAB=BE-TzPKSsHo_nvMuGkB_4JbbP8OZ81ce=76y-28nAeZiniQ@mail.gmail.com>
Subject: Re: [PATCH v2] erofs: lazily initialize per-CPU workers and CPU
 hotplug hooks
To: linux-erofs@lists.ozlabs.org, Gao Xiang <xiang@kernel.org>, 
	Chao Yu <chao@kernel.org>, Yue Hu <zbestahu@gmail.com>, 
	Jeffle Xu <jefflexu@linux.alibaba.com>, Sandeep Dhavale <dhavale@google.com>
Cc: hsiangkao@linux.alibaba.com, kernel-team@android.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,
Gentle ping for review in case this slipped through the list.

Thanks,
Sandeep.
