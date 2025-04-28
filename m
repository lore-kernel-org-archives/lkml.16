Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F478C1E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 19:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745868778; cv=none; b=PH73UhzTKK2Mgr31bUTFqNpwhqFwizC+ekPhM7NI6eLsDA7fRsIs0Of6EhiRVpO/Ah7xruYycb4kswcYEy6htCQo3P4qhVia5OYtJn89pIUoQMQUI3VCspHXbTe2XXhKVEfe7oHRUbXWMtMgSi3SSRDmj7j+4BKqJyA971jUBfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745868778; c=relaxed/simple;
	bh=Y6n23dawAWFH2JLNBPqMIuR/bd0pb0K07Z82KXD09aQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Twy1R5BphlhSUddUvPLiySGOwW7iOPWnyRvvMFRk9EvJcAZcp0cEJ6W3BPmP7w8uS7H8zvJR5dKeCOHoko1YbKtw0PTFkmGW+OPT83pdLuJXvk6Ec/2Eag/9Va1GOwtKD34xI8zTYlqUZUfjqR6HI7IQCF6+Ott7zjbuFN/v8UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BKodFuoK; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BKodFuoK"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2295d78b433so56166925ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745868773; x=1746473573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=BKodFuoKyZy8EeF8JGblYjA4dNh7RUvbhVYB4VOiJuAtCloHpwPo/hNawAYITUwYzP
         Bz0ttIaUuhb5txq6vLM+Sl9/v1FgytfpnKy+Ya8YGXtTlDgARHf2r36Di/PUYcAE/WI0
         kspqsYXLB6hITEOCcJg3sW26Qp5IJt0K6tlCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745868773; x=1746473573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mfzpR+XCt8jA2E6ve9YtKygB0tbO6iFuLJbvzZ6DwIk=;
        b=HeRXdtJpFWg4/kmb0GE/TWIZPTTNtphGEUAmWQYLp/e4PddBh5AW6ma7S0Bfj7N8Bp
         0auqXtADji2llW83jDXc3+iVC0tSHf8WORmlB0ML94YgWfWEUqogDf7xBZT7eiom+zn+
         NV8lkhxWn+WbvVXJOF5Ul57bJuECO6FOa7F+aRdJY7KvMfRBAL0MZz/VGt48+fIsuR2d
         vFfu1RKrVd5ICnqUD0onjWDyGJ0NnLFuKO+cl+IHlqpFzEMfopnnVC1BZh6SLuA2lOSw
         /Cz5Zta29Hj8QtrcVsZ6c0BaaxnU4ajP61Ovp2LbcfrwxFTayEeGOdUSBzEZOiIMqenF
         QCjw==
X-Forwarded-Encrypted: i=1; AJvYcCVSJhKRIv5F5b1xBzmKhrVbT3q/r1kbTZVBHBw+CBvqVnnLu5WDJiSK8bfW2sOYaLooUSwj+4ziStlFMAE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0ltaRPgYG+3bVN7Xwc0O+GtuMpfXmiIYBwr+dF4MhjMCwN1hU
	ONEEStvx7tO7rGLWTlnePhmlv7gDKAB5RWWsdbrYgT8gq+8cX01DC3Vp1+F/J4fUMB+jjkJLXcs
	=
X-Gm-Gg: ASbGnctbfsdLH/TuMyk/lBVfo5kMeZKclk91Dc7G5bkQdjenuSquE6XGD/f88bmi79r
	haZTTlIvYyUtTpMDmUzEGOMrHCFCB1N18Wv89w48/4fpZWrxUZNNvFeZLmGFZlxdZUXd53a50Jo
	p6+9ZT9RrKZh4GuXa6LeflILjU6U7mLOxP8i50vWm3VCPS2jSA3bVMtGLjJJ7hulMehkuEO5/TX
	U6w1tFtYL47XHrkLp8zyX5z/77T1GVyLSLZ/weJdOcrfRLwLin3t4PmAASeDaZP+U/DlQHshjzC
	UhQ5b3yrrOol1UbXBmmChn2n87k93rxX2HlZSs9h8Oj8vpJ3fgijboCsBpQqKaf/3zyJ9gCVLdw
	0BzEqkSVDiRO6UdheJ9U=
X-Google-Smtp-Source: AGHT+IGJ+GmNinwhdGaGycWHizhk/hWVEHMK339wghQFUqcNWHjpf27eVy7VO+9nWeQmQKyvtwWX1Q==
X-Received: by 2002:a17:902:f60e:b0:224:c47:cb7 with SMTP id d9443c01a7336-22dc6809c39mr165024165ad.0.1745868773400;
        Mon, 28 Apr 2025 12:32:53 -0700 (PDT)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com. [209.85.215.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4d76e16sm86817775ad.44.2025.04.28.12.32.51
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-af5085f7861so3876282a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:32:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVxEFo6pBHn9DOSE+y7UInibFMi/xeP3ojz3I0q7QD17bZvpfasOiNxHBlZAbB52+WQYJ3zOhEabZtd9ec=@vger.kernel.org
X-Received: by 2002:a17:90b:5490:b0:309:f5c6:4c5c with SMTP id
 98e67ed59e1d1-30a01398884mr14674637a91.25.1745868770606; Mon, 28 Apr 2025
 12:32:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250421101248.426929-1-wenst@chromium.org> <20250421101248.426929-2-wenst@chromium.org>
In-Reply-To: <20250421101248.426929-2-wenst@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 12:32:39 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
X-Gm-Features: ATxdqUEnTKoRxhC-TaBEXil7UFoCr2GvfRCzsqwspS2g_INzWAwlvG_Di1SAl68
Message-ID: <CAD=FV=XLonF5qM+f6diESvnqAHKm4Y7wwPsNssdNqZfkn2OzSw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: HID: i2c-hid: elan: Introduce Elan eKTH8D18
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 21, 2025 at 3:13=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The Elan eKTH8D18 touchscreen controller is an I2C HID device with a
> longer boot-up time. Power sequence timing wise it is compatible with
> the eKTH6A12NAY, with a power-on delay of at least 5ms, 20ms
> out-of-reset for I2C ack response, and 150ms out-of-reset for I2C HID
> enumeration, both shorter than what the eKTH6A12NAY requires.
> Enumeration and subsequent operation follows the I2C HID standard.
>
> Add a compatible string for it with the ekth6a12nay one as a fallback.
> No enum was used as it is rare to actually add new entries. These
> chips are commonly completely backward compatible, and unless the
> power sequencing delays change, there is no real effort being made to
> keep track of new parts, which come out constantly.
>
> Also drop the constraints on the I2C address since it's not really
> part of the binding.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Reworded commit message
> - Dropped the enum for the new compatible string entry
> - Dropped constraint on I2C address completely
> ---
>  .../devicetree/bindings/input/elan,ekth6915.yaml     | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
