Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8949D1DA53;
	Mon, 16 Jun 2025 07:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059073; cv=none; b=uqDjIECDDEBOd9hUCngabutt7KISXhRIeOeOLfJvMOYeCUFKFi9g+EnnAW6amg93JvxkjHxiGLSDDZ3VREzTGuhWBmZuUKf9YCrZRH1C7pI/qot8idsO+vAK+Ep069rjaQr4HdnQM3WzPEzGFB4HTufEgRFp80QqvMww+AkkHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059073; c=relaxed/simple;
	bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZSXd3sFcIF0E+43rmbRInUN9Km+ZQxP2Im1dHbGx7rMnqaJSJXnhRiCNnIYCNLT/+vCqfdOn0eosQxZL0QVIFNplXrOSNd9ih780Mvcs0bHIm4Mb8cE3dz3pPQ3Eh3gpOcH5S7Gw1jkEefweoqipGiKw/ms53t6lHfsdR8xocM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MKFulSnI; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MKFulSnI"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af51596da56so3509844a12.0;
        Mon, 16 Jun 2025 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750059072; x=1750663872; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
        b=MKFulSnIWH4GvPNkt1OHFWo+qB4zTZ0WcKLLAvIGzn0Lhff/rrYuOHx3N1qQ16HBzH
         spEgY/sGDmfDZEqHiyolcP0CzEdM2cF5nMCw5nH/25r71yZJXb4VIEskkbfEhBjbiCoR
         yeSamMoJ3dixoySedJxw5cxrq8iyun3CbKhO+sSLWxqjo91cwdBhTpcXwMRMQHrMcki5
         pwc3nouzzYzKv+/XauOdbnq6VCHkTovo6TavAlvkaf4NBYRkzAU2NPkMrhBbBrJYZeuK
         Xh4N2q9O1Ba6JKQafXYlvxFzYA6bHmj2uZ7Ub5OvL6saMEhiXRFUjgaYmzlNonxOr2gz
         mORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059072; x=1750663872;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cheEarIyKVJUARXwRvLdgflVQA3knWwTd0Aeo5HkwRs=;
        b=FfYz1b6h2QxD2/Rih+qDRqW8R3LpswNZTahLmOKDaNbhcjRqHnW268UX/fl7JQRMPG
         RJd3MLDBNNfiSvInKjdSn+uHsipMQPYDArGTNB0IZajX48JvHcKOIkCq+GoomZzDtmEP
         5xVH0zOEc8k6XWe6jLVjh8NDsw9l1LRrZ5MeUXaoB70A4v53FsmqSH9YfSnqfT7i0Rxb
         MM7P6nus8L4Js/uEeR0su+gP+6F8mPRqq/S42GU4B6lEb5+hp5mmiJz/IfPdLnSsW0/b
         bUgcru7krzmaUrwy4JMRH//eDWvyH3VwuUazpF3NQzvtcvLi2KhVNRMz0PaAn3UVP8Ke
         uJ4A==
X-Forwarded-Encrypted: i=1; AJvYcCUpij9ltFNsKjunJ++0VekxzXKjClcdWIuwSRHUWdg6LCeJeuKGbMEUwfeytj7+/WvhPyVX/+zmZSK4tfw=@vger.kernel.org, AJvYcCWwoVQsgvgpuipoboxX+pUZGVvDPzkIrSJ/2ERi2SUWGc6FDh9Kzw/Zofj6W38uZvE8Ryp7wU8ie5cc9II=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjwtjyCPIK1iWMNGQ0u1w9OSSPvEZxsDK6gJqYSdlAQWMJw3C6
	KA8Q8I5wtiMB1cUQM8GAuk9lnbUVvHU54B0FhiyCsVG9lN+UGjsSrPG9m/jD4eSz+MMInThmBEg
	nYrFGMkmrS+r4NITwm5aBqh8zBHdZz64=
X-Gm-Gg: ASbGncuFl7CPMTuFJK40gzwVaq3LGS1oeWjTvn30ukrPOTspmyvU+H3tVSDTMPuNoYG
	tXQ7BSDMkJfEeH5h4o0649UlmCJR18yk+ky7u0s1bNFEQBKP8yr+OJifYtQ2gjTodStPB0DZRQ2
	Ou1ReBw990LJWdukIAsK8WMrLX35hwCS1dXLvSX90a
X-Google-Smtp-Source: AGHT+IFAqYUd3QpiI+ATQMIggtddyd5pZ5byJDm+wKZp9c0vvh4+WvPZLenvvopWZ+I4insDVZLiVfMwAJbeqfnmCkc=
X-Received: by 2002:a17:90a:c107:b0:311:fc8b:31b5 with SMTP id
 98e67ed59e1d1-313f1ca1398mr15200699a91.14.1750059071687; Mon, 16 Jun 2025
 00:31:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
In-Reply-To: <20250613194310.1128733-1-laurentiumihalcea111@gmail.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 16 Jun 2025 10:33:13 +0300
X-Gm-Features: AX0GCFtn0hwbvtz7t5if-ZTv1RrgsBJVVoHPdrySbGFc57a2cboCkTDRMjfm2ao
Message-ID: <CAEnQRZBHF4dwTEcaz2VQE9UYCu9aVapV4fuRtTXhvBdDDkZDWg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: SOF: imx8: add core shutdown operation for imx8/imx8x
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 10:43=E2=80=AFPM Laurentiu Mihalcea
<laurentiumihalcea111@gmail.com> wrote:
>
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>
> Currently, the DSP core from i.MX8QM/i.MX8QXP is able to operate while th=
e
> firmware image is being loaded. Because of this, the DSP may change the
> content of the firmware data just after it was loaded, thus leading to th=
e
> data having unexpected values when the DSP is reset (via run()).
>
> Fix this by implementing the core_shutdown() operation that will put the
> DSP in stall during suspend(). The stall will be removed during the run()
> opertion, thus guaranteeing that the DSP core will not be able to run
> while the firmware image is being loaded.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
