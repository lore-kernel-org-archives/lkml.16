Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E914D86353
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746711210; cv=none; b=Lq1BhwjsZRY2nuMAbdfbf8f3BT8MReeCklzrXgeGgPSaAUDZMdfPKFsx/1RGEIZc+Y4FK0JGaOf/6QU2sF47BkOduNTS912pwqxoHddUIgsNcy+jhvicRwB5egjRYr5ydERPBAS2EBmrXZP8J+d8LpT5JXMYuw+aCOcCEqMxcaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746711210; c=relaxed/simple;
	bh=kHY2L9AAUzXeokRXvu9nu/P9V3hBGYDfgVExgxaVQq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jUsJq6Ll+0E9EoRpYRbdJ/Xw+VsK93QgJwdFqcf2j05oNnENJxRhWxTDHRxpF9rXLMclpmSrFoQKVkBO3Q0qe0ba++4ASJ40Osh82BaVnMDF2IpVeusP5X/ZvVNaa2MH+UDfxplqgzD/dG3D9e4nL20voqKjn/KpsE8VIgiD0AQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CfECkK+B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CfECkK+B"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548Ckwj9010134
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 13:33:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMYfNUnuS89Wpo1r8C5mbTS3ohz5/xv+vUvBIEOJELk=; b=CfECkK+BZyHZQ8Ad
	DVbqKsJ7rmilEVrJucabreteJTYoeIW1wtLY6UaXsZdQLIaOYBd2dNQ/3pdvNZQV
	IASApCjasMyqnSp4rCU9aHAnmE3O0+AJTfjl9OsAd5Gj4xEDaFEkPkqWxR3ySHZa
	qN31EoxlRtkt+HhfOszKb/KXyrhxEuDKcvMOpjQrOta9GSoygZzbq+K+2+21M70J
	K1B6ICTJpS6X8XRQ6NTrSQJ4Iyg4ZP3jAlBmLX/9LcSDAP69+JGJjJUpQNe2EWkI
	YituhxSnk/+iE38BImbdrWKMSFd2qD9Xad8BJgbEp07AoZkVZCXzmSIRiLGeiLI/
	Fj4WWA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp79fgh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 13:33:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so24309085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:33:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746711207; x=1747316007;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lMYfNUnuS89Wpo1r8C5mbTS3ohz5/xv+vUvBIEOJELk=;
        b=qVxd6wKFHb+YPzc06W3+9jZtrUEJP4Ungdyl/0lpDdZRQCuiqToIJ8zJiSt5DkIEoa
         ieX11XjDm3rBcqBkkB+ga6p4CHHXqAvZ5+ChFTEFNIqnLGAvgdJiShpGIDMYBsbWYRbn
         N1l9NG6X+FkfUEUHUBTH9XtAqiADFbU9nCW+pFSevCVBVS2IyR5wQsxIo6Zt4Jnft/w4
         DPNDxufQUM7luMqY7EZ+2BLruu1ckXJepdv5WL4O3+DPCEdzQ3MRK91zI7OlkgOZK9fH
         znh5Ufd0ynRPwb5Zy6d/F6MdIuJprN6FHswLquUHt6pHNdvZjGYFu+f6FEs0rSmBsFpT
         98UQ==
X-Forwarded-Encrypted: i=1; AJvYcCW2vwhT/GOeabd59/mYRCb+pa8RSlHrRgQB7C+wykNOL8aShMI57FaVQrp8KKdJCbYl+kLq0cpYjQ50rz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHlKPRu+WtB8rlDM5nOQ37qRm8w15IanBKuRSCQ1yD2Bfd7s9B
	7Nv7XJEeoiQff4hdksHi6+8FWKSK8Fv9xMOoNhtUQ1SCP6fzna0NildPuz3z7PiyLOOX8BIHpff
	Qnv/ipVT1KQxUH11vS1Fy8fJO49feaw3J+X1tDCvmdJa7PsGwuFcZ9sL12ldSLiCDxn4S2Wc=
