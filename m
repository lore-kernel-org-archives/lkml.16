Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A928373;
	Wed, 16 Apr 2025 18:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744826440; cv=none; b=mog8rQ4tF9HPh1eSV1OiFrYOCrM4fEJBiKCHLNdGEZr8A754slkb7UlOLpAFirQxMwfMWr6Oopuu7BbvBIxjp3fNC/o1RiDkWi1toDWXLdrviUCrRbBd3RPd8eGcJ1GzQ7yWo9zP5A9G9sT2vq27sqFJkb2YMxnFwYT9/eRYETk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744826440; c=relaxed/simple;
	bh=rqSAP3+B7aB8thSP1AbXg2HpkSEmhLoZ+Um8NySeZp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=An3T9Q6Oq+y6kbb36GXMWKTduLaRVwNNNJa+nFZPgJMu1AhJbCpZP3gh7FmEdkkExoU6tFgJEd6YKpUhpayeAuVyLWX/937s4m9OZlSpcjr63dmsgTI8SfbzG3WH+KO8IDjAlKR4JjP4hX7+V/Rq1C/Eox7qDFy3DsJwmSxLUUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6zpKzWl; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6zpKzWl"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e3978c00a5aso5651383276.1;
        Wed, 16 Apr 2025 11:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744826438; x=1745431238; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rqSAP3+B7aB8thSP1AbXg2HpkSEmhLoZ+Um8NySeZp4=;
        b=H6zpKzWl1DjvprhW3p9MaXplECpd+E7GZ8o0jpERYGeocPYxBzjX2db8yKazn2mzOS
         0h/XTqK9foKYimr3J1lkJh/0zg0e8ssQqCdBtl34AqZ4yzYl6Gclf8gB8fpzdh0CPfQb
         848l03WUUss/hBbd4EXZt/WbKYne/QT25gstHmynW9KHhrMMDcFrsDrMq5KTRvVexdgW
         pPo2L0+OzJcqCjNDaPdyN3o2hbRRI8WZlsTN/FmRtUj+RKdzXSG+P8JfdjEBetmQ0zMQ
         FbRhq99d8tC5coOzstn7VKjWNX19YgDNRlLeHZVo8g+qukrbpwNn7a761YavHxAqv5bP
         Cjvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744826438; x=1745431238;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rqSAP3+B7aB8thSP1AbXg2HpkSEmhLoZ+Um8NySeZp4=;
        b=ry0jV7Ik7jtFZBvCbDfjKrE+7E9X6fjtxVX8kK7wfsIH6vGAcYNTG7yfZnf2RFGVHB
         /CXHje2Fahy2tEOjRHEUn61rYkUuv3BjXBbGuRJnuQ5Tr+sgKPaOJaWIx9G0BYmldPCy
         tNL/FttCU3/aw1evtlFDaivyNd7DVFqLiYplFQqN90c7N1s0Tl08wD7MEsfgOVpkUrP1
         x9YQNxY4YN5A01UHT0I1ZCNrGprWYNjHhgmepXrmzhb+0g1gRIoQZV1FueNduTnJXY9L
         bPlCOH3XNK7vgAhbJMV7l7gxqZ7tDo7VDMQjtPOYllhzsXjVXteSGYIm68lvGUbF3OIC
         sPFA==
X-Forwarded-Encrypted: i=1; AJvYcCWVSKcSbSagY/NOrMPzS8M/WP00MFQTmwOvz8YX1PD6I0M7VX6dxtexOihuHWd8SXY/VUyxNen3Tbu+@vger.kernel.org, AJvYcCWjuJ20VUBD8K0aXlhCRwonZUBBqIhGEFtK6xOdHFMuK2kQkjf5hW2ffso1JdGfCT63GEAh2+MPYMw1dhww@vger.kernel.org
X-Gm-Message-State: AOJu0YwTKyluTDeX2tJ2Hg5mj626ZcfAxW1Bm0pLEKvBwXDjCdv+6FZc
	khHxdzV6t3vfdjf+Mamh8GWUf7K6wgr+iILzUgXLQUcZCAgGssmIKmA4VYffKc1rtmn92ABCuy6
	SwihWUoEVUKUHdM6Eprqo8n4DpPI=
X-Gm-Gg: ASbGncs4naIUJczCebjkIyg1eKiCbeNYnJc5Idh0G7y2kBOd3ejPTz6Sa/HPrG8Zagz
	5313tTqPA/EIs/v3hI9RJ5DV+PQ9LIj7tpQuSpO+WHvw9a9bal7uZTNp9gXsRAMHbqxy9bMITwg
	nfTDCqS5ZBlrQrYWICCtY0H/U=
X-Google-Smtp-Source: AGHT+IGB8oCqqfaWsVNagbDEQkYgDTuZs8G2qd2r+3/NlNRtfFD2gJC9vJ1mnc/kLpHnmhHah4bCxtXr7QqVZ+WxeC4=
X-Received: by 2002:a05:6902:981:b0:e6d:fb0f:fcac with SMTP id
 3f1490d57ef6-e7275f25641mr4050749276.40.1744826437731; Wed, 16 Apr 2025
 11:00:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401235630.3220150-1-william@wkennington.com> <174369085137.3191483.5593938005824189048.b4-ty@codeconstruct.com.au>
In-Reply-To: <174369085137.3191483.5593938005824189048.b4-ty@codeconstruct.com.au>
From: Tomer Maimon <tmaimon77@gmail.com>
Date: Wed, 16 Apr 2025 21:00:26 +0300
X-Gm-Features: ATxdqUEFakrB13IND0DAqq207TNLwCbMoXu2w24Hy0B0OvjA503gTpT4TrQ1xSk
Message-ID: <CAP6Zq1izXL669DcYeLOnCDYknRPfVi7J0Ad3BjQTp1h1tZuW0w@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nuvoton: Add UDC nodes
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, "William A. Kennington III" <william@wkennington.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"

William, thanks for the patch.

Reviewed-by: Tomer Maimon <tmaimon77@gmail.com>



On Thu, 3 Apr 2025 at 17:34, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> On Tue, 01 Apr 2025 16:56:30 -0700, William A. Kennington III wrote:
> > The driver support was already added but we are missing the nodes in our
> > common devicetree.
> >
> >
>
> Thanks, I've applied this to be picked up through the BMC tree.
>
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
