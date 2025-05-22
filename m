Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D19221285
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915919; cv=none; b=G0fhsuLjLQvna1DXZYMPRLyEnleOu+vix6LKxYJREFUyeLOp+VI78ByD+ytWkBrhfK0kaxqvQKZCq6fo+uakaR4dVHDtx2hDlFXvO//MX+UyfhOn7z7rVhUOCWXgGqqF2Lmk5rHzagd3HQKIEgXcPtNediFBOyQsiBjzHgD0LX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915919; c=relaxed/simple;
	bh=oqvrcC8YRASsnI6iNObCy8oJhW0KzispMcJhTnvLQ/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=euaui3G5eg6DhCf3vwS/7lHXD1eJ4F/kBLK1EjQfLWuCm9/99ndQNOog6O6sPr4NnPw+qmZkED2BUFOcwv03hNRUkrLbDWBsA8nML42Rd1GJ1ukaXXEto9gDCIzu9zV6Q+osVztfd4K9a+msHycaRpAQzctr4VujYQPGXCAquIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FgaVWke/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FgaVWke/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M7hxvR000873
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:11:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1OvU4OaQPAAxsTJt9AcdgBDD
	Dut4RQiRmCJONEEZXas=; b=FgaVWke/p5ieGS5LDE2P/OYFDZd72vFGr1CTI5Kc
	+ZdfaaElguxJ0CEye1JaW7EY43hMvLmBbzZUdMh9LOowzK9qJw/+IbBXgXZhHyYi
	yV3LQDPV/IUGaikhVzjJnsi/bKD+Ny5Ov4qUkUhbsKp8aF1HpQQ/dDqFfph9bAUq
	yAgf8cduT0NC3AHJak9km52QXudDz24OlBlkPNveP9EG98qIjM8bkQMULtUdLjuQ
	DXTUSOd+a4F9gTpL20tdX5NagUlE9DCLqAYbs2NRkdpqgx7JoE6Fvhlkb0YPKK0Z
	2x8sKsIL7fcbILh+76tX0ZI2EOwIHoEeldX3Z5/Cx7NEpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6x5r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:11:56 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22aa75e6653so58634115ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:11:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915915; x=1748520715;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1OvU4OaQPAAxsTJt9AcdgBDDDut4RQiRmCJONEEZXas=;
        b=CrQXfuvoqjw46oCOkrvJFAt5qFrsIh6Bh21J5N6K/2pUk2JKUa/W6pSk4YVn0isqf/
         3cHtf7j2QfmTi9DuwItq+BZupNu2h937UjHFqJuZTXfylQsXWU2fh1dgtvY1zJnowyrb
         Gk1jhNo0Csuk9HGrzaf1Jl0gJmHEXUuq7/YFTLP1xgOoJAKOLMKOv1iLs1s82QK62gTO
         aG00oQUkrIU3ZOsVROuxf6jhQHdCIDIbDeRsCeCjI6YJ1p9Fit+ptl0rSJoLMwteu7WR
         8v8WGyPi24xFNOFbHSsFlffv3yN1ppWyfRWkC1FWgSBs+SXbgv24CuA8SkPxf0UsVy8v
         ogJA==
X-Forwarded-Encrypted: i=1; AJvYcCVmsf3A8ENHOnQyDe1iEydPH5DOB0y6vMStWEsPPicoHvqsAfqyV1Wm/wpKe6S+fZFQer0UUpHnHheKhlI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw84jtRaqgr6TsIQdx9D/ebRvEK1M94weK14czxV3tTNsuQs4bY
	5ARBKJ92nYXfp5l9zQyUT6K7NJJObJHIaP21MT7A9VyrQ8jcXnirDBGLP4ytfkvuimcG/bFaDdp
	9fgd0VbiRp94aFEFPBGiTrTUnu2SGcxvRR+G5KgcEWGDHd8KnjwOTrtv4wl6O4K9wq6oSkv6IQK
	qV9AU8tPuZp4jPl9WyFZ/jr81IxLD5h5R6+ZND9iLPeQ==
X-Gm-Gg: ASbGncvfGJ3C4uaWkuHdKlFsIGy1WL79xtI2JWDExrlW1EJ7i13HH71JZw3JYb6SeCX
	sjf0wKyj54giJI6hs8CNesaWzo38HyZ79cA2/tyD8LT89rNSBrm6Z0UK9ix/MUicXSRtnF0snDH
	E6zBWqBEg=
X-Received: by 2002:a17:902:d4d2:b0:231:faf5:c1d0 with SMTP id d9443c01a7336-231faf5c3ecmr354091985ad.24.1747915915329;
        Thu, 22 May 2025 05:11:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESIl+YAA+LmGGozI0lWLtu1kBwk65N5SNlCdpiBMOASwRP9Ac6amhIibfmRF/Rk9s+GFOqroMlir5kClZwazo=
X-Received: by 2002:a17:902:d4d2:b0:231:faf5:c1d0 with SMTP id
 d9443c01a7336-231faf5c3ecmr354091545ad.24.1747915914913; Thu, 22 May 2025
 05:11:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-4-ekansh.gupta@oss.qualcomm.com> <dgij4bftqzog6muu2tsaq7vxj2lpjh4ahwgrpt4ztsvch5juey@4ki5ly3pzuad>
 <b1324d19-9a61-46d4-b7cd-5fffabf95685@oss.qualcomm.com> <cqwvytawzuczg3drgojfddifsqjaxtzs4dcae2rjw7dag7n7b7@pa2mkmrlvqjb>
 <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
