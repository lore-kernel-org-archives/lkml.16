Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7B923E336
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792200; cv=none; b=AoKwFfssjGV6iMp+S/yCAhUh7I0tEMkG4GGHwbzmJV7aizwO1YJMDQ7Shd3h+hZ7vWRbL/OzlGKvir8ir84rq6vKN478dANeMw0iwpTi7ZfZ41NX2Os8j9JNAFKoCe0qauzlMdQTJbGWzVCb9KmsC5FCAhMyjHa/1I0YnfXtzr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792200; c=relaxed/simple;
	bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMrQKHEAgM9FJwZ7ksG6IBjqw1Xl6mHZJO5uiGAQsAdhBU6Kdtri19jmPHB68IT4hks0Uu77rkcrWU17J7/dzDyjNNM3iOYlzo5QHnSRfm6Q3W8W8riI3tqMn4uABZzJo25WYxTMBU/0vxPH15LseixtVMiy6L31W1CPNztW6dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZjcTzL41; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZjcTzL41"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b855b468bso9646261fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792197; x=1751396997; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=ZjcTzL41jB/kZUDeGngOmfr8licR23+YP+SfM3Ys+9kcbEEP6bc2tIjj+s6116mnmU
         RuDni2ms8BfQWXYh6dftypJB1I+IQqRs+x/KSVFaEe1OMt1Stmaefr0U53JT10HdA80n
         uGIMoJew8TEQ/GGvEOnmE34ZUsYKd20dbQDCQehcpqDrDx5gec4hyUNyELwBb54yVIHf
         CtOJtdHax65go4A9Iq5I39SMIG/WJQ8ycHbYBxg0/yakDw6WevKP48ZHE6VI5udjlTGz
         mm71jxAMk0Ag74PY1wlTUTsVzXxEd6QtPF2978R1o8G6CDSBHCm4tbpVDh+v7ni9Mqsg
         R5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792197; x=1751396997;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1IoGx82bNXS8SQk73EDpLUekVy9W1YtsSOWCGgpVvuw=;
        b=Gt05MMhndD5je+zz5ISsl95Epxw84IN9E4utG4akuI6R38Ul/ftgfZIFDzslEXaNX6
         2t6yJDzErG9+g7VGWJKtO4B2J8yWRe29Qmyp9GPxfYpBDqR0QTzbJTwwHI7PMN1abynC
         KPOP8SYnNhzP0w4SL9OvA6WuRGC3DWaNLJuhSdob+JY/5Em3r3RM68JidvTzQFsmI/je
         2GVhNSTv8ovEeYPaEUfMl9y4DIbMMQnlS6TKsjbFi47K3mug+P59kTyZoIuuf4y5E/Ce
         y0sjLMJ7aoJH69i4YHk9fYGXsMopipTnAGW8kdcChSStjNHuLRFV8pr5N6wuhL6/iKxy
         WNyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWL6ZdlMWHsi9bW/g6tZaKLB1qkozscfi3J9OAfCq+iVWByJDRGiDVYHejtvHQ8RU6y23c+B0OoljWk/78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ROpx3a8em0DVUAhr5DXg0wq7IhPbTdqa7kocV0gi4+QAJvep
	pLGwTzd/4mI5b97yPYY0Q7SxuH7Zl1YU4i/DqOYY9XI9s3dxJ+uhYYejRhwjQE0v8874ct1wrq9
	44fQ8JEW57QQCubSIziOoA55ac7y7p6WHXvCF/5zaJA==
X-Gm-Gg: ASbGncsBu7zIZVNxXXZLO5/jj8O9LDhd8Vqx1PNyaR3L6clLzMqK2bXE5dSCL5rcp08
	0VRV4HUDqDtwA5dVnRRemd5chPCdv5EdGXhI1a+sQfec6QObNSJuQraNLthb6T1PaQiS8Gl1V9I
	SkGRtJ80gRmIQOI2o31iC6hCOa61nXKOMxQucWSuO9UJQ=
X-Google-Smtp-Source: AGHT+IFYV5tWfAirZ3xGznpIUaLpWBixuh3VvEydLIyjUMUfbNZ+cH8IGpZnstfzUOBltBpSOosISbHrdrVWXJsPv9I=
X-Received: by 2002:a05:651c:4181:b0:32b:8e4a:5710 with SMTP id
 38308e7fff4ca-32b9906d535mr47675041fa.34.1750792197208; Tue, 24 Jun 2025
 12:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
In-Reply-To: <20250619-gs101-eint-mask-v1-0-89438cfd7499@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:09:46 +0200
X-Gm-Features: AX0GCFugxTy5C8vSywb43SRY5CIYHYmTk1VMWuSas72eq14vY73ndiufDbScINw
Message-ID: <CACRpkdac0sg82LFV-Ub1Wnbpq2jTWgAVXZzCdTqLakV_4GkFbQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] Add support for programming gs101 EINT_WAKEUP_MASK registers
To: Peter Griffin <peter.griffin@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	William Mcvicker <willmcvicker@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 1:18=E2=80=AFPM Peter Griffin <peter.griffin@linaro=
.org> wrote:

> The following series adds support for programming the gs101
> EINT_WAKEUP_MASK registers for the 67 external wakeup interrupts on gpa0 =
to
> gpa11 (alive and far_alive). gs101 differs to previous SoCs in that it ha=
s
> 3 EINT_WAKEUP_MASK registers

Looks all right to me, I expect Krzysztof to review and queue this and
send to me as a pull request.

Yours,
Linus Walleij
