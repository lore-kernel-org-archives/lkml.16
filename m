Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8F322ACEF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750854068; cv=none; b=Ho6MQYJImg4LqU8oWw1Mg6CJuTJnhDueMN21QtshqjDgqT1riDqtrnUH6JOuVjV0aEV0Zxj0m9IApJCcDxcNUusKxx2vmKtglTTmNNuZrYfC40sXWZykae1BHqRX6buxOtLKYtzytUGwGk3wbb5MrNiXJzsZpY11AyOZdxk9tQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750854068; c=relaxed/simple;
	bh=5yqfQFrzXljuR9WcvKD23xmEcWvqoiPzYpT8pvVnSUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W8qGd65JIAXCzyDt1BoKA3ySHDbQIkr9mVRiktCCRuVpc5rC/xUIEwLTOwOFRvm4nNsNx0mCI+DTWfa5j+0z3e5NyGed58JEi1YsvK9LlzyI5EDDfOwDKWKDZjS1NMnVBV1dXNpfqmVK5nr0EN9sZYzU1OGyDKxkpfSEXUBOCrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYiyE+l6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYiyE+l6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBVR1i013850
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aXaMYHHdy1hSo129ywhFjHkER1funcnc3Uc8Wtr6BfI=; b=SYiyE+l6QwX1B73R
	q2cYdl84CL4p4tXbUJuBHITc+8Y0KYkt3IT3uPiF6s7oMjSmE2IHnsqnB750uvhy
	gMS9mr8ynlH+S9NYpKshx6eXitccZRS5e3z7EmOD84aTbnuiLA4frYzf7bPBYmbX
	Mt+jbVIVF+Hgtvit3dAQfHMG8jjzXMQIFDr5Nw73ftF6NvwtpFYCniz2AbOg88FG
	vK4UfiP/4aTV1QRrmWS3//P7DWuXxkPTUm9XFfqIOO+IzX7+bK+HRfcg64OOyBNK
	DG17QjDTYg/M6aNB/PkCX471S4VY4mTxpwucays0xc7fdpRjPLyVhl8s2WlmoqLn
	6n2AMA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4s1se-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 12:21:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3ba561898so114009885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 05:21:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750854062; x=1751458862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aXaMYHHdy1hSo129ywhFjHkER1funcnc3Uc8Wtr6BfI=;
        b=a7jofU3PHXv1oARRdiMepydLb0+YdKe4uMP+DtkVVSypB9/9OzfA/TsjCRXc8dzySH
         wEmM5nfKjeeUc8I+82+eASGnUbASJDbC0NLMamLZAT72Fi+SWIEpto5yeehhcgbFMOgi
         eNlBX0bkI46F7FI36iIX5SKkEd0yBMq94PKWgzLIl4Ld1mqCEvvT4DjqtlyzKRF4qvTa
         mTujVvdsFL0sKAWbu3jlcr9/9LNFBtcfP5LdgO9wAArk6wC/DS+TBmwEJeCMt+O9n1jn
         RKh1/u2eLigF5eETORseZTOf+cUvu14rdwW5XMnEVu24VFBEq919McZyYP2NYZ6fx/m8
         k4NA==
X-Forwarded-Encrypted: i=1; AJvYcCXEt+Zs77jSaGMC6Rddw7w0zIYjtPPMqyXH4omupzTyU4kyAY9ctTgZFpuy7S4kImpy+RZrYmQ2raQAHhI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA/JyrwaHWHr6wrAXxHoLlipUPqS4uo/NlFQNTPByCaxtf37Qm
	SejDf1m4Et1OHC4fZDiof/NZb/zDrytzZoS+B/EKBxWP63Z5OeZ5W5UbhRhQXHjkwPzFvlv6Npv
	8PYKxdfygBFsPA2pNZBpdj2SGbSKncrDLWkmIUrTJxIzbVJXy1AJSP1bAQslWZ3oGKEM=
X-Gm-Gg: ASbGncsMh3Td3PJrUTSrc1Nvnsnywo3EhenfAH2fdNdP7LKJVzJK2eAkFhlJ65Ibphv
	JROq3F/9WgOOkS7BGZtXD9vhaZPTxZdme0leCeeqMgdW+pMdHqlczsM/2tWBy4YrhnYe4iOTJhZ
	kSBTQNuzkXjO/+GUroZAJIrmuRifoTeywVwdAjo59zaIrOkujR1a8OyCWoqxv/CWDVd7VFRSDX4
	6NmDuQWrWG8939+nmxkG6ZCys7oiC1uTWTODyjlqxJ+9VfWXUC5MoctqhELDHa0tByz8BAGPtoP
	cOBDb8QeRYNMRvedYEHAtQnBenmk2jbmCtvn/lwofLVeFtDjR4fVFOu4QxucIUhS1l/FjIBKS8h
	zKQM=
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr121900085a.4.1750854061733;
        Wed, 25 Jun 2025 05:21:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCditgNqKLkT3Kcb/76zkTHjqL5rN/Om6Fnze1yjtsZfzkyU25uWLCyTODkKMaOCcRJaX8Dw==
X-Received: by 2002:a05:620a:262a:b0:7c5:8ece:8b56 with SMTP id af79cd13be357-7d4296f1b05mr121898885a.4.1750854061275;
        Wed, 25 Jun 2025 05:21:01 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0cab0ed04sm37502066b.135.2025.06.25.05.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 05:21:00 -0700 (PDT)
Message-ID: <4f8fa0c7-a208-4ba2-994f-ec7a5da0d39c@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 14:20:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: qcom: socinfo: Add PM7550 & PMIV0108 PMICs
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250625-sm7635-socinfo-v1-0-be09d5c697b8@fairphone.com>
 <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-socinfo-v1-3-be09d5c697b8@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685be9b1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10 a=AYr37p2UDEkA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: ck3_lYA1xGJrmaix5LxgBYMHlnSp1E2X
X-Proofpoint-ORIG-GUID: ck3_lYA1xGJrmaix5LxgBYMHlnSp1E2X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA5MiBTYWx0ZWRfXw4dgqvHHrjCO
 zFTVEWVs3ZSQPbC6qeFG65Kw+HlUJcnLoLlo8pgd+xSinmFs4JjXo04F2pLm4WUDJAYvwoQ0thk
 Zgip4C6g5XCG6lP1PyrFmfVRHlz5q84YJaqXE0cmBu6CTlC1LIHLZ600OjJTY3EF2+JdJxIJ2p3
 JL6Mqkisb5bvX1L1iChw2l6LXGXTY4qulcJsV/jA5rSWldBl7HRiFdsb7KwqvYFxdZ1mYj0gjQs
 N4B4zG2qbvOK2Y99FdRHmlFv8T5wOECOZA/DmMNPD0xDKzwFiDplIXlrvZJ6Vkr0Cg8zHAKfdEG
 5rEipppx8Lf22TV8RWuK1K1GBnB66yK3kOzaKs56tR2R422WTTJHKx/RTSlCOpRNujVgf5HQk5w
 Uqu+VCyEFNNmOuC0SCVvpIwYgwddVtEuvzxTzPonfKgzaxwh5AR+l2Rrnrmi6iVUT33aItRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=763
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250092

On 6/25/25 11:11 AM, Luca Weiss wrote:
> Add the PM7550 and PMIV0108 to the pmic_models array.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
