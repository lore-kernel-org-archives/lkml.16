Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF9E1DF735
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745883411; cv=none; b=XnliFjHrIDlZSvGaXkXiM6g1qZiyo1QaZeUbipFdOqj/QhDvlHrAGv4HA5t/dRdTW2pQai7vCriSWj/OIBz7ZjPXK6QlTiVIaqgyISLCFUGqpwyNGDvJ1Ff1US9tQc9BYjak6v/gzjgIQEnYBz1T1IzvZD+CHfPu2vqt3U5sSwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745883411; c=relaxed/simple;
	bh=k37WAKWj9MK4No/K2twFZKQRmU/o0AQNp+dOIiPpcTA=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQWaSMRgVfYKhfI9RB+8FE6GNX8hfwm5nS1T9O4JIv3gccvv0fhiyaHlEdMEn1YNH5kpQndgCWk6bIfL3nvSzGF24ZWKoLhA78pKR18lHQO6/AMTigivH4xxL67gMvm00K0RfigQPv7ix+B97nw8gBJCezCJpMQXiCcpiwNMcFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dKl+m04V; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dKl+m04V"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecfbf8fa76so75162406d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 16:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745883409; x=1746488209; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k37WAKWj9MK4No/K2twFZKQRmU/o0AQNp+dOIiPpcTA=;
        b=dKl+m04VIAsCnw77xxjQtHyVHuzckogaN9ELnisRtSE3j8OOpRmOVTL7iv7Eu5Ndrl
         lDEODEZ9R4msdpPltIBiBkKY7EmqtSMAJ3gOiQ4+duaF3gb4mXjmPA2oadoENXqnYeGF
         rEU4sDe7NsOATFvSyO/ugWgApdtgXTExOtRjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745883409; x=1746488209;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k37WAKWj9MK4No/K2twFZKQRmU/o0AQNp+dOIiPpcTA=;
        b=Myt/KsnyKuoXnV7kvR50CaqIe2B/3w/KSTAPmQHwCb6SfEDCQ2qVLZVhDq6H5EEfay
         yeMyd87g9EOjnRBqPacZZmKZ3P9GLyELCQDq1RFkn2UCjdwGBCCOQsNRcM3FlWsPoesw
         hHF3/5k3muAO1k9T1ZuMQZMy2Hn4zM9YQmQfGHYncDhIzKE06qOgFYP/AMTdeLthft5r
         7lQ3ZP6ZecDRCAUHedQhzjDHgNfeXxXd7Id4mJfP0vCW8JbfCphCGa1dhDAosFcgrglj
         A0N15CnOlXFfeWB5mgbQTIQBJTPeOnS2m2dsv8FChoXMKtaWA91gxgsEjgQLOqVODPWH
         1QBA==
X-Forwarded-Encrypted: i=1; AJvYcCUXI0+z/1DeQTE0oqikbvBc/xJzoAfL7vzv3xWTkqGNGQIDhbPm/t7jbynju/2YKcBHPVkb1AdYsp4roWE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2pI6VRYT0fOEqngjCH7mnK7KqyaJSSNO0eNVrHeVaxtnJOyzJ
	zYl8T2EmBDyvGcjDwk3Ejo2U4XkaSzVu7/UIivpDmjkr/GetBwzc2Yzu5yUwi9mJEgqRp+aoN1P
	+2JK+qeq80iU9MAQb/1zAf3wdGrT4whAXe4tc
X-Gm-Gg: ASbGnct8sKDeX8LxR6nuSL9tO9LvVCAiZBWptSQM+13uj/ObS+i0gyJpulZy0llO16B
	s28EPorZCTQCyjknNaNHCobe52lUlTa8Iu1aB9XAD8Jz5/v3AOEyfMI4Cpl6oSRC6Hi3aRTDZdX
	fX0J9DXxj67M/UMxajWkUq5s8K3zhpo7eRo9TmfQXjzPd6gXbgLg==
X-Google-Smtp-Source: AGHT+IFAV6Dt5wFCfoA6cMOB3MpMn43GlHt9c/t/48VDjhtKHnzic+oww3lMsF+lLiVKsN5rQEhaV4NlaHAZGDqPKnY=
X-Received: by 2002:a05:6214:2a82:b0:6e8:f17e:e00d with SMTP id
 6a1803df08f44-6f4d1eff0femr191352106d6.14.1745883409038; Mon, 28 Apr 2025
 16:36:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:36:48 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Apr 2025 16:36:48 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250422082957.2058229-5-treapking@chromium.org>
References: <20250422082957.2058229-1-treapking@chromium.org> <20250422082957.2058229-5-treapking@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev8+g17a99a841c4b
Date: Mon, 28 Apr 2025 16:36:48 -0700
X-Gm-Features: ATxdqUGecLQva0BYL1F9HfFnhP02mLVZfmOPIfqCxVFuGQnipmIIGxt7Bd3hSGQ
Message-ID: <CAE-0n51y0ZaxOe-pVdXqyoiBS2hA7JnrWLf_116dRkoMsiJvMg@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] usb: misc: onboard_usb_dev: Add Parade PS5511 hub support
To: Conor Dooley <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Kaehlcke <mka@chromium.org>, 
	Pin-yen Lin <treapking@chromium.org>, Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Quoting Pin-yen Lin (2025-04-22 01:28:30)
> Parade PS5511 is 4+1 port USB 3.2 gen 1 hub with a reset pin and two power
> supplies (3V3 and 1V1).
>
> Add the support for this hub for the reset pin control and power supply.
>
> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
