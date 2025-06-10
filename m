Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E856293B76
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749560244; cv=none; b=qPLgW/Y51ZgB0pSfwFWtlT8DZy/l9OE3w/xEQQtMVtsPR1qxKY1GGCWqZN53VWsyNf72xOQuycFO0gcuZecbnTc8UHnOWb2dEsatVG7PDLqKa/FzCGaUio4DJD2Gcb1I01UyqO1aBoHCczVnZnouvQVYVGAD6ei6dcSyg+v4GrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749560244; c=relaxed/simple;
	bh=qhIVpEZDZOmir5ypQGJPM5AKAogRaLno5vHtbx9uYco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bm96HV1YrazRhONyXiwTW/HkZxKCRSy+Hr+78RIApTXD+O1YhDEExSchAn8IEw+oFRnwWAc8mqWurjiGPADXyJScG/C7yLoGdX869HfZonsKuDAjQxMBFVRll7a3SAmkeiXTOF52pzKe5A5koo5Rz9n9oPOtUTS/KF804lgPPdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iw+pYu9w; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iw+pYu9w"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-607fbc13725so2778109a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749560241; x=1750165041; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CUkJhWRp3L7SGl8YQInLtuEOp8CfW807ly4f8cXAKNg=;
        b=Iw+pYu9wj8TPnjtMho6jQXgdksId+1akOTNdyrRNkjp//ulZJygzb8PR/ptjfENVEI
         qug6n8lx5eEN39bQeDG9LdswoQDdg7oM6tPa84afyw/Zwf58Z+Q10R3ezILP38VgBNfO
         lj/6JHFZTa4kdC0TkJElVfoiBOW8k8tb4UMBiZ3sqPVgh3hjBzsQV8EHramZhcy/pqrF
         ySDl7jug2TIDUOj/25BZqQOoX3A1qbYbhOeEU1NnnEuVlrqlcmJB9WWlIswr/rUtafI7
         bIf7a+zyhni8VvJsMj/V+BVS1ivtdMQFmz7M9z5H5COhbIbZgd57LRx8AdVUS7G+MziH
         W2Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749560241; x=1750165041;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CUkJhWRp3L7SGl8YQInLtuEOp8CfW807ly4f8cXAKNg=;
        b=MB0lWctgEz/3ODaBBmyKcKDrgQ/9DPhsHcUELmaTTC9DqQ6o3SiyEzFKMw/tncMPyR
         BQD5XrNrrpDhWEfj13YkSOU6934/t2bDe3TOqshMWIsYC+HNzQ0hcMkPpnZ6Eb+jc6iA
         Q18sut+CBHO2hsrwguSfMh5uf7khMTf8Ms5xuEpbzhPD/0JgEzrONBiFQ9alYTioYJqF
         WgTIhG4mx5LSMFEJ9q6bIcFxuaquFSDl6ZVFHedQq2yycGdaIN3HbeyyxqkK5L18TNCT
         BrfDXmw30krKMoc5La6sPQswfMwnCCqBQNIhOgkO39Tg65CBKjEDBhUqyfQPpKPbH/aS
         Beew==
X-Forwarded-Encrypted: i=1; AJvYcCWM3hYJJoPA4Sb5jhnh24QQK69/JNrZAcTriEdfp7s606fwfmb6qQpcM4qbb+7iPLtILv2cfgEpnvSKHHI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2gd/Jacje9+JwqtZYgi4V49FvGyqZUQB180N329xnHs/7spzy
	TfdR8KGc9A36FvsGtSvchI7Hax1EmyLfB4e6Hv5qSA0q0o9NNbBnVEnn1cCd1c7cPXiUvI4lyxx
	EJOThvw7HQltrz0HBc6htpjt1uqoUQSBSsPXSPa/eZhqr2QbjX7IKjRk=
X-Gm-Gg: ASbGncvYRIMVuylaMyHxxYNmR9vAoXVX8Gra/cg7JMuXc7L7IUBsTlTJrG3lQ/p7yte
	X2ljORSV9gN49cbSRPDY+5uOe1Kn5Qm2aNDysJwCa/gTUv5EVS4OWnKaUtbP/+RU1Uq6CBwUKnG
	gQq50ip8kYxgw+cMZ9gjraAqN9LORTYWe6U6k8n2wjfp0p
