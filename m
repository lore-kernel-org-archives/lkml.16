Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E223E6FBF
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738197658; cv=none; b=O0kkRyqaUiEDLKrJAHpnrTQZ05N2fdZHZoLFgrpb922KGH+wdO6sHydnitgksM0j42vU4/1kwcpZM/Ql6XgD8MQncPqkCsPsg1h0YxgV5G8TjQaJoXa/We2SFK8a996ANe0w5o5YOFl0XG+IzVl/AsHCF28v4PLOfBfbFSDZiBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738197658; c=relaxed/simple;
	bh=V5Cnltx/k7lyq+iRSTLIH18N0jvX4j3KUrkiAckatwU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O9XjzjOxeNfUWQkemcb4Oz/WcP2LfTF2NoYQ/irAOrl9tQin/PMlXLfE0XqMIRe6WMNJ6Minx370frPkhWpPa/M++V/guK4ocujQ5EyvjiXPdTZ5bjpJCwSjSD396+6kMBvTBMBy9WxZyeRCSAxrRSkYHQZgAfBNNt89k5G0IOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j1UGNN0X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j1UGNN0X"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TGrswa013771
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:40:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	po3bYhuUznoa/KRaYsWLaR5r54iic7yoSXMCO3Mfr1g=; b=j1UGNN0XuGl9N1Ck
	KbOq/cLUx4paaN2RAr+lhHBdch6V6LTVcJhpbnxr0IoKf01zJUeTMCC6bhiqKd2Z
	8H3ojBmBvJiIaLf5YoI6dbHwGFJ0UD3BqsISpI6Jf/Rx5/c/OLJBvZj4PtUc9lQU
	q5qqKoiPgi/wbqS8sBZoWSxlJ0SAomPoH+Iu1qamlqhRPrlSZIYgO5etpU4sCHGP
	9rrujHmRNFFu1N/hfCUoZbyotwTZ8b7ZjylITRI+FN/Fo0S6k9m/7tv+N0/ATFr/
	8rB1s8YXpzxzEISCglTGoE6uPDPx0+EOrdkzhO3ygjrd+u+x1gmqmiLLviR4IHtn
	rlUlTQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fr8kh0xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 00:40:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef9dbeb848so426346a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 16:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738197649; x=1738802449;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=po3bYhuUznoa/KRaYsWLaR5r54iic7yoSXMCO3Mfr1g=;
        b=ZKzZ/Oo6GWaxqIv64xWaVVWVZqpaYzrO4mmC6R4ETwiUTiGtxmW+ahz67GpfKiazXM
         iNBmLrNUX63DFKnrxDz22cOUb0jl+Vc1vMJ0RraqTLlOKAkCt40OGWlsOE1q3nGgkJZj
         TXuX09KO5IrgtkeEZVjDapAez+ml5XBkXOcGOO6cMphLWB1V661ccf97U/hFxk+BOhob
         ygIQ4z0tSeNJ70qIVMYHqmAmwi/i6nvOKEPY8RZlsHIuJimPdGUC5ejV4vv+NBG/oaBt
         NlHiXaUnd0dacZeupBHQuzM56T1TtyLW7IU9VmY6im3mV8/q7WC3FIX9fccxCFRoSvHT
         Ns8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVtQBnffdhw8I9qIuVmeHfpRvlQPgLA4H1ixXA6YHOWVgexoiT5+dk/qPsyoyyaa2s3AtJk8im32bgtRHw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA+wUMuprYQ60tG/ohEhJFtqihNlU0as1M2jI/FpGXqDYXqpJ/
	D5KEGZqFwhPudMI3uw7GGHwiyo/aXBBIvA6+ODmyi70el05+H4wFEANOX6JWwR0wcDMD3iZ8XtF
	O5pnzFqCH6Haf4TPu4xHlcTf5KPyuW2Ca2VnOPCKqFdcF2t+yd1hRuWGjRgyPTCI=
X-Gm-Gg: ASbGnctPQAiAceEj9eZBlUlaKpZs1VFMW81PYBgdeop+RcfkNTzXuEj1PVqHh62bwe6
	EaEDkYc6w3eFIb+f16gV8LxH7MzXVb7lMeRIMgdkPtAIa5R89GN9jguIhcoKXKCERITNXXC38Gc
	5QfA92xwjYKOSbvKoobGzGO6svULlrb3sz1BYFN+oiBHEWEna8gKZNNBOeYo1orXpdPSTEpgMpD
	1mLdlom0at2ptNxISS1QnoeeqhBdDtSfNPdHDGaE6FvF4VPNm9kYMPmRzOafPcQZK2zqdKa2NR2
	KVlI/tjw8od4DrrA8xAu9aUpmj24GqXpfobrxJnHyrD1JN+MjQR/AK3Ost1171zEN0pDYHlYfw=
	=
X-Received: by 2002:a17:90b:5150:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-2f83ac72363mr7092104a91.25.1738197648942;
        Wed, 29 Jan 2025 16:40:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEjeeBGHQYK4pwJpYbbQtyFpKkkhvlOwnQJRHFqL1T5XxfaPsnkvAFYLuNJG4+wJrLuZvVCYA==
X-Received: by 2002:a17:90b:5150:b0:2ee:c2b5:97a0 with SMTP id 98e67ed59e1d1-2f83ac72363mr7092076a91.25.1738197648578;
        Wed, 29 Jan 2025 16:40:48 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f848ace1ebsm187855a91.44.2025.01.29.16.40.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 16:40:48 -0800 (PST)
Message-ID: <6f52dcd2-3b0b-4c19-b8bd-cd17dc4543b5@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 16:40:47 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath12k: fix handling of CSA offsets in
 beacon template command
To: Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo
 <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250124-ath12k_mlo_csa-v2-0-420c42fcfecf@quicinc.com>
 <20250124-ath12k_mlo_csa-v2-2-420c42fcfecf@quicinc.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20250124-ath12k_mlo_csa-v2-2-420c42fcfecf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: p2sRSfkmNHaz9w81rlSv_K6RGnTJH3FQ
X-Proofpoint-GUID: p2sRSfkmNHaz9w81rlSv_K6RGnTJH3FQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_05,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=940
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501300002

On 1/23/2025 10:16 PM, Aditya Kumar Singh wrote:
> @@ -108,5 +108,6 @@ int ath12k_mac_vdev_stop(struct ath12k_link_vif *arvif);
>  void ath12k_mac_get_any_chanctx_conf_iter(struct ieee80211_hw *hw,
>  					  struct ieee80211_chanctx_conf *conf,
>  					  void *data);
> +struct ieee80211_bss_conf *ath12k_mac_get_link_bss_conf(struct ath12k_link_vif *arvif);

This patch now conflicts with:
wifi: ath12k: report station mode transmit rate

but i'll clean that up in 'pending'

>  
>  #endif


