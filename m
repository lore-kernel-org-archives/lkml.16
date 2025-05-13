Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6844D253F1B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747134149; cv=none; b=NCNqaPuXueNCqq7HN6yzQiRtXsMOPzNOraCiObzHj5NkoJ1oWU1zLNpl0k5pTKBZNTu3OWB/65FEk3z7rEF7aAj9wdJYhsjk5VdD+JONxzqO84RlK435HlHtuAYlgYJTieywymh9YWrQUB7lNuHE16b97Q+5i+x3HfdYCy/+PYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747134149; c=relaxed/simple;
	bh=7C7FBJUy24pQwhj2ko07VwT/gjAy69DojfL+YvpqFQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EpLi2tQEWj/3QzngLJdsMIF+tYmm8lQADwIQNJndhWr3VgdHoBqU1uuoeM5enLspT1LNXYte1V3KPPHT4Dd0tfvzcSlzuL4SwUGsDHjRYu121xzYHM6Gl4dOhRiH1fHiB9aRHbxXkKEtPmtj4MU+3qyV83hVD4mzAZb665gkSZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kU9tSSJC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kU9tSSJC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-441c99459e9so36904415e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747134145; x=1747738945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIuQRYwFH70ryKEjus/+ycj00Kxpege6lANQjndQh/I=;
        b=kU9tSSJCDzPt31hjYnEV1dE7WlPnVyEPUVhZKleyyeAb4euJ0cMr51AG4A1qxm4bCR
         rFaGFML1ExSQ334c3qVEIVYL16NamxDb72K7OvHEFx2r/MqHR3YcrTb4+vTnRowKPG4L
         3Tq0hE6JV02Vcv4eRGWO1kobxgnVeZcWqb06mgiN7oGL7DIq7QfNUX+5jKpbsTRm9cPg
         XNPh3Ch2UtRL1WLw2XMBXHjhGF/IAyPHVWNmey/PD1tDKzkC4qKwGZI+JpgkjKUqncW2
         7QjeaMQyn5xgXiMz+6N3O43nz9yDcNCE8SBOz7/alcfKFE7T7tk5sgfDtQQ8u9ETv1Na
         3bxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747134145; x=1747738945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIuQRYwFH70ryKEjus/+ycj00Kxpege6lANQjndQh/I=;
        b=L5+miygRJg260wh4hadtu0WqcJy2kzLi7iWXkE9XMMleEeAZ6ypkfPClbr4Q0l2UXw
         ksvN47SW2TWPO4FxhsOpprxmceHCYBkBc3XcC4eEJUOLj7imZsKSonp+rN5lytoIH8EI
         1OfGVLQwmuIQrWWJQPQGQjCYYReu4amKOYrapDXSdo4TztMlR2MawdfG1PSUg/8jY4ji
         WAltXby6RfFiGVrS6yDajsFFd/EyUI8QOWw9W+YdrLX3JRbswI2ADRbLxs1CuogLRbIg
         02lq7p2stKyC6J23w0DYH5UxentCO/MfLVbjdhiCxtlxABlix5+4hJMX3TYhqJi/XW4a
         ZOWA==
X-Gm-Message-State: AOJu0Yxg33jbRgiNl+yXhx1hHLMNEGoL1y7zM88X1vCkgAbZgDb8wHMV
	On2Sckl5KjH1Bg3aRIdUAHPBRCAVfFay4Q22rt0bHVq9Bmta0CYJobVnN2Mr2xX7sE8NB0NQz4+
	b8bA=
X-Gm-Gg: ASbGnctK9P5t9vKMIiFLrLTF9JiZhk/z5ZwnW72jC7RiCWABoK5gNlZDT+jE2duJAar
	km3P3e41t6u3e2v/5MVzCrHs/tVON4Ag8M+WPO8sFtUZk77vP/1Op4UYiDeoQ1y1zgUI6k86dUi
	72QPy1o9ngwXdu6gBGTxCeyTx28nYAxhTTN/Q+pPq/XR8qfRz+lDACXqwHqo47QHcQp24WUMMgb
	zxR7wUJgDmrw5XetM7oynhnWzhCPyGW8yvK11AXOnabYzDi6sGN6QC7NFEXsyw1N6mc5QlAynpe
	383ACQdTlkztaawSk298j2RcLY9Ffe0zXSGamJ37eZVo2xG/kOHtmGYBinWIXfvj+oaWaPEEnx5
	OqrsdxqbQ/N5bzL02oe8wFNRi
X-Google-Smtp-Source: AGHT+IEzayTDLNTwYtqIT+B5aLrYmeyR5WNydDtXjj4rAfErOhIW1EDdBLfpwZ9AflrAt4ElBdrCuw==
X-Received: by 2002:a05:600c:8212:b0:442:d5dd:5b4b with SMTP id 5b1f17b1804b1-442d6de0e29mr170363815e9.31.1747134145222;
        Tue, 13 May 2025 04:02:25 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a2ca47sm15851252f8f.73.2025.05.13.04.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 04:02:24 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-kernel@vger.kernel.org,
	Markus Burri <markus.burri@mt.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org,
	Markus Burri <markus.burri@bbv.ch>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1] gpio: fix potential out-of-bound write
Date: Tue, 13 May 2025 13:02:19 +0200
Message-ID: <174713408244.11101.2931169841658120912.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250509150459.115489-1-markus.burri@mt.com>
References: <20250509150459.115489-1-markus.burri@mt.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 09 May 2025 17:04:59 +0200, Markus Burri wrote:
> Check that the input size does not exceed the buffer size.
> If a caller write more characters, count is truncated to the max available
> space in "simple_write_to_buffer".
> Write a zero termination afterwards.
> 
> 

I tweaked the subject line: should have been: "gpio: virtuser: ...".

Also: you sent it as v1 but it was in fact v2, please keep the series
numbering even when splitting patches out of a bigger one.

[1/1] gpio: fix potential out-of-bound write
      https://git.kernel.org/brgl/linux/c/7118be7c6072f40391923543fdd1563b8d56377c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
