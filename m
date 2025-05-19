Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935DA26A1B1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661660; cv=none; b=ua2P4pH7JAQE1bAPCLbiLj/bA1tRD9OBTCazb0jPLA5+qEgC1asg8kS++38bVCSVkCQVwE0fB6S8EmfxhyAE7BUzjrXuU1INBUF0Ti8ARSZieq+J4/SOqYFudRptlsNSmKBYhSnLvYFiJMPDFfbSPyOxH+ffELsFKY7wejW0nsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661660; c=relaxed/simple;
	bh=kB4yL39ixK2E/W6GBCz5xywTTmFgLjwXfZpiDkAKENE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSGaDH9cXWHofJLQR5gxab60PMDQXZwabgjIZOPT0DuK6WStuhzZLe2H3xHFcqbyvCbwMSPaNjiKaI6e4KbNzwL6aripA4ORR1u3GVn6gczYn9dLWHVrieDN3eO+k9nZiGQuLVBajmVXPVmSDh9J/Q2/AdVsfTXuIxWqb0KGb80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1NtbhJ/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1NtbhJ/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GhJa023299
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xpmZsdGXKdiDzFuBCCBP+7+8
	PxMeQZauDmsiloV3TR8=; b=O1NtbhJ/GamIerrMd57QzpuD9042qlBgDo7/1kzz
	+CansZR7/m8qmUEUuG4zbrstnGg2HTZoxpq6wuwePFsUmhOUJgkADAaiovVCHgm4
	AKOM9yvbv96aITgFZ1jtoUgxanO32fQjl8ahQ1LqR5wdRwoS0uW0S1cB/cpBLW/d
	QXmZJdyDxnzxjTecFkYNyGixuQPIngctCCt8dcouIKi6SREUaR5w/VQjfFlrzt9Y
	JsQmNG5m41PiDS2jiwnBFhjDSjQ3gZjBWReKWJn96tPmcLpNHPXcytBURly3Gphg
	7uvK141Fv/8rDGkLT0EJVQt0tsvAlwkhrXXQ/8YUtw4+Og==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041s2cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:34:18 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dc67719da8so15785375ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:34:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661657; x=1748266457;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xpmZsdGXKdiDzFuBCCBP+7+8PxMeQZauDmsiloV3TR8=;
        b=grVvl5PdeHhej/eDtmYrVAT7K+2fDl0od7XFK9xcQxw03ZWcFipkni8TO3W9V+viUp
         O2mA6fPdDIkYAx2kA/q26B8bxvSqaa3ViakcZlu/5fPERJcSQHuSbSDa0XsBLwjxJn5D
         mvXJd7laLXI9d31Z1SLh92PD2v5Ulm2peoXZMAZgVoXPvCgcnhsZcONum4gvvs578woz
         e+ygLCLSQx8m1A6w7M9pSiYL659msKplpJQvwsLKRELyBZgTLCec8YS+yf7ekC62kFaR
         vkHfizaxIrnImwEuquIj2eaFc0kkzQS5oCjRIfpFlpAIyeku8iZaKPrcTXVLhTV6Opwi
         VW8w==
X-Forwarded-Encrypted: i=1; AJvYcCXgjk2p+e83VLMoIZMTntPEabcG9nFnanSb4vBEvXj0tszUH8/ZuRWyTTc4FswaxVzh8IXpZ1CmB3trE9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxorxD3bgJvHuhkLIzHhzfToFwZqprixOBt6dV59hUBDGgyY1pA
	WftYns8FskcVTrEArfhkrChJ1JK0KOcJ0u2/gAobF7+5tRsptnpMOxrSmVvrLV3ZmeldTsuMPYy
	RiadZjdkmE0VMZUgVkd/6dG669wInD+1AzKqNeRQws37nJNAcBmy8cWRZSEpm8dp/eO0=
