Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F672628D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 01:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748913650; cv=none; b=VFF6YKFPsuKaijopFk5TbunGtTEhXGhygjVq1CeIkwtXubLD4iUkHmFsfEwMoBBn7mESGqc/+azCYhYsa4ZYxXxpE9XQ2dwJCF3uA4NwVUVMsCufdDgSOKmyCj8HpreaIaUKq05hkYEGmMHEvuNfbBkcYT1Ao0WGdFBOI7gRMV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748913650; c=relaxed/simple;
	bh=VE+nhMtYbDV/EMRZgRGQbRzYzLn6vPrGVdIaal0ehfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uZyig7bei7rvF4MbPrrINJPsJgvfPTXwmEkhShPK5EmW2N3MPPJBFxk5LbTGcK7AbeJTjJn+DrSkVnIXX/tjTNebJbJeShqZ2HRSUv7VgogPyDb91+n/CSQRf0tgKwVOZ1dB8WOIvbxvP76Z6xEs4bJYY7no9LYqgT0QEIgkZ9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EZBepW4K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EZBepW4K"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 552JiojK021213
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 01:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VE+nhMtYbDV/EMRZgRGQbRzYzLn6vPrGVdIaal0ehfU=; b=EZBepW4KEcCOwDK0
	YqEAt9rqJs9WVD8leP92Thg1nts+tR55uj3RujIlrW3lOY73E1T33YV7JR6kMUxw
	oN+xzxdlq5uam6MGcTejVxiGlzrVKuR+FDDV6Bsxp4KS1iBVQ//K+vdfz6glX9GB
	FRxvupUo8/LmV/FVdth/01hhROgHSlCpt0fnEtESOK9XnhSyr4kL6kSWzv87OwR4
	r1NzlqY1MWVnrBpT5zYfaU6av0Ljct3wzfTLy5eXDTb26guvDruj6WzWl7GEMlzo
	fDsK1sWOm/WYCKKLM2lOIvDGMnO+mMhUu1hA7NlWskaK7m49xJu5xY6tse0QaTih
	0TMujA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8t8xd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 01:20:47 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-70e7f66cd58so65394997b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 18:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748913646; x=1749518446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VE+nhMtYbDV/EMRZgRGQbRzYzLn6vPrGVdIaal0ehfU=;
        b=pgrDt46cZlTzPUbcUoiL6fU53uNWuDVHYcZ4/P55zvvRYsdRbjLqUrC6aUqH8qMiTg
         pJ6Ml5707uSGZUKirPXecvYMp6TxF+d5gda7bKmtnKsBvhAtvWKPzms9vFAuASdkObFY
         lUVaXL/HDSzmrlJETnBzBeemuE3RJYG8kqS3jJTuZAvFpLVrPOiPKuvnP4/AU0M+fP/z
         EkiDTlD1xxAtsg/UxZlRtwC6BImcq7eoOXbfz/DPz5VsEz3HR47fWjUFw9LjxqyMwfop
         vPXJuHiqPRwGwIC0fWU/tcdlCu6e54q5zE/VQp8b+Fz+T70WfSTK7HpDdQxxQ9N4bQ38
         VvSw==
X-Forwarded-Encrypted: i=1; AJvYcCWEpO3Exuj+Cm1f+4rDUpl6M9sjC0vnZzIMCQevrI4FUyIzkyvK2fgNYwozrsAnPg7MCK59zrchUfxqnLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCdbSNbFPC2x6kWTwlab5SW1W4ptHoax3szV14s7QBTOGgGXfm
	j9mOK2H//Ua7fCKyiv2hK/gFgdsW2/vllkBwy/OlN8bbuObzcjUy6MQU+jZyCA0QGUcNP6Yazlh
	G2zi09qoNDWEhCB7bDe8CeHbdUaIVgS3Q82frg+v/IrOWzbX8rGD6EJU6UoepyFDOYYucCU4HTd
	B1gwMDJJnJ3UMBB4NINSQESWdGxKpJFdKx/pJqQ7OEKLNLMBefm5j7
X-Gm-Gg: ASbGncsrVShtPgm6tqpAkGWFYnqSOZJ+p5NbVJiiJPADOSU2wKt/miES5IyqbBOUW8v
	Y1mTTCcumBRWmar+i04heXRkDkAWQCfepzKjAmJVyRvtUgZckCeWrGiXqmUtDKBULxuPafQ==
