Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CE919F48D;
	Fri,  4 Jul 2025 18:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751654165; cv=none; b=ZwmNF+/+ebwOWE6BxSGIgt21F3Vg75v6Rq1bFD+Qu6YdBth1ivYp86nX6zTFLy1vFKhRSa8AyfiG8AAoBOLYCBr68GTZ0AqZhxGq5p6YwTd5b5kkfh8tTTK4mnMZbPzwOzR1+1tYUJpITLbVItzGdcADPYUhgpw5vfEH3OrMJ7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751654165; c=relaxed/simple;
	bh=Xeg/JPm6n6HC2qxgyIIg/Hz6baV2O8fYoHgw0N8NS2Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aUJZmTfysU3Qe/cTETSRvvVTnsbJn6aGUhmCGcA5mXNZEgh9ByE18TPknZiiSgB5zC6TB4owBoPKYfyIuSYhIgF1s74i6DliTLh03UiLXSIXKnY+zKZBwWxOOp8No3QQIw/lcTv0QAXFo4D/eO24aofhOd1nFkvtFoRIfkUaEHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2fXZdPp; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2fXZdPp"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40a4de1753fso820975b6e.1;
        Fri, 04 Jul 2025 11:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751654163; x=1752258963; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xeg/JPm6n6HC2qxgyIIg/Hz6baV2O8fYoHgw0N8NS2Q=;
        b=T2fXZdPpyxrAm4lTSqd2NT5ftcKTL3VgiuFHLltLkGZ65ra9lrobWLxLA30BOsnVbl
         jf3bgH8lliN7VbstPMGNnrw3x2hRnBVjOhDb8WJTauqrTN+s6VKNe0bGWB7yDPl8NwX/
         SK7JhlFPz/C2y7kQ1Drf2nAIctQWBrcsRIl4y+zgbSRg3nfBOTvOyFSZFCsjmtlocxdR
         CXIjbaPxASfg+etK/tLplu1QJzJsqBB6iMJ4H0MKX7XYOkFeHGPjZ99MI5tawXhNiKmh
         N61oIOtrbvUJggzA6awUmLvYn+pCWTi4rCUZMD8uj/6DDyPdonwLpsLfD3m6L8ABsJ04
         ElTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751654163; x=1752258963;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xeg/JPm6n6HC2qxgyIIg/Hz6baV2O8fYoHgw0N8NS2Q=;
        b=uQK16GLxsdQQ17mW2qE5Z2AHwtH7kHsv+FhxLwAFdIMegVk+d7u1qLm2wYD5f49oO6
         /iD9E0/mjMZQil+fBN8jmRoMlkRbvRk1s9o6XobrJGfBNpPFPY5sC4S7vCpSnujnPVVw
         rqtUUZo/9Fjoi1C3AL3Rvj/b5puXgak1iV7T3hy2P/enyLsu7joAInGcIXFmr4Ot3hRc
         RiwppPBlRLfV2zLeUOA3iphXLDcRnYydpCMntJMcXobxCfqXb8ES9g7d9BxHz3/TTOvP
         8Qf7LpmjINtRo3dKBs5HN+qy2Qqmp7l438V9/uN1QLRHVYukLsKmbLEidJ1VdEO7p8b1
         Mcow==
X-Forwarded-Encrypted: i=1; AJvYcCU0RL4X4B59JSNQnlyJjf18CuD3uxhwTOk2WpY64C6QmnT+YY4DUNL0bFNZrYa+XV92IgRA2ZRh7N+t@vger.kernel.org, AJvYcCXWqenZXsxtLcyJoEVVWMlTebbLvjZgaaA7r8K88CaONB9f0Knn6ktHgqtnteNJA/YNxOS7XgrKQ/jXpls4@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3NxdksOF0Sfn3fDR3eLQXc8p1chsnRHj6ENqOdXsZZJccftEH
	mq/lyzGJAnPd/8oKjFg8UHB94avJBb+lAuk0vpTxJX6fQJElnNSYwnGhWaHKbDKcCql7+jEJ1TM
	EkOfzs+4C3py4HArgLUjUPG36sPZN8Dr0xw==
X-Gm-Gg: ASbGncvkC1JymjB7QVcddfmXzk9O/DzMDkcwdTAcIWKHhnjLag0DNd6MZJfZm2WSN6x
	+kWdAno5NUK9ThBAb0gBYf+dO7YYV8ne/P9hEG4X+/Hbk/t0P0k7dZGONX8pR3GY82RjfMgsbY0
	NhH7ubNdE1FOepFj+z/HWLxwT4lh7b1UMigk7G4OR1WT0d
X-Google-Smtp-Source: AGHT+IFbA6BEdKGEcMG1hPfdYdlou35N5PiGkJ6gDYA+8ptFPbpOHXlaxK1xR2BlaFABc43Ybr4ALWavsaG7bbVz6Nc=
X-Received: by 2002:a05:6808:1188:b0:40b:9527:8e9b with SMTP id
 5614622812f47-40d029f52d9mr3054856b6e.7.1751654162680; Fri, 04 Jul 2025
 11:36:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609031627.1605851-1-peter.chen@cixtech.com>
 <20250609031627.1605851-6-peter.chen@cixtech.com> <64f39e94-7e88-49d0-8455-cd77d61d4fe2@app.fastmail.com>
In-Reply-To: <64f39e94-7e88-49d0-8455-cd77d61d4fe2@app.fastmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 4 Jul 2025 13:35:51 -0500
X-Gm-Features: Ac12FXyLydZrRTipZV1GpQ3LNzUnb0dIxPUYlGRWR5QEyZ7_13BUSLAzEe2C5Ro
Message-ID: <CABb+yY1pzut-A9Xf117AoGMze2OevWKYrH5NtWBGFBhAMZky+A@mail.gmail.com>
Subject: Re: [PATCH v9 5/9] mailbox: add CIX mailbox driver
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Chen <peter.chen@cixtech.com>, Rob Herring <robh@kernel.org>, krzk+dt@kernel.org, 
	Conor Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, Marc Zyngier <maz@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Kajetan Puchalski <kajetan.puchalski@arm.com>, 
	Enric Balletbo <eballetb@redhat.com>, Guomin Chen <Guomin.Chen@cixtech.com>, 
	Gary Yang <gary.yang@cixtech.com>, Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 4, 2025 at 11:05=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrote=
:
>
> On Mon, Jun 9, 2025, at 05:16, Peter Chen wrote:
> > From: Guomin Chen <Guomin.Chen@cixtech.com>
> >
> > The CIX mailbox controller, used in the Cix SoCs, like sky1.
> > facilitates message transmission between multiple processors
> > within the SoC, such as the AP, PM, audio DSP, SensorHub MCU,
> > and others.
> >
> > Reviewed-by: Peter Chen <peter.chen@cixtech.com>
> > Signed-off-by: Guomin Chen <Guomin.Chen@cixtech.com>
> > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > Signed-off-by: Lihua Liu <Lihua.Liu@cixtech.com>
> > Signed-off-by: Peter Chen <peter.chen@cixtech.com>
>
> This is the only driver holding up the merge of the CIX
> platform, so I had a closer look myself.
>
Sorry I wasn't made aware of this. Also I normally let the drivers
roast until second half
hoping other platform folks find issues - I have reduced imposing my
opinions on platform
specific code because it is usually met with some sledge-hammer requirement=
.

>
> The one thing that stuck out to me is the design of
> having multiple types of mailbox in one driver, which
> feels out of scope for a simple mailbox.
>
Yes, if not all modes are used currently, maybe drop unused ones.

I will review the rest separately.

Thanks.
