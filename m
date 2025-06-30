Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F26728ECF5
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 15:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751297995; cv=none; b=VqbIrCt7LlfK567AGCsGtL4HVavsS0NRPevu/ianQ0LtTwqu5e4zL5WmjpzIp3H65ssSJie05dPPIXO7/34Ms9vFsa7T2ZJwPR7DbMWbO8qh62XXlsvutA5+uckWX4mnoVo0TSc3Aj6ynLOMO8Ufn992zCx7O1VxEmy8SABhMqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751297995; c=relaxed/simple;
	bh=3w63HtcrTJ91JYwdGPTwy1GlgEB58Nzr8tG6+Ue5pOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QnLPfKdg119UhK/aP13DmOGyFaPDxmRh2gTavIULVYkmdnGYZXbF4+GHM9b9ju2rZ5RJaxDqvPvnifZGf/Taq7/6PN4ZHm6PkpbXmrZWrsds8CVkyYxWDvkKhNdi+tjL1F8zAMcau2E+bK27k4Kwpryru3BcsEocaN3gQejN1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2eQBEW++; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2eQBEW++"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3df2fa612c4so531615ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751297992; x=1751902792; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3w63HtcrTJ91JYwdGPTwy1GlgEB58Nzr8tG6+Ue5pOU=;
        b=2eQBEW++n9SvD07n9szVeQCXHDN5flWmK9rIXRKf1mHHrbvmwluudTar7JiDhmAfUo
         +/kDOlRn91Kb7VVuLOsun4SPXTzF6UpxW7nT2Von18z/VF5AuvR9rNIpfIji6hCpGHrM
         g3iia87lDjcRuOiOhB3dBo6maiE6Fc+PMEBibzHJYvgNgcwNhmhxbTpTPH292adqfNfm
         3K2KxJqH43VgnEyKbui4sWs1q4gDAZe22+1RiEvGpDECRo7er8WwxaFuC5pw23QN4XVn
         8xtc8En3w2sIK/X5wKRn1Swqsr7awRzMVHLzkySp+5DQ2Cgtslk7Dj5FVyDtbxcp5U6H
         zgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297992; x=1751902792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3w63HtcrTJ91JYwdGPTwy1GlgEB58Nzr8tG6+Ue5pOU=;
        b=eopZ6qhOOBIS3sH7cEn/ilagk185a6Q242hTVUueu50RSbeHWteismn9MSjvnD8hZP
         ANr34AHQvTdLYLDzZmNJ7L8zGk5OlDpwGhFVSGSnbSZWTh5hnEOHHOFjfKVFjllPin9s
         oMd9fe6bKZwNpOTwFFE8UKgz5rjKvGNN9jxZGBBIOkHwMKZaYvMcRs2xpz+Fh/4HqEIo
         lQfY1H4yJYraR3z6JAKNUJLv+zu/g0AQwhSphjmI5ayFjsdkmIyFxdws3CtlPcw3NYy9
         UexnLTQ7MPsmIep78ECSqC2PWfNsJIq1Xda8rir091p7Gr6HwL4EU/O5OR4m8fGTs+dp
         wBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVoaNUtQwH3tgC2UgJE2WlQmwZqLaJ2wkYA4cNZ85tWIXAOU0cuZbbJDrUmOnEx8p42Nx6mGDyniX2VeYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwn+fy8F1YKgsHS2roLntw1xtMKwtR+cG20cxOEusM/JZ9B+Gi
	WTFNY37bDS2ffe9EKn+8T914GHG/rYB3dDZJZsnzeoaGYGKGI6cpR7JCjPcagMEX3NshHEaDkI0
	3LSUG9tCHh5ZtTz8Fbo+/RfuAYW2XuxAK0GyTy4/C
X-Gm-Gg: ASbGncuNt1RRbl2jpC563iU0DwvZUIbRUmV1Mcf9AnK0uqNe0zLp/3aCWkBkhrOFSgZ
	mfkiqjyuW/6cK940c91+QttovoN6V9ZCK8XL/Cw1vWgy4+c8tnWnMaslEHXF4tJPxgzTl3APkf8
	cvCtvjk+LxiRwEQxYojtsaZdO740WFT8+Kb6fIiWh8y30+pucKgbNviYsPwifDklzjqsf5UW1Jd
	N2CCSbfXg==
X-Google-Smtp-Source: AGHT+IE3Gjk62YQq72+SdA23cor3rISzp+2vi5ogIScgBjQ8JLbbC6ZC7DtLKd3NdBa5DEDq5THLgobbPpD7gEYD/hQ=
X-Received: by 2002:a05:6e02:1606:b0:3dd:cc4c:382c with SMTP id
 e9e14a558f8ab-3df558794bemr7428205ab.24.1751297992362; Mon, 30 Jun 2025
 08:39:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250612000224.780337-1-irogers@google.com> <CAP-5=fVGqnWuQNYM9XULyLuDvx-yAuyCMRh=uS0gybiEsYH9jw@mail.gmail.com>
 <fe821704ddd4a3ae5169ec974cc8cfde8dc44e7d.camel@intel.com>
In-Reply-To: <fe821704ddd4a3ae5169ec974cc8cfde8dc44e7d.camel@intel.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 30 Jun 2025 08:39:39 -0700
X-Gm-Features: Ac12FXzCbmaQnlvNe8l_BtMCouk1SBtEALi3aMKfEu6hBpoEXaSqQxQQetV8l-Y
Message-ID: <CAP-5=fWC_buKxJ9aSOWeRY2Z+NrhQy0QvVWaMLJa-Eqfwf-NHg@mail.gmail.com>
Subject: Re: [PATCH v1 00/15] perf vendor events: Update Intel events
To: "Falcon, Thomas" <thomas.falcon@intel.com>
Cc: "alexander.shishkin@linux.intel.com" <alexander.shishkin@linux.intel.com>, 
	"Biggers, Caleb" <caleb.biggers@intel.com>, "Hunter, Adrian" <adrian.hunter@intel.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, 
	"kan.liang@linux.intel.com" <kan.liang@linux.intel.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>, 
	"Baker, Edward" <edward.baker@intel.com>, "peterz@infradead.org" <peterz@infradead.org>, 
	"mani@kernel.org" <mani@kernel.org>, "acme@kernel.org" <acme@kernel.org>, "afaerber@suse.de" <afaerber@suse.de>, 
	"jolsa@kernel.org" <jolsa@kernel.org>, "namhyung@kernel.org" <namhyung@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 30, 2025 at 7:21=E2=80=AFAM Falcon, Thomas <thomas.falcon@intel=
.com> wrote:
> Hi Ian, not sure what happened but I can't find this series in my inbox. =
Could you resend it?

Will do. I'll rebase and send as a v2.

Thanks,
Ian
