Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724D11D90AE
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 20:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738874627; cv=none; b=OyMsm964ccsXWJdV8M2QQchmNqGgTL8iqxp1qBb4DXeviARTtJPRvv1lSPSuMJGNlMAUaa3QEPULvjuQXaLI/HcKNBnL0UYDY6rm88EgEdf51JUsh3M2JbGB6ZekSpnQTcU8LXXCUR38vEBpTuHuVdh8j4xM6vr8PYkx4nxIBwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738874627; c=relaxed/simple;
	bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g3AqjI36P4TYAjH876fh/J2ubUpLMizJy5tcr0uKmJSoY8WckGVqdJVTJv5YKSLML9aC4LnTqObu+DOIQxaPutNFvnXAvS9cUwE6TjVCglk4djwAooDB6nifbEjBwxP8sJKM4HPbIVa48NXikgrb6aQ2uW82fs0u0eP2dYvUndA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VpdvU9Qi; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VpdvU9Qi"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6e8814842so148709285a.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 12:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738874623; x=1739479423; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
        b=VpdvU9Qi4JF1wHvut91sAo2uH9unLgmKOBEfJRN8Kk4VvYj+U6zot43hjvvgfT1tJW
         9CQ87LtUodSUD25bSJOLppkguLXy85C6GEo84/grB4ZOdi3BOb9jN5Sxf9JAlOJsbhy1
         EPxam1tWwLJ2VvbT4EIQmcTXugM4yabxL6G+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738874623; x=1739479423;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghMXVxcLYuC3amakcAM+2RrFtMQq4/vF5UL/FgqkJjk=;
        b=vUaSQdaWANujVp/k3nJST7WSi4a4E+AQbHQ3fTUdGdJOnL8fOvrAEKJ04RUSaav8nu
         JNK9O4DK+/6/5Iu3Gr3BAMM4CAnBHfm7bab9duJXA1vf7aYGWQuOt3Uh9auCkqEUPjfR
         hxvtyqyX5YLCNjHiniqyq7YZxqUIzR3kJaea0QjGpqi/mikBgrjMxds4Ptk11UR8JLna
         9v4UPLUxLJA7hHLHqmb36nPIw1Xsdiz9Yg3AxpkQD3cT3E1zAK68TeexMgQrOMVZLROc
         V05Iq3QQ8bHLw1eeqGrOqUEN7pUl9vntMBkP7eAnMX1PcRf8WgoMoZ1iQCWgMv7lX8yP
         ZdLQ==
X-Gm-Message-State: AOJu0Yy9Zw9kSz8g2PGBEjD3WFb1cSfqYFwBbtwnTxreht36D4ahyx+W
	Wro8OQppw2Iz9lKoPALhA0ANn35ImKbA1Z5NEN2S5j+JDJCITtB0WnUNbmpzmHsszs+7pfV4p6R
	nZuEISFQ62hgXIfPXUFWeY6hxFGiO0XbrOvod
X-Gm-Gg: ASbGnctNYgtysFU+KTKHlDvzs252eWNYEcbxU+W7pY2QZPp/IpES0AM3otr76hzFhID
	R6TLTOA7lYpT6gaVHGj2jJWXuuTNR/lREHcoNshfm+vZaGOmFHM62R4djbukQvcShBH9hqruU9z
	4cK1ixvVoxrrvtpShPEBz6CDio
X-Google-Smtp-Source: AGHT+IGIi7KHGakyYrhAS6Nm6sSDzZzym1yivy6eswLvWosFcy/m0lzamEPvxM2Mp6Z9Nh8JG+b4sn+mv4BnqJ62Jhc=
X-Received: by 2002:a05:620a:f15:b0:7b6:dc74:829f with SMTP id
 af79cd13be357-7c047ba4996mr111088585a.7.1738874623312; Thu, 06 Feb 2025
 12:43:43 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Feb 2025 12:43:42 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 6 Feb 2025 12:43:42 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
References: <20250205233016.1600517-1-swboyd@chromium.org> <20250205233016.1600517-2-swboyd@chromium.org>
 <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Thu, 6 Feb 2025 12:43:42 -0800
X-Gm-Features: AWEUYZk9G69zlKfea1G0cVv2Pso0fG2dCEq5z01lgx0Eou9Uj4laycjO7Oq51wY
Message-ID: <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Konrad Dybcio (2025-02-06 03:30:50)
> On 6.02.2025 12:30 AM, Stephen Boyd wrote:
> > diff --git a/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > new file mode 100644
> > index 000000000000..622e171b6b08
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/chrome/google,pogo-pin-connector.yaml
> > @@ -0,0 +1,68 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/chrome/google,pogo-pin-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Google Pogo Pin Connector
>
> This looks like a very generic piece of hw.. many boards (esp. convertibles)
> do the same thing, with 4 or 5 pins on the bottom of the device.

Yes, connectors are basically just pins :-)

>
> But of course hw manufacturers being hw manufacturers, many different kinds
> of signals go through such connectors - if it's not USB then it's perhaps
> I2C or some variation thereof

Right, and I doubt they call them "pogo".

>
> IMO, we could perhaps add this to usb-connector.yaml as "usb-custom-connector"
> or so

Do you have a device that could use such a generic binding? I can't
really design something in the abstract without two or more concrete use
cases. Coming up with something generic looks like a quagmire, because
as you say the signals going through the pins could be anything: i2c,
1-wire, etc.

At least this is a vendor prefixed binding, meaning a generic binding
could supersede this one later. The risk of accepting this binding is
low because it can be replaced by a more generic one at a later date.

I will move the file to usb/ so that it is more likely to be seen, but
I'm hesitant to sign up to work on any sort of generic binding for USB2
plus an extra pin used for who knows what.
