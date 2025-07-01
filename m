Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C4E78F5D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 07:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751355623; cv=none; b=jrMxpI5XQGPYcPBLDkO2+I4MTdfhHLNre7tGkRVf22FdHWWGEaARh9q5HKaGIJcEXdWDjsoWmLQI2Gk32hYgYYGl1SZq+1RypZfDspPk0tihP5tk3EjmF386dR2rspbUYfanJfgyBxn0j30YOZwvlNuUnfkoKt4Dv5V5QKBzTzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751355623; c=relaxed/simple;
	bh=yD+gTzX65UHJgMgaHXUtRp/UqZB3K8WSvA4L6J7/iWU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZsztezE2RDEy+JWccJ9uDG6kRtGTIYInZj3jCAS9LjOwx7mz7zYN+a7OvDtARey2RrBjtJqaYItOsu34O9UjyCHNn1ZcMBxalAv5xKw5RPB8dQb6Ntk6myOd5pV1iOkPL5uqx2SdQMfBqEZqftmM0oeDIciP7jtZUaJGWEL4q7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kqzinbpD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kqzinbpD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5613OZb1032109
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 07:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9FJpgLVOiD37cYFqSGkdmMgvU4F7xSlbYlGdvhvvuUw=; b=kqzinbpDsgdG2QUS
	YY2Sstvk7QTvAoViLiWREvOunSo9e/Al7nwST0OPYVl4JWej7BeHIDKz/QBXQOTX
	ca/3bIsGLLUASNpzfkLQ4eGD77nAUhwxBq1h3nlc7M/+l6LE5s9+GIhj5maSSCxk
	H2dGNHGDh6pjJMO0OVX1PXYr3r+Ri4e67rfu++1/2xdxYg+IN0nGVZjqJ13JI7z3
	BjUNz3+QhYVjwzOsnQBIVE1M7ubOYaTs9h54dWJy2KVs6bBQ2+bF71XauaHKOx3X
	nlqo/HnUuhcYSKn+e3h9qju2W9J3Y3zZwxiqVXZYqfTwlubECMcWeQvk8FXIUbwK
	0KJIMw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j63k7sew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:40:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23689228a7fso70267585ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 00:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355620; x=1751960420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FJpgLVOiD37cYFqSGkdmMgvU4F7xSlbYlGdvhvvuUw=;
        b=wHWwLHH2CiaoiYNUg9Eom3S29j5QFvX2j9hVD/jl2ZMAv5nc/0a+2WhbCxax0iXkRQ
         fLqjnf1JXm2v2ZFNN/3Y35lJujmDJVKOvVA9SfmGN+xjPTHxJUoB2t9jxppFNdobJBpj
         I2VD85ieyf3M1h0t+PASXVKSIpqXYF7tST5MX134hxZ9nRIU4ET7K9noYSWyBDmJoBCY
         b8bDxBBy+E0EtiOJY+H/Ac+Z1RwFJiM/k8yVgNVfZiqWKIHvGpBGW1LNj6gdLG5kSNbe
         EgO0a0J4l7pxdvvjkPJlEFCBWzvv2/P2BSUIr7d3jwyAOWxykKyIINywzfweern3SbYP
         EzdA==
X-Forwarded-Encrypted: i=1; AJvYcCVpHJ6G2ySBMajDhvsuHkxdybcVFgZzGSR5EXJpuL3Z6K27FZoPHrlIqgRfiGaetq/1p2hGmUfcHVXjYIU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+SodrrS9N+ndW1N+vLYUWKhrKRbsaX/GRadve/XyZjR1nYxx+
	OWSfiDrPyGq747f8MhfdA+r4qEMQAPwwjGt4XfZkIQ5VEqxw8USi+M57oUQeqWZSiKwEX2P6wQA
	TTBzLKMW/8feDoQ5LJHwkHMCHiIbGGtG/QnwKcFPtPNiotlDsUAtyYafXfVaH8mb65t8=
X-Gm-Gg: ASbGncv1TDQPqO6qOwjEGbNh6Yd0G160/8m1/2pDWmCaKC2MOmMvP7Blbk5OOgJ0Z6g
	w1z5/CnIFbPmKH0JXUDneIaZgorDfu6paUx0+nIuSiMMphqjXd20+Zkr3l7lECOJTn1UnfaxXPs
	tRSTqPpivdMvEzU+Xm3tdy8j5o+tF8fFgDYs0hN71QxqUs44S09QoJo1AVfV1NfXJvYraqSiGD9
	VCKxl/ykc7SoKuaHL5jT3v6VayTPmvBPpzu/GzRv2+TofWAIPCdxoS393VEty6V51dyOMBWLIlN
	jfOCyNKkE2StCVmzqrp2bM66+50OjKHTgG223IO/3t5ANDGH+Lqi