X-Gm-Gg: ASbGncsd0OpyR2NURzuSb5EA0pf8xv0fzizOXlyBRyjgaOSmwC9X9Fd6TIF9m7OQSm2
	r0kx6GMYvx38bAxuIPjR/QGuhIzKYqaH/Jt84ZTgdvmJvXfAsQ9QClH76rll26xcvetUaPf67Kt
	Evm4QvARsvciPM5/uaG9cQsH4Boj4kjzkeVg15wbVOSa5G4DTkEjWtWmmuI4i9mXfXjm64VrHu/
	goKQ+JCA7meez70kzcog/nLmStTcQdOILYuWOMq6xzIjXBuK2wo45dbEbw+217EYmo2pwNkuU+D
	GbVQH6n0M6C4xKf+85hDTdHV1b2wWRTWgWUwQ/8tc8aJRqtzkGniTvmor0k0VCyEbCKrOPYsk5w
	=
X-Received: by 2002:a05:6e02:2407:b0:3d6:cd54:ba53 with SMTP id e9e14a558f8ab-3db857c0338mr107675075ab.22.1747661657350;
        Mon, 19 May 2025 06:34:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcs1xC9T+Wm6LLSGkClHv/8oharNk5wTXGyZpzjQtEoc2B8cCPX68CXbbZPZLfmwEF7MSPLQ==
X-Received: by 2002:a05:6e02:2407:b0:3d6:cd54:ba53 with SMTP id e9e14a558f8ab-3db857c0338mr107674705ab.22.1747661656964;
        Mon, 19 May 2025 06:34:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e701831bsm1869971e87.156.2025.05.19.06.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:34:16 -0700 (PDT)
Date: Mon, 19 May 2025 16:34:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping
 user-requested remote heap
Message-ID: <7ogkoxsowpd2x5qmjog4qx5eu4eiinvtnyjz5hfufgna2hz7na@oxzmowlnelxb>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
 <22uccyp5m2szry7bpitqcav5nlvwch5eqh4mdacfedidgrnyhx@vsjobngwdkmb>
 <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc67df54-2a19-4318-acd4-b96b8549b64d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNiBTYWx0ZWRfXysT9Ru5Momkd
 1YysKRRhAgqEPTMU1cc+UTnH+/4GPwFh5uJr/yaEBB+qnFdndVzwvbi2qyZhKZMJxsza7+42PWs
 SirV00KVowA2REUzjoe8aKA7giwmcA0HFItL62PWWVzHgYFoaQNejdJBUwL4sWT0isCg96oN71A
 zHlwJ1klPVm1SlxfvjwZ3jyj4LNVrbe7nwJRIGnJ9QKYPPCoLhdJwxnH05S6iOk5V09c+wkcRML
 9UdnHsHBpgQQ5y+owVRlSYGYySknKMGc+nc2NzHrnYdqLySSAUX1QQ13Wsr98weqWoWZsU9gfy4
 /efew0Naf4RmhhP2iR9uhMrMK/Y0DscaGq3pkyIrc80QRQrxL6wTJM0i2MP3U1ru/v2ssh7X3E+
 ewRXo6AhU9l3/MlAhomEH646nBxCgExBArtr9PqaXQXS4GiCHtODXwnMsxJG2QNW+zfiz3pa
X-Proofpoint-ORIG-GUID: 4ALC6eSiRzWCyziv0xtL0tpbPavXhSCE
X-Proofpoint-GUID: 4ALC6eSiRzWCyziv0xtL0tpbPavXhSCE
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b335a cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jo6cr0NhVVvRSACVVboA:9
 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190126

On Mon, May 19, 2025 at 04:28:34PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 4:22 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:25AM +0530, Ekansh Gupta wrote:
> >> User request for remote heap allocation is supported using ioctl
> >> interface but support for unmap is missing. This could result in
> >> memory leak issues. Add unmap user request support for remote heap.
> > Can this memory be in use by the remote proc?
> Remote heap allocation request is only intended for audioPD. Other PDs
> running on DSP are not intended to use this request.

'Intended'. That's fine. I asked a different question: _can_ it be in
use? What happens if userspace by mistake tries to unmap memory too
early? Or if it happens intentionally, at some specific time during
work.

> >
> >> Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
> >>  1 file changed, 51 insertions(+), 11 deletions(-)
> >>
> 

-- 
With best wishes
Dmitry
