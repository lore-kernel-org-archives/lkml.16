Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 070A12E11C0
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750942474; cv=none; b=b/Dc71OAQc7OJDERdB30KS3ixV5BDOHKeiWo0G6Aa+x7Qi8Fsp9S1qWVtraTpnD1zOFXQ2hNPA3/2khQee0HeOpWmU7iVMOxevqNwQANXRrtGDXDEEOKZwNAxPN2LZGhO9o5KJ6NSOTo1pUvUMzcl5jeZEvAD40pQ73qW1xQTA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750942474; c=relaxed/simple;
	bh=asdumluxlys5mpuCyqM+5LtmRLFjUYo4X/pjky7in7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fCurHUuJf1CDjZkpVw2BBAvD7FjrGrzjK4+LCUgVyX6CJSBtyn77qFwgqlsLNsAF6m4OvaCkPQPM9Aaz8B4f7K0oG0bkeSACldOrEjxHnyTk37mKagvB4DAeDgPYWm+Z6ZYIzy6NTFLBFGAKO8C14IDkLnlBK1sfoeRp2IpsMcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bZ9KGKBE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bZ9KGKBE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9WLKp013378
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3x6shSd/yrF34vsnt1iiXfA6
	5GCU1AJJcNwTtSBnT2Q=; b=bZ9KGKBEnFFtGiR31CkiHufZWZC58eaxbW20N4DF
	B9YElwL7IPI63Q7O9LelBe1Uit11W+diCIaE2aMzdaMe2z77KxVdevvDbhty/aPd
	Ft84E0co7UN1TAD69k13W7MvWF+5ZMUfhEsX03rorFY32TaYGbu+nG3qnmkohMWm
	HrqdfJix/VIPHbl85zdJK6d+zSv6vrViOSYBOaKgFr1R6QgRjlF+eK/Beh8DouKc
	R6ShdJb802EcI3rFkdzB9wdWor7rfNi4jFK+HPDWtDrO+ZbH9PExQ7RQyoKgCshn
	rPBrBEvqDmfTf190r14j7Ldgu755rGfff3ppSsvXrSR15w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm21wq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 12:54:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31366819969so861713a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 05:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750942464; x=1751547264;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3x6shSd/yrF34vsnt1iiXfA65GCU1AJJcNwTtSBnT2Q=;
        b=rwRvdsXQleMb1vf6jo0l6piPtuMdhxsFSyeHRUu/Ma0AuHFuSkb8d0D0zB2H96X7oy
         Nf27J7BUs6H2gdZtX9DVpTihW9MXzVDnZjr7GurG3HDmsXYQyTWHMi8b+uqhvRDWhL0j
         Dih5kK+6GWBM2iu7V04nfGw4ehwUH0ava1jMHgjSYwySFrnRHn1DB/CB/f4CExbvtrYP
         pQ1yHLiHUT0haBgo9zYSBFykK6drux3Ba8vSzPJxAtAOM9oGDFLYE0OzUJd68Fc1MDfr
         WqJT0/9C9S9h4WOoVPSrVOnx/14bTRRMwQ/+XrKr8mGzM/+5hJkkAdfN3/oAHZxgn2hF
         fXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfcfdrqLeGoWTZuLCPsK+zYy/pmkmdr+7uqQGmKtcpoNy1yG68pL+vfM3Myy2LdAjLSlomQceImV6mBLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjuSBd+HdLryuKQf56NRNykGaWynWQyy10FGUCM/YnHhhhQ1Ls
	3KyqzT5HFd7+U6yOncF+xzGTaICfTIp572HEpauViVOGAFAE3sIHff2sTjajhl9wtPZa3AX57gw
	G6+71aScZ36b9phFdPM3HWyGhidscwh46Nz9b0vKMWIppzB1F4nZV2L2V6XKQ7mLFbmTXCQftXX
	fdz02k9CeA7V8J1tuRjop79ZB+1nIflOkmN5ap37ZoWHF5qlloxg==
X-Gm-Gg: ASbGncs6Iy/sXx/8nrOtvWvlb8XjaoP7TkwRDly2Y51OvZTmaWCS6mFOUgLBuyB0Enu
	6nH4KxzcZGCekxMVHGHwGCVxJVH0sX2JpIGxBdXhuofqgKWxZtQeBjsLAReRu4oE+xKo9P0FSJV
	mmEJ1w8qvNM+rdSDkANQ==
X-Received: by 2002:a17:90b:4c4e:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-31615961004mr5428794a91.24.1750942464339;
        Thu, 26 Jun 2025 05:54:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGuAIj1aEqYNeOoxb9nP2pAN+XuVJjT0xlC2v4akSLt4zynbmjMB91F5msiUFqnswgOqwnZpMRyUbkvjb89yQU=
