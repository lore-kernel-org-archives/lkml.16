Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE41E493C
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 10:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751019467; cv=none; b=ndj2hVwNjSMAVlgff0JdsTFzPXlhZplFYO/2AVZwYiibZoMqtM7NyqkQITYSp15dycwJMxP5XieqTjPEq8j25yMVa1q/Sw6q61m/JX4cSXSGl9jOjPkBIoDEXgDNDlYUHNFyzaZ1IDbX6Zxhly+jtkO71H3yctl+NuaBziNKmdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751019467; c=relaxed/simple;
	bh=X6Vz3DOquqc8dg6Ek4Np2dQQDqcv3D9dZDjDNHBtZIw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mNerTPHu85GU5dO/4OJN7YrchoF+QPX3th4NvnFnF/2nxqraf4RE7KMMCMqIBHuRjKSwzPP60N+ax6burU8yZZxnw3DTxeKoaC3GV4kzLmgK6o6SOqmY97DQXoL/yBV1OinjY0WYMbI7mEcRUlXdRDa3z/QKk47kYGoWSRyNWFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ugfxDErm; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ugfxDErm"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4f858bc5eso1385087f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 03:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751019464; x=1751624264; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=X6Vz3DOquqc8dg6Ek4Np2dQQDqcv3D9dZDjDNHBtZIw=;
        b=ugfxDErmyELvLREfYnobf+is3r0Z9FoyDFSy5H9m8A/OyfSlexfDrg4on8sysuI6tQ
         /gMCyn4iYmDopQFe7Jq+KUD3LPIECL7Y5b9VJETB0bQBs8u51msjP77f5pxijAoCoeOD
         6QYwVzeR6+6WAF5vtMaFX1VQwCOASqX1A2i+kZwtZCMHr6kCEXCJyXYl/M76MmZt5Chw
         O8QHuyF9jRhHhipIi3IYDIqiS4qCwm6yvrMCyRVm61jsr/Qaiv19mQgKqoBP1Ka9oaDa
         EnxYZz5WSJsGMANoaHzFh9O/ExY/kAcXH+11rP3Z0q4RU8ys8I/2u4rXr3uUgNOQap98
         OGrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751019464; x=1751624264;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X6Vz3DOquqc8dg6Ek4Np2dQQDqcv3D9dZDjDNHBtZIw=;
        b=BGIColg6XydY5zN4qJG/po5gsDiMwcysxwWrLxES7N4cybPdPDmSLibXtEycg7TIRD
         tpzRb++7SP4mqOd3AwoE0ozFhO4jWdgnmDxulFZ6V4NCP5cEDCdVSaAv0PnDW8f6VhWY
         ouVa20z0tslZVv3u490z3QHIqMk7iEM6afvnlvFJJ62AfMGFijjkKKz1tF9+W5uSguuX
         fw8wQDzfn9Wccs3MN9r3/CefXcZcIUqwJaJeGyKaPlGKSQV803hi9dpnTkm4AfR7/0q3
         I1pzKilvOUQKm2b9BqGDzKKSXFTytJ9U02n2wZpmV5VGd3ah0TBkkt+taX1QfGCdX/Rd
         Ussw==
X-Forwarded-Encrypted: i=1; AJvYcCXiQ2gzmsGULeJve9OuFGPGw6ajkR79mJTSRZEnSZF0hoWtRFGdKmEDNipBlfO/sgPEknYuX6+WQJs1hKw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIVMAsQaAk/QBvztYaPd2j9/DysCWPfVWDOKDOjEFsSfz3cCgo
	5ZUhwBFkFDKzmfCay38zELI/PhcQEpjx8RArMdN/L1pPz4G0vmyvtToRA1FS/GrIZeX2i049fQR
	PGuOUWIDEJR6odg==
X-Google-Smtp-Source: AGHT+IEPAJuicPK7FfhCMymhJh9zeNLMFabJIARCoC/y7wW+R0dC5AIYe+jPOaR3l7nbhV3dBYOtfDMnHdj1Aw==
X-Received: from wmbhc10.prod.google.com ([2002:a05:600c:870a:b0:43e:9aac:5a49])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4188:b0:3a4:e740:cd72 with SMTP id ffacd0b85a97d-3a8f482bb98mr1597668f8f.13.1751019464358;
 Fri, 27 Jun 2025 03:17:44 -0700 (PDT)
Date: Fri, 27 Jun 2025 10:17:34 +0000
In-Reply-To: <20250619-fix-gdb-lx-mnt-v1-1-ad2ba742048a@samsung.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250619-fix-gdb-lx-mnt-v1-1-ad2ba742048a@samsung.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250627101734.1287929-1-jackmanb@google.com>
Subject: Re: [PATCH] scripts/gdb: fix mount flags for lx-symbols
From: Brendan Jackman <jackmanb@google.com>
To: da.gomez@kernel.org
Cc: brauner@kernel.org, da.gomez@samsung.com, jan.kiszka@siemens.com, 
	kbingham@kernel.org, linux-kernel@vger.kernel.org, 
	stephen.s.brennan@oracle.com, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="UTF-8"

> Fixes: 101f2bbab541 ("fs: convert mount flags to enum")

Thanks for this!

Tested-by: Brendan Jackman <jackmanb@google.com>
