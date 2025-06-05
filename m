Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EAF1E261F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749139112; cv=none; b=sOfXnrNgl5TxEWtbzK5JizmPA1TjlSNOb5Cv8NCraTmMdVB5p0T1VELGAbMRIJFlMp6y1hmj3lrAeT+9fD3iNJHMlF8hReIBHoOaCb0zZzPE7sthZiiLhtfiWyDvipzz+KOKQK2nbwuQgq2tu9Vo5CL4bULvNzaou1Gw7B8uxfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749139112; c=relaxed/simple;
	bh=5oy6KHOvTzdcuYytmPkKZgPrpl7idOQtfQSObqeQCVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HdHiYwn3LWiToa9kYOovAM70NpP1+qL3NUdHhHSflbVdgfqV/lo8i6JxxY7V81bZN58o7E16i+8KYS0/KOEIZjERTRJGG/e/UaW5tmBBVXQUv9W3RR4O5A89yMeoo2x0SHHoiy/DI++Eqvw+gQqJYvXNQ+gOMNvAcgY1QzgKLXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io; spf=pass smtp.mailfrom=foundries.io; dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b=gW0btmgC; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=foundries.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foundries.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foundries.io header.i=@foundries.io header.b="gW0btmgC"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5533c562608so1129273e87.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google; t=1749139109; x=1749743909; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jY+fBvo1omxGhJb81xJVOAzLMDMZ0VpHsAY7o7wB4qM=;
        b=gW0btmgCzehWxNok2ZvOcAU/uE8xx9vZXUoy5HO61a6CGpYTesRV3mVq0K3ft1B8tM
         rUfO7oSyn2QAdn+0prfGkxgjfeEe3rV2DcU94NZ5hkktHJtR8uQOq0igXIM4zdanNGW0
         SkZiD3t+Q7ak90C7SZYqumWqSu5SipEt00OBWDGLmFzc2b8lunolrsGLGh6zfEM3qSTH
         AcLJdOOYwT3kYTAa6oOZpbvzHUmD7dU4yqImBpZ7WdTcH4pWANga0XVeYm39bPaflEh9
         jcP9zS08Fr24XRrrs0yfmPJ0UHj2DxyBKi2dOSpD+SlaBqnBKJBUETa+LAbIjNBITq6u
         kXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749139109; x=1749743909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jY+fBvo1omxGhJb81xJVOAzLMDMZ0VpHsAY7o7wB4qM=;
        b=kks/GogfkmkTl5joMaJO5/yvro2xKoKwlGS81aY6s1rZR51EGSogPz3ptDRQGAEWWy
         ukyXtIgGzhXihFPbhcvTN5bGrjrHEvqfzJ26dYygVyaYNFkb32JbJFhrMCPE9o70SGwv
         9v/5VPQwsijsu5n2U2lOxfitamFmz9pkfC5FHYbjbceab5ydLA8glwlkMECKPqg1UDOe
         1OH24UiXJXyoGg4oEe/lpQHzBcLK5QfWB6eWC6vClKfcd69WOS4rTZAIA+6h6L9UqH3B
         6369htKWWMZhkEnNt6qcxSQwhTZ9sCIiFZyklwwXn1vy9He463XOIY8mGgNAUtrN75g5
         paxA==
X-Forwarded-Encrypted: i=1; AJvYcCW007GfHIcp3KP1wVttqvaiu+GAy+YYGp1qXnjgvzgoO6vQ0X6G0H4PoFRyKQKhtNilQl3rlHxmWqfnD9s=@vger.kernel.org
X-Gm-Message-State: AOJu0YztwksNcYdeFPG0cpXDJN2f7lNVPM4YVa6kLvBljkHUIK0K928t
	TTTeZ/uaxmJowddl/FpUPaurTgDYqfne1aeb9t20gAs8V+i+/ND1X0fVh//lAfJFQBo=
X-Gm-Gg: ASbGnct0FV8c5rRQ2p/4ol4Z0VSJscZnOqJasv6WgrhDFgloscbFxnugHKITCschb71
	uX3pV1Anc7SCeoNnRFjjAAFKsw6sIiqPqQLH3jnWq/mM2eSfSoCMXUyQMoamALEfPBqeZatdsux
	tgWW61t/pn4nJbGGZnvQdVuQaap3ACYC6dBLvFIuRfl9X5Gtp/dMmXORQA7J+wXJ6UH/3QrboJw
	f6OEccx5atn66stj1xnfC+pV34Ur8ryCoKhEpmVExbcYjEyyuFOqCVAHAdNg6SXdbxHdEh1IN2C
	R1rG6xObGBCgZwpLOKyFc2xe3Z18Dlc3O2d71DSGsB7t7Hc0HxbJ/G8ZIwjYm7YTyYY6cH3mOuM
	YQ7rYqeW7gXHyUV+SkhWdiAx59qb7gygWnGP+xXPVkNK4
X-Google-Smtp-Source: AGHT+IE5g0NpZiGKWdQAhxqzPgU+EDalkwHq2x5qhV+iGVnnLfBvqqZ/6tin9VLqkHuvfZ3nNw2+aQ==
X-Received: by 2002:a05:6512:3a8e:b0:553:2a2f:22eb with SMTP id 2adb3069b0e04-55356df996cmr2190335e87.36.1749139108888;
        Thu, 05 Jun 2025 08:58:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85b5664asm25008971fa.60.2025.06.05.08.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:58:28 -0700 (PDT)
Date: Thu, 5 Jun 2025 18:58:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] soc: qcom: mdt_loader: Actually use the e_phoff
Message-ID: <p2nl6wmzo5tn7ve3ufhuwiw7sixg2bmmml3txwahq72h76asok@y24ixmekdxfr>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605-mdt-loader-validation-and-fixes-v1-3-29e22e7a82f4@oss.qualcomm.com>

On Thu, Jun 05, 2025 at 08:43:02AM -0500, Bjorn Andersson wrote:
> Rather than relying/assuming that the tools generating the firmware
> places the program headers immediately following the ELF header, use
> e_phoff as intended to find the program headers.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/mdt_loader.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
