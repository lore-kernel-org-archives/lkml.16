Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840621CC60
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 17:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746811620; cv=none; b=odrNZ4UErymuikLAGoiF/tUQJAK8/stmt4z9+SNhotFiXXso2w6u4Oj/FhmZdWC0FabKZDh4Z8jinkDQJp9y7FK7UnvSvkrQ0U6oKonsunnZixDPCrQVbpxLlXapyxFQNnlA8pxDHyQOWb9FVQ0Usni7bOWCkvrI6UX45PAt5RM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746811620; c=relaxed/simple;
	bh=Tv51iCifaNwhYZxM7lUUyAfZ76kxlBfYATAgonwaBA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pwpV8TLZ8uWXlZjRpcLyPlCE5vgfgMTQQ2H27T33MFbwtYRkKxWI4HRm0GPoBD6VgxgT0nL6Ok77VxwAQH+fWrhqFH1l5sgnjWhVVuWbcWlSQqEnkBzSLOy7Eg6ZgM22l52RO22SwQ/gbEB+CaIWxcsBrUPpAfdWNcgHnNa9fvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Aq4RSGKN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Aq4RSGKN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 549BDwEK010134
	for <linux-kernel@vger.kernel.org>; Fri, 9 May 2025 17:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1wUapQOrEwYp132n33ZM87lG9BL1ZkFAOuhX9RAXCbY=; b=Aq4RSGKNLykYMGhb
	WB1R461DbyFBxyBfcmhQwSxqHNxGy+pFCuY1W8P9s4hbOleP/H952SCIo6J/w1XJ
	bOvMxwWaYWl176wqbjc5VEsv2Iebf4jpgNjmBzUMSe4BL60nVk0+qwFG6rKUjz2J
	nnYVQLDbTCkeOuxTX90+7W6zTvu1LggPip8JM2HkyJ+DgwjIl+2ao6uYZUvPTAPJ
	fH0U1lRLMiA/QKbPLMTYw8FLNWog6j6zPhukOsy3bEVxxO7jpVDWV0R0ktDDKBRQ
	D+1KBYUcIyfaidBCArg+VtwU7R2BlBjv8zTtsoOn1Lfm+EGnBbgxJTurPomu4gfq
	5b/MIw==
