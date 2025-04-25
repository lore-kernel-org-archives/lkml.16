Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4811B0430;
	Fri, 25 Apr 2025 03:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745553184; cv=none; b=YGwlv02vibTgVzZYBnlpH81SF9ywWj9Gpi4tcZ0CAKUP70Rs5YyBVPIN7kclcK2l7hy78W3mpw0i6i+YdxEblpt8wRVhP8SDw4ELL2hDAmDNvm4CI2917BsQ7dGXZo9DWo5gANyjU773zbJDHsbVGy+TxEy+ru2exrMqCLGrQtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745553184; c=relaxed/simple;
	bh=tMCG7PVJZT2ImV73Bv9BnKAx04gSVppKM7hgJ6w7nuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n09+2wki/bfMNY4t48L+6qGFK/8pq7SvGq9/UqWJrnevmronMOL6cBVf+1VSZtG3dLjhyJ/eIXSYVk+Zmnr9TtufftNVJRhb5oromuagVx+VwowgNKrwHfXM2XLSRcaMmlmc1Xj8774l/EQYKMRl512c6u3S1Db5vbej8JQti5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so1642002e87.1;
        Thu, 24 Apr 2025 20:53:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745553177; x=1746157977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tMCG7PVJZT2ImV73Bv9BnKAx04gSVppKM7hgJ6w7nuM=;
        b=uqa6P2kiF08OlQF1yWs9IsERerLzuC7a6Jkv3JaRtkyP0nKUGqK7SRbltpFrnjXZBh
         tYMQSTQQX2E4tKWgwjiikElka9LE54DzpHZbKKp0S4RNUgYsMFz7THQ7Js5Pviu9+FF/
         3IygFznYBP77r7BlFo99MC6ehQSthlRohMhs2iBchTaknF1DCZ+Wn85Fmt3wWuPIItke
         S2O1rxqyU/1px1pzJaV8JtIcZR1jCbGJkrfL8E/QjR5755WXQy9Ot/UQ5oe6e71C+p5G
         1c5iX1MSeNgXBEOYmEO3TRetCDI6WZZMJuXhpmqaa5TYsAyWP0k+xEB2wiWO+hYm7xd2
         JsRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQPGQCr9tTjLWywh85vWAKtGDv/T0+iJkFwFjzOMa6FCkH2WzuZBs5m3SlZ5X4htgK+lzYy2PX+piqoS5R@vger.kernel.org, AJvYcCVb4zux6ytmnbZvdSiBPSAY8iOWI6C7MJRlC26pjyILLIaJK3kWePYdQjSsuYS47D8aBJfRpNyRWgG7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5K9zxcwo0uixhyZtAq8jF1mD7LY0Fi9M6c2XAZQ2eaGXjMiOs
	iGdW8myMRY3b9wlTFt+xaYqJIta2f6K4qk+qogr/0mRJeWn/xOi4OhcZl5R0
X-Gm-Gg: ASbGncvkNHbWLV9vfvslrcSac4zCe7PQWPvIFKcpyhmCu2HGtKnSTBq99lXmrlCs1jJ
	tLsqmZeVBf+7f4HVSclsgb1EbSkSzItxpL3//6uADb/3XB1EQYEckJ4Xw3tJf6p9KkffOSC/b2d
	/yi+6MFwg2o2vDxKOkRcizYhbGcoiEhepaQ6LdlVN/3quJiyrAFSa0ue8ynAkmGxaUh/sO+k6fu
	+6lTYvgC1ItFPr1kBgZFDZeYP4iDUfLC7Krijeo8Ua0ICDVq6KYwdWL8Zy8vcOaMTDOfTFqzhh9
	Jf6paPfIC2uiunilPPefxKMwfzdr8qYG7PGOynLbJZTpmnqYnVHeOM4+l0NrD91W6XT5RGBPlg=
	=
X-Google-Smtp-Source: AGHT+IHDU/nOpkr6bjMwVQagfnFQlq1e13eHtB1E42WFuKNyPuR+hM3ww074VQg7AKEc7hV3kuA0DA==
X-Received: by 2002:a05:6512:3c9e:b0:549:5769:6ae3 with SMTP id 2adb3069b0e04-54e8cbcda64mr204433e87.6.1745553176615;
        Thu, 24 Apr 2025 20:52:56 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb25931sm438896e87.27.2025.04.24.20.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 20:52:56 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-30beedb99c9so16596961fa.3;
        Thu, 24 Apr 2025 20:52:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWGL1awKOjLlhwGeYfdis+ADzgrrokU4e7DoKEgKfBj3iNfHgJBMZBMHDNcPsxmRLDH5Tm39C9tN+JJ@vger.kernel.org, AJvYcCXwluFyTkijsnmNXagSbNneOv/xCq/K3YBitExITikeEjyvZ6tK5qCOlUlk6rZcsJ6G6SxPhjMPfexWT99a@vger.kernel.org
X-Received: by 2002:a2e:bc90:0:b0:309:26e8:cb1a with SMTP id
 38308e7fff4ca-319081da5e5mr1615191fa.30.1745553175817; Thu, 24 Apr 2025
 20:52:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425023527-GYA50272@gentoo> <20250425030006.45169-1-amadeus@jmu.edu.cn>
In-Reply-To: <20250425030006.45169-1-amadeus@jmu.edu.cn>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 25 Apr 2025 11:52:42 +0800
X-Gmail-Original-Message-ID: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
X-Gm-Features: ATxdqUGezFuhR_KSYVB0KgNvKi6facsIdDbC9B14oLs_hkhyS0lMNSVl4JE789M
Message-ID: <CAGb2v649ntfAEUdV5S1wM8nUGhvaOP-RBw07XcxwdbafbC2PYQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
To: Chukun Pan <amadeus@jmu.edu.cn>, andre.przywara@arm.com
Cc: dlan@gentoo.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	jernej.skrabec@gmail.com, krzk+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, robh@kernel.org, samuel@sholland.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 25, 2025 at 11:00=E2=80=AFAM Chukun Pan <amadeus@jmu.edu.cn> wr=
ote:
>
> Hi,
>
> > It seems I'm a little bit late for this, but while we are here,
> > Can we also append 'cubie' to dts file name?
> > e.g. - sun55i-a527-radxa-cubie-a5e.dts
>
> Usually we use the device name (without the vendor name),
> maybe sun55i-a527-cubie-a5e.dts would be better?

I agree with this one.

I can probably squash in a name change (since I'll be squashing in the
SD card slot fix anyway). Andre?


In that case would you prefer to keep your current patch separate, or
squashed in so that everything is clean from the first commit?

It's up to you since you lose out on commit stats.


Thanks
ChenYu

> Thanks,
> Chukun
>
> --
> 2.25.1
>
>