X-Google-Smtp-Source: AGHT+IFnoTHHifJTlb/W9AH+wSprRlJ6AOhC3m2qBRGlahZc+wsPlXhKLbork72DQJ3HMf/KrBrC0eU+kRMagyP2nkg=
X-Received: by 2002:a17:907:d644:b0:ad8:8689:2cc6 with SMTP id
 a640c23a62f3a-ade1ab2216fmr1457025566b.47.1749560240911; Tue, 10 Jun 2025
 05:57:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606110121.96314-1-victorshihgli@gmail.com>
In-Reply-To: <20250606110121.96314-1-victorshihgli@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 10 Jun 2025 14:56:42 +0200
X-Gm-Features: AX0GCFtz58qEc2pH3XdErcJzGd3l9xp3ByR8YdkuPCCJGBGEv9OQcWr7tPHik30
Message-ID: <CAPDyKFrpHvrgjG2xOYPoPwUf1NNyBM+fGaO+AgPpZ1CMZYrqgg@mail.gmail.com>
Subject: Re: [PATCH V3 0/3] Adjust some error messages for SD UHS-II
 initialization process
To: Victor Shih <victorshihgli@gmail.com>
Cc: adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, benchuanggli@gmail.com, 
	ben.chuang@genesyslogic.com.tw, HL.Liu@genesyslogic.com.tw, 
	Greg.tu@genesyslogic.com.tw, Victor Shih <victor.shih@genesyslogic.com.tw>
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Jun 2025 at 13:01, Victor Shih <victorshihgli@gmail.com> wrote:
>
> From: Victor Shih <victor.shih@genesyslogic.com.tw>
>
> Summary
> =======
> It is normal that errors will occur when using non-UHS-II card to enter
> the UHS-II card initialization process. We should not be producing error
> messages and register dumps. Therefore, switch the error messages to debug
> mode and register dumps to dynamic debug mode.
>
> Patch structure
> ===============
> patch#1:    for core
> patch#2-#3: for sdhci
>
> Changes in v3 (June. 06, 2025)
> * Rebase on latest mmc/next.
> * Patch#2: Separate the helper function in V2 patch#2 into V3 patch#2.
>
> ----------------- original cover letter from v2 -----------------
> Summary
> =======
> It is normal that errors will occur when using non-UHS-II card to enter
> the UHS-II card initialization process. We should not be producing error
> messages and register dumps. Therefore, switch the error messages to debug
> mode and register dumps to dynamic debug mode.
>
> Patch structure
> ===============
> patch#1: for core
> patch#2: for sdhci
>
> Changes in v2 (May. 23, 2025)
> * Rebase on latest mmc/next.
> * Patch#1: Drop the use of DBG macro and use pr_debug() instead.
> * Patch#2: Drop the use of DBG macro in some function
>            and use pr_debug() instead.
>
> ----------------- original cover letter from v1 -----------------
> Summary
> =======
> It is normal that errors will occur when using non-UHS-II card to enter
> the UHS-II card initialization process. We should not be producing error
> messages and register dumps. Therefore, switch the error messages to debug
> mode and register dumps to dynamic debug mode.
>
> Patch structure
> ===============
> patch#1: for core
> patch#2: for sdhci
>
> Changes in v1 (May. 16, 2025)
> * Rebase on latest mmc/next.
> * Patch#1: Adjust some error messages for SD UHS-II cards.
> * Patch#2: Adjust some error messages and register dump for SD UHS-II card
>
> Victor Shih (3):
>   mmc: core: Adjust some error messages for SD UHS-II cards
>   mmc: sdhci: Add a helper function for dump register in dynamic debug
>     mode
>   mmc: sdhci-uhs2: Adjust some error messages and register dump for SD
>     UHS-II card
>
>  drivers/mmc/core/sd_uhs2.c    |  4 ++--
>  drivers/mmc/host/sdhci-uhs2.c | 20 ++++++++++----------
>  drivers/mmc/host/sdhci.h      | 16 ++++++++++++++++
>  3 files changed, 28 insertions(+), 12 deletions(-)
>
> --
> 2.43.0
>

The series applied for next, thanks!

Kind regards
Uffe
