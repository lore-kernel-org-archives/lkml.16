Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922432797BE
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 17:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749146201; cv=none; b=Elkt/UPM+H8iQmZt5AYQd/+6kAslaa9hLSUv/u3BhqQbrlZ0Abx3g6bw619Rhk+utqNkB55T4ITWXKegvD5m0lunHW6lT2IKw3/VxtKR9Temu3dvZa57KsIKqNf5LZ3aiVhmnwZjhyafJG/xZroW88hg9jo5vjvm6mo9WL+5rII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749146201; c=relaxed/simple;
	bh=gMroWcHjboWrDGM0ZLdaI8dfCuaAXIz3Ryz9wJRs4Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QLqKUP3WqgsSq6+9xk5TKhS33yWaBO0OXZ3ZZpjcPV7dm4TnrPKjd4gAV434JcW7kC3WPtmrEjJ2WMVXwkHt0yJDcyLLLGsxEW9Ld8hfbYqz2RiH8JF++2+a8pKoVyodFl0rPBVBbKoaNTNQ8z4JMLUbaxdqmJaqmeLwLwY1tGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YKnCut+c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YKnCut+c"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555H4xE7032282
	for <linux-kernel@vger.kernel.org>; Thu, 5 Jun 2025 17:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZcQKtQ1ov37yB/aXsBXEWGJWFPqRd9laCgmUZnxfnI=; b=YKnCut+cQlT0BUlC
	qNGULUZb/+z9n5FK3yZoJ+Bj27zW8a3gB3yrKhR7mkXvcTikrfk9nk2OhpZ3vREW
	Lf0N0+lEVYq4PqtJFMgwkssNpI601/0HRIQNg7IIUm+jR7jOi/Xtxar/xFlYd9I3
	YQhLsH3EllhEOuCy4J26MFt76M1t2Qb3A9iQ2kk3OXvUcdz3OUlejgnsyKUhcYfQ
	l7MQUCO+kqhV1W/HaN4m/ZL4/n4LtXCpO6s+BiXxm96nAQdSSFeOp/nldRJoGt+/
	4LhtrKYLGnAfczR1acA7h7/tDBHoppU2dDs4HtQkaEp2ZDUPge0w7RVj40WcP8SU
	eYQl9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv14rk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 17:56:38 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43be59f17so2208321cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 10:56:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749146197; x=1749750997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZcQKtQ1ov37yB/aXsBXEWGJWFPqRd9laCgmUZnxfnI=;
        b=joJPJL1eyZk/VpPMYQhsmNfamFRyyrGy8wfYwolOA/pCbxEJwiAzhDhWPzs2esXlJS
         1E3AXCJkpr5vmMD7pi5kesBCDIKKJ0JMwgh1Ko4MM+b62+QViEu+AlJ3yffUJY6EyRkf
         BnspxADFVCLEiNXVlPNdHETwZIpSiJS0S8DwRTpn4si/oVennBip6/tBJWHMHpN4Ms3v
         UNtK5ieouTub/+7HCaHJHlR5mxsSYfMaWRWDz2EwudLiry9WHHJ0kHi3thvlqCuPkXYA
         N8ClFWgfneV0EEs0uY8/t3lvoETUX7xCEVQ9YQjY6l81PoJ1Pj6O+gqr7sMWIhzisOi4
         KjGw==
X-Forwarded-Encrypted: i=1; AJvYcCWSf16p/4ThLuEbjJTt+ZbeqUQO4qJmU6CrFZdPNlHgVaToKD2kH8K7S4YC+98tLcVV74tU+fCm0HiAVIg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQMi3H0WNGa2+k/o0Sc7eOemwEsP1tYT1DD985LIUWOfDTnIqn
	HN0a/zJpnfHeapZ2xl7zGdUgJHKbaALwaOu60k8C1EpvrD6QMOhCNHTY0quND2N8+thzviCi2Dv
	f7Gvtn08k8I+z6mjR0SiMY2htw+XKN7d0Pw2FnjXc7UxmmTlj9BAhFh1Ws1hPQaXgheA=
