Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D5918DF80;
	Tue,  6 May 2025 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746510167; cv=none; b=RjmRI2TFzmN0hXuzufvhHw+LO8gCJHBG87eGP6fBkTo+9ofI6lSqOIqoVPJHf6StQu3fsgE8Hb83WZE3zb32bdabwqk8IOccqaY0t/Nfj+VKxA2L87S/+MNfgECTji369yfOx1kWv/96b3llit2ebtunMZQm6Jo3PrLJLY+Nz7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746510167; c=relaxed/simple;
	bh=w5PP8pPqPAlFWPzr7SqBRYCQHZuRk2Mb8hKI7hyMvQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tghj9gfoU3G2fu6683AGxTmQrU9My3N0L3r0wuecr/VF23t3VQAnQb7W24a/37590Uzbp7WHpyQMd/gXHzn9+OBowC5M9bdqIWK5PZ8ox2PUsZk9djyPsgscpL/HGt7uVTHQB7XHDC+sNvLtxaxTQ+/EEpnPhYXM5RHcrgvuIFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=RKSNA0Ln; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RKSNA0Ln"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-22c3407a87aso77799035ad.3;
        Mon, 05 May 2025 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510165; x=1747114965; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w5PP8pPqPAlFWPzr7SqBRYCQHZuRk2Mb8hKI7hyMvQs=;
        b=RKSNA0LnACSRcHFm8dM8NKqkQlkftEO2yWNLuEYNESSVVsEwWsn/6ongqBainOKWMp
         GLX6k8BnlCLWJdsxTaSCfRgGsUNeE1J6a/M2GFr+1Sh1Q3reUPL4HomNzhCzNytY6Hhf
         JtsDMGsQwvXr36IAOvI45N04bca9twsPIQbPze+Qys3X4Sv4cMBPz0j5SWyQY8wCHn5e
         i3DhDp8RZeiUSdI2TOI0TNf5mv/95VycR2X6GyDCM7MxqTOhQEdZnBFsARHhk4REDoEi
         UJu/4oulRTseL65AOm26kC0/4NxNb0ADl9CZE3qmUKO1QMhWDREuLiBXcwMHQesqZJN+
         0jJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510165; x=1747114965;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w5PP8pPqPAlFWPzr7SqBRYCQHZuRk2Mb8hKI7hyMvQs=;
        b=KU+1Kc4SCD1Gaa4gbl5tYLb+w+m5tCf3+HJz8Z/d3IpSCNYeuQZTIXs1fb+SCvrfne
         10tnRo3UPXtEal37QbszrKx1mLhkaWZx4GCqxCbhz9es8/iQA0ptAZvbqBYIhOhHh6uw
         QzuG+5j480v3iXkPu9LRJ7LazXOL1KvHwTT8JlKQe2a9mpule8buXgH7gS/2LdC1c0I6
         dfnAYL2ihieC+KCSUip48pxYUKQqgAkebrKZtUc5WF+SjW/wJo7q6rNr2aLSxFFsTFiP
         Qg8w0FhFDGaQD6Y9jhw7h6J/LGcEBbSerzeX985es2ctLVBlgzyLciMe9LqJNG6I5lyK
         mHAg==
X-Forwarded-Encrypted: i=1; AJvYcCXMaOgJMYdk/+Pa0I+ctRW+Ifr8e5LpknQEHFqU1T05OkcUZgwmcF9hmXF3bTuNJ45dpv/6a3ZxSib+/16S@vger.kernel.org, AJvYcCXtGYcu5hfgGMsO2ENDjaDk/5iGxUI0amOYWR9XvfFsjKvJ1CttnyVe+k+IXwe7506cbfgHRRJZiIqI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2C8kZnL9+/sCv1hPXmvR9t2CBykPCsR8DoKouZu6ZZTtooWgM
	fgRCShkXE2jPdRdJpnsA1gm8rf3EJgOXG235D3pOWYS52w7b3bZ1YmEGZ/NDgHntXCSlHBjVG4h
	1yqGYINaDvjZErwF1Mhf0VAEL7DY=
X-Gm-Gg: ASbGncuoLqxJ6FC6EoVbY3re1VN67eNLZ5qg9ZVwWIJIx9J78Mm4iyiRnZozH/aQHE6
	W5EL6210Xpeis/SwYbrG94mMkXIYyBBGmW61qKCIUfnoYjStuGI+NG3HxBJJYA7TK4EQPkhTbA+
	6ljGcUIvpRMsmd+Wjex+8Sa/gvWU3EUsVo8UNB
X-Google-Smtp-Source: AGHT+IHWCctdzwcMCj5ZjU40zivptT8H7299TSSxDfB5fLI/6Bil0HTVn5o/o/QdVIGdyzwtB4e67QWfmRswaQICEjE=
X-Received: by 2002:a17:903:3c2e:b0:22e:3c2:d477 with SMTP id
 d9443c01a7336-22e1ea60099mr185549235ad.25.1746510165582; Mon, 05 May 2025
 22:42:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250505143700.4029484-1-christianshewitt@gmail.com>
In-Reply-To: <20250505143700.4029484-1-christianshewitt@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:42:34 +0200
X-Gm-Features: ATxdqUG_EIknxuU7AXpA0gnX9o4lB6z8IXOJ4Kfd6xvHmWt15cDgq86uJeQsSX0
Message-ID: <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed
 for stability
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 5, 2025 at 4:37=E2=80=AFPM Christian Hewitt
<christianshewitt@gmail.com> wrote:
>
> Users report being able to boot (u-boot) from SD card but kernel
> init then fails to mount partitions on the card containing boot
> media resulting in first-boot failure. System logs show only the
> probe of the mmc devices: the SD card is seen, but no partitions
> are found so init fails to mount them and boot stalls.
>
> Reducing the speed of the SD card from 50MHz to 35MHz results in
> complete probing of the card and successful boot.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

> ---
> The same workaround of dropping to 35MHz is also done with the
> ac2xx dtsi; which has a comment about CRC errors being seen at
> 50MHz. It's probable this is the same although I forget now how
> that diagnosis was done (or who did it, Martin perhaps?).
Maybe Jerome helped investigate/debug? I can't recall and at the same
time: if it fixes the end user experience it's a win.
