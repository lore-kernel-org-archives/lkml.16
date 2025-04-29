Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879DD23F413
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745944739; cv=none; b=GLDZN778awiO/THR8YGU5B6DevzdP+c9VbVFAAMbHk+5FGuCsZt6B/0xCcgxMEhaKfNTLs8Xj7f8bdsTY8gP4EJlAdr66eoTsSIYHDKJCaZr70I1vp/ZhkAp+GGdee9N7H+3rsq7NhVKLkzkyIMqkFJk2x50UO0brjP7HpZfpEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745944739; c=relaxed/simple;
	bh=hR8Y+nK0cX/CZdCBzLn+W3sfxRoUxjFKeCQdBb+BaYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGMmC7bPgFK0OPqd5jmIOyZ15Cn8UmgLH97GMx8Fe76HrbkmlSWIVM+d6qmNBFu21FPm5OhZDvRM+lbcyc0O1gbuf8vxbVvF3U3HoSdZU7ViFenSq+RnPzFWFS7UVK7ibhbXq56x1qFOe8gIaKVKpXxwgM55UCWaQB73h7Oa/WU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch; spf=none smtp.mailfrom=easyb.ch; dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b=a4FKzEKN; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=easyb.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=easyb.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=easyb-ch.20230601.gappssmtp.com header.i=@easyb-ch.20230601.gappssmtp.com header.b="a4FKzEKN"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e6a8aa771e8so5468624276.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=easyb-ch.20230601.gappssmtp.com; s=20230601; t=1745944736; x=1746549536; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mKJPPGmtZ4Q4FEXLrbVF+XChkMZLyTXErk0JCwdy/xQ=;
        b=a4FKzEKN+YLks3QNu8GVGLGXipONF0ukBLVeDOqGDULOPB8dCvDeDGrOrnG2RF+Hbr
         yj90RDrwwu4hbJr0gZpboNQ6SlQ1zmGb/Tj+8KbTvpeG0HhlV0AzKjtIxG3p9pFcFyTp
         ifIAYzatPar1wSeTyGSSSr/NGndkUv9h4DG+tSibE0LLbjDpvGtNL3n1FhTPw8PYIYGA
         ltEM8zccIR10PxRsidosJwORNXUeRMb0vFCFzaXakK+eYN2UMH+Fa/RBVpgbZMqZuyNO
         T/7ZwWvxkJUCihGYXtlNRY2V2a03DMeuEPDaWouoIeRKqaxY1ily/jHzf8a8vNuyVUUn
         cypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745944736; x=1746549536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mKJPPGmtZ4Q4FEXLrbVF+XChkMZLyTXErk0JCwdy/xQ=;
        b=reBSdE8X5CLf+3AVmV+5CisOj7LqsuHF3/aPTDaOvXbwXoN7uUGh/Iz813Yic17D2O
         izZdq8jAHPrXsgYd3LKMzMQz13+5tBgMoNtcrdQAbatJVOJzs+3cxpSA3YYif9pgMas6
         eTSAvkz3T64w761cvMdZHmz9p15zo7ga618zwaOw+gi933gxzVpQTfJRdykoyDB21NJB
         66/vBoLlYvgaff/d2O0R6NdLK0H6ZGnrfd5NsKTlJlYPS7e4HuZDvJnlcvjY7njRg5fR
         4Nc63m9cppjpOe86gyP5XSvdgFsKU1sl/N5XCSRO7NnRa58o6X8pDE45FoB6+mDiIgof
         f+yA==
X-Forwarded-Encrypted: i=1; AJvYcCW6+67Ehty/tSCrGvFllFSbYF6BHypkcVuVvRU5s+Y41jEVUYLecxOsFIYIhmgOm1TxLjX/zhl0M3RCDow=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpyRE2H6stzjoKNTQ5m94jcLfYejgLSDxij3RhmNRYL9qwtO1G
	mxagfQdq1XEO1D6vcgVDJZYGM1Ki09u0eUHwNHsG7YZTCWCb/7RIz+5CJynmMXfh5E8Wx55ChPa
	F3rQf3zJOKET2V33sJigrWjc5BDw3vh/mRoXluA==
X-Gm-Gg: ASbGncu6NL26s05EAB94jtspfJtk47n4bBh4DRVW37AWVMy8Mg7Sn7GfnuOVGfU7MIy
	5Ou+5GqAx0zUQXvnnJJxCryt97U+QaiSa9MfeaRMsifqyaPeh6yqt0AI9wp9TiFTKLdditVqCoS
	l80dB6ZNB3JQyxKksGsylyg71wteMCWWhDPTQ3+gMdgMkBxY4ny1w=