X-Gm-Gg: ASbGncswVShgzYIL+rK4sH33vbhT3JT8yXSM0IvHAvfa2JFN0Mz8Py2vz4XF5KD6Nfv
	kdXtBaKFloLxgAyPVHmfLtM5l7/WUSCurXEf/UX7XA0lqehuA7tqntmHpfxSNm3CTyqPdyS+T+f
	gqqz7hDV6vjm74mBGe8GGSYEEaG0OmtuSI4NfKZDuve7mYPfz/jMeTBoh9oCrm2eKRa2sA7jl46
	Ya17GqUS9hyIvloCJRJfUkdxBy5xi0jOX2WpBvWnHvmKwd+uECOD4h2fysnDwP1UWWEw6b3hV8O
	UX1rYds60APpqwnuojDa7caePjafbof2mLVZV/2MEdRA5WY46bM1XJ17Pf1v0c+YLA==
X-Received: by 2002:a05:622a:607:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a5b9f3c841mr3459221cf.10.1749146197321;
        Thu, 05 Jun 2025 10:56:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGT3i6QouPUynjX4yzcxTQBbYY9kUpqtzwk6L8Pm4W1giH5Gphq0ngetzOJkdmxHBjlqVwyAw==
X-Received: by 2002:a05:622a:607:b0:4a4:323a:2d76 with SMTP id d75a77b69052e-4a5b9f3c841mr3458951cf.10.1749146196865;
        Thu, 05 Jun 2025 10:56:36 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82e80csm1283599666b.71.2025.06.05.10.56.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 10:56:36 -0700 (PDT)
Message-ID: <922180a7-ff39-4511-8640-ed8bfd777fc1@oss.qualcomm.com>
Date: Thu, 5 Jun 2025 19:56:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sc7280: Add wake GPIO
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        quic_vbadigan@quicinc.com, quic_mrana@quicinc.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20250605-wake_irq_support-v3-0-7ba56dc909a5@oss.qualcomm.com>
 <20250605-wake_irq_support-v3-1-7ba56dc909a5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250605-wake_irq_support-v3-1-7ba56dc909a5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6841da56 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=lN5UOK94kOf-3Ws_NdwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: oZoPZ_z9qIwXLYZZDPHYduO9AGxc_WLd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA1MDE1OSBTYWx0ZWRfXwyTLan5UJhUZ
 6XTYlo9Ay2UftDHFv+/AIPsXn3ucpUGRyD2ViHoxMR3CqwfT5y7LrekDXZ6uPQkOjtB5PZjX4X3
 ljWMLWNf+G2O8of/AhbdSO/Nxkbf/nZHGC8gH2FrYWnzE4KhmjoSPMtMCu2K1ByRj5zc/QIl1p/
 KXbxzQLu9Ly5fevZwqulbbLPqpLVMi4X7ZQEYPfoTI1xBwrc1Re20E+Wi/WTmA9c8lCCe4P3XD+
 l7iS/vHxIz/k8KdNcEBlkeRXU+Sx8c5XZFDNXQ6mE1iTop/Egl7I4FbHZKpdAny8eEb6RaqjNaA
 QmOZkf4pbOzltLJZx/GKL5UpKa0NPL7W+lwu9JSmkQPGZwh+KsgO0sMw9BzR0qBSanTAcJGR+Gv
 YAc6pGRYLCyug77MQ2g5S+DRqjfu+hQCclFWGmsaIXGn2yA5Mlizip6iW1BgIlHeLuhmSm+V
X-Proofpoint-GUID: oZoPZ_z9qIwXLYZZDPHYduO9AGxc_WLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-05_05,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=788 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506050159

On 6/5/25 7:24 AM, Krishna Chaitanya Chundru wrote:
> Add WAKE# gpio which is needed to bring PCIe device state
> from D3cold to D0.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
