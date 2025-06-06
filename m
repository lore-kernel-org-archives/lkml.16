Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B2A20DD49
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 21:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749246729; cv=none; b=oUtjNf170CLc8UdQ3twJKKV75tbptEkpfQOzqoecTEENHC/pwLKjHVFi+CFq1D+egoIVikOebvzxblQI4zaVUubSNUkYatcrcNRqDVqGnayTvjTiy4m0cOsRog2XI0JoOrFijng58ldH0378zO+kBQ1626Q5BKaaIvOu02+qa0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749246729; c=relaxed/simple;
	bh=wNRLXwP2AOV1TrHHUqrNrX9EWxb3G26pRZWwMmUbQTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chVD92E2JQf8hfdr7gFiSKeqNYKhg+U5vgKEu1Lf7Kh/EcIpSPJl4D+GKlK2zGBFWYnrjnuVqJ5OdJuhQagKVLuPehyY8NJM0RkaRH0ffxTyJTakZXL3DHdkHgrshDTk2EqMI8aCpW2jzM5k6FKXXAbNcWsB/4RYi2YA1OUWg5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ye/ySsnl; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ye/ySsnl"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-530e4ba1032so411293e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 14:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749246726; x=1749851526; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyOaDhp2PexLIt5LY+LfBmOnozOIIhJOKbnZ0qemSwI=;
        b=Ye/ySsnl/Lp/EhoNzozti9Gb0z0+0TUWjTfrl9uwm+W1PYZv3oGquJ2TehMWBpMhuw
         tY/JHmWD7XuiUQ43ww/FPniq1ijyZUEQBM2ugWr5qQnzhNfcDx8OKo0kbc9NJMNfTRE4
         lnv82DpYgfh1jBus4ysdV1KyruIdz/J1/zd67DmWkyZExHGN5AYRlAyXlzffMfm4wSxl
         qYHR+h0iOZvu+bolqm1oAP/ZOL52Pk9XIYm57i8jiSxglFfmAvzz1eJGZS+l1e5mtOjH
         EULDLgPmjmkFg6Rwksnvsi+y45mV0R3s1oEC9Ec5eCoUN7oEDcOfFbc79WtggJ7lPRSH
         IiRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749246726; x=1749851526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lyOaDhp2PexLIt5LY+LfBmOnozOIIhJOKbnZ0qemSwI=;
        b=VATI3yid5QXo0NzTAnYhohfU1WK/EFgHmEaQcyYwNamKBYEYc3LjL4nXTi6GpYqOgN
         Acy/oNutnCvhZ6HYOCLV3BaPSSEiJDyjfPYIijHoDj6cap/xzHIqTt+Mb9QRoG8X+dhK
         xSknMlxTCCUxiWqnuz18Q4NwGILycF7W+CmfaNhbU8rYw1/8FggPtQcA+6elrHH9heF7
         UY4URis15nvotW1wbf3QmKJb6gISOlefpGAvi37gaxDq4xvPgOeqkjirSooRSdilDfD4
         kO/n0WRdNS25gJ/W+m9qnOK5p2hpsb4he78Xe0hTyJy1UdX8pbH/b5g7jVdNw9dls1ZT
         hN5g==
X-Forwarded-Encrypted: i=1; AJvYcCViSxr2QY5k/2Dbw5lXy6jlf0dJBcr6qf81Y1hZexO6mHrXr554WABqDZ8SN4IceJZXbr0j618RIBx2nPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBzWUMxb3olFoj7Tx73Yd99iskVwvxvLrn7YkUd/NHHBQ7kmWv
	Tn/sE/gcNzb/cH4tlrExM/9G2Q+7txHBWHPR9LFB2IV1m9cxAVsnUVsQw0SRd4MKxEiRsWqB1SS
	gL6Ixz9NgE1EDoXJC0x2PBPpEz/4qB9gxL+jgDGi0
X-Gm-Gg: ASbGncux6ZCNEnPaqslX/e3QRFNumqxu8TAJk+AtMFQw1OqiKBBT1wlMqVb4rGD4pg0
	IjOcSR7Wk8dC3OHaw38NoCLG8rsijRCiysqhKeTZk3WYM1cXKnX9Ef5dVWpkIr2gDCFyyJFbQ+S
	UXaHMrIUVZVlDMO6knUf4sFnTwL41AOAUcHQuwAfJhkq4=
X-Google-Smtp-Source: AGHT+IHVHFaA1ry8YDiIbyMGIfrve8HMzCRf6dRbsB1VOlu9MTykpwHA6tI71aPDkraqSY7CjR0ozhtFiZHyJm38vDY=
X-Received: by 2002:a05:6122:1d41:b0:526:720:704 with SMTP id
 71dfb90a1353d-530e487a257mr5820895e0c.7.1749246726354; Fri, 06 Jun 2025
 14:52:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250605233934.1881839-1-blakejones@google.com>
 <20250605233934.1881839-4-blakejones@google.com> <aEM7SeSC7yup7TJ7@google.com>
In-Reply-To: <aEM7SeSC7yup7TJ7@google.com>
From: Blake Jones <blakejones@google.com>
Date: Fri, 6 Jun 2025 14:51:55 -0700
X-Gm-Features: AX0GCFvT1RS7Fs_le6fa-v64xZAYCDvDqqmAEUDabdNRCY24PDqfLenkWkzvCCA
Message-ID: <CAP_z_CiJrs5qsM557TgNrcFu2yyML6uMKfU0mDJ8Z=AKs_Kpaw@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] perf: collect BPF metadata from new programs, and
 display the new event
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Tomas Glozar <tglozar@redhat.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Chun-Tse Shao <ctshao@google.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Zhongqiu Han <quic_zhonhan@quicinc.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Yujie Liu <yujie.liu@intel.com>, 
	Graham Woodward <graham.woodward@arm.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	Ben Gainey <ben.gainey@arm.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Namhyung,

On Fri, Jun 6, 2025 at 12:02=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
> Can you please split the final synthesis and the processing/display
> parts?  I prefer commits doing one at a time.

Sorry about that - when I was doing development these two parts seemed
inextricably tied up, but when I went back over them just now they were
easy to separate. v3 will have these split out.

Blake