X-Google-Smtp-Source: AGHT+IEBBaq5tsglGxhuINvv6IZSxaRI9dE1eDAka1Xuo1qsb8GlnVfNRulVXOsQNgsWdqejnZiq9iGFOJQ10Z6pJ+o=
X-Received: by 2002:a05:6902:154a:b0:e72:a02e:a797 with SMTP id
 3f1490d57ef6-e73511f984dmr5201544276.44.1745944736100; Tue, 29 Apr 2025
 09:38:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241107125209.1736277-1-michael.nemanov@ti.com>
In-Reply-To: <20241107125209.1736277-1-michael.nemanov@ti.com>
From: Ezra Buehler <ezra@easyb.ch>
Date: Tue, 29 Apr 2025 18:38:20 +0200
X-Gm-Features: ATxdqUHV5CP1dNwzjt8THrj9C95bgv7pJhkhoTGKgrCVvTrrD0jY5bAxDeZ-Gnw
Message-ID: <CAM1KZSnvDqUHd2ENKyaZc=WyRgL18TrsF766_ZJVeeAiPth+Vw@mail.gmail.com>
Subject: Re: [PATCH v5 00/17] wifi: cc33xx: Add driver for new TI CC33xx
 wireless device family
To: Michael Nemanov <michael.nemanov@ti.com>
Cc: Kalle Valo <kvalo@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sabeeh Khan <sabeeh-khan@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Michael,

On Thu, Nov 7, 2024 at 1:51=E2=80=AFPM Michael Nemanov <michael.nemanov@ti.=
com> wrote:
> This series adds support for CC33xx which is a new family of WLAN IEEE802=
.11 a/b/g/n/ax
> and BLE 5.4 transceivers by Texas Instruments.

Thanks for going through the effort of upstreaming the driver.

We have started looking into the CC33xx chips (in conjunction with the
AM62L SoC) and noticed the following behavior:

# curl https://speedtest.init7.net/1GB.dd >/dev/null
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Cur=
rent
                                 Dload  Upload   Total   Spent    Left  Spe=
ed
  4 1024M    4 42.4M    0     0  2358k      0  0:07:24  0:00:18  0:07:06   =
  0

After downloading some megabytes of data, with reasonable speed,
something seems to lock up and no further communication is possible
through the Wi-Fi interface.

AFAICT nothing is logged, however, when I unload the driver, I see errors
like:

[16590.256433] cc33xx: ERROR failed to initiate cmd role disable
[16590.256446] cc33xx: CC33xx driver attempting recovery
[16590.256455] cc33xx: Driver being removed, recovery disabled
[16590.272950] wlan0: deauthenticating from ab:cd:ef:01:23:45 by local
choice (Reason: 3=3DDEAUTH_LEAVING)
[16590.784390] cc33xx: WARNING Unable to flush all TX buffers, timed
out (timeout 500 ms
[16591.296388] cc33xx: WARNING Unable to flush all TX buffers, timed
out (timeout 500 ms
[16591.808379] cc33xx: WARNING Unable to flush all TX buffers, timed
out (timeout 500 ms
[16591.816792] wlan0: failed to remove key (0, ab:cd:ef:01:23:45) from
hardware (-11)
[16593.840379] cc33xx: WARNING CONFIGURE command NOK
[16593.845172] cc33xx: WARNING tx param cfg failed: -5
[16595.856352] cc33xx: WARNING CONFIGURE command NOK
[16595.861159] cc33xx: WARNING tx param cfg failed: -5
[16597.872323] cc33xx: WARNING CONFIGURE command NOK
[16597.877079] cc33xx: WARNING tx param cfg failed: -5
[16599.888317] cc33xx: WARNING CONFIGURE command NOK
[16599.893069] cc33xx: WARNING tx param cfg failed: -5
[16600.400303] cc33xx: WARNING Unable to flush all TX buffers, timed
out (timeout 500 ms
[16600.912270] cc33xx: WARNING Unable to flush all TX buffers, timed
out (timeout 500 ms
[16600.920388] wlan0: failed to remove key (1, ff:ff:ff:ff:ff:ff) from
hardware (-11)

We can easily reproduce this behavior on our ATMDS62LEVM board in
conjunction with the M2-CC3351 card. We run a Yocto-based distribution
(Scarthgap) using the latest linux-ti-staging-6.12 kernel recipe (Linux
6.12.17+).

So far, I haven't tried to dig into this deeper. Any ideas on how to
debug this further?

Cheers,
Ezra.
