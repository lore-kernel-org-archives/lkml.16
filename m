Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B32E3AF8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750194874; cv=none; b=RvSDsCJ1ZQRE9IHH5P5en+XLzIuH3hLxsXB4DsAu1cuO76OXEJwUkhNJ5tTiEqYLSt9N84SJhCZlwOxmHBI9Frx/+nOLN1xh3NVaMtjCdBU00OwwO3Atz1umvqteorNNgVtcwduzguersaT4orJRV5tdb17iJ/BG1V1j8uGxrk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750194874; c=relaxed/simple;
	bh=u9sQ5FNZIfCRkoh32wY/8yyyp10GkggqKBS9UMhJ8PA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0bVutX5nKlmY+X9hoB1C3uHIB8l13mLKsn6QBbK8qFoRSczzPF6Zw+MtSU7TMnT7OD8wiCJWHb0P87Eanh4DD1kxVPkWSxDXOkkgoA5JoR0oJWYpnxRm/SIxYXUuT9tYFr1bOHSY9AdIYMEWoqNvkAl7vjgGdJyYvekUiRrkjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=sL044JYV; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="sL044JYV"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55HKFhC1004365
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:43:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=cc :
 content-transfer-encoding : content-type : date : from : in-reply-to :
 message-id : mime-version : references : subject : to; s=pps01;
 bh=u9sQ5FNZIfCRkoh32wY/8yyyp10GkggqKBS9UMhJ8PA=;
 b=sL044JYV7uef5oYi0VV89Acktqm8ahYTVj+EwwoHVLCTzeBg3FDGb/w9n4QDgQA6tpxa
 BJR1rCPYYivPGmJmLaef4EpEZNXlYf2ljtqx8PBhYGiJet8Wqj2MnqPsQRI4biajggAK
 wQakfJQfmZbRkXLdvZE7P3rwnPLHkFiZpz+rj9UaXrVOvGpVSHolkGCbtIDjntRCoaN5
 0UdSUoMIkoYouigvonAct9ROwkVo4ZH2Xk2nk2ptssdhJg2KC+53E3mYOLdnwvWUTSk5
 TO0bVIZIyfRPOhrSVKa5ZU6Wed98XPF+S+OCrT40JNtaZAWW8hMkCLlhDbDP1PTbkxeQ iA== 
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4793byjga7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 16:43:55 -0400
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-70e4bd6510eso83456437b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:43:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193034; x=1750797834;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u9sQ5FNZIfCRkoh32wY/8yyyp10GkggqKBS9UMhJ8PA=;
        b=cjt5owjulNoeRlaIku0/I2tDd4vojK4zZgfFQ7uFmcsfq8WXYqq8Tok+sDcvzb4kAD
         wTlOOYdnuUvq2xFDYRRoPRvMaeiBYYDttpWRLrDeqdc64nQYN9cG8h5q77cdewHl1fKC
         UcDrlM4ccC+qemOLM9oPNhQ5NBDr5o4ykarsRo03M7do/2+mLOiq8jR6SHtztX0nRUBz
         eU/4fz46gmoOZGsueb8VEqDtaB8uZP/lny9PGsZgq+xCWMQ04vrrIFPzK3wG1Sc4jF7h
         jkRIzdrFVcLDooofGyC9cO0Shulcvysbioj1PBkMTFnqEmBf0QMLbwi5D6+EncIUnWsq
         TspA==
X-Gm-Message-State: AOJu0YzE2f7F5p9vjyjQ8hyV/ndX+OdwZvg1Zsu0djkAOZPYpVJr7fn6
	7VMZEQhYrnSoDpWtq7tjqa0/OmAKJHOBRxMY/QSyGm0uXIZwtWn/26qEojry+z36E8UW/63TnuU
	Z29PRcZ3bWREw++AkuFMyTwqvEvOU2nIzWwrPabLIIuWmPmuL4XBuXlOtsQJnwSoMgL6nU1h4dO
	FKNiV0FUvOFOcRheAfS3nzLDYNpktOsyvnxbfe
