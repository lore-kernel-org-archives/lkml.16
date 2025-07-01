Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2931F428F;
	Tue,  1 Jul 2025 07:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751356005; cv=none; b=kUwdb7UEnV+HON7khcL7GCYrUw5yF6VieQY/5nIP2KxtbldFqSjEHQWvGVifi5DUxCc+cphy5+kX1diezV7i2EMRM61oKye+zeFgR4irD34tpTYDFRQzSlu/bpOpCN4MyWFInPtvYIEMxmabnCMN5oEP/HvB7Ieawd9y+nERqHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751356005; c=relaxed/simple;
	bh=dyCX5o4Dg6QY3l8HSrTsQtDR0kFtbE32Z2wolTki55w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dhY0DHDP5AXQWZxjWtAmTs9zsLx161mRmopiljkDvZquuYn9F+6pc5mQ58xxHmsRPpR4SIIyGDyGIb8Ba7pSe2K3IMAEXsDWMiS7EeFVRiwCAlzGWHTkFu1ufXZa9RC7atevst0GbxNy0kGb2T/SqwpxPmu0KzBvYDMeDdXBWrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gaZL+nXz; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gaZL+nXz"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so11740375a12.2;
        Tue, 01 Jul 2025 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751356002; x=1751960802; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyCX5o4Dg6QY3l8HSrTsQtDR0kFtbE32Z2wolTki55w=;
        b=gaZL+nXz9orByOpBzl761kI4sTjRWwSUQSx+x9u3VNMTB6Ek7nLFED3MwvoaN4f5+t
         lONE7fyDv5iP0pof5+CFjPze5u+xSvizN8omhMTUDoy/GwNfZTuj8LacGEYg2+5LQYO6
         QuCNagBcEKLM1iVRAjD6vf4jmqQubifOrz+ubG0DVP+6ZXm1eQBMrHQn1fnPvEKrRtZR
         2N4N+nh/tFKJfWWHvw1FJaLwQGR5Ri2tzroDmBhN6GuIgkMYqgme4SOerGMeDxZ0LRJX
         W0Ov3yS3KIPtX43HxHKXaZra7ToND8ufiw5zOcl5wVj4AUqnnLTWwInIB8Pw7Ll2YE78
         KS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356002; x=1751960802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dyCX5o4Dg6QY3l8HSrTsQtDR0kFtbE32Z2wolTki55w=;
        b=PSDR6o0XAzCCLS3WytRZLbZogoykCLW4XGGxMSi8Pwu7Z+LZ168+Rv3FdPVpNKziDD
         WuarND+ib39WVOmcaqQ0SCM3HQ+26WJ5x9+CX38U/I8BQ8pqzjZbNXymd2I1yDxtwbjM
         i6aNHVMebzfVVge9+XwCDRf24KLjjNV+L08kDsr9J/1XJTkv8tNWQoKqVTCbAA3VO6Sg
         8hJu30K6Ow3QARUthAXPKW8rUxqXrm6UQHDPrY8kzBr8LDZHzEvYVocMPGEhhsLbJi+P
         1layEtBPvudkPZPwmMKo+9ARwPLEdC/guk3r/nNUQcKMsh4qRIO1oiNEG83jshPoLJn8
         OvIA==
