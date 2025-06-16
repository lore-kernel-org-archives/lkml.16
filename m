Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A080B2139B5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750107609; cv=none; b=J8zceKShsvhX0kYmlMw6Ya6B+1ymQB4de79/zsZunjc7OCmksgjLKy8ShDPWtMPr6pXW7IwgEquwHvGl61owfhtWSKp0Jx4WNLuCfsnR83XrRjmApsRy8qHqInUrDlx2NmsQWdPXFbHiMLRWNNiVQT/pIqnYFY2URxFR0o4p8ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750107609; c=relaxed/simple;
	bh=85V7IA2aISIwTDOJA3zCDbzaPGLMrAlD2eCpQ+pTtCY=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=Wg7d6q3DMViOzomZ81I6/Fp4Y2z9QxNU/XEKmGphpt2usFCW6fbFUeHCbdy8gGfEVgkBF8MAwPL2rXCjDnaoHfnkCklPlqAUY7IvdxpC54pzPz1/OlKNtUQqj9ZOgzlQ1/6HRJqjz7BDLahXovrmfODVl+8cHhuJN5Laz47M4vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=LX89Feo+; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="LX89Feo+"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7caeeef95d4so551116985a.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 14:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1750107606; x=1750712406; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=65voBFu++KUxAGnb17CUWd/eEc8FRKpL+JgvnIz6Rz8=;
        b=LX89Feo+52pF37QwuNRSqtLtCdIxpG3ehzgXg1AzH5HAeAA4IbflBPFfo/+UT03ae6
         uQBGvJ94MsLCOBAvPhFNnBHdEPWIGaFh5mPjBVn6BlP0te/8+oUtcHnHXKaOiIYQNepX
         ZyBsjRzk/zolnlNdYwUlEAzyDMQsLUc8lHphTo9J3PPrqzp9VP8wdW55Q/iacsJdijGW
         GS4v4BucndWqyts+r6KyeCCT37wYwN/2sDG2aZz71zUGyUjJZsOAX1lmDcVLZdnFWwCF
         hhitpJFA3e1lGqdf1lMTTUq/uP+loqHNpkuKBiTfF+WywJA7ZAauMfMGPlaxywLVxfXQ
         d/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107606; x=1750712406;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :mime-version:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=65voBFu++KUxAGnb17CUWd/eEc8FRKpL+JgvnIz6Rz8=;
        b=wIYdHpBxARmuVqyloivS9zZDHKMaELTE3WwenFgr0vSJN+BqQLo6GG2NaCT7n6tH+m
         /7SfxwT5k81X0simQQrEpYtktd2Yj6Ia73xlI9p2HuvCXM6l6GbrnvOLsJjVqlJ26Wym
         2m13CjUflp7PcbawfcZ/s42HGnYMIJwuDG3+hqujfk72mDhRDOdc0OsM1+IgwUhhAWtQ
         MRVDlIKW8yqJp5VCnj7ibcgOiCg7cOSnKo8jPV8p++QgmUuiYit7Y+ugB+V8VQ0of9T7
         O+Ty/O1I8ggy29GJwMyqweY8OI7BUUfyh0aQ/BsTYptKpHr7YfZZugIkE/U9Rp2rs9RC
         Z7Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXO1H+3IhEXsWWxYymnfVzKp+PlAZqtVLmDL6qpNWTd8AC/EwPfEZCpKFCF5H35Vc7XSeX3cAwfCKYlZ30=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Ht7TU8XZB9pzzLV48V/tmv0Eizq4/eJcVEInyXw57qWOaFKL
	mxDd/YqSdhrkVWwOE07A2Is9lzcePzsrw6pxmGzIfGwXp8ZU9PDOWrX7bTgdnFggfQ==
X-Gm-Gg: ASbGncs7MpQ48YTCAAwIWkuLGOvQlzFtx70oJxstxedN1QscUYU2BjUfShsZeXrVcbA
	B2T4fjtNcQg1gTZRsBsRLPzlt8FTNqPUDGpQDkyjgIDVsLFlxlDLOgNBczFMRxsC/FAOa78LWvA
	u/dfbgpa0bMC20vsZaJhnoS+L0w7HaCBaOupD2lzjJ9/QrrvgNFdJiXHnLIIDr/Xl6LtTuVBg7C
	23e+QueYtQqR3QJqLJUuqGZ8YqQRwhMi983LXxHn+Hl25OaTAbSgjHpU2/e/MF10ECMXGMrdLTY
	ATHN8ked6OSWomkrlYtUROalTNoZy/W9lq8AvLhrgrFhQcP36/lh7BW7lATt8mlyFkA1KvS9/Pt
	DzNKJBIQk1FLtm/oLEp1MXaI5QMdc/50=
X-Google-Smtp-Source: AGHT+IHaG7XFRU2VIYe0CJKJvqwGmo+KTaXV3iT3aOl1lxbWuUv/pC/6cFlxEol951+BgG6B48ONvg==
X-Received: by 2002:a05:620a:f13:b0:7c0:c469:d651 with SMTP id af79cd13be357-7d3c6cff2a0mr1547477985a.57.1750107606484;
        Mon, 16 Jun 2025 14:00:06 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7d3b8e0535csm569975685a.41.2025.06.16.14.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:00:06 -0700 (PDT)
Date: Mon, 16 Jun 2025 17:00:05 -0400
Message-ID: <baa9721a34d995cbcc9f7db5c9eba531@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20250616_1212/pstg-lib:20250616_1001/pstg-pwork:20250616_1212
From: Paul Moore <paul@paul-moore.com>
To: Richard Guy Briggs <rgb@redhat.com>, Linux-Audit Mailing List <linux-audit@lists.linux-audit.osci.io>, LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org, Linux Kernel Audit Mailing List <audit@vger.kernel.org>
Cc: Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>, Richard Guy Briggs <rgb@redhat.com>
Subject: Re: [PATCH v3] audit,module: restore audit logging in load failure  case
References: <9b7b21e5f37f5718fe9176a36ebf670bbdfdd54a.1748462545.git.rgb@redhat.com>
In-Reply-To: <9b7b21e5f37f5718fe9176a36ebf670bbdfdd54a.1748462545.git.rgb@redhat.com>

On Jun 13, 2025 Richard Guy Briggs <rgb@redhat.com> wrote:
> 
> The move of the module sanity check to earlier skipped the audit logging
> call in the case of failure and to a place where the previously used
> context is unavailable.
> 
> Add an audit logging call for the module loading failure case and get
> the module name when possible.
> 
> Link: https://issues.redhat.com/browse/RHEL-52839
> Fixes: 02da2cbab452 ("module: move check_modinfo() early to early_mod_check()")
> Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
> Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
> ---
> Changelog:
> v2
> - use info->name for both audit_log_kern_module() calls and add const
> v3
> - use "?" rather than "(unavailable)" for consistency with other records
> ---
>  include/linux/audit.h | 9 ++++-----
>  kernel/audit.h        | 2 +-
>  kernel/auditsc.c      | 2 +-
>  kernel/module/main.c  | 6 ++++--
>  4 files changed, 10 insertions(+), 9 deletions(-)

Merged into audit/dev, thanks!

--
paul-moore.com
