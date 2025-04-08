Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D62242930
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 21:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148411; cv=none; b=fxrhPeaT28/nQj03seIgB0Dd4dL3RYO7I3MjzuvDT5r2zTTk0hg+2ZxVYWFH+p24FZLH4EqEkbLomYDqr8DuhlnsX7HGCqmyewUMLHjnVDdXt/tp2m/ThLtT5KfeyO9fcqMiD77AulwwErcxW7O1mV/SNwjRJyrmQ0U/5keS0Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148411; c=relaxed/simple;
	bh=SktKjID9PX6Mi7F9PD1XLt4SH9Ai1yb/YoZf11MhWgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpQ0SZT8XKqRMC29XZLHVjVonbrZwFvBQxGZfJ559ImAGwszmft3+nHGrncf2iFCRvo/HJXgP+WDcu6PMgk22ThGZFEHxpvz75zjmhi+IfqSfI7L49gB2AZsXZ+Pfc9gB8F42+LZcevO4ResqRmcx6QWBIxyrIFHqjtonaFCYq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=NUz+y2ea; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NUz+y2ea"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499bd3084aso5776547e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:40:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744148408; x=1744753208; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gGze2p6ov5nhKjVxLmH8WTXrOTuNddI/56IYEuj8SXE=;
        b=NUz+y2ea6PoQJpOJHj3Br0Q0aqOoDkMnJ3kJCiCZALMSTz7M7q/qqFpaCTVQDAn+wV
         LpuLm56wnvG1niApPxCK1jMYLAWY6GKtypQuEYpEonClpENP+knLVvb/wgCyqyGqCKyq
         GxJVG4yQ/dPw611XQLPWxVI7F89RNOuJta3Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744148408; x=1744753208;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGze2p6ov5nhKjVxLmH8WTXrOTuNddI/56IYEuj8SXE=;
        b=Vgr/SS+KjQeAafTdegJeFo4LkdBmhLs4S7mrPR+D0C5ms+gSs5LWaoTSyciHRzMflG
         Ojr8JTqeR4FnsHim37jIQQ32T3GLb+xporpyzv7G+Z+0CK6FyanqPYPZ2Dlv57SolDQ7
         U3D6EkCsZCsK7aV/94W3adRD+ojyrbZtfDSQFQcWICfBKmcYjkTom7q+qV3aljFcMUPr
         oOPbC6yfl++MHw7iA0ky33VGV2X7WcHtEewqz5F2I1LkUcOar+aanc6HwSLn75tWuzGN
         37n1V+uSiXp4Eglvg+lcpExBrM9dFS5dEGXM3hKRrtjgI2ksRDh0U0ghh5tQfATmBmsI
         Ec4A==
X-Forwarded-Encrypted: i=1; AJvYcCUax6qcLirkHUbHlnlBN2me7/t2wZ+jM6IL9cRcEjvAANzLW9OxJoldFc2brpo0Drx0E+Eacb480Y6Zbao=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlqRMkyGTrcVW4dKS2XzRxe94WUzZRdRHY3VSHNIqzX6rGqnf
	8II4STTlrmQG4h7zHeSEa/3kN2Qa1+yPlD4mV5aEpM5njt5t1uwrp8X6GL3kCrn0ndSbM8exF6c
	=
X-Gm-Gg: ASbGnctw2hnKSL17LP5UsILNIH7D2Nigb+nlZBXXigleNobcTEjzm78STjTaw3QJWXM
	XrrExy5wUocMLTU8hgPPAHryzuaiBKUK1VRes6mIr1IxV7w3nQIouOGRR+Z07Q6citIyQ7XPrpJ
	Rqgys2V7gw2UnDU/zkj/N0C+jqo8Z19OtU8e/DKWMzwS5h4Jf5Q7sEyzga6cPZNLkGTISJ62uWN
	4/C4If1c752VMNknscayYJsq/aJPXK06N2YI4Gw4DvMcZy/6jfLrcEi1aWSSgh6Rhmdh6Wa4TQT
	UpEFBw8EX6ppnWX1uGNM2QMJvjx+uj6IDEFSOhI0nFyhggr+cjdPkUWPwi9VkDs/cEVi9NLmAh4
	4NjaQX2U=
X-Google-Smtp-Source: AGHT+IFb1C5khOvzPRxQL6jhQQZC9tdPyee/u1j7xEmpom4dvwiIhlo0sd8gWb5gYkBWqQyefKRI9g==
X-Received: by 2002:a2e:b893:0:b0:30b:8f84:49c5 with SMTP id 38308e7fff4ca-30f4504097cmr339841fa.28.1744148407825;
        Tue, 08 Apr 2025 14:40:07 -0700 (PDT)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031ce768sm20556341fa.89.2025.04.08.14.40.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 14:40:07 -0700 (PDT)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549b116321aso6912007e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 14:40:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUK3z/wmfqLnA9CTSmuLmShAf/3FDBayWguzqD3kFBTYZ/bTcjInHF1nVmw7NfIVTUnNdWcqBAqgdwrvt4=@vger.kernel.org
X-Received: by 2002:a05:6512:ba5:b0:545:1db5:f224 with SMTP id
 2adb3069b0e04-54c444b6994mr53176e87.11.1744148406896; Tue, 08 Apr 2025
 14:40:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250225-spx-v1-1-e935b27eb80d@chromium.org> <12647854.O9o76ZdvQC@radijator>
 <Z_Tgp8L_8goc63K1@pampelmuse> <Z_TtXaRnaU1zXbXv@pampelmuse>
 <Z_T8OiLQzKDGhOJs@pampelmuse> <MW5PR13MB5632E13F8F5B0B2B6DE3D16CFDB52@MW5PR13MB5632.namprd13.prod.outlook.com>
 <2025040816-pork-lisp-7b66@gregkh>
In-Reply-To: <2025040816-pork-lisp-7b66@gregkh>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Tue, 8 Apr 2025 23:39:55 +0200
X-Gmail-Original-Message-ID: <CANiDSCs0timX+XN8xNsMKEXnaj58+FpfL791UyFo7djNOE6dLQ@mail.gmail.com>
X-Gm-Features: ATxdqUFKlgiTWgAKq3QwhMHai6z7obJaUq6teJeVC8rjjJ6u-OBXDk3g8rw1cDM
Message-ID: <CANiDSCs0timX+XN8xNsMKEXnaj58+FpfL791UyFo7djNOE6dLQ@mail.gmail.com>
Subject: Re: spdxcheck: python git module considered harmful (was RE: [PATCH]
 scripts/spdxcheck: Limit the scope of git.Repo)
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Bird, Tim" <Tim.Bird@sony.com>, Gon Solo <gonsolo@gmail.com>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Thomas Gleixner <tglx@linutronix.de>, 
	"linux-spdx@vger.kernel.org" <linux-spdx@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Tim

On Tue, 8 Apr 2025 at 20:12, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> > Let me know if anyone objects to me working up a refactoring of spdxcheck.py
> > eliminating the use of the python 'git' module, and submitting it for review.
>
> No objection from me!

SGTM. Depending on how much time you need to implement it, we could
land something with `del` as Gon proposed. I can send a v2 if needed.

Let me know what you think



-- 
Ricardo Ribalda