X-Forwarded-Encrypted: i=1; AJvYcCU8kDOi78hzIKgSECLYp/yd3cexvUOoAQRmNOfLr3CRHlHbCBaSsd2xd/NbhG6L75eeHox/cMnBfrQ1VSEs@vger.kernel.org, AJvYcCUa78MfiN+sdhe5eJsORyXTm60+l73qVZGF0Fp9dSbW0yu3q3JlEd9zyM7SQjRVXzNLN5NaF281biKv@vger.kernel.org, AJvYcCV1CV2ii0QHI7884Jp5Zw5HMyECKWoEo+8rIhOttve+0uESpmr5zmgZYkDBPzPPquOY7vN5mH47Wh4c@vger.kernel.org, AJvYcCVRx+kigcWgO49tHCYauvhIa29rgPp7gDw3lu6CMvYnV8ZkSf0e3NNOaFM3nAqW3q7qK/7h14RE2o4a6ag=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+SL5ESFruaHgvfYWvEyFZcKbgaT3TI1IOdDpvVVXQjXJ9e0D+
	ufeoZvY2hkjW62UoXEljecp4AyfF7i/knpEjRIXh2zl4dYEpcD3ySHIRS839zjDvnZIEP52Vxy4
	VpIzUGn0ifKRKSR85fszPfLkTgNtpT2M=
X-Gm-Gg: ASbGncvtbkCzEGs/VaRh4uq2aiz5zoh3BrSSdNzKOli+r0fmuLuWkJfkXF5OEvpNhDd
	FSjhb0xn+Ad3AvixJRH/qwW9NmWelwnDpJF7fYyaiAbu90DFmP/dTpyOqKmrL29BcFujMArDAyY
	45aaJsp/0osQwIYipuuMpR7ieK9gctozHQAYanNq+LSDQR
X-Google-Smtp-Source: AGHT+IFdn8VEEQHDC8OasRXI0qgEnkqyj5lzRx6CSU9/4hWwZLvVN9kESBAm67CBFRdOqfMNoceln8a+BhI8D9pIt1o=
X-Received: by 2002:a17:907:7ea2:b0:ade:198c:4b6f with SMTP id
 a640c23a62f3a-ae34fd30a97mr1469575766b.1.1751356001813; Tue, 01 Jul 2025
 00:46:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250630112120.588246-1-Henry_Wu@quantatw.com>
 <20250630112120.588246-3-Henry_Wu@quantatw.com> <a2c8e8ea-4cd1-43ca-8973-ac7210f821c2@kernel.org>
In-Reply-To: <a2c8e8ea-4cd1-43ca-8973-ac7210f821c2@kernel.org>
From: Henry Wu <tzuhao.wtmh@gmail.com>
Date: Tue, 1 Jul 2025 15:46:30 +0800
X-Gm-Features: Ac12FXwsUlVyBrckRHAx_VI3BD8drXikFezbwgMsDj67FjJjWVGhfyaL4w7fzVs
Message-ID: <CAL3H=v17_h5b-7bFbnubJwAPOpS1xz7k-c7Mx3Ss9YXa8U+0Xw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: trivial-devices: Add mp2869a/mp29612a
 device entry
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>, 
	Michal Simek <michal.simek@amd.com>, Fabio Estevam <festevam@gmail.com>, 
	Naresh Solanki <naresh.solanki@9elements.com>, Henry Wu <Henry_Wu@quantatw.com>, 
	Grant Peltier <grantpeltier93@gmail.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Cedric Encarnacion <cedricjustine.encarnacion@analog.com>, 
	Mariel Tinaco <Mariel.Tinaco@analog.com>, Alex Vdovydchenko <xzeol@yahoo.com>, 
	John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>, Leo Yang <leo.yang.sy0@gmail.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kim Seer Paller <kimseer.paller@analog.com>, Nuno Sa <nuno.sa@analog.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
	peteryin.openbmc@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B46=E6=9C=8830=
=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=887:28=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 30/06/2025 13:20, tzuhao.wtmh@gmail.com wrote:
> > From: Henry Wu <Henry_Wu@quantatw.com>
> >
> > Add trivial-devices binding for mp2869a/mp29612a to enable automatic ma=
tching
> > in device tree.
>
> Nothing improved. You did not respond to my comments and just sent the sa=
me.
>
> No, implement and respond to comments.
>
I=E2=80=99m sorry, that was my mistake. I will update the description to:
Add trivial-devices bindings for MP2869A/MP29612A voltage regulator control=
lers.
>
>
> Best regards,
> Krzysztof
