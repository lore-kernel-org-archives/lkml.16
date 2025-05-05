Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23FC13AF2
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 22:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746482683; cv=none; b=ov9PMZfzIAIQSGXBKPi6qfM1lXVFai7PJ7h3C14hlFwdUK2cWvl/unN0mfdUhKdfORo//WdqB8+Oig3xrBak9ZJ3J2x905KQWRHpVQFgzT27DTMLq1Jq/3upPUGUhf9GLRBiICBfu/xDodd70nJ4TNnOD7zIb3GA7F85hfpAl+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746482683; c=relaxed/simple;
	bh=snnOXzAe6Heu5aV6mBs11DJFSl0CS3QgcwKgPRQLEqw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWj6mgZ3+XeaRgLXHicPgfBNCxPQHSWz/PiRbz573+qWp128dfKXyTyV+SeEExdtN5SVfv4FIMKuIvMeOZ3tryHnIkGwzbGecQQuH1evHdJ+pFJ2dVo0RumDbcTfTpis01zRnnU8XZC7y6Ty04+Gg/0sa/SzIMpyfExPm+xGK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CbqEW6mo; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CbqEW6mo"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3105ef2a06cso47534491fa.2
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 15:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746482680; x=1747087480; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snnOXzAe6Heu5aV6mBs11DJFSl0CS3QgcwKgPRQLEqw=;
        b=CbqEW6mozUuh5dSDm0FHYiwRVzfuV7llWkCzbTPuTbHkkU0TEsOlvxxTr6qhqJu4ES
         wPlgqLaTwzN5D2PMseUtgzVsk78H20k8NVe/0k59Nx42F6rRond8FV7E/yALe8SxqNXs
         25WNqWieGSiigKK6vmi7ZTuuR7oF//scBKHSGHdBMvsGJr0DjBg87IokuCgfGSxTbUrC
         MBhH/PDPpbnC1JTQPagM8exsn5tpKuYgGTjUs+ScypV5r8ncWP9tDiwbXIV+1mRlVez+
         psAzX1r+Oh2zSF6tTSOKY1LXu+ov78+c3vdkZtO/WJVmEa4f2GUua07Mm0qjrdS7hhV9
         HUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746482680; x=1747087480;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=snnOXzAe6Heu5aV6mBs11DJFSl0CS3QgcwKgPRQLEqw=;
        b=Q7s+pJw1di+zAHIN+4gZ+NV4LNaCkv+CP6Wj/nlHTUkBAGCQOHpB6tN0n60rI3gyX/
         lzA5VrKBDG/jKX962vl4QRKG8Mui0k4OpYm6lbRMnf53HQazbPHeMYlq70YngKdT9iMS
         lRYSJAhQJ/eRblu57acg827dcGmjUILWp4KOBhRX6JfouEZtWRoPhaCd4UapLS4a3Qky
         bZd+inUrqkU9GEJ6Uq3fmSyOu9IAyZ2qzWICjK1uiUPI7w1mNoEnO3LrriWgyB10A3j4
         n2/MeLwi3zrXedwu0Wv1ZO+0ahnixZ85UDfmleN4r+13Z0HrvksL/UxPsSc4CAjp5P5e
         EzPg==
X-Forwarded-Encrypted: i=1; AJvYcCVcAx3BIY1sCyyV8ST0G2XJX/l1kRrY3IVyBNx0j/hyNUd0kmgqCJohqp6c9afyHIADtO9/cxb63wn7HpU=@vger.kernel.org
X-Gm-Message-State: AOJu0YygzTxtbI1igECH69pIEE428zKXHQNO57B+FUHcFwyoqkDoHHYj
	7x4NoHV4woq7/taig+tfrBzSn2gxLvrfF+szWI/GTRFBKVOnTAnqqwIFc3cVMKlx8X5xFdgDnDu
	MHeZdyFmbGFKYKKDCN4z0jLdqnVYuY1AJGndMBg==
X-Gm-Gg: ASbGncsXRFW5Bf/5qYv8jtF2jv9kdFgmQ8spo4RemttNhLr11ShNHXPLtF+0rE0XR/n
	nWLlWElZ1i1ed8+Vot6icPRPCjCUU3HezXv47qAUmAKSU3DA3XorzPL61b1zoa7OxGXJc98ZU06
	chTfZTrci8ezaxg5pCJ1IWI2Kt2xdfEQvZ
X-Google-Smtp-Source: AGHT+IGApbe9p7gXAk1nkGLKFD1tdslNqS67hi+XGq/azpYJ6FPZ6Uj8RDgT8dGRyemAo12Y9+ch0ZiUQQSCtCm0RZ8=
X-Received: by 2002:a2e:a58d:0:b0:30b:b987:b6a7 with SMTP id
 38308e7fff4ca-32668d51266mr1583961fa.0.1746482679935; Mon, 05 May 2025
 15:04:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505144654.1288979-1-robh@kernel.org>
In-Reply-To: <20250505144654.1288979-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 May 2025 00:04:28 +0200
X-Gm-Features: ATxdqUGbLo14PoDMJ9iRiD56H5JN5nsFkKufHU7P1DoHi_A24GdHzXWd-M_Gq0E
Message-ID: <CACRpkdY1OU+hfTuqOJ2noHp9pMtYbTJGtOzpHrb6qcVt4hY22Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 faraday,ftintc010 to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 4:46=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Convert the Faraday FTINTC010 interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
