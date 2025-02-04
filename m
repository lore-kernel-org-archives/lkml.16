Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 801F5206F3B
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738654580; cv=none; b=fHzkCnEJRK/dk/eAzqk43gU30vMGWLMvxmnAPzsdtTdcxcuaVN3YHsC2BtCRj+1gtKz4sIpLrtt44Yccqh4c28jGUj4o1tpj0ONU0Ya1A9XywCYIl1Sht4tG0IGBXTBZTevroxaHCIkqRHMq81fIb3opx1V62AiuUc3ozk0q1Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738654580; c=relaxed/simple;
	bh=EQD9gmQEVA6k+MlspviszKJBYwouvmMiSnP6qfZuXfY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nB1vmUJg5P3YAAP3dsmcak8/DD8vhtburwanY/uT8nVoDdqfi0cu2ldxcS3mBfETTmXRp4XFhZCp/0LIxp3BoVXghYtiCV2d1Pz7rHECp9u2t3Wj1ldG25PRwAU8UCoQ03tS9pOTnV/VEtllfRg1yh+EB8za8CSpwnd1K4mSdZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ek8hssLv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ek8hssLv"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513GEZQi010471
	for <linux-kernel@vger.kernel.org>; Tue, 4 Feb 2025 07:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cmhZf2jtZFOhpBYRl2QGSrvfhYgmFz43h5DbYsnxQXc=; b=Ek8hssLvbAp3HLsl
	d6Cems0cQ7UVrrtOzbw3rP9RtUvlU7LZQxImsvUh9mNHPoYQADnNRM/5M2RgKMxT
	/txFPJBT7brVeDMQk4Sc8iYLwHFtqyNJw3BoV7O+HIo4wy7jEsRxexnk+SairqKH
	NByr3jgpN7UTLiqDB3KdLumxG2DkSUr7rysvbJeWKw6CyOp7phFKSFJXCS56jero
	yMEjKPOSSXhddeRCxUcSDD+X1WkbFSQazlwNFXwDVrL+8niI84unV54g8EojG78y
	dNgg8fU+AFM58V1XcVBKtEd0n+s5ahd9jSo6rrFFU3pdRMeHHNLmOJf6dsf1UlRu
	np+IkA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k159hrgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:36:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21effaf89d9so17134875ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 23:36:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738654576; x=1739259376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cmhZf2jtZFOhpBYRl2QGSrvfhYgmFz43h5DbYsnxQXc=;
        b=FKUxbo2YKHFMpISO99Eq//hH8U2oUAjsJbgjnWAarasf9JS/HIitduiMYu2FJJK/4e
         /y7CXDeCtzfER9R9HGKf+He09AdTSRv6nC+OVQMGGUeb+EETD/uus+C7hmcteRIRhpkI
         ziOWgZs3bZgUgptfKtAgcAQp2qdbCXAeJO5uO8xF4/m3BguQCH51KNdFjgq6BcKfpf4q
         U17vRi2bsyrXtRAdj9I9aljMPUzySiDTdK5bF4lOOQMtKQ7Bq0XfInOfPno7WSHGY54U
         aFCiL9eq18se1b59Mz7hDkuAIeSdplhYHL7JmfWEUpVCKXkGtMMrCNR5J+g4CtKhPQSE
         QVDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9fixU9KO9m7QJ/z98C7NGiLMwdbeje9VfVliT+F1+X0O0J57Z+sU61maI379WlAbgyjwtNcQ3cNb3YkY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5Dt0GAJFUAUOL4O0tkuk++4jYPmE2NXo+b3QQ4PrwUDHCEuaO
	4FzXFnJfTNOwlI/roNelyyFxtm6y6NQlYwGthcxUOpiFMplLBs0cDc3jeox1d/gl3x6vTb95l3k
	M0/QQ5J7jM655iHIIAeLaQa9EaPmBPcxTSg4EaFb/13cdqTe0ASxJgqLkE0+TyaE=
X-Gm-Gg: ASbGncvWUjR8ynOZPqL5G+Kdlb1ndWvNGZz7Gigy8PccYp9LLTj3y/xDRHcB15hRnyG
	GC75WljdCNSTNC1qAtRTDk1q6cB1wZ8NfGcJ20yxyjWVzGLjzovhkh+El7Sajs/9WU6PjXJEvJ9
	/e80JHpa9BBw4nH6oSI4QzfrZJeZ74cldGKOrtT+1QJEbrps1UfXDrL5oegEqYKnkpPdlahOfFX
	QqR3/c0GbY/rd4EwxgPH3v/hwt+S0ALs3j7wiSWn1L6husFHwYYAtxfMrslHk9cruNVH2QhSDgf
	J7O7kIBmMeD3w3JVs2yBwiuFeTIkIFgDHi3T0DMnG7ogT+Q=
X-Received: by 2002:a17:902:e5d0:b0:21c:1140:136d with SMTP id d9443c01a7336-21dd7deefabmr438784525ad.40.1738654575724;
        Mon, 03 Feb 2025 23:36:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBJ1xxgLF4XGmhl1EYxqcc54FnC35M9tEB/AjgAeRQpmlzCyfnNfRRLtDm9urOOoIV/+qunQ==
X-Received: by 2002:a17:902:e5d0:b0:21c:1140:136d with SMTP id d9443c01a7336-21dd7deefabmr438784225ad.40.1738654575341;
        Mon, 03 Feb 2025 23:36:15 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea80csm89749945ad.140.2025.02.03.23.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 23:36:15 -0800 (PST)
Message-ID: <aeac367b-00d6-4dcb-82bf-cda8307fd0d0@oss.qualcomm.com>
Date: Tue, 4 Feb 2025 13:06:11 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/8] wifi: ath12k: use arvif instead of link_conf in
 ath12k_mac_set_key()
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250204-unlink_link_arvif_from_chanctx-v1-0-675bd4cea339@oss.qualcomm.com>
 <20250204-unlink_link_arvif_from_chanctx-v1-5-675bd4cea339@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250204-unlink_link_arvif_from_chanctx-v1-5-675bd4cea339@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CuZZi0Twq80fhQjPd8le6SM-MhGehvIk
X-Proofpoint-ORIG-GUID: CuZZi0Twq80fhQjPd8le6SM-MhGehvIk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-04_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 mlxlogscore=876 phishscore=0 clxscore=1011
 mlxscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502040059



On 2/4/2025 9:53 AM, Aditya Kumar Singh wrote:
> Currently, in ath12k_mac_set_key(), if sta is not present, the address is
> retrieved from link_conf's bssid or addr member, depending on the interface
> type.
> 
> When operating as an ML station and during shutdown, link_conf will not be
> available. This can result in the following error:
> 
> ath12k_pci 0004:01:00.0: unable to access bss link conf in set key for vif AA:BB:CC:DD:EE:FF link 1
> 
> The primary purpose of accessing link_conf is to obtain the address for
> finding the peer. However, since arvif is always valid in this call, it can
> be used instead.
> 
> Add change to use arvif instead of link_conf.
> 
> A subsequent change will expose this issue but since tear down will give
> error, this is included first.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
