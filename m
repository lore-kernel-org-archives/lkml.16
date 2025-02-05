Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B811228383
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 08:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745989; cv=none; b=Y5EdfUtXVClhAiuivPKaDvLDyVXUUA32Fz51ya7LkAOaHCXzcpIs9rSXxquR5jPoiNfGtAepndBhtYZrlg4fCwgcytOi6X4Lr2ioclXAn+sVkjbn5Cs8kZHMprEBjbBORKVw8gMI4TMoHUZnciB9u1TPW8zNtHW0LaFMAD6u/Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745989; c=relaxed/simple;
	bh=4rdH6GrIXB8lz8HjYqpZ22C0ajtDCyflT20HUHPnBBw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eAjsmQkhAvHlkck0JW4DdCxan8zmnEUTLPEGlVENMbmLIBgLP1dYshStz7vJvFpT0EwusVM+uedy7cKSuhjxKO5p/BKv+PtAwo3pukCdRppMZvI2BIABqmCGixvwHUmtvV792G5qB1XkrCe8jf4zfW4I0OhScYyLhMuty7E2wak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qsTZvYSf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qsTZvYSf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-436341f575fso75683125e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 00:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738745986; x=1739350786; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5wmjz18zqFyKr/G/A4DW/iVZd6rNAAhBzVdAwovC+Hs=;
        b=qsTZvYSfA2iAaSvNAmjNIfOyMh4C4XDBJbJ8lEHGaDffN7K8UItLD8F2opmcBQGBbU
         4OvshB2mP8fSP5DC/dJouuENaIueeg1zN1v/q/ek8n1EhT9kaJnL+pq0ESMyhS5QXApi
         u5nUTgUPgVrel3MlJQ8n1kSiwHvoJyVjLe4T6QDnA2cisHp0ty/SoTB6AN7jczb3zCVU
         GczYmndR+a0IXfCqlvWXB003PQn3wApz5cJ66kr0/dxfrsFZKh1x6TYblP0bggXNbHuy
         7te44fmlbzVnwfi0zPYVp7vTM2QmmM8Veoy47SGXZr0kCplpWUjfZefVgHl6JRQQ6Eto
         jEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738745986; x=1739350786;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5wmjz18zqFyKr/G/A4DW/iVZd6rNAAhBzVdAwovC+Hs=;
        b=Y1SK3aqj15LkVVjF1KWPLbSBaGalM5fyk7PX5bMkYwmnYiMLTnmUrcmqr7o8pBU8Fe
         z+zuMp8MChdZOXS5wa20SwWTqu0whpBX+2/IYjBo3wlh9N3+/CqLbjoEleZuIpm6bN3k
         KnBkCCNIU1MXHNopX1xXioySbH2bF0mQ288UPXt4VFXDun4qJsbcKTQZiQt0HclWu+JS
         1dWkTw/neGQa7uFsb9WTRulMyYvK6bXWLGbwAHLe27ANSAjTQ8Hmxmz71Qyd2EAqTrYO
         OaEzvjlKrcwEXN2Wch0l3U3NRu4BRhC+XUKdM8filNhLx/8JsmUXy9IwfLW4iRBRS2i/
         rv2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhnVqXr3JCCkmD4fersR0JOtmn3Zm8LcCWl0cRsd59GPyKi73AAj/xADLOuu8MiubCwFXT+Nu7CAAomz4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQqb+ZA/pMPudm7Gat/0LB/SGslVlvTV6Uf3clz7tNJ2zD7SJg
	aZ7TD2tCB4lksE2UlkVAs1jobF0XId8Gc3MJpX1T+g+XeYxWZlEMlR/yTNAJyP4=
X-Gm-Gg: ASbGncs8KdyZnUIIT9I1hgtgivWMasBEZMyvMLj3/7zL0hBQMKlX/gA/yfdWDiHSIwY
	7IabejOL3oGFtmQCRNNkJRI1eHX1e9eDOkdR9lQdmS1BpMDIoLuEe0q1m4j3Ne96Cabx9JGQD8V
	SSYiCZ8jmcIBljHOT1tXCBatp0Daa8k/fsL7WFOcRHyxhiLc8IPkW3K5Z8xImg1MxjjZUp7B56F
	6xTlcHqiqmncBrfdGQgB2xe93gIHPv/Rt+MCbW37E3EF8kiyw01n3a1uaF+xnIYXySu0h3X+d2Q
	3zCKTyLPlJpSHyI=
X-Google-Smtp-Source: AGHT+IHvujR6ocyaWXRib9FJP8dFsztpMFdYT+nb0yAfmtcuRsRIBa6C6+A4Dxp5o66bjEcIRw+i0g==
X-Received: by 2002:a05:6000:2cd:b0:38c:2745:2df3 with SMTP id ffacd0b85a97d-38db49009a6mr1396467f8f.37.1738745985676;
        Wed, 05 Feb 2025 00:59:45 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:a766:1fb1:99b5:1d5f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f1b570sm33940815e9.1.2025.02.05.00.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 00:59:45 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	Danila Tikhonov <danila@jiaxyga.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux@mainlining.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: (subset) [PATCH 0/4] sm7325-nothing-spacewar: Preparing for the cameras
Date: Wed,  5 Feb 2025 09:59:43 +0100
Message-ID: <173874597816.7784.10623106141376200723.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250203111429.22062-1-danila@jiaxyga.com>
References: <20250203111429.22062-1-danila@jiaxyga.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Feb 2025 14:14:25 +0300, Danila Tikhonov wrote:
> Nothing Phone (1) - sm7325-nothing-spacewar has three camera sensors:
> - Wide sony,imx766
> - Ultra wide samsung,s5kjn1
> - Front sony,imx471
> We tested the UW and Front cameras by hacking the IMX412 in our fork and
> they work as expected. Wide is a C-PHY sensor, so unfortunately we haven't
> tested it fully yet.
> 
> [...]

Applied, thanks!

[2/4] dt-bindings: eeprom: at24: Add compatible for Puya P24C64F
      commit: 78d9ee370ed33cd8b662981fe1f47cff7b4f0e43
[3/4] dt-bindings: eeprom: at24: Add compatible for Giantec GT24P128E
      commit: 03480898cefe9cb5ba921dba9304703f7574b687

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
