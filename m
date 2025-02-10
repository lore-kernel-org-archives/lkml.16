Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90C22586E8
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739227840; cv=none; b=CXjAJVMVSOMKubBVCSBZrOCOomSq0fu5YfY74b3Lq2We0j8rzhTU6ERatZDTqSfSDMFdNZNz1Yz3zzVEgPOxC36t+hV2yepDqwzpeoGf+d1oyWXIeVjapIL0HizEfrPK5LCeNjB00IiZbQBBYL4FSB7O8Z1gtywJtlW5JbZPPKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739227840; c=relaxed/simple;
	bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdjbpvnKGLpMe//7okCLkaXO1qT+fy8Nhp4Kxa4MmX2TW+n8WksdBJRzOJVf+COXV3YpIDk79jGx+e/VKndlvpg44+vxFAnKMwwYXl8b546TJt9QM1BjXVgk8RMXG8FT5bRynlURBX8Hm66r/k9yAfKNzPisRO4+7HKHc9kmgHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fn1WTRYx; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fn1WTRYx"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6dd420f82e2so63139356d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739227837; x=1739832637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
        b=Fn1WTRYxcY/IF+pLgssEdlj4HJBpjPUtmFK36ZDZGyP0aHwRFj22JO9P/0V4RjcdUb
         nIlz+Z7/f892FtYCN26Fl4MB91dA/W6Gy5EtCxH1Wu2HepQ3jf5Tq9oo/RG2nz6qKQFL
         eBbEcXJ8LqbRwhIU0xYjPIqCUekQ4MytyxNtw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739227837; x=1739832637;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zbZ0mjlc5mJspBqAdHsl+XIcsIzXXEkeeddcLU17Ww=;
        b=gpfR1XOx/aAGt2RqeMy/fsgk5gLVpjJ5RjD3+0TuTMoLj3rYfXPwqiq5mpZGzS3u7z
         oqlSx2TB9gjpkBjD39twxs8NLwhUqgyrZAqzLxV4O8N9jpPLa3LQYsbQEN3wfxihnwFt
         3aHPm9HIKcOFSC6R3dTcREQmn1ksB4plagLvOAXY4doABhvHvGt2cLIyvhtFXE/KMJj5
         K6zn/sFyI+dnVDwkPhqMma7YeQLHeh8R3cV59wfB9BOK92FP36QByDWA490OrE7rY+vd
         rmRnJfAdvKP8IZW741EvfzKDvozeSQHLHAmXcriFPysZLt5HCoDpoNY/B4ztcYtcZoPx
         7YFA==
X-Gm-Message-State: AOJu0YzOWg/X9bAru1i+mJOP8OmCd1wk5bkmp3tJZ7Ny3+3q2NYrVvzk
	D+bKN3E5s8vKVQ0sCvPMW0SmwaA8L+8BC2rASG00J8xTv7Rw7kzf7GBGHKhqI2WGa27Ngvno1VS
	jsuBicYqNWvPDLR8B7W55+UdMZOdweAv308z7
X-Gm-Gg: ASbGnct2JJfNVyoMcyJKEMdOmbLyrozNgFscmaf5+FMddAOdmRNaAIgCAd8ZW3mDR4N
	0nROBI1DqEAH5v1DyCDYzJzehzDOw/CEQBNh5ff+DR5ah8WtoE1xWOGf5jU9af/pulBXXKqOyXx
	F5l5zNPvqr/iWT5CH6PEk23xBP
X-Google-Smtp-Source: AGHT+IGL4SmQgIAC10xipCYbVaexIQbpQQDDIqhx2hGeOo7wq1KUJ/UwijMW6vgDIGzhCGOUFwEwrakNbbsm+km09q4=
X-Received: by 2002:a05:6214:240f:b0:6df:99f7:a616 with SMTP id
 6a1803df08f44-6e4455d2fdemr247845286d6.2.1739227837669; Mon, 10 Feb 2025
 14:50:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Feb 2025 16:50:37 -0600
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 10 Feb 2025 16:50:37 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <87895166-659e-475f-99bf-5791a6e1ac3b@oss.qualcomm.com>
References: <20250205233016.1600517-1-swboyd@chromium.org> <20250205233016.1600517-2-swboyd@chromium.org>
 <74527323-31ff-4ed0-b19f-e535f26abf2b@oss.qualcomm.com> <CAE-0n50DXcAXQMaLtsamvxHjUrkJVBz42G6gtgKgW9Rh=qd31Q@mail.gmail.com>
 <87895166-659e-475f-99bf-5791a6e1ac3b@oss.qualcomm.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
Date: Mon, 10 Feb 2025 16:50:37 -0600
X-Gm-Features: AWEUYZmtYYT334_kTXnpfDawnzC3OarpU1PJNDWzV_jXYgahC0sPCiJwqwU3_-I
Message-ID: <CAE-0n51zc65GSm5J9TbHe_g4reos2h_iv-ozMU6CCrAuOt3Kww@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: chrome: Add binding for ChromeOS Pogo
 pin connector
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	patches@lists.linux.dev, cros-qcom-dts-watchers@chromium.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benson Leung <bleung@chromium.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Pin-yen Lin <treapking@chromium.org>
Content-Type: text/plain; charset="UTF-8"

Quoting Konrad Dybcio (2025-02-10 11:09:57)
> On 6.02.2025 9:43 PM, Stephen Boyd wrote:
> >
> > Do you have a device that could use such a generic binding? I can't
> > really design something in the abstract without two or more concrete use
> > cases. Coming up with something generic looks like a quagmire, because
> > as you say the signals going through the pins could be anything: i2c,
> > 1-wire, etc.
>
> Right, we can't be overly generic either. FWIW I'm not standing in the way
> of this patch getting merged.
>

Ok, got it. I've renamed this to google,usb-pogo-keyboard and made it
keyboard specific. I'll send v3 shortly.
