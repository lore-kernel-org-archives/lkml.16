Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6E6236451
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 11:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743593917; cv=none; b=WYeORE5smiSa+RVPzWYBgG2mZeA/NFiX7jGibO0NAcXmevL8n7f/4PodF3pRw+NYk3rI/gAL0kYo66X81Pw7sSrJAHqa6NUOQuBvaE2l9o3fHuvi4K/o5RZEDuQV8LIDwoYmaB0m+GG2TppLlqhrD2Q+pyRR5vLblJm319Jlbgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743593917; c=relaxed/simple;
	bh=GUggOhobSrOlcUDTeQcYGsk57ggzviGGHES/ecK+M4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tfQNOztDuuAKfC7dytbvuThBw8DlCqeGrRDy8CCQnXAPNMVhG7p9O/HXrnBAETOlMDsn8KGN1jNADpkOvS8i4EYDzvynDMiOO7qh3iol4UBzufmL9IJhbkQkAiQImLLNnpPz4d6vtlMcLtNxmlhCWW5gu7s+4Se1k7TRodKZ+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TiFCuPy+; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiFCuPy+"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4769bbc21b0so59270261cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 04:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743593914; x=1744198714; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRqA63UFWrU/kbVz2yqnfo+CaGznFARvu1jMY3Mq+6U=;
        b=TiFCuPy+O2hsmIZxseHEN4Lp4FCL/+NVuqT4tXE8q2+4kBk5iseGzbh8q7APDBaWre
         WUifvq7LA7Wc1TQi/CkRYBtAKdIQYWQh2MpchXrKp2HZlZ4QI0wCRjbeAgCcgDz3VIxF
         1GScjZbpjLtmbD1uZXCD2JK71R9VTBysiXT9yNAvneITIcUt6hh8ZRWTxTqC41TJOTKU
         N8juGiQfexlHupGBlB4s8upQyHUGxLwGDIUtiH2fH2ddbmjUd9RGGvBM2gMzHmVcxcGf
         3AJ7BQo8YoEpbIi+Ui6ja0Uo6M5XROOQVVBPQWJrWEmPr0VT+JRrIs8FjQPkc0Dz3H/9
         rGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743593914; x=1744198714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FRqA63UFWrU/kbVz2yqnfo+CaGznFARvu1jMY3Mq+6U=;
        b=K6o9hyvUfE03Bd9Tu1eUm1nnx22wAH3tWKDCWARH0jCYrIJyC8Tx6aT2eIz2G1OYYS
         qe7ROJmyqlg7C9Q5X6PLtNP/VMMTE+q9rYsfthrybCxxc38I4GAwIsMWbHVa6GOm932r
         yUelUucAVWq2uB/FkFh4saXhOqP9WFOOFzWJKGsg7LUZ0shhsue+anJl1AMF/ger5lgv
         FgldoQa+eUzbeWnlMj/mxgAqb6sLmbBHB1V6dXz80AMIroQ+HcZ3JaF3XjDjGWz45CcI
         lxeyCmoG4wa3Eqd7VJBa20FMwNFdtbGjyffa/xh5pqTNAlbUucucNDNpnzA1P62ovTD5
         UeCw==
X-Forwarded-Encrypted: i=1; AJvYcCUyLk23a1x0STrfzrad+/uuND8k4Xgvxm1TUYjCoJBBngY2HmnJ1HQLM3IunyPi76UaKovuowx7wQHOYNY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJgmsZdP5a2UQBRyi9ZcH5AQlKeEJvxxwsAKP+btYdvRNgDOvS
	6CthuTcq66FJiGqS5+LqS6TcCQ9kLRlDwh4ITu2iH0mmr8akTEXBv12YHjtcU1P9T5dBaD6wg75
	hEtUrAUDK8TLKBw+TIIhtbaizuCiyVp5MBUA=
X-Gm-Gg: ASbGnctmk/4hzmznH8oe8fmuLZ9U1u3n3IxROJId0BlTs2Enq9XF9lg6n5+FYlK08nE
	lw4btfB3D4PzVcWSIGHjj2lN3U9CgYihi/asa+c2uccJOlKnkrSlmvVQ9wd2kfMVCxWrzkuTUuB
	LoHD/jtg6SV7KrVN6XPqBeqQk2bO4jRJuwiFv1w9bxz+epBQLMh5zsR9rj
X-Google-Smtp-Source: AGHT+IHn07IIP6+NU94AilqOS6twG644NgpX+0KmOrIAxkFFiYdraDmeVxNFjYfX16bn6CJ8/NKAnwQlbffXBjglfdU=
X-Received: by 2002:a05:622a:1206:b0:476:7669:b947 with SMTP id
 d75a77b69052e-4790a01f711mr29016171cf.36.1743593914167; Wed, 02 Apr 2025
 04:38:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250402113158.45760-1-gshahrouzi@gmail.com>
In-Reply-To: <20250402113158.45760-1-gshahrouzi@gmail.com>
From: Gabriel <gshahrouzi@gmail.com>
Date: Wed, 2 Apr 2025 07:38:21 -0400
X-Gm-Features: AQ5f1JpkOnQ2KG1mFrP2M4hqJ1HoC8ryy307ZDAG5XuA9hGC2YPKPvsG8alR0ZA
Message-ID: <CAKUZ0zKst7us8LfZCP27=62ExiGisuW0ZqyCvgKETZbvTv3_yQ@mail.gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: Remove trailing whitespace
To: linux-staging@lists.linux.dev
Cc: philipp.g.hortmann@gmail.com, eamanu@riseup.net, 
	linux-kernel@vger.kernel.org, kernelmentees@lists.linuxfoundation.org, 
	skhan@linuxfoundation.org, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 2, 2025 at 7:32=E2=80=AFAM Gabriel Shahrouzi <gshahrouzi@gmail.=
com> wrote:
>
> Remove trailing whitespace to comply with kernel coding style.
>
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/hal_pwr_seq.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/st=
aging/rtl8723bs/include/hal_pwr_seq.h
> index b93d74a5b9a5..48bf7f66a06e 100644
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> @@ -209,7 +209,7 @@
>  #define RTL8723B_TRANS_END                                              =
                                                                       \
>         /* format */                                                     =
                                                                       \
>         /* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value=
 }, comments here*/                                                        =
    \
> -       {0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, P=
WR_CMD_END, 0, 0},
> +       {0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, P=
WR_CMD_END, 0, 0},
>
>
>  extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU=
_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
> --
> 2.43.0
>
Adding Greg K-H to the CC list for visibility.