X-Received: by 2002:a05:6902:1003:b0:e7d:7e4a:24dd with SMTP id 3f1490d57ef6-e7f821a2fc5mr22012109276.45.1748913646342;
        Mon, 02 Jun 2025 18:20:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPmAlxmvcMTiK/XDr0rnfNiCP56keNN/57x6ceV4nEFPyGnFA1vocZoTQcJKiotEyeUzmiKqgvZWovkOBQytI=
X-Received: by 2002:a05:6902:1003:b0:e7d:7e4a:24dd with SMTP id
 3f1490d57ef6-e7f821a2fc5mr22012088276.45.1748913645973; Mon, 02 Jun 2025
 18:20:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201-topic-ignore_unused_warn-v1-1-f29db78cea3a@oss.qualcomm.com>
 <93b5004dacfe1151ca3abbb0fa31eaa6.sboyd@kernel.org> <87241686-90b5-44fe-b4e9-1a59451e3575@broadcom.com>
 <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
In-Reply-To: <CAA8EJppgU7_BoVCDfTuKVveBnnhtHUN6jEzkUaAou7=aypD-Dw@mail.gmail.com>
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Mon, 2 Jun 2025 20:20:35 -0500
X-Gm-Features: AX0GCFuHluwTsP7oLiyvKLnMzG_WoD3tJgykr805F96nO8UQuJnf--QyhpYzhjU
Message-ID: <CADLxj5QnVKkRotvKXNFaORqiQJ1oNPm=SpDzWgnOpWgOcXse5Q@mail.gmail.com>
Subject: Re: [PATCH] clk: Warn (and therefore taint the kernel) on clk_ignore_unused
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDAxMCBTYWx0ZWRfX/bJsShhu1Udr
 +Kicqym2a6sRlyMkF7tC0bgsIJlrS7XK2hfBHvXiSWYyf5FZLP9a+tFkbc55q80IlfIQJgWMqqp
 qWl2d3GxZrtsRLFbMvak6IrMS+Ey3nf/YNY6Yo6a+xXlZtQVpnHw/I7otRoHwBMdkvgyMCBaA1L
 ptpEOzpEm0om+iUx9GTuYSUOeT2TJ9eAoq+b294sa26mc3R2Y6RveRvunVZcyKLS+5JV8xH8hpf
 cpes7DtD5P7EkWgEYy093dzlNDDm0WnL4zI1e64uXDUOu+Gd5copOm1Kl27kgFRs2525EFr6jhz
 VPkBJEetTSyzgbuynD6lhhrQrT91yl+CEx+QtQwJSd4c556oeM1CO55ABlmdxj2DtCl2BP0aJWe
 nIPFX/GnQj+N4Ci5Kec4gSUOQ6VIxEojUOW/Y55sBPvjma72jhC0NHfoADExQPnk9GDzHjnW
X-Proofpoint-ORIG-GUID: tRwRJcFtEzaxhhVNW2YVznsw59uzeFwA
X-Authority-Analysis: v=2.4 cv=OuxPyz/t c=1 sm=1 tr=0 ts=683e4def cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=KKAkSRfTAAAA:8 a=Q-fNiiVtAAAA:8 a=EUspDBNiAAAA:8 a=ecN6cws7RnC_jEw2w0AA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tRwRJcFtEzaxhhVNW2YVznsw59uzeFwA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_08,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 spamscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030010

On Mon, Mar 3, 2025 at 5:17=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Tue, 4 Mar 2025 at 00:16, Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> >
> > On 3/3/25 14:48, Stephen Boyd wrote:
> > > Quoting Konrad Dybcio (2025-02-01 08:52:30)
> > >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
[..]
> > >
> > > What is a user supposed to do about this warning stack? We already pr=
int
> > > a warning. I don't see us dumping the stack when a driver is unfinish=
ed
> > > and doesn't implement runtime PM to save power.
> > >
> >
> > Agreed, I don't think this is tremendously helpful given that it does
> > not even tell you what part is incomplete, it's just a broad warning fo=
r
> > the entire system.
> >
> > Assuming you have a clock provided that can be used to turn clocks off,
> > and you did not boot with 'clk_ignore_unused' set on the kernel command
> > line, then you should discover pretty quickly which driver is not
> > managing the clocks as it should no?
>
> Unfortunately it's sometimes not that easy. And some developers
> pretend that 'clk_ignore_unused' is a viable way to run the system.
>

A bit late to the discussion, but I think you got that "pretend" part backw=
ards.
Some folks pretend that you can run the Linux kernel on a platform
with clock provider or consumer drivers built as modules without
clk_ignore_unused and have a reliable outcome.

Regards,
Bjorn