X-Received: by 2002:a17:903:1a70:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23ac46270f7mr205402975ad.30.1751355620384;
        Tue, 01 Jul 2025 00:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6PfU55PeZ0THoeIsQvpLSXshyFj5bq+0QDrT7N2DDDg3D3DoMl91iR6zJ6C30Jos6dGx8tA==
X-Received: by 2002:a17:903:1a70:b0:235:caa8:1a72 with SMTP id d9443c01a7336-23ac46270f7mr205402505ad.30.1751355619911;
        Tue, 01 Jul 2025 00:40:19 -0700 (PDT)
Received: from [10.92.200.128] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c2352sm97622025ad.208.2025.07.01.00.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 00:40:19 -0700 (PDT)
Message-ID: <d055d163-a0a7-41c4-90e6-0606f9b6eb89@oss.qualcomm.com>
Date: Tue, 1 Jul 2025 13:10:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] PCI: Enable Power and configure the TC9563 PCIe
 switch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        chaitanya chundru <quic_krichai@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, quic_vbadigan@quicnic.com,
        amitk@kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250412-qps615_v4_1-v5-0-5b6a06132fec@oss.qualcomm.com>
 <ps5ck23ubpo2vdxzko6yixujlf7mqppdssqrc5bz3vbupmn6cu@yc2ld2tb3r2b>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ps5ck23ubpo2vdxzko6yixujlf7mqppdssqrc5bz3vbupmn6cu@yc2ld2tb3r2b>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZKfXmW7b c=1 sm=1 tr=0 ts=686390e5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MuaoRvlZ_d6aMCo3pHsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA0MiBTYWx0ZWRfXyQYwNxmH6GSN
 tqk+pKYOjEyJpibihSzz4vchqLTy3S7Zf+GZOQmorr+RL4NVz2WT3eJXZRW6VvMZPTUrs6kasB5
 RR1gje2llrKTblzJ6j3wHMguvJwStEvAVlnw76+rmwXdshoeh8wTaFTpCiKigJ6K/kDw5W5UPDg
 fpE0xQmcJQDc5wZtqYdn+FRshViyZCujxC/YK8OUdCfcAT2sgwVIzqb17W96UJxRZKl/oiqXlmc
 Ayz3clPE41UwGbk6cnn4KiCnAFZdlNGntoVhj3aVUWl0qDz4SoU2nbqq9CYhve4wEy09PAcI4xr
 8xfmbYHXEnEbwyHXp5V+iqv6k0BXV7taQTayQ5gs/aLgcpjlLGRT75wMveKV4uY9sMJHZa9ELk+
 50c69u8UiFIBAI4KuWbtaWJz7EHarOJyGMZKLXgzucqTR5nva610lvPHvuswUNr4RuVyqGHl
X-Proofpoint-ORIG-GUID: qL6fDUxWcO9Zd7GHmVaJKcyk7pxhMn_9
X-Proofpoint-GUID: qL6fDUxWcO9Zd7GHmVaJKcyk7pxhMn_9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 mlxlogscore=933 spamscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010042



On 7/1/2025 12:41 PM, Dmitry Baryshkov wrote:
> On Sat, Apr 12, 2025 at 07:19:49AM +0530, Krishna Chaitanya Chundru wrote:
>> TC9563 is the PCIe switch which has one upstream and three downstream
>> ports. To one of the downstream ports ethernet MAC is connected as endpoint
>> device. Other two downstream ports are supposed to connect to external
>> device. One Host can connect to TC956x by upstream port.
>>
>> TC9563 switch power is controlled by the GPIO's. After powering on
>> the switch will immediately participate in the link training. if the
>> host is also ready by that time PCIe link will established.
>>
>> The TC9563 needs to configured certain parameters like de-emphasis,
>> disable unused port etc before link is established.
>>
>> As the controller starts link training before the probe of pwrctl driver,
>> the PCIe link may come up as soon as we power on the switch. Due to this
>> configuring the switch itself through i2c will not have any effect as
>> this configuration needs to done before link training. To avoid this
>> introduce two functions in pci_ops to start_link() & stop_link() which
>> will disable the link training if the PCIe link is not up yet.
>>
>> This series depends on the https://lore.kernel.org/all/20250124101038.3871768-3-krishna.chundru@oss.qualcomm.com/
>>
>> Note: The QPS615 PCIe switch is rebranded version of Toshiba switch TC9563 series.
>> There is no difference between both the switches, both has two open downstream ports
>> and one embedded downstream port to which Ethernet MAC is connected. As QPS615 is the
>> rebranded version of Toshiba switch rename qps615 with tc956x so that this driver
>> can be leveraged by all who are using Toshiba switch.
>>
>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> Krishna, the series no longer applies to linux-next. There were comments
> which required another respin. When can we expect a next revision?
Hi Dmitry,

Mani asked me hold on this series as he was working on some design
changes on pwrctrl framework which can impact our design too.
Once Mani posts his new design I will respin this series.

- Krishna Chaitanya.
> 
