Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 796C013F434
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370567; cv=none; b=RgGjxiVO8fNXUiopd0DqcR0y8UMBx7bN72QjO/F1bL58E5KLVKfeOOc46Ndh/680VC90ZXNPQRR+exBoSFMUzj0qxI4eAzwSwRGHS8yV4JVYQ3yYdpYCYtuZIuTMa1qBNafJRg1Q7cZ401GlRUkmHFSC0+vIaJfb7ecHQXS17Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370567; c=relaxed/simple;
	bh=xWEYAXYN75uPFbnF9tMBMayDM0TPtCpSrhXZ3dzsbXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwwervMd0M+pOyzd+R66qxDVwq6Ob8vwFpFyuh/N02/eRuOAI4A0TzVGzKuwMA7irwDWrJNtwGP/I4tLZWGgvdJImvOSncnlwMJlyMXRr0/y2nHtgQp9aohEMYEq2h7sQH/cT7b00cSgh9QNjzP0rVF50wsV4Y72HKRB/7uh2ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzCpobK6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzCpobK6"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5DgPg028819
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7ldlKd5A1c1kzPQv6PSKZi5mNPAQ4xGSwtKcBaJjAA=; b=PzCpobK6k49gH9pw
	6B2mE8QRIPd3ybIuROrbFKS0vSG3bh5q755fu9xmdB9xYloq4sopQ2x3U5UfGMcF
	EbQ8/pTUU4qQYl2lqutTbixe0nOyqrxHz+X0bmw9xLP+MY9Lic51Hj6hqVy8PyJt
	memccoaKhxy1pg1bpp3Q3M9OQ/gXQuRALWFa2PTcgCAWbGvexrq+rMeEDKLsorWs
	NqhxZ+kAQ2mLWfdfHqf5TwSPGguMXQBp/AyVxJ3LKYfUfVOGoiD4dT8rAMII3fMp
	9x7lkBPfma+M0WY85tZ70Y8NSB88m4sLWVDpMM3M3puV7JgKrm/ggTfyTWmFcOiW
	lgdKgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbut7wb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 11:22:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4766ce9a08cso4158251cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 04:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370563; x=1744975363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7ldlKd5A1c1kzPQv6PSKZi5mNPAQ4xGSwtKcBaJjAA=;
        b=FXtSzr5fc0fsUF67v92IIuIi7cFKIIu6ur/Cdj2eCDpEe8eyROf9grmYYTPiEsXsMN
         fIJb/fXNBJxVzhR34+b3xQHqwQ8Mosv3NW0k8wJtXt2UIPlLydHs8CySs3KZExVzJOXP
         tr35W4odCDackVSzqth8gsQhzn8X+Ld3g0G5Pa7Wc4Pqmk9k2iVNeboLUiilpvk+TuMh
         UjdgLf/sqPMt5u1eGygaJdjTfySzYB7pwtFy6Kt7w8N0ZC8oVGDkNCr9+u7N7SvQEnlT
         zO3KOowTUh+QHk/N8r+zGZdgG/OVxBo5++DBqS6P1JYW80yqCvcpMWuEzouO1DWEIL6M
         uJZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWp973Je6xCx/0mLtnqHYdD19neXcEQznS3TQ7pqewQerSFguC1NFUYZ7Lwekg+EgtLL9GTu+wHO1Rajlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOQSluGdtvmuCofrwjDeYzBQFFHWHETF9/5JKuM0yKZoF/jnE5
	XLfzrx+M3YSzGz7lLrGmCdgXubudiPhuyaOD3EE7LyLDgSxKa1T7OobY8c+q9crHue4oJmrUFGf
	ZPof2P4Pq9iG9yENHTDgofqYO636xQYGa+gLojrNnEJHa7pdmVROANribMw1AkHE=
X-Gm-Gg: ASbGncv7mkigMSRBBkBFOF2DVfExxscK9PPjte6NlBzJCHsVAJH9xw2NxxXG+JKUAHL
	+irKuocThpABCNLYXXr+gpnEogfjH8cu+Ed4n0w1DSUkp6BTAxujlyiCrhUsmyF/bVpbx8P8ojE
	Jf6YLi9lmwdjXlMWp4BRgrzvbc/elGfZ8H3IPXoXLgSw+IgPbFoq9NuLTFL9nT5JAmT2DL7vhOo
	LUF5STTBjs2r0FnJWc/Zk+M5enYqNm+Gd4klftf8p/J4hmQjlffWf6NzhYK0RO8MW2+ZP+AYv25
	/QqRiHpXoq9Cdr6wUi/SZ3HzVx/5Ik2jmqJE/M/W4Lru4JTs1eo9EMzzJfWvtHlwgA==
X-Received: by 2002:a05:622a:60e:b0:472:1573:fa9f with SMTP id d75a77b69052e-479775c57cemr11267041cf.10.1744370563315;
        Fri, 11 Apr 2025 04:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqXzDm9Tm3+0QeUI5Zh14tIbU+d/Vs8viys7evruocl5cnMn/7ajmcF2ZxqV8LNPFi3bPWpQ==
X-Received: by 2002:a05:622a:60e:b0:472:1573:fa9f with SMTP id d75a77b69052e-479775c57cemr11266921cf.10.1744370562918;
        Fri, 11 Apr 2025 04:22:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5541fsm818081a12.14.2025.04.11.04.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:22:42 -0700 (PDT)
Message-ID: <48361e2a-89b2-4474-97aa-557fbbbdf601@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 13:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/4] arm64: dts: qcom: ipq5332: Add PCIe related nodes
To: Varadarajan Narayanan <quic_varada@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20250317100029.881286-1-quic_varada@quicinc.com>
 <20250317100029.881286-4-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317100029.881286-4-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: D8aMeJlImf0CiE7WB7VA8-gE-MAriIce
X-Proofpoint-ORIG-GUID: D8aMeJlImf0CiE7WB7VA8-gE-MAriIce
X-Authority-Analysis: v=2.4 cv=dbeA3WXe c=1 sm=1 tr=0 ts=67f8fb84 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Y_ot1G8rUta36iX-w7oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=952 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504110072

On 3/17/25 11:00 AM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add phy and controller nodes for pcie0_x1 and pcie1_x2.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

I think you're reaching out of the BAR register space by an order of magnitude,
on both hosts

IIUC it's only 32 MiB for both

the register addresses/sizes look good

I'm not super glad that we decided to move forward with not putting PARF first,
as the other registers are in the BAR region, but bindings are bindings and
bindings are ABI..

Konrad