X-Received: by 2002:a17:90b:4c4e:b0:30e:5c7f:5d26 with SMTP id
 98e67ed59e1d1-31615961004mr5428759a91.24.1750942463905; Thu, 26 Jun 2025
 05:54:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-1-aacca9306cee@oss.qualcomm.com>
 <aF0bLtnABcGTi0wM@hovoldconsulting.com> <zw5u5c2itmpxq34d22y5wmtr32d4zsmjj5clf77ryeqs5jgd4v@t3wjfyj43yra>
 <aF1CX2uWZ_KaMDVR@hovoldconsulting.com>
In-Reply-To: <aF1CX2uWZ_KaMDVR@hovoldconsulting.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 15:54:11 +0300
X-Gm-Features: Ac12FXxVTG1v8Nw68lgTtYQ3zkEFEeO_qii9xMXVu692vfF36NTvJZSjEsoMVSY
Message-ID: <CAO9ioeWwyxSgG9DNYpW-Z_SU_Scv+4sSBs8UeZnxFz+tOaESEQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] efi: efivars: don't crash in efivar_set_variable{,_locked}
 in r/o case
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685d4301 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=9OOZl2ZXbS4rxasUFm0A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: do2X3bOGsekqD1LBk0hK7Qd-QhQ4Sz1v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEwOCBTYWx0ZWRfXyj29g7YYu1NF
 91eToVNwZUkMn/M6SZO+dPVitfwIw1P7jrnN+GJSKYmKTqIqqe4Au9/4l/7HcSsbkzcUfECig/w
 I3sqTo0b/HBJr+ZG68GF1cwfOn1wNHLgEYS3xCDklbGAwsREA+JQTVZ4yZjwPq/tL7+KenCRig2
 e4UbVbV0+cNAVmPf27GCz3wIwFc88ys2JgL7OH+q2cKyTQm8Yf0+YxAToKE1LDPvYXy89O0nNkZ
 kyiyKsIKjLVp+aUbSBeizPJnO4ZyZ7Bfvi65lSmVO2F2yLiJHVy2GHTUFAGN58jw7+o+6Fw4uwj
 emrF4JVPT492OGcIOfpvuKCi1BtZAC2jFTlpiEK1vXHyxImOVIxz7mWGiW/cC2KNQNS9F8OpUTB
 /zDcYPzxPSc6EjdQGrImkCc3+WBTF3p9NYjDsvDWEXaB9ldLQtyBjo9Lz8wPoPLYU9yIMWQR
X-Proofpoint-ORIG-GUID: do2X3bOGsekqD1LBk0hK7Qd-QhQ4Sz1v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260108

On Thu, 26 Jun 2025 at 15:51, Johan Hovold <johan@kernel.org> wrote:
>
> On Thu, Jun 26, 2025 at 02:03:44PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 26, 2025 at 12:04:30PM +0200, Johan Hovold wrote:
> > > On Wed, Jun 25, 2025 at 01:53:20AM +0300, Dmitry Baryshkov wrote:
> > > > If efivar implementation doesn't provide write support, then calling
> > > > efivar_set_variable() (e.g. when PM8xxx RTC driver tries to update the
> > > > RTC offset) will crash the system. Prevent that by checking that
> > > > set_variable callback is actually provided and fail with an
> > > > EFI_WRITE_PROTECTED if it is not.
> > > >
> > > > Fixes: 472831d4c4b2 ("efi: vars: Add thin wrapper around EFI get/set variable interface")
> > >
> > > I don't think a fixes tag is warranted here as it currently appears to
> > > be expected that the callers check if setvar is supported before calling
> > > this helper (e.g. by calling efivar_supports_writes() as efivarfs does).
> >
> > It is not documented as such. So, I think, we'd better not crash the
> > callers.
>
> You need to look at the backstory to determine that before jumping to
> conclusions (e.g. start by looking at f88814cc2578 ("efi/efivars: Expose
> RT service availability via efivars abstraction")).

_documented_. I'll update documentation for efivar_set_variable() in
the next iteration and add a check to the RTC driver. However I still
think that this patch is valid.

>
> > > So should perhaps be fixed in the RTC driver if we agree that supporting
> > > read-only offsets is indeed something we want.
> > >
> > > Are there any other current user that may possibly benefit from
> > > something like this?
> >
> > efi-pstore comes to my mind.
>
> No, that driver is also disabled when efivar_supports_writes() returns
> false.

Good.


-- 
With best wishes
Dmitry
