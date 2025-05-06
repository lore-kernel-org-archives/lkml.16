Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EE2EAC7;
	Tue,  6 May 2025 05:45:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510325; cv=none; b=uY/XuPfEG/jitOccSLkF+E2BONc482IzPyMnR2kkbAFbONJ5gOqn0SECZvWtMHOSpfkOLlid79Oj142HQb+XA5pa1B5bWsrMUnELX3O7975yfAlcC0VfARTXTrjfKpMhfl4Zxx2ejhoZIF9wnC7qrzmZ5Ka+qtNcwPIefUtgqi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510325; c=relaxed/simple;
	bh=w+Da+BnQUlOWvBDgeGpYiWZ70src3MtM7cbEk+XJsCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UVckHTwn17mH5gtS76J+0CvxGN5IuiRp1yXSeie44cpAYV5FI4/EkyNmI6yBBiZOjTrF6j9QfyO1F56I9bI3YTqYjsDyWdrcHXJMKJiF8fRjic/vpUFNUZcBE+Aw1CojkvT/1eKcI5ydrRz1rZidkLBV5VNnVNef8vi3rXrIXco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=YZBe9hkO; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="YZBe9hkO"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b0db0b6a677so5018040a12.2;
        Mon, 05 May 2025 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510323; x=1747115123; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzOZk3IAQIFbUw4Ne76D3ImIMW3ziYe4M2KihJqGVRI=;
        b=YZBe9hkOHeNdCW7LW6f4FIPHtBAc/RSMa8eO5QEZ9FANhrl0RWr0uLMUuvR8q2Rx8e
         rUYOOxgW1JL3kgS9ia+s5yqUu+oTrK16jv1kz4WppGy8I0iPPZMuvWxbKirnA8UFFuhT
         aYwh1S31+rjjvuvKdyZN6NYo5eGVCo8MVLjf6SH18UQbhGR65G0NNKdLbRcszngOhVOk
         z5KzRZZ+W8WN0Ys3ifVI2xPjKnwMJRdBeb09k/y2qlDnYpKVis3rS7WJegq1QPzSQagy
         Fp+z3qNjRi4ROhYOuWIJ6QSUFjohMLWzpTDXq978hx1y+7GG57MGRW6ztJlHu4hGdN6y
         CTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510323; x=1747115123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzOZk3IAQIFbUw4Ne76D3ImIMW3ziYe4M2KihJqGVRI=;
        b=g2p4iI7mAbcUhyptd+GEP8YF8eV0Th3AubizOMhSUo1vou94qpmHP5YfCQ2Su1xI/R
         MUcxlFWGZ+Cp64DnZ/oQShlsPzSVKBuEJQai/W/p0QKJUulAps3e1bAMZiT4q4iwdD8D
         i/UEk4WWSoI9WxPegePi3VJvoq6g6TvV+cSpsVMRU7xpI43J7YxLOCoprtUYQ7uv5+Ar
         89L2Ki0OCoxnVp8PDRcrdyE232D8NgOUvMn/hAG0c/O5zAYzxnL8EVRJHPF2yAucmw24
         AvW+2kpcsqqcGiT14kXnk2W1/TvS97kaxHi9sAlQfD4Dtvv/YKRYUxXB+D/Bym696X35
         YZKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm+j30twRAR0HtzaUegXh7WNJEsMEY0EFJTEgyKIki5qG96gvItnP5ORImygtb6UoVohD1ttHoN9Bn187W@vger.kernel.org, AJvYcCXyuseKbleiRNOXbGPD1xdYjFHMiscmVyv0fhiGpLZtLiWq2cqw+lXO18bRA2OjVX5q6qsIC/X73qbc@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxn3SQHEvT87u+aO4HiOx04/CvUD2TPlw10cZZblz5IQXXU2qP
	0Co+lrQnt2h6YBBlIMg8daSFtGjoe/ZA2tekQTZaWKPP8X6qRSbueAwQRZSIatSw3ZlJe+xdrCI
	W+IerFEBBwRkMicPH0cvn0tBVe5U=
X-Gm-Gg: ASbGncvOTPLFZqD6iz+cPG5mIkW01psZ/IQkIb8J21Pg0wEeYTxZXpQTb5bvSXhDMI4
	mGKtzMhkiiQ+y0mQXnitHDoXPQkksjGDYoU52V6MKK6F4Iti8KDVRZLYRkH7b5O/pPE1IW5Ijr1
	7rR8Ap3m1ZCD/rV9tG2cFIQwQx1eCIGyAAt8s4
X-Google-Smtp-Source: AGHT+IG9+XTY5gsqEu/5VO21buM3ao3qt5hN1Shgf6am5MZstz3wz0os2aGjV9duIeZ0pFO63t5UT9LAAOodm+H5DxI=
X-Received: by 2002:a17:902:fc8d:b0:216:3d72:1712 with SMTP id
 d9443c01a7336-22e365af0demr27207085ad.48.1746510323601; Mon, 05 May 2025
 22:45:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net> <20250428-fernsehfee-v2-4-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-4-293b98a43a91@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:45:12 +0200
X-Gm-Features: ATxdqUHExb0y3TB0sGh-a9qJlHSjuGqizCi_ElK5QBzZ7JwOhNsd0f26AUxqkpg
Message-ID: <CAFBinCBLvy=jBBZY2XKnmWJAxhne=8VCMJnWjmA=nUBWM4p2fg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 12:44=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> The fernsehfee3 board uses a Ricoh RN5T618 PMIC to generate various
> voltages. Board schematics are not available, but the regulator voltages
> found in /sys/kernel/debug/regulator/regulator_summary match those in
> meson8m2-mxiii-plus.dts:
>
>  DCDC1               0    0      0 unknown  1100mV     0mA     0mV     0m=
V
>  DCDC2               0    0      0 unknown  1150mV     0mA     0mV     0m=
V
>  DCDC3               0    0      0 unknown  1500mV     0mA     0mV     0m=
V
>  LDO1                0    0      0 unknown  2900mV     0mA     0mV     0m=
V
>  LDO2                0    0      0 unknown  1800mV     0mA     0mV     0m=
V
>  LDO3                0    0      0 unknown  1800mV     0mA     0mV     0m=
V
>  LDO4                0    0      0 unknown  2850mV     0mA     0mV     0m=
V
>  LDO5                0    0      0 unknown  1800mV     0mA     0mV     0m=
V
>  LDORTC1             0    0      0 unknown  2700mV     0mA     0mV     0m=
V
>  LDORTC2             0    0      0 unknown   900mV     0mA     0mV     0m=
V
>
> This patch takes the following approach:
>
>  - Copy RN5T618 regulator nodes from meson8m2-mxiii-plus.dts
>  - Remove some of the regulator names, which do not seem to apply
>  - Verify regulator supply relations by starting without any relations
>    (and without regulator-always-on) and seeing what breaks when the
>    kernel turns off "unused" regulators.
>
> This results in the following observations:
>
>  - When LDO1 is turned off, the board resets
>  - When DCDC1, DCDC2, DCDC3, LDO2, or LDO5 are turned off, the board (as
>    observed through the serial port) stops running, so these must stay on
>    at all times.
>  - LDO4 (VCC2V8) appears to be unused on this board.
>  - LDO3 (VCC1V8_USB) must stay on in order for USB to work, both the
>    external USB ports and the internal USB wifi module.
>
> The cpu-supply and mali-supply relations are also copied from
> meson8m2-mxiii-plus.dts
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for the detailed summary!