X-Gm-Gg: ASbGncvYuvMO0o+2RkyA8TSW+vPmwt5SsqiWrEve+hkH7GzW4v5sNj0r/elW/yx2ELW
	tevM2zaTMq0uE64KxEOzkER2HW870Tz4l1Ac4BneBYEs4aPKitFURrEtKeE79DZ5Ecdhg33OpZz
	PAFi8U
X-Received: by 2002:a05:690c:6c83:b0:70e:2cba:868c with SMTP id 00721157ae682-71175489fbcmr243794697b3.11.1750193034534;
        Tue, 17 Jun 2025 13:43:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjF0ibehLbKNVTF8HcFuWA6h3KDVMReJtX7DTOphewbVZdmya9vlUAMYxWvtW5I5gCI+10/DiUzzrU1AQ0D2s=
X-Received: by 2002:a05:690c:6c83:b0:70e:2cba:868c with SMTP id
 00721157ae682-71175489fbcmr243794097b3.11.1750193034121; Tue, 17 Jun 2025
 13:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528-tlb-trace-fix-v1-0-2e94c58f450d@columbia.edu>
In-Reply-To: <20250528-tlb-trace-fix-v1-0-2e94c58f450d@columbia.edu>
From: Tal Zussman <tz2294@columbia.edu>
Date: Tue, 17 Jun 2025 16:43:43 -0400
X-Gm-Features: AX0GCFuiCTOK14X6XurXoh82sgBg97ZdwtwT9OBTjyW80sMOJfdncixxOy-kdtk
Message-ID: <CAKha_srZTXfQkizBzvrdpWs6Txw2PSgRAqT6QC8gom=PaitYNg@mail.gmail.com>
Subject: Re: [PATCH 0/2] x86, mm: minor tlb_flush tracepoint adjustments
To: Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Ingo Molnar <mingo@kernel.org>, Rik van Riel <riel@surriel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        David Hildenbrand <david@redhat.com>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        x86@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: zkQkz7mqF9kMIw6zudBq772NdGMbEFqw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDE2NSBTYWx0ZWRfX9UrH0FVpyKP8 hFF8iVK9aEHYsvA4bG8IwAAiE6IoIBMdV9kX7Ha0UaeKDzfH1K0aBtGRKtqo6sVeZ6jan4pLBPA KrFIVKRdZvRQZeCTUbgOHAGRLFJHg/WqScCZJkQa8BlHH1Jf6eFUPr7IFqZE7rrGO7AamimROW4
 pIryhba7C+SD/rDQmqWtYxQ90asrQ98asc/AephQbzWgzastv5d7i37usEHhmuZG7IgWZM895RH SvC1oA6+lGO0Zp4io6TQoCnNy9pF3KFGCmjUkqhTn1oYQuGReGUFJJW3ljK79dBxYTViwNSE2tz XCBl7NSbBwTuma5eBIGWufukcx051gBlCWJytWxtzLVIinD1nPirbUHXk6xrfg9sSL6wRdLZ0yz YhMNaQ0M
X-Proofpoint-ORIG-GUID: zkQkz7mqF9kMIw6zudBq772NdGMbEFqw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=10
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=765
 malwarescore=0 bulkscore=10 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506170165

On Wed, May 28, 2025 at 1:35=E2=80=AFAM Tal Zussman <tz2294@columbia.edu> w=
rote:
>
> One minor fix and one minor cleanup related to the tlb_flush tracepoint.
>
> As an aside, include/trace/events/tlb.h isn't covered by MAINTAINERS,
> along with other mm related files under include/trace/events/. Flagging
> this since I see there's a recent effort to overhaul the mm MAINTAINERS
> entries.
>
> It's been a while since I've submitted patches to the mailing list --
> please let me know if anything looks off. Thanks!

I don't see this series in any of the mm trees -- anything else that needs =
to be
done to get this in?

Thanks,
Tal
