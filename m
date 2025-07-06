Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2C01B423C;
	Sun,  6 Jul 2025 13:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751807846; cv=none; b=KI4d+dn7ri61faaXd6VMoC0e2sOD/JXJbSpjDYTl0MWri+nGSGWeXmCBg7BkbVzLIVOLxokPHfuzvYhBptbLdKiZaTlewYJ8btvq15q73OnD80HdvUifMeTXxPVl7myMnEEEvMMDYpxr4ZHMwZYU4MyTj4DJerhTf5FTLdmblks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751807846; c=relaxed/simple;
	bh=WP4NPqP2klp6cY0JVsOVsse2OV15aZnlzDfglLdC58M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o8IBY1x5vlsuv2ud5Mq6C48xxQlIbrQoGizXjLwQnfXG9TEiEBuI0wAKB772b0eMk0Nq08krceuxKjssLcCGuhTeHiknVvEXm3I4Po+GOVe7dfAzSapjQA4xi2QheoW+pA2YVRAVMuAHSC+KNQSh35R4b8mZ6mxZ2wshwCW1Ybc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIk+yaZ7; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIk+yaZ7"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-60c60f7eeaaso3327819a12.0;
        Sun, 06 Jul 2025 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751807843; x=1752412643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NW0rjBXYV+Wrs3/1FDfXItg+5wO+F1Ydy7SjQdilrL4=;
        b=MIk+yaZ78XedsMLpBcn9X6fR89uJ1BDKi4wGmKD+hBnDQi8fhC6nGu2M7WZUpirQLS
         QeSs0LTI0HLYggbvIfoxH07G45AMGQFf0XnhTo3YgggDXw91KvhhYNX7nEM2yfB9hzAa
         tmaaMtHRqF9b0KnppPXvI7FHjfhGNKQhihcGQ9p/rUCnxrdyEdi/foo/26DCSuXKU/Ax
         EydPQsia7XymQ3fxIFgYHFbvBRk+m6Xy22Aa6OFOCf17H/fbiRvLZ1Y1mUopWlFgW3ld
         RjmABk/M+5thGZoeq5tMuiCrRfcanWmvxPbcH+cEFE8uf4dZFZlCE/uxiywJ7WOFSvnA
         sgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751807843; x=1752412643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NW0rjBXYV+Wrs3/1FDfXItg+5wO+F1Ydy7SjQdilrL4=;
        b=KkaPJKFQz6cgkUuJvKf2DEpXdo7CAaN3zBuUOmRkWjINz4NUlLaXdadwe7CI8+7CJa
         IHLpWxKBOQeR8hn1uTmNJgKc+FDkbtR4GiJszg7C5xhpBpksbKH5S5Ceq6q+JQXJEU9c
         9EG9qdXdvihVmCrZ7o1SknbEAGXB1GNSTfBSMeOB5+x7uWeIIdI5DcbuOP211xCQuPoR
         PvYMD/BsIUxl7raVps1fmUS/37xosRgWllM7V0ONCaFGY9iqf6ssKVDuFaSRvmoKUW9d
         WCB1XDN/DRSq49sj3aQjGACTe1xkF2jqpVg7NyZyuzR42LxzLzBBjTumzPsw1P8Lb/kT
         9p0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUUBl0TGHWPEkNDe2/AzdQYn6lBncgSSsZnfcao7Qthc/GWLCCEsPtVP882U1/aGLtM241tmuuv316kQcLU@vger.kernel.org, AJvYcCUk8Qf6jLAfTr0FxChQNd8tOuo1ZcUZuIJHmojq/ht6uV4sUcDHPonMlyIUlE5uaGODk22b5Brtve8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVQhKbBQFuVbVnvcBbpyYSi+c08EdIYio/Tjuoo22BJ+LmBTW/
	paN/AMyn+9fE4SLh4VPLkFhHO1JeMiIVstK8/9uKePRaWBOjkDzl5mZLD1fZ/SxzqJiIHwE5dTe
	g44qQtqYXk4+n36eBi4S92Jjxd9H9HME=
X-Gm-Gg: ASbGnctv3rfQTseEroxZNpqAfJcvuaSNnGzU3x839poZSbQYn9beQd8V8+dZdydD9PK
	YxKPek0aSmvL2+UyL8sKQPi+bK6PgOhx1R9XM70+/S9t5KKIFSLTfxtukTdhqQIskSPOTlvtw3v
	OjzKOmeagzXLBk6SbXCRnsj/JK3Un4lucCJH6/JzPNkUo=
X-Google-Smtp-Source: AGHT+IGHd4LkqOn8RU280jbV15bvWm2aY9k5+RlIQ7lyEkhqNZWv9JDtQK8LMpDyGBzDoXu8q61GXHRH1V7HZrwkEvQ=
X-Received: by 2002:a05:6402:2793:b0:60c:5268:5587 with SMTP id
 4fb4d7f45d1cf-60ff3e18872mr3957776a12.29.1751807842840; Sun, 06 Jul 2025
 06:17:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250705110208457-jq3LiPPAxR6f7WxKIsfO@zte.com.cn>
In-Reply-To: <20250705110208457-jq3LiPPAxR6f7WxKIsfO@zte.com.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Sun, 6 Jul 2025 21:16:46 +0800
X-Gm-Features: Ac12FXweybnDWGh0iuNyIB0tuX-KyizIMC_zeiIFnX7w3WBK9tO4Ju6GfN0kd1o
Message-ID: <CAJy-AmmZMttjPRURWhj2TJqMaR=zL1KPzgd=C4f0R+N99EA8_A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3 linux next] Docs/zh_CN: Translate networking docs
 to Simplified Chinese
To: jiang.kun2@zte.com.cn
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, xu.xin16@zte.com.cn, 
	yang.yang29@zte.com.cn, wang.yaxin@zte.com.cn, fan.yu9@zte.com.cn, 
	he.peilin@zte.com.cn, tu.qiang35@zte.com.cn, qiu.yutan@zte.com.cn, 
	zhang.yunkai@zte.com.cn, ye.xingchen@zte.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, Thanks!

<jiang.kun2@zte.com.cn> =E4=BA=8E2025=E5=B9=B47=E6=9C=885=E6=97=A5=E5=91=A8=
=E5=85=AD 11:02=E5=86=99=E9=81=93=EF=BC=9A
>
> From: Wang Yaxin <wang.yaxin@zte.com.cn>
>
> translate networking docs to Simplified Chinese
>
> Wang Yaxin (3):
>   Docs/zh_CN: Translate netif-msg.rst to Simplified Chinese
>   Docs/zh_CN: Translate xfrm_proc.rst to Simplified Chinese
>   Docs/zh_CN: Translate netmem.rst to Simplified Chinese
>
>  .../translations/zh_CN/networking/index.rst   |   8 +-
>  .../zh_CN/networking/netif-msg.rst            |  92 +++++++++++++
>  .../translations/zh_CN/networking/netmem.rst  |  92 +++++++++++++
>  .../zh_CN/networking/xfrm_proc.rst            | 126 ++++++++++++++++++
>  4 files changed, 314 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/networking/netif-msg=
.rst
>  create mode 100644 Documentation/translations/zh_CN/networking/netmem.rs=
t
>  create mode 100644 Documentation/translations/zh_CN/networking/xfrm_proc=
.rst
>
> --
> 2.25.1