Received: from mail-io1-f70.google.com (mail-io1-f70.google.com [209.85.166.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp7dfxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 17:26:58 +0000 (GMT)
Received: by mail-io1-f70.google.com with SMTP id ca18e2360f4ac-85b418faf73so366043939f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 10:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746811617; x=1747416417;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1wUapQOrEwYp132n33ZM87lG9BL1ZkFAOuhX9RAXCbY=;
        b=o6o/UZ19Pd1Hut2DVCo7GNcc1Ofn2imu8EOZ+T4W9eaebRCgXWcVWMGqqdDFhSieEM
         86bYXbO/Zr7p6M6CaPCqhwCaAFxprIHOWFnGD+BlR98nUeRuOk/R4FipEpamX25JSUvt
         e0nquPbIvHRytpJOcfcX1vNIOd5V12NZdkYemHkvrK5xWislUFhl7vxsKV/Xa6eL4tgG
         NkBYbuUR0VEwLo9Hnf2GCw0Aj7SmzeOzfVeOAk7+CHjUh763upIb2k0ezHZlb5ItdgU/
         +BzhHS3d/6xLrAPpuhyvJAPAijVK5wYVKB/GIPrjBK81T71LzQ1AnZ3OBjRFvd4Rj7iU
         wfZA==
X-Gm-Message-State: AOJu0YwpMCOCLCWNZYa0ct2X8sh6B3F/SMNGBsK2g8gcD9/juZqeUHtm
	G5lYlaVccg0xLaBHgpaIAaqVkc82VWxvoi3qVbCWeKdLXGIA/OdcVq6J1j8kt9l83kOmn0n6PMc
	IGyi/6YQxfIcIH8Bq3Yv1KyBX+dptc8nfheK7EM/8pPou5VNTRhjtWqHEiVPZJhY+j8r4bf0=
X-Gm-Gg: ASbGncsRME3ZLi7Gz32Yv/8U3fOuNYUk1VTqG32+j/2/SBYgaLG+z1arSbCIiFgSWLI
	fBCza8WRoyDz+N4MkScN8UNUK1ipmViLA0OQwrBL9kPyt/MYf4t0GS0APZvK1Zze1CqVtmZ/3zE
	CQQDRIPcFMRpf0Ran/9gXZ3mOs1U1wUSB4ReAqHvNA9Rop2gy90rR0/anRA6WJr6y5DHBo3Y9OJ
	EtRKWV8rheoZUpJIpxq141xjGD2NhAzy2ClG4+SafhrDtVH47ox4vR+6kjSKrhfbSIdhYbWLIVv
	0Ob5oAwTH0l9uobcpSJufC3rVSY+OaEIGte4XT6C7YzcRlg7GEWjMa2BkUpZJyB5JoYWzJDNHFH
	YkDj6
X-Received: by 2002:a92:ca4f:0:b0:3d9:6cd9:5079 with SMTP id e9e14a558f8ab-3da7e203652mr43047205ab.14.1746811617045;
        Fri, 09 May 2025 10:26:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE07AB4b/+Pf4nyMGbIX4jP3EQyt3RqCUIg7THoH1pbvrDKMFpM29PCxiYGbZo0g5pPaPC2Bw==
X-Received: by 2002:a17:903:32d2:b0:220:e5be:29c7 with SMTP id d9443c01a7336-22fc91a1e83mr53377865ad.39.1746811606037;
        Fri, 09 May 2025 10:26:46 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4ffb42fsm4697857a91.40.2025.05.09.10.26.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 10:26:45 -0700 (PDT)
Message-ID: <a3d69b71-d204-4e4f-b6bd-d7e80bf7b546@oss.qualcomm.com>
Date: Fri, 9 May 2025 10:26:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: issue wth ath12k in ath12k_dbring_buffer_release_event
To: "Colin King (gmail)" <colin.i.king@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        ath12k@lists.infradead.org
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <e26e4e8b-90d5-4543-af0a-ba5cebf516d8@gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e26e4e8b-90d5-4543-af0a-ba5cebf516d8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE3NCBTYWx0ZWRfX8GO19PVfUNTp
 w8ks2vQ3A3qQTDFpZcVjeZmXllx2/323u6ZlJXBlPIbsv6LkFTp8aKjL3ETfWcLC27TXwanQbpr
 sEHc5zxeF34D16kUF47rLoEQo4P/eUi4G/ZYgMsctx07+CXlTlOiJRrqNNwAvfbcd5FCcmT4MkT
 l5g9g6Qpyu0mhaeCKlZMCt6aQvl5us1giHO3KyJWk3Hdaq2xJgnyA4iCXXTr0Od8I8OlVz6UkuZ
 1fq+JlAbRRwsxvq50uwECNLlmcTNAyZQ9Fc3F2pdi0dOHd5jEdi5xxQy7qToJbiYRSeZMFtFXoP
 nj/AjIi8heYP5c3MUcezr7mGZqYVm/xwi1ZeTlJ7oXaBqBY/nNBAOUI7GKtEJvtm0iLeNqdHiLU
 xULRRHqhwo4PFlY29/e7Fk2oFkgH1LADpFuXRWHpzH/ydam4SDhmapVEYeRbwrBBOH3csGcG
X-Proofpoint-GUID: X305oZZvgS09CatHMOHkokYWR284HANq
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681e3ae2 cx=c_pps
 a=x6q9Wowz3da5qcMoR2tSzg==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UYGBsdy-ktPGMqgawXkA:9
 a=QEXdDO2ut3YA:10 a=TsFzuV67ciA61D7d30EA:22
X-Proofpoint-ORIG-GUID: X305oZZvgS09CatHMOHkokYWR284HANq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=824 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090174

On 5/8/2025 4:00 AM, Colin King (gmail) wrote:
> Hi,
> 
> In drivers/net/wireless/ath/ath12k/dbring.c function 
> ath12k_dbring_buffer_release_event() there is a large hunk of code that 
> is never executed because ring is NULL.  The code that is never executed 
> is a fairly large part of the functionality of the code, so I this looks 
> like a bug to me.

The features which use this functionality have not yet landed in the upstream
version of ath12k.

/jeff
