Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F46244AF4
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 16:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739032897; cv=none; b=gqAT62w5yXhgcvfygZ2+VECtNFSyLxzLaIJOr+AnngmIZwy8QP/4tFrbuBgx0nsis3AtzL+CFtSJuVVuHqqbp/m7h2USaY1n/i9OJz4bSL5T54l5QXI/Z9OmQKA78VZt3+iqxQJT9lAYPVoVaP8klUAdKCNlTbaAkWon+wsrc7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739032897; c=relaxed/simple;
	bh=a4n+EXUYOHQLFBvK1XUVpN8sRe/78Xe4hiD/SY2RLI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Afg/c5J2IraHqkuMiTL0mLmlEljeiW/w/ZXDRF5kep6rtK1wJKF6LzNn4opZEckrel6v0oMs3evXjrek4DGhVYt7iz02tPb+1rMfdG97880J+eI4bRfMiQUaf+InGC9dra/3jrz2kfcIacGo2C1ToxVm6lTpANSN/ZHaro3jpUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UCYEQ/T8; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UCYEQ/T8"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-21f74c4e586so5728455ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 08:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739032895; x=1739637695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vXCjsjIchj4ClmE8mkIDMpox5dmrDwmTJqUAgxNU5dQ=;
        b=UCYEQ/T8ght3C+Oc8TL/qUAQTLX/xJtSso2SrvpU+IbczbGBgYMU6T5TWFaNhxvSGD
         Wr4TfCH4pdPCby7QrTJm43YPbJktVVlrE6D/Ss99mZ5XpenbDBQCaGsvIYiG4VEJSf9/
         tjoQymLaUgrt6lYKzqVi/vgwDYJgE32FCmZEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739032895; x=1739637695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vXCjsjIchj4ClmE8mkIDMpox5dmrDwmTJqUAgxNU5dQ=;
        b=DKBvxaAjj40RQ/uP7f0CaDza/OzJ/aJo0WCbGQE2J4qkJls0l6r2iREX9LtAWyqkFm
         G4PWnyjLgEVraSM6nvCQGBem61qxpvIvHL6o8N9YE5rD4UgyEB0F4nsaOVlpvbWtrPug
         wn8c92flGFmMV9uk7hsVTTYC7Lgdjx/dLyTiWdJSe4sWKsQdau2QXaB8IvLZfpbE0ne4
         WqhTCuTuW/1wE/8iCbcbMU2jhxRKNq5tT4W9sf2pBs/yVHuhGaXSpOmmhiUArvBndWSd
         DbwJkvD3tz2XPF2J/3CbuCUE8CaDVhmIdJPul/r4ETgxdFR7cgJ3O1Fdu5Nbt/kqqkoE
         Cp7w==
X-Forwarded-Encrypted: i=1; AJvYcCUWkDGBjjy9WtX9mQi8j5ShYofOML8f2bhIUy/JKNDUXTMBUenOGU3dtiEjwjqlX5pjjnsGb5w0pY4WbtE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTR50kNcSa4vp1VL/bwyEKddQWs5DY0daHByzDkTkMPiWOoyix
	sx3a2wXOW1EtTAd/1k+f6u7zvqM8foW7EPcQ2ZQOUmZXG67UD5wNUgqtIwHqYQ==
X-Gm-Gg: ASbGnctmLm8xaVHNYCLzsZlMlhiYvjkcKabm/Ipx9z1SA8kOpVfw8eqFZXlw8wCA2B1
	SFQ1FaSkRCOjW/hXu4Qrkz1ATfIGGLsj8fDo9+wQ/sWJxyPxigVMm0SZOOfvBlkee1f4SVBEu5C
	uYcEMvN0nQgDvje4iKAXtsq6U6ihTN5NeFPW4iVEeLuFmPJeuLPSp0zGdw9CiHsm+q7MjZ4eRij
	va/ZfxTlmM+tfB0cSVrRmk6qX8Ce1QRU5DpEXag8PtThgFSGFBTigNwVtHLYJUs4lvTzviNhjOS
	3iZhJjyjMA768SAQlw==
X-Google-Smtp-Source: AGHT+IFgi77tH3wA01tZZCz7a+5y8kuCdm5LYnkR+qY46E3GAn35GhJb9PnwYL0bHM9MBXsMPLcUjQ==
X-Received: by 2002:a17:902:e547:b0:212:996:3536 with SMTP id d9443c01a7336-21f4e1cb73fmr137616885ad.10.1739032895636;
        Sat, 08 Feb 2025 08:41:35 -0800 (PST)
Received: from google.com ([2401:fa00:8f:203:139a:254:3216:daad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687bde1sm49019555ad.195.2025.02.08.08.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 08:41:35 -0800 (PST)
Date: Sun, 9 Feb 2025 01:41:28 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Yosry Ahmed <yosry.ahmed@linux.dev>, Kairui Song <ryncsn@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Minchan Kim <minchan@kernel.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv4 02/17] zram: do not use per-CPU compression streams
Message-ID: <2ckvrkhhioezkjscvwvzclspikstx2sreglsyie5bi725fypdm@bxxuqtulk3gl>
References: <20250131090658.3386285-3-senozhatsky@chromium.org>
 <CAMgjq7BFUrUY5Xq5Eks4ibqbWgJcca1vqB4kq=otQVyG=23FRw@mail.gmail.com>
 <ryc3rgu567q44d3ck4un5itf77i2os4rqx3ruohivaqscn3rrt@ms5xoipyi72q>
 <CAMgjq7DKveiCJVb4ACSaLFV0Q1_Yd+sbL_X2dgXz6QGYwuNRTw@mail.gmail.com>
 <ysqyikz2jhnvjkhmkgwekbmz6dykvjssut6n3t746tpsscursu@zc6rg5xgk6sp>
 <Z6TgSaYIf1DnOszP@google.com>
 <n3k4c6qurl7vuqenxhmtxtitkeszohrcpauobwxxc4cpgbfujg@jxrinduvof6p>
 <u2o6c2zgtsol4uc53tnvi6xeksmhjjgo7xwrs4vg4wade52mbk@3iss25tlosau>
 <Z6Z1_XxcoBnM9E2o@google.com>
 <kaprll3vfmf4vxy4zigkooytykz7my2pyf4jajyxf2m7fpygyl@wgs735yktho5>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <kaprll3vfmf4vxy4zigkooytykz7my2pyf4jajyxf2m7fpygyl@wgs735yktho5>

On (25/02/09 01:20), Sergey Senozhatsky wrote:
> So I moved lockdep class keys to per-zram device and per-zsmalloc pool
> to separate the lockdep chains.  Looks like that did the trick.
> 
> 
[..]
> 
> [ 1714.900906] [    T172] Chain exists of:
>                             ptlock_ptr(ptdesc)#2 --> zram-entry->lock --> &zstrm->lock
> 
> [ 1714.903183] [    T172]  Possible unsafe locking scenario:
> 
> [ 1714.904463] [    T172]        CPU0                    CPU1
> [ 1714.905380] [    T172]        ----                    ----
> [ 1714.906293] [    T172]   lock(&zstrm->lock);
> [ 1714.907006] [    T172]                                lock(zram-entry->lock);
> [ 1714.908204] [    T172]                                lock(&zstrm->lock);
> [ 1714.909347] [    T172]   lock(ptlock_ptr(ptdesc)#2);
> [ 1714.910179] [    T172]
>                            *** DEADLOCK ***

Actually, let me look at this more.  Maybe I haven't figured it out yet.
