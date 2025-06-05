Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9180522F16F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749129442; cv=none; b=nv+ecNyvhy8MX06WRLc9adPZLlefFjW8o7XEf/aCTuL/KgF+leD+1GgIxXTlHJhZ4NReZLuYyzv8idNHQvvSWNuHXAo4q5GdWpXh2g1nHQZgtWefP3aZ2t+Zpo4UdQUubaWRqlF7lPEfE3mm5u7MdDT16OrvfPAATO9ewizedbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749129442; c=relaxed/simple;
	bh=JYxfNLUhajuZaDRRmStEgps44e1RMYkmRRzlZU8Wqi4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pS3PqKLqTg1CYijeaeKFCvITqy7FGqNCmh1bY/H47FbYeqrvD+Wzej+7OrHayVWiFKlaHnReRM1SvE25YzDPXLnF+TyjoDGXLvalttVyXT6Tc4Fk+/s9upfcEjE35sIgwYMlXA3+fWp21RSYML0dlKqup/xmRVcaVsDF0rO8P38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=URyF9kk3; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="URyF9kk3"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5532a30ac41so1097783e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749129439; x=1749734239; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aVRYwEpnZ9G37QC8CdeQkhsKUCGJDds8q+iTQKaOrS8=;
        b=URyF9kk3Fsb2DItj67bfO0zdxI5KbRZASQRjGUMIVVTZcphQqg58YNuZXG8AZt2eio
         z1R0ax5Uqcl3yvTut5nSuIEfGQjJIkAGvv+PHo1IKqbjXLlMMjJ7EAwxj9fAirZI2XOm
         9ZIrUloogH0Rq01bUWiPEEFCntQ1fNZFF7EwGfTT+YCR7VqGw4ntxkmRuiNHxIc7Wr1b
         tBZruTjNyobTPyQxCfuYgJ01TVowcc6C7aSFj2W93nYLxnMCHLrNMxhFRjEJqP8+o/mI
         ElCyawQKY32esnOhFod5P9DVPJB/6Na2mR1l3YrpgkI8D5jPuQ/JyuKccQjMSFrGAo4N
         TWIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129439; x=1749734239;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aVRYwEpnZ9G37QC8CdeQkhsKUCGJDds8q+iTQKaOrS8=;
        b=upXxHIOBiOoL4dMXqd4FSFWcf9OUjvWM16IH5m+Jc7V3PDz40SDJe98k0M4GRDOTeu
         mgik+A51Z6kbp/NZ8pOWk40xGxBfgteuAR5t41d/+lZI5pmWR8Uxkp8ymWx8e6SNhOiK
         KguCzbWqz012gJonTLlAUnvFcaueyj5ASZzxScb8GrJZkSASkHSHNVSXq+8gBMI60P+A
         zlCJHS7BtaQZ+E+c0REc8n82kn7pRCwXtadoA2dwlLTV249StfrbLC+zWa5k8mWhHPL5
         WqfidMQKO5v3qYgoaCBoC5eVhpIRvHnUd5dNIr05axB0NIf6n6PrEY39SYrsjwUM+S46
         O87A==
X-Forwarded-Encrypted: i=1; AJvYcCXYADXOoPUCu83q0J+v51fJjiQMw81axMFrZ8tQmNux981aDLJ7NqvvfiR8pqQUfUCDXQwC/7ry+HWT1nY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZK+RiauqJU0x4egu9aVASk1SfJLT4+Uk1+whxp3uWy0yTiQQD
	PdkJrMNFjoCripW0wuFJQs1TOmAVluiy26FyPaKtl37sFRv9n8YLT40d5NNv7OKRSg3wZG0jBS7
	VxBaAxmHtegzDIgkfkA/PLhmCyCAEf7Y3YO31zaMYdQ==
X-Gm-Gg: ASbGncsUcbo8QbVC5kdkObPkT9FhWJKa6+u9qXR7EUw0nOvDBc+tYojkNZ/jmPZm9Uz
	b5x3T6rjbcLerSz75Dzn/rbh7SRyVkNj9IPKSnGYZzvZxVFfxHqC7nDu1XhyQR4fGPsG5wJdrjl
	02L4RUI/EBsc8zayx72pfRIGtKXSjzSj73WhpWYCeTf5A=
X-Google-Smtp-Source: AGHT+IGSwgYnrvr3g8aeRhiSjVHFD+1gNjjWAA5+wUJMnF+AzDSh1sGl53H+1ztLSXhG3Ujo7CEKSbOVGk6DthmnUAk=
X-Received: by 2002:a05:6512:318b:b0:553:2ca4:39e6 with SMTP id
 2adb3069b0e04-55357bd6ebemr1929113e87.50.1749129438604; Thu, 05 Jun 2025
 06:17:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528104514.184122-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250528104514.184122-2-krzysztof.kozlowski@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 5 Jun 2025 15:17:07 +0200
X-Gm-Features: AX0GCFsyHTy0xHTXMQQJYfVcsI20tWGrSxmyCezmfvwpOnDjuZ5_vrh0a2YdFDg
Message-ID: <CACRpkdYfQYzkU49eVhaWB9M32yTrCN_Lr6xFte0bSM91t3z3SQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: MAINTAINERS: Drop bouncing Jianlong Huang
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 12:45=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> Emails to Jianlong Huang bounce since 9 months, so drop the person from
> maintainers:
>
>   550 5.4.1 Recipient address rejected: Access denied.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied for fixes.

Yours,
Linus Walleij
