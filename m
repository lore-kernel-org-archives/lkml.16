Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FAE4207A0B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751125818; cv=none; b=KBfww0EcMFQW7RQzKbpmfb321StjdG/VZBqsELC83iO1dEdEqFXP7B6lpcQqZ92eElJr4DLP10oVicOt7jKqo1Un/Rd3cEuQ+mVEdNe/R4/P8n2s6aPkSgT7usnwWR1RkjESkH5P5zM3C+PFoE6MPymEGqrBv+540lEQetltIr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751125818; c=relaxed/simple;
	bh=UhdyBvWUdTzq9Tt5CDP9Ck0AZU7LvAz9Un6yPjcW9Wk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHzVTOaIHZPf+6rSQ8/Kf9FR2QFLTA2fSOHP8keZPbo+7p9qQahsYNNuAemHlq6YxQxvBn3QJAE7U5tPEUNIdEz5141txIGnoJTBYOzDBE9eU13ksVTc1n1kCc/ykruatl5TW6/BAYaIl54W+lqD9AIF0T6oq0uwN7FISftRycY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7By2li1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7By2li1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S5Lo2Y024967
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eWdrwLiaH5wIgAqjHd2m4i/B
	poO4mO4jKXqkdUUaYhU=; b=B7By2li1GNB72N13F0O4kwQ8l3hqREd2hocKNCAH
	5F2Qnki+puRtJ+kshqMy6IvTc549shFPDBZhdsKudvNL+yArE4lnTyoC8hwF6Oet
	OfzqAVt3ujL/tST/7m86L/C+lFysuqiL+K88jW6i/pehY0yCmv+yZkmHvw4Gkv+u
	nnPq7XyJCCTVJqR+v9jL7+2sjNVBodfqhupiczCGD76XHB61psa6YauosrAfwDhk
	VdIIAWsLnyVuyXl0Bb75VRG3kdzyYrD+r+kI4Rabb79V4fzzLOHGL2DmStqLw97B
	KSiyXZeU/jZOh+YJXo++2ftVsAqj0IFcqhlie2AX81z5iQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k113w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 15:50:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d15c975968so140153085a.2
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 08:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751125815; x=1751730615;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWdrwLiaH5wIgAqjHd2m4i/BpoO4mO4jKXqkdUUaYhU=;
        b=quAIq6rSTBg/Fva7VtbxuTy4ZSuamg/z4H0cb78zHMOIzberh9cbsZ/CQQSA1WiWh0
         FeDw9pSIMvWKijmfYpyfHDam9yZHemFWrl6Xp3l420r4+P0e3arpYrYOfA5v3hrXgEuG
         x4a5WK9M77L8AmKRbYM3lZlCYm+3JrAK1r4FCx7nOb+yG22jkLsh9OuByVyJyM40FUMN
         b8xGob6MNTStCyWV76AnS/pTmhQE80iY+uikH+kVArZX6QumlCEUf3bUv2YDQSoEbgPT
         uqSRPmLQjDFBwF6CfKgRUtzMACCI9fJz6yN0/arhiW8WtvRNSWMK8eikk5ZLH/geJQxP
         GmmQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+SSyOIj6E6Uf1OGfMa9jmXEzWwnriIWMR8LbqRha9Q1qGTxKb2j03gM7nOyIKXbBR+8OAVqbxd0gFDKA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEjwD7VRzSg+pLi8/90Z5QL+bCZplgJ1t2ROHdlgWhxoU4sRn4
	AXv8zu0Kq2xnPoLNFDmoYabG9S+Sq4DUQ/Y9ER+5J8+jsPFZ1Bu6nHJzoB3ERfO/xxHafB0ip30
	s0cl9ixu3NQsCvCysWkNSs5oOLtsYGzaWgqfzdTzu/BUtvyYb0hB6IwDLqyI4CPBwj5c=
X-Gm-Gg: ASbGncslppJxw0NfsTIN6oAoPX86ocmHBsFUBZbk/GASP7adnXW+YQE121HTf/X0Oth
	1x/mWRlRDRF5nCKoAb397pPDy2ROnNMIMpYpUeXBR0PIZR2+4Nr+/lUClvOb1SadG7Urk218hCR
	m4yUhSVjq6Qj8JSqhE+Bp9HFfroWvwh1o+ATMNHYf+Xqx39X5f1T4dG/uOfJzN2Nx3IbIKH3KV7
	8vg5v8xg/JtjqMJcZMBhCql19uaSmM0/47XAUIeS/ns1HdCMifmwFyc47Ei4TjPZDzPx5GyqF4I
	QdWioqclrawvqOPVwW8bZcTBC4KNlM1Lt4Ku6xC0GdD0stMndgn9Q/Ud7klfJ8XiyQeEgGEXwvJ
	p/lgE5SZdASrKsbeNQjv85gwRFYF63bQAZQs=
X-Received: by 2002:a05:620a:1b8d:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d4439a65femr891493385a.34.1751125815026;
        Sat, 28 Jun 2025 08:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXHeHAR3jro5JwVkyah1P0tVqO4Nod5yvizT9CIaPu13zn8ai+/6N0tztx2GTOOd7HbCGs/Q==
X-Received: by 2002:a05:620a:1b8d:b0:7d2:139b:a994 with SMTP id af79cd13be357-7d4439a65femr891489885a.34.1751125814642;
        Sat, 28 Jun 2025 08:50:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2edcc2sm842664e87.238.2025.06.28.08.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 08:50:13 -0700 (PDT)
Date: Sat, 28 Jun 2025 18:50:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
Message-ID: <uzohbx6rzv5wmo3c45pczn5lory7qwhqc5ixx5wdnvdbzemhvl@edl7dddvruly>
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=68600f38 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=4BQ2PeVRA74-f4yG9uIA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDEzMiBTYWx0ZWRfX/o7hFYBsEvpj
 GZbI09tWH+LXo8etMlTcl9HPjPY7EgVqMAR+nf83v/qzfKRCMLgEF5VA2QCBgBLvK+1hq6pH7yr
 mzCUZAxFmuWQMGmPPrMPt6uqcIridG2kMehe8aNizq745x3RWCEAiA9XbE84KEpXnMY1HxhJ7vR
 7Wsv3Tge9MGaNo5hFh1tJCQiDQczCuj9s/u//axncObIrq5r1Y3C0n7WiFfoghPx00M2VCaMiyf
 4aLMzacEipBdhKpe8pIpP3rVCUY9PV4j9x12ET71dYaiEVg4DGmczJ6SsVDItyJmOw6TP3sD6g5
 Hb+3Wy/SfIOuEbDncFS2KCh84T70CBKPzI1pOm4PQA8Dm/TVlmaOQLf6yEIHVedk9IdR52XNPPb
 LmP9Bu1jPq5FEjauP023NBK80jhsPXsIAoKPztr0oGNloGYZTveW43HT2K5L25+O9klqDEsV
X-Proofpoint-ORIG-GUID: HiahxdHrBCH0BhgQDZKOfsB2SHzAEi8j
X-Proofpoint-GUID: HiahxdHrBCH0BhgQDZKOfsB2SHzAEi8j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=755 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506280132

On Wed, Jun 25, 2025 at 11:11:46AM +0200, Luca Weiss wrote:
> Add the PM7550 and PMIV0108 to the pmic_models array.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  drivers/soc/qcom/socinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Assuming that you've seen them in socinfo:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