In-Reply-To: <36327516-3db9-4bc7-ae2d-162135466e7e@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:11:43 +0300
X-Gm-Features: AX0GCFvYuxPUpH8myXBy6T_C47lECUFkSMBFRBtjqAqbhfjKJulCyzwdkmj7MpI
Message-ID: <CAO9ioeVCU50YX8jYdCxTZ066GjpKW3kL+4mA=PMrOEROb1szuA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] misc: fastrpc: Fix initial memory allocation for
 Audio PD memory pool
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: 6Q82dyzhJw7KvLC47qhxlk8IO5kgfo2p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfXw00S8O0zfjlx
 0hKLgRueCLR5NHIUFTE9NgM20eL3z20UITF47IKj9I56VG1qFPX9+4TkU/1y13D8zsYALpyIejf
 8eQk04Wdc3ScfHD/VDnvgjSYIVWC7beu4vg29PhyxLlRdd6O+NYxIRGHmJrByg9pGWUu9xVsIuI
 rUPkeaVSSoFo+XU9nTYvR36W0BggpGn4KAxF5jn+xo2+c65hmHmuO/gs5r9s60ced8KIUd7p4dm
 2O22SPSA/+Mpj2y7YnXL11Xdb7S9m0sn9y5KS1mwVPGJv8NAzVgAChxwouRdLFUpylADt4qovz5
 Eqagh+YeSrlpI76wf9LOVlkiWJuB3lt9wmR65En8iK+ELSvlbyXdTuE+z73v6caFgiqWuN44HRo
 M71p3gKWzHu0ZvYnDYpT9YRxau3Kmz9Dck3kAFCTo7BWuQPF+iafmHW5+s4l4ieqV0u6Kz+/
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f148c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vDpd8R7RqsPVAR_k8fEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 6Q82dyzhJw7KvLC47qhxlk8IO5kgfo2p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220123

On Thu, 22 May 2025 at 07:58, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 7:01 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:23:28PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 3:47 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:23AM +0530, Ekansh Gupta wrote:
> >>>> The initially allocated memory is not properly included in the pool,
> >>>> leading to potential issues with memory management. Set the number
> >>> What is 'properly'? Which issues?
> >> inbuf.pageslen is getting updated to 1 in case buffer is allocated,
> > Is it a flag or some page count?
>
> This is page count,

If it is page count, then why is it '1' instead of being calculated
based on the init.memlen?

> based on this count, DSP with add memory to audioPD
> pool. If it is 0, the memory is not added.
>
> >
> >> which only
> >> happens if (!fl->cctx->audio_init_mem).
> > You are describing patch behaviour.
> >
> >> Till now pageslen is always 0 irrespective of whether the memory is allocated
> >> or not due to which audio PD is never able to use this memory.
> > and the is current behaviour. So this answers the first question.
> > 'properly'. Now, the second quesiton. 'Which issues?'
>
> The issues is actually memory leak as the initial memory is never
> used by audio PD and it will immediately make a remote heap request
> as no memory is added to the pool initially.
>
> I'll capture this also in the commit text.
>
> >
> >> I'll update this to the commit in the next spin.
> >>
> >>>> of pages to one to ensure that the initially allocated memory is
> >>>> correctly added to the Audio PD memory pool.
> >>>>
> >>>> Fixes: 0871561055e66 ("misc: fastrpc: Add support for audiopd")
> >>>> Cc: stable@kernel.org
> >>>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >>>> ---
> >>>>  drivers/misc/fastrpc.c | 7 ++++---
> >>>>  1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>
> >>>> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> >>>> index d4e38b5e5e6c..b629e24f00bc 100644
> >>>> --- a/drivers/misc/fastrpc.c
> >>>> +++ b/drivers/misc/fastrpc.c
> >>>> @@ -1311,6 +1311,9 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>>>            goto err;
> >>>>    }
> >>>>
> >>>> +  inbuf.client_id = fl->client_id;
> >>>> +  inbuf.namelen = init.namelen;
> >>>> +  inbuf.pageslen = 0;
> >>>>    if (!fl->cctx->audio_init_mem) {
> >>>>            err = fastrpc_remote_heap_alloc(fl, fl->sctx->dev, init.memlen,
> >>>>                                            &buf);
> >>>> @@ -1335,12 +1338,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
> >>>>                    list_add_tail(&buf->node, &fl->cctx->rhmaps);
> >>>>                    spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >>>>                    fl->cctx->audio_init_mem = true;
> >>>> +                  inbuf.pageslen = 1;
> >>>>            }
> >>>>    }
> >>>>
> >>>> -  inbuf.client_id = fl->client_id;
> >>>> -  inbuf.namelen = init.namelen;
> >>>> -  inbuf.pageslen = 0;
> >>>>    fl->pd = USER_PD;
> >>>>
> >>>>    args[0].ptr = (u64)(uintptr_t)&inbuf;
> >>>> --
> >>>> 2.34.1
> >>>>
>


-- 
With best wishes
Dmitry