X-Gm-Gg: ASbGnct3SK0VU9vrxYghQOVSOGgj1XCp7jrdk5rn452K+cfLpsGDwvvd+qgaVfa+DlC
	xy/kAOU9IRSiwoiGdrrML2onM27reHLtqYr8gxXQ6C18mmLoghKcZnkkJYV92u50fILNWaWkwLP
	LcLgYTfpXY3apakk5Z3Y4cEJLQhp5/d98AyudVW68G12A4lD9Fop0JVzXMdz/DGPXBcAd3SFesF
	nFiJZYS7A4XdR2LOqeMEFZRNZ5bhknU7nRFRRmfkgyqlDJwNx4Rh4UfUWwgYdgHoD5kChSa9Irv
	nptWfzZmoxlhxnVxAjA3kmqUtwv/q+sEb59DSQl1hwGQmqKqkPF/ef2Jh2MbefRj11Y=
X-Received: by 2002:a05:620a:2a14:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7caf74220dbmr329259585a.15.1746711206756;
        Thu, 08 May 2025 06:33:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6s2Ys7CGrDpjUFZ6mMJVSeDH0rUEreHUG859D2NeWarnKpmclxkN93uV3z/V0eMXoKSJDtg==
X-Received: by 2002:a05:620a:2a14:b0:7c3:bcb2:f450 with SMTP id af79cd13be357-7caf74220dbmr329258085a.15.1746711206337;
        Thu, 08 May 2025 06:33:26 -0700 (PDT)
Received: from [192.168.65.105] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad18950857fsm1081323966b.125.2025.05.08.06.33.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:33:24 -0700 (PDT)
Message-ID: <370da6b0-f6ac-4a9c-ac9f-f1adc890fc68@oss.qualcomm.com>
Date: Thu, 8 May 2025 15:33:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs8300: add the pcie smmu node
To: Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>
References: <20250508-qcs8300-pcie-smmu-v3-1-c6b4453b0b22@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250508-qcs8300-pcie-smmu-v3-1-c6b4453b0b22@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExNCBTYWx0ZWRfXw31fqQWwPwW1
 XI/lZydNar/PhGhoMiNUtBXAsYfXd6F6hMPg5ijZjZI66SPvReJTH7F4FLzmSpeI0AODZrtTXr4
 7c/1a7tEZra3s5kj4/74DnUUcNjOzAPz8FBx1aVW5Y7aTYoGrg6YF/DyM6OTgAHL2i1J3j4429h
 TnZVIw7g8rnFCf9vyQXa70na5VDK2h7BYc2oPELFuqxXOn5nkdxyxZ7OpGdzeqrKRs1OR6E5K2h
 l2LN4R7xBEi6ta3+YsBTcoTscFiAZVPyks6hHSX+AdFtgaLY+ryB+NEygaBqTuiRBOUmXxbM2gQ
 mU7sM9OOFmrwyZIflCvfK/HqSB/Lfc8F8W+FDUhqvAWnt3CIIAzS15JMGGnBM4RorssCDF89bk2
 5PqKwnrdGpiiAu+me0/ZUGd4ynAKJGgOg5X6zMoA0y1C6yUOyAOO35eAjbfZJncG9otA3jjp
X-Proofpoint-GUID: MmlbikU-ZmVlLtLLoJklprUbaECedMCh
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681cb2a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=kZKVpPXic2WTofaLpVUA:9 a=QEXdDO2ut3YA:10 a=IkyAniIzxkYA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: MmlbikU-ZmVlLtLLoJklprUbaECedMCh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=767 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080114

On 5/8/25 8:21 AM, Pratyush Brahma wrote:
> Add the PCIe SMMU node to enable address translations
> for pcie.
> 
> Reviewed-by: Dmitry Baryshkov <lumag@kernel.org>
> Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
