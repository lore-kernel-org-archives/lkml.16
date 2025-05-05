Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2ED127467A
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 22:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746482653; cv=none; b=U35XGHlWORkMenbgW3NfrH2scflnoxW3EfEwObuZ9625TJI7lXzDmTbN3x4ZBtLBRQ7S8dHtQVVLZVxx9CCB8QR2k0g7CdfvtMX0NlqplXuVbvxAcVrqD4agB4iuAMQV8RXCYjYqiU3a5KnQrAJqycDN9gDYU5sxqhlgDmdLZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746482653; c=relaxed/simple;
	bh=PpdmoR8nEkrIKtA42MWXyNQ6DvUv1NTQJUJQQ+3vaZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iEpxtDWfj6dlasQnXhH3ywIWJcOyTFf1LFuvoYOGumvXrvu+ioycCV2Hsr/PbpB6szxzMf2wr83jjGGgqseKbkUt3RNLs+OWia+VtRbdToQ3zcN+QDi4hed1+S+k2nXlXF8yN/SoTLnaotU0w+sR6V77l1fOomDtz7NR1N/KvMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=us4AIZLQ; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="us4AIZLQ"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3105ef2a071so51031511fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 15:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746482650; x=1747087450; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PpdmoR8nEkrIKtA42MWXyNQ6DvUv1NTQJUJQQ+3vaZI=;
        b=us4AIZLQIE3Bps1t0B5O27A8EgKK8gRfkBa01nrOqZkA5mGkw+TrdYeA0PlfETqw71
         S2p9O+2c2U/wYKtTBeZKzLyKK7efoNuXJyaUAE3bwoZiI1uJjfyVQnrx3OfM+aFcmOqz
         dVrgxK6gSx0gLavKYhAT/bHG3LLWMSRiCPd3RZs+5+k425kkbTHySEWpUibMNhp4vuPa
         zDqC/GI2/by5tHgjVfyn0NnysJMFDBWq1+mzRz4hm8/fS30M3yCScZsv2CZysZdNp+PF
         rRCLyaZsKvIRS7Oxi/pfBKYe50J2MsAOVKmJUW/3RrCRQJiVDDW1H+JG0mTLNtrRatME
         Q2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746482650; x=1747087450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PpdmoR8nEkrIKtA42MWXyNQ6DvUv1NTQJUJQQ+3vaZI=;
        b=QlxyFLHglsKiNhhMKdoc/e7w7NOcWFtOTpo6s79VafxRIsbJkbASGYf7hxVkaMU2RR
         rf1IOdSz9GDxJjndGq17lyV/wsMyaAHqK8532z/tGdjWi9GK7BiR/CdLRA21nJZy5k4I
         qSQUXwo4IMTp0oxS6FnIFWVy5ZQddlr+2euTmbQdDarbZgWhCyRK8yK2dCooP1J/2Jig
         shCrEbeIa8AcSngN0uRncK+ibk910VWWRWfPNS5JBm5p8nInSrHFzRizedcdCrzIP7dy
         dU+r19XYD5p7vu0Z7wnMkXCfTjPkOojonE9HMImXvbC6NsTVFY4H5AUC/W5KQKmKRPX2
         8eAA==
X-Forwarded-Encrypted: i=1; AJvYcCUuuQejGmbQ2S/phADjpSRV9uBVLDMEYBxg3kQ22wkQY/yjh8Z3PI7IhnNU0kncFUeTbYkjr07w/h7zTJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwryLLTJ7MD7vv8EMfUqRUzIGZCY7IfSHqKeb58ZptL+iP2o+2P
	Ll/gEUK4Tx1H0JCUbkmbmzYKScNtDLTDIeYrqLjk/WminYB4N1BmEb09PXWQHOtGnkS6Ok10z+a
	xoXvwMRatDg1CAmNb2dVbt2jMiEZw7fzVaIXdSQ==
X-Gm-Gg: ASbGnctLbMtlV6Az9pWEUQHJZrE5sbGyEaAndGI5KytSRdWBzICOumi7Aim/2uHPgIX
	jDv4hQ7pqRtTd5x82i+a8PXeBAp2vA0nOw4tqFSFiWwh7PEkUVFQLHGDbGzXeqN29nbZ70tCUIR
	BuYoiChvBbYXwqbnaXuViYvQ==
X-Google-Smtp-Source: AGHT+IEHFxriErzJ6KWZ4Dnlp4ZP5W2Iyy0QEY/BgIwj3zLpxQz0U2At8oBYxwGceOg9dDWjzWeX9nJUKs0U3r9gdWc=
X-Received: by 2002:a2e:ab1a:0:b0:310:85ba:115f with SMTP id
 38308e7fff4ca-32650ec80b8mr3872961fa.33.1746482649729; Mon, 05 May 2025
 15:04:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505144558.1286889-1-robh@kernel.org>
In-Reply-To: <20250505144558.1286889-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 6 May 2025 00:03:58 +0200
X-Gm-Features: ATxdqUE1cM-taJ4-SlbcCYbnOvbDEQV7s-gz28KDyeQW4mI3XtkOG49fIqlZFsM
Message-ID: <CACRpkdZgB4sg1FtDK3QTzKKviPhoCZ8xwP92fV0WGhOBWyUMSQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: Convert
 arm,versatile-fpga-irq to DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 4:46=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org> =
wrote:

> Convert the Arm Versatile FPGA interrupt controller binding to schema
> format. It's a straight-forward conversion of the typical interrupt
> controller.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
