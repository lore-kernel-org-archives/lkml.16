Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4169827817D
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661551; cv=none; b=tKqKUBGBNWl2zE3W7idUb3JsJNmsF6VwWkYpbIRO6Okl1gNFChp/7Kliz5H5/rUl+iL3XwBewC1gmyJbpNAXUbU1RCROUFA7sQ/M2QBGVxQ5sFpgRNvmuGTRpuBcIqZz6XrDObq0080f5RCHTqS3dm3yAnXmW1cAJaZOKjZR9R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661551; c=relaxed/simple;
	bh=Ty0mgOaUOMptCfYc6qpz38mROmUwTRB/tempK+OqW3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NCMt+d8kCcgF1rbOhqaPHxTx2np7pE4UMdMQr5SqfqitBz72dwgFSVRUaHvVLEsuDuf/GE0+vU3smfbFSAD/FxNCxQ5qzri1zBrF4/ec7oHVL2TcY0rJK78TX5KR22fqFriOHD89EG3c9o9ehL2KuOO+DK53teCVHlMUsOezvno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qb5qGP60; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qb5qGP60"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9rZOh003157
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=roo25XkD9MwN9YLNJ0rkSlMr
	zlUHYdOOQOOLiVFz1HE=; b=Qb5qGP60B3NePNIBhuUHRGJG3bWV2EmZfcrXkX1J
	lsejR0Xl6t4ZPFZi/OW/aVX9dkUI4sTy1GsxQGTHDDSrTD002MZRs7A1Lnsg3ibF
	cKtmJihniGyOaMIjccbxx4B19yyxNQpNL5QfzLUj3D/yHO77zj2n8hrQPYgllDgH
	QD9mfTqFRVtIirD+ygaEMW2IhcoLVuducyiqt8HP4mcQsMvPbsxXsl6ye1A0Namj
	mbH9BioQ5GDtEkkg6v8ME6DuXuSduAjggor4j20fh46FLnWr70+NxIOoxLvjwh3d
	z0n3Kkh1Rru3cfqsKbPe1gGu7VkftebSlFo6kb9jG3SXEA==
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com [209.85.166.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4me9h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:32:28 +0000 (GMT)
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3ce8dadfb67so43150695ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661548; x=1748266348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=roo25XkD9MwN9YLNJ0rkSlMrzlUHYdOOQOOLiVFz1HE=;
        b=upZAU3dukjiF+gKeb2YNDJ3t+yplTgnj+ed0+WDeLAQ6/+476qY1g30KXCrzjOrAVa
         YHKIBoPkQlgNphaZAYYqNhdAq+YDzmX1nZobqyhyUKwkARMyUwOvavYIqqlVNa8BKNnP
         0tgi3uw3ngMZRYJ9SzWYKZBj4gWfhSWg4tqDu4TOAQXMa7+Dib32uh9H0oHeTKiLJbYQ
         chQ7GSd33zv5z1JE2KMN3aej2mhfszlCYcNM7hzaLDMqptZZ5jQL5fNLfyzz1PCKWHGi
         uV4biMp+ghkagClMJwva4yHyIbZb0bbAeNGgzXVkj9x+dXSHoa/gWcl8IblI018mL0yk
         0axw==
X-Forwarded-Encrypted: i=1; AJvYcCW9xg8mu7QqOf+zNSsBqDyHYiCM8s3hgmchIlNlSN5H2lnpxss3IOVSiy8eLBjco0ea7jLH98w3UTnj5vc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTVgBOkp6DyGdYFQ13qepjp8gNDMS9Q2jggHi5IaKdVvSKxJ5e
	i+hBuyzZGSpTna4lD7WwdafeydIa/NbB9pZFl9Q/BvCuAxq0vvbOQmZioTLef/J49/rhApwn9oA
	AHVIJsLQlFaDd+L7KgELA9cY7f4ziUPLqVn39sEq5cLWyFZ0YvLPPpxkwN3ie4KgqZ8s=
X-Gm-Gg: ASbGnctQa792q8A8owd9dmJmeY+fgb8WXoUZFTQS0TAAO9P/bszH7bjOo9tmIz09Bh/
	pLv0N2MJZqiYMy+3RDK/hlDBonNnWrk1Xuuv6z+YUAEpQzjg2PCiiyq/xP23Z1hj6zk7kBF9Www
	cec0UiCrvCcyRkNI6tdZ0kFxgZJfMl5g+pKFctJt7hvU2aNiiZCiovXmI4P3HOjIYUueJ1ledXE
	utfPHYFaODute/gK+l/MM7DpiHAJB3LDBnu8IpYMN2UjzVNKFRnU4FrGxPFJ/sIoJCuJgL/MJ/c
	h1uTy1BnK0Ar1I9lYyWBY8dUVAdWSPCme7OlH1O2tXLUKNR2HjHpWMNYyptY+i1Z2p5Ee6Vuwok
	=
X-Received: by 2002:a92:cda6:0:b0:3d8:1d2d:60b0 with SMTP id e9e14a558f8ab-3db842aae78mr135137155ab.5.1747661547784;
        Mon, 19 May 2025 06:32:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVkVDsyixEUb8OMq/WsoDZju8ka5ZGx6BVSZrQXQfPiLNdGYIuQ/43DL17obhYrD8HKJ76zw==
X-Received: by 2002:a92:cda6:0:b0:3d8:1d2d:60b0 with SMTP id e9e14a558f8ab-3db842aae78mr135136855ab.5.1747661547433;
        Mon, 19 May 2025 06:32:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f34d40sm1867709e87.91.2025.05.19.06.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:32:26 -0700 (PDT)
Date: Mon, 19 May 2025 16:32:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to
 unmap operation
Message-ID: <p6cc5lxufmefeulx5bhlh6q6ivwluqf2muj3hu5e5526fsppuu@brcy6arm7epg>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
 <uw6dcnbgg5vbfkcnei54rwkslpbseolr46cqhsosiadscd5srh@ixk67qdcwfug>
 <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1246b4e6-dd1f-4293-b580-5d642f661956@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8Hov2H7wD1X9cQ1FPDGlIORKN-t4kciZ
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b32ec cx=c_pps
 a=knIvlqb+BQeIC/0qDTJ88A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TIZ-FQZdIQNwdW-vVJYA:9
 a=CjuIK1q_8ugA:10 a=8vIIu0IPYQVSORyX1RVL:22
X-Proofpoint-GUID: 8Hov2H7wD1X9cQ1FPDGlIORKN-t4kciZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX7xvJQO0B9zmD
 b2zS26SLEmDycYSjTMYkTBwFvAQydORnNWMeXyUKFyoinB6RpAA6Mk9tKJtsJONuYBOgzqW5dCU
 XCssWXdf6CpX4wa8wBeMmZc8hxsOyQnW05umMccC96JKm4+3bAwqA5sF1YSNjv3oNXuMzZEd4lE
 EkKzPbERmfmXMwxTdND30Qer7JPFMK7KUCXkFXgvWoL9ruCIuXav6saWHtOHZ9WEsv02HHyIcpG
 EKJjNxhp79h01A4WFLTZQODGmUNgOqfot/7e/geDATddQ0wuDucPVmDFwmvLuPbanNPYsiMAXA0
 ZeFBeHac6RFZ2d4vQNDx6sqAd1DYgCBozXv9OB1jkIDIgDKcg1enXWY1ysDW5vw73/PlBLh9c0L
 ux8I+LK1iXVT3Z7RrOUwBoLWeQK6eDmftDJXXTWyi6Dw/Ate69QLOR0KH/94BR8Yv6YwN6lJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=964 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190125

On Mon, May 19, 2025 at 04:26:27PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 3:50 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:24AM +0530, Ekansh Gupta wrote:
> >> fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
> >> getting removed from the list after it is unmapped from DSP. This can
> >> create potential race conditions if any other thread removes the entry
> >> from list while unmap operation is ongoing. Remove the entry before
> >> calling unmap operation.
> >>
> >> Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
> >> Cc: stable@kernel.org
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
> >>  1 file changed, 22 insertions(+), 7 deletions(-)
> >>

> >
> >> +err_copy:
> >> +	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
> >> +		spin_lock_irqsave(&fl->cctx->lock, flags);
> >> +		list_del(&buf->node);
> >> +		spin_unlock_irqrestore(&fl->cctx->lock, flags);
> >> +	} else {
> >> +		spin_lock(&fl->lock);
> >> +		list_del(&buf->node);
> >> +		spin_unlock(&fl->lock);
> >> +	}
> > Can we store the spinlock pointer in the struct fastrpc_buf instead?
> this spinlock is used for multiple lists(bufs, maps and ctx).

pointer, not a spinlock itself.

> >
> >>  err_assign:
> >>  	fastrpc_req_munmap_impl(fl, buf);
> >>  
> >> -- 
> >> 2.34.1
> >>
> 

-- 
With best wishes
Dmitry
