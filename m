Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59347189BB3
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770650; cv=none; b=hff63M/mW5mo4R98nqkng/PFczKADNlhuP/+8pyARdG0DoccoAeaUd1OIarOmiJZ351/EZnsgYrVIaHPiHhqj7wq8BJjM0VWr77lOS8xMvJNpOlyPJRlT4kv19eypLHFlPAqk3lNdpquot9KLt56FYYHdiSfCAryhVbFWLmk9bU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770650; c=relaxed/simple;
	bh=sYJYR75W/X4qiJx7MQ0584FcrNzNgCuv19cJ2nI5CB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iQqAI09t9qIWrHhTguaA79GOibqE+8b7ApfF9CHAPw9P91ksNq6q8+pxsaMksNGiKE/b08Mz2dL25OQf9CfBUgiIgf4ygPP4exJbEe2AJ30wjPh1pol3j7Fhez2RVaDwFoFTCIir7nrH0i7TQgAKA/IjEeAe64m7xSWWr/l2tnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qpr5Hq/5; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qpr5Hq/5"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5439a6179a7so1076598e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738770646; x=1739375446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V5pjtlFBbyV2tkO66ddvoUngY8TmcZcq3HnlQUDSPEI=;
        b=Qpr5Hq/5UPoc+gqomCCGFL1PP21f9heXSGtvIz6SgoEIuApb4XMrBR+pCh48YAOF01
         E7Rt0jkunIs1IHetfMbppgFIZTMXz3nSnS/gPaiUca+YDSxqbwGbw6XEe5FHtqFCNspP
         WmQKg/aWjs68CHQRA/C4w/mc7QXov/Ccw7hWlSx7EMnhn3mRUYAJeJN/w4jHO5nE24FZ
         E2osGlsuNTD/ahD/0+ycB2KkZGyosEHE0IhlHrOZuCNQpvKEVeOkRqo45b2wB9MXg8IH
         4/jjQUhqCOdiqrcICyx9qNbCpnWjQ7NC55OBymBHYQ++c/gHMgIz8lsUiRr52kUbOhMN
         AIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770646; x=1739375446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V5pjtlFBbyV2tkO66ddvoUngY8TmcZcq3HnlQUDSPEI=;
        b=MIRTn7hCZ3k2zGSOGzWu06QTalbO7sC3uNqa7n26OkcthjJiyYC87GJ1hfhf+wHLvm
         QO9BRnX5R/qWhkgR6tzrbzTaSa8OmDmydYTm1yxghoHV93ObDN7yGjty1CQ+1RgfTaz4
         5Ssq0cv5+Nc+Ae541VeQF8LD0hKfMj1K21V8QDTomg9LzB/ytNLnAdcgWDTjsacWHwC8
         qw3nXgEK5dUV4GoSVaFLM7MiImGH9hcJVWR4Sz38/nChJyFdqLwJ+P1bWzjPkAcy7Tn0
         vL01+c0NRYKKrHl66czFw384EE7PCYQKyef959EkZuTDBfU9u0KLwWUW3u9SMsKnvxK2
         eePg==
X-Forwarded-Encrypted: i=1; AJvYcCV05DYWXdYtTLtICnfwBK2pwGMlxUYdm36d5j1s5h6OnyxCj3pWQwsrm0ARfXhq8qSglgCnrTz7B3AAC0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzycR0lBYnaqfjqhuxka5IfyulzqaV39FCcu2gNjdz852ozVkuB
	pzTjX+4pwdKuMfUp8c9uAaD+lNorhf5MAWD8qsf2e6PnETbDklwMWC650jEPn5M4DV5n5MW/lu+
	FhJp6B5cZwhnRzYTrD+qL/+12pN8=
X-Gm-Gg: ASbGncuewXoX9p62wVfteyrxXx54KbJ+gKMKKrhOvifhjVh6PMmG7V0+kuA2qdvcus7
	InXaYAGAaVFQdrvwCUrlU3eHM3klzesxBKIgHWnCPePWurk8/MABfIf2xuXjguzhl+nFG7R7XiN
	w6QB9VDQ7L03c6gRwSzKnOVVPOU6Q=
X-Google-Smtp-Source: AGHT+IFDxYIl5oogc4aOzvhvY0HAoYIntif84wA755oePAmAkgyhvnAbag537ru1gnMM2wW5pU4RYFXtdOqt55rYnMU=
X-Received: by 2002:a05:6512:3c8f:b0:543:bb69:c635 with SMTP id
 2adb3069b0e04-54405836109mr1109351e87.15.1738770645990; Wed, 05 Feb 2025
 07:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
In-Reply-To: <9638976432d8dfcb0c4df9d454b661f9022a2d7b.1738766259.git.geert+renesas@glider.be>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 5 Feb 2025 12:50:34 -0300
X-Gm-Features: AWEUYZlFLXiepv_yE9yXJ9KlWCIpZy_t6h9dHVFhvb1GQAbeKkvQGMigDUgxkZw
Message-ID: <CAOMZO5Ar_-_H+Kwv_=ScoABqLzfEHX=3=JxrpPfiD2QmDt4=QQ@mail.gmail.com>
Subject: Re: [PATCH resend] firmware: imx: IMX_SCMI_MISC_DRV should depend on ARCH_MXC
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sudeep Holla <sudeep.holla@arm.com>, Mark Brown <broonie@kernel.org>, soc@lists.linux.dev, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 11:52=E2=80=AFAM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
>
> The i.MX System Controller Management Interface firmware is only present
> on Freescale i.MX SoCs.  Hence add a dependency on ARCH_MXC, to prevent
> asking the user about this driver when configuring a kernel without
> Freescale i.MX platform support.
>
> Fixes: 514b2262ade48a05 ("firmware: arm_scmi: Fix i.MX build dependency")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
