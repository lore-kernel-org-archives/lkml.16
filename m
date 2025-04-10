Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC3A1D5CE8;
	Thu, 10 Apr 2025 16:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744301742; cv=none; b=F2AkZXtvXpfeVz/C2lYAeDjA6ynetxBaS/9mzDzVkYvjV+Yquu1wt7M0kCfJobjAc5shvd/tA77uN2SUnzZsL4sRnxHVydJhT387EMo9Ha4um3p78deeUQcs1waxRbyIFjZFEYMw+OX85MhpS9Ld3/9LAmgvxY7vw82etpE4tcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744301742; c=relaxed/simple;
	bh=u2TlwBOzgobYs6NU9vBkdIki+8FEexHtdbsjNxa1jqY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uoEDEwz5WSrNMTVGlObdbF1tVZhQ3RV/IQzJkpWqPGrHYQ7U3DA1kYHqn0HhZezAg1spxdpgcjKDwr4h/kNu2fkpCcfVdFkt9igr7T7IZhtFPgpDYxiOt/ulMe2euqvhKpmEEDM2x/cxKtz3DcpvpSJZmV2tAyCYbgdRgAd+8Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c54f67db99so210286485a.1;
        Thu, 10 Apr 2025 09:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744301737; x=1744906537;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w8EsySpJlSULS66RCfJ+UHS8bmbeTZRzNn9o+t8zKEs=;
        b=iScbnFnvHDLCxXEDhlAftPSpehDPozSH2KK0PR0NnBlcp2ui1TUzrhRakh6QuMjLmA
         OU3YlRd9IBsrn8DaGax5UQGJVQNPWEQrmEQYlzLkYIBaGUPumkrUZDUjgDvust0zQ9+S
         fki2wUte+MtMqLLSLbvtaZWbWwUxM7BMAc1WryUziWOBJg0RvUDqP9Lxp7bM3tj/9wK+
         qDFUhB0/x5J9UNWA23iVDJioYg5ZlV/XSgvbxEzTctgxO0cn3FmKd/dSveBNgwsTdQCH
         c7usAQpoghhztyGMums7dgL/Z0kR1+9+RV7Ra+28+KRpARmGh4KrB98UcE+nFeyZXTjf
         P26A==
X-Forwarded-Encrypted: i=1; AJvYcCUtGoHCLPaHvFMwpJ2xQ4RRDdWCduHNw5pyGYpFG2n/I1hr5rG5g19uqVC9/Y1M7iIQAeOsAhb1Ul9Tgqs=@vger.kernel.org, AJvYcCXQEwaOlYAQhDN/BuqIQcNn2xC2vSt4WcYk4m4sM77vX6IDTgB0W0ebZ50mryoC25wjRKfnh0GuPaXR@vger.kernel.org, AJvYcCXQfOonv4miQSHvYe9t9jB1V3rOHvhgiZp7H7TzJBtRXBBLr/K8FqtA85CsG8asraKXH+QuCF+LVGOVqXqR@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtjQxGkSZCbHz9uOA16jkbecmjXUuimWSr01rutXTYNDhkeMu
	ax9mEYh5wKBBrqGIcc+8NdwJCHkCwfMCmGAsrfvuO43UDL5pMa/12K3ni+V85ww=
X-Gm-Gg: ASbGnctCdn1+F53aZbtPilHPG5oW5DRxdXyXKo5QnZm1HXlg2BFT3UcVxugSDx1Ht3n
	4LCE7glyWdcvnprp7CwrrRnT8AU5nXEpo3v70+K8WqJMeUabYxvIInzOxCahKUiTcrQ4CGb1jxX
	7veNhDfwAn44vTggTmQRM3gyO1+f9YsUuHPRxbC33WZqv9GqouaKjKeOiyyXiUYX8O2SthBnDTe
	WfYpnT4paUTBJjvvz6KLdMLo4k07ljL6P8/T/ONJ02OPnwC1XSl43rP9UBpO4kiyXUdtwdPP/Bw
	iwNuj7UeMEnEiUJNsVgkIvCDKbrpUh/zMxdaLcfi9+LtfpafLNdKWJO5TtE8bM3nLrRVEzpZOxr
	b+vDDUX0=
X-Google-Smtp-Source: AGHT+IHMU8QCbZ82jkl7oaLNClFAAowOSu8lTPHBSxxXabsnF4oAGM4j/n3afgexRoG4sxGHOFu4hA==
X-Received: by 2002:a05:620a:4094:b0:7b6:cb3c:cb81 with SMTP id af79cd13be357-7c7a76b9749mr469780685a.18.1744301737110;
        Thu, 10 Apr 2025 09:15:37 -0700 (PDT)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com. [209.85.222.177])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0c608sm109294585a.93.2025.04.10.09.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 09:15:36 -0700 (PDT)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c5f720c717so212425885a.0;
        Thu, 10 Apr 2025 09:15:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW+SyqE1cScBSnHpHwe0bMHVaWEU5gtGvy5j4uOXGF2hUxSj5DC5u4ISbvqhhkpX4mBmVSW9sPtdJVEWlcp@vger.kernel.org, AJvYcCWPum97O4ee4vAYsZO4Yzm/NOc1SLy6ybtckjhOx0uCqTuu2mqbJ0Gjh4T/E87cpXaaLNATu1/cGkcB@vger.kernel.org, AJvYcCXmV8zjhyedFbDaxF7B7Ysm1xTV0g6C7hkOI/AZYREcOwpsVmmAWppkvTWkwTp3Ble0HwLzWBBVzpFhDus=@vger.kernel.org
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id
 af79cd13be357-7c7a764cb6bmr497107485a.4.1744301736084; Thu, 10 Apr 2025
 09:15:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240223-moonrise-feminist-de59b9e1b3ba@spud> <20240223-blabber-obnoxious-353e519541a6@spud>
In-Reply-To: <20240223-blabber-obnoxious-353e519541a6@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Apr 2025 18:15:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXXWSfDrrQUTW54FFHN464efe+672jyCjqYw4jpSPosBA@mail.gmail.com>
X-Gm-Features: ATxdqUEct_QnFBksOgt38puapdCm8A8IqZn3f2lKjQY01BE-SIP4uvm6YbHt3Qo
Message-ID: <CAMuHMdXXWSfDrrQUTW54FFHN464efe+672jyCjqYw4jpSPosBA@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] regulator: dt-bindings: promote infineon buck
 converters to their own binding
To: Conor Dooley <conor@kernel.org>
Cc: linux@roeck-us.net, Conor Dooley <conor.dooley@microchip.com>, 
	Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>, Patrick Rudolph <patrick.rudolph@9elements.com>, 
	Peter Yin <peteryin.openbmc@gmail.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Conor,

On Fri, 23 Feb 2024 at 17:23, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> These devices are regulators may need to make use of the common
> regulator properties, but these are not permitted while only documented
> in trivial-devices.yaml
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch, which is now commit bad582f9879812bc
("regulator: dt-bindings: promote infineon buck converters
to their own binding") in v6.9-rc1.

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml
> @@ -0,0 +1,46 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/infineon,ir38060.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Infineon Buck Regulators with PMBUS interfaces
> +
> +maintainers:
> +  - Not Me.

make dt_binding_check:

    Documentation/devicetree/bindings/regulator/infineon,ir38060.yaml:
maintainers:0: 'Not Me.' does not match '@'
            from schema $id: http://devicetree.org/meta-schemas/base.yaml#

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
