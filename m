Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CE4148827
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677596; cv=none; b=GbVqrDbjxBKhFGOCbhBhAWia95FgC2XLUsyGsF0xiIZlR3ljc5eGHFTg+CEar/Y3OsKAnd2ckH0t9mZVcvhHnrnjMjkuPfqwuKbQNnfycuCLpOjnExtwjAuxo1/ozet1UEA0Z3l6SE84QAkqQWIBJcn6XuusgBDefIAxaNLnYOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677596; c=relaxed/simple;
	bh=SAX/4gVNCkszlA4kN/MJxlF4iWqpz8DqffG0LjHMHn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mhSONZ0DS+arzNjerNLP0Ol4Ifma2p01j4UMcSk+3yvkFWec85hITOu2Yf9YclmT/NB1dCY3wf/kdQwOcze6OsGa6SqZhEaE19FtyMIi/XDbPnbtCdUEEtV+zTF5M7sslviFCzMAfzrr4//8Jrz0FGhv2v7LAWxae1umlLb1/wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CjNt/pWK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CjNt/pWK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9GjM7031794
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:19:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7zKQIAVsdldY9upKrkZv5EtVBOTxNNZ0b5TunOsRvzY=; b=CjNt/pWKALLATVmK
	Nx1yNvJX0afa3tS7XhO3li9kwLbqCCvvBmiiDBrg8SW6RQOSguwn9ZfDrM+ayoZC
	AloKtX4p4fZo7tZ5JPrTHsINcrpl/3RRR6XJk79nIUFZ2gfM2ac96+lJ53bWI83e
	98wUve2dR3JKbzRZjw6KRDo6eeNz9H+a+RdTnl+rAw5W14/WGx3zCsTYagVonreS
	zPn/SVotxdE2w+LjlVJLNUjZ3HJEvt1PAmb1VbqDtNpzlSLmCdwdztCPe/0MwyQ6
	7lmaaWK2Lwr2OO9Uaub+BB4KvW15wAfkL1AjRlxltBfEip9o0GTwxXo+OdpFml5B
	bSmUsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec262mwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:19:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21080c26fso107638985a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 04:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677592; x=1751282392;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7zKQIAVsdldY9upKrkZv5EtVBOTxNNZ0b5TunOsRvzY=;
        b=j1t7s/Gd4tR/fGKd73MwHjmknMS0m64CSjEQ2bvuTaFPCePlqOXI1Llasz71GzZYOX
         4hFr7lq4FRYF0gJ3GxKpWaIO88SZWQ+ug1n6ezg11Jy6j3jPkTePyn+EoRtS3PXtec/Y
         CDrY26Elmk+qmK5TV7Izogsz3kbcR/bfid9/mvNMQg9Dr9H3C9osw28i9zDOU0eebD+P
         exWfcm/51jbqagGdFjgJeUAKQo5bMOta5kdMdla9sjrcEEhGYi6D3r6s5zyen/LNctaz
         4/IizvSyvJ4JzYpKEHn4PBPhIwdGglARY6vTbEfC9G6AmdcKIhBC3FA8S5ySoUAMaDbS
         6MKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvAQpu0NUJmIRJEnclvhKD4FWdNaVFjNLMqNSmQrJ7DLqBYisUi27xnzL+t0M70ihAEhayl1efKUnZt2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/Ru8b3eNwqsS4lG8luL15+uAgJYx6fMDKKRzZ/MjdSq1kcgWc
	5tuE+IH9CXGtPuKzCuvJE6Pr7DZ/YhupA6SZPYWJeOwePQk1oGrzw64/IeoJheWxbOl9CzemTbg
	XGMdCj3Ii4pNxUceKUG1ewGqjgGHZ3iRSt6tMN3ORCIYy+SEzxzA8ducVM0x/u9yrJbE=
X-Gm-Gg: ASbGncsY4bHS0u8uNLq+xKLd08oLCMI1fHdeKuOGuxNFWhRVypA6HiRW7kw8GwfQ3I3
	VtrBzW/qAHqwXT6F4hLSSqyBI6lQFRMwAI97jIjanKJF0oB01mIYUpCVuIIGgpDimChiXTGnYuu
	Ul3t5xdGapEP1iLvPZELj5jbjPSU8tx1QojktvOqngiWRPaRyotCRhPlp6fs1nfQe4yodZo4Uji
	Q+G+ZOVcXINkP25nuwixxIjQxPd+JPFIsDaym4jBPaEE08IPL2zs8Pi5lzf3bA67zAMfkf/owie
	UAa0A55Aba7JeQ1M/RypTzrxF0qd1umCMJiZ7CQHnciUi6zq13yfVzl7FJue+wjUXAXsqya6Gei
	3ChY=
X-Received: by 2002:a05:620a:178d:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7d3f9920ff3mr524116385a.9.1750677592193;
        Mon, 23 Jun 2025 04:19:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHHqPoH6QmN0MGatJznqXrfBJU91ugdsW9S22UakSW0tiObJMZH8PiX02io1ERTh2F295E7ew==
X-Received: by 2002:a05:620a:178d:b0:7c5:ac06:af8 with SMTP id af79cd13be357-7d3f9920ff3mr524114885a.9.1750677591576;
        Mon, 23 Jun 2025 04:19:51 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b74cesm706297266b.142.2025.06.23.04.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:19:51 -0700 (PDT)
Message-ID: <1f7af719-a945-400c-8caf-16e6e55b2484@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:19:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] ARM: dts: qcom: add device tree for Sony Xperia SP
To: Antony Kurniawan Soemardi <linux@smankusors.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>
References: <20250623-msm8960-sdcard-v2-0-340a5e8f7df0@smankusors.com>
 <20250623-msm8960-sdcard-v2-5-340a5e8f7df0@smankusors.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250623-msm8960-sdcard-v2-5-340a5e8f7df0@smankusors.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2NyBTYWx0ZWRfX6RSTdgdi1GVn
 gxetAezcX02D1fjn7DlswHhaUYAAdQ9PMhJFe0OwPK1B7K5r532tJ3TPngIPB6h/WGouBJLmpL6
 KWI85qxF/APySgrFSGsgbqkiAuIX5Ebyfe9ZWSqa2SqCYGvRmYZFyvBe6Y32DN3gxi0UbimSe/i
 Bz0aEXO5sf9siFiYThUodz0g1GBot/49lIThxDHtxnU8FlX4qgBIcaFWfhappy+nxrafYX0o/FM
 s9z4Tu9+57rEn5o7rpulUXdmbHCa3MzvhvsgID7b61VJ7faX8VczjP7RKDBtFb40cPa3OAdu5UJ
 UDmMi8m49NA5/EuphcMBvJC5o0gEHwfr9MlZ5vAkxn8wW5Rq5ROHdGXKP7P3vyxg3MSfj/syUzX
 9qBx+OmPlYD92PF1ZGhSkWdHRONw72araDH7um+lw9b8zM4pQgjyrM2A95Mf53JhONdR2TsK
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=68593859 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=Gbw9aFdXAAAA:8 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=sfE0evLFWE0D8gplxDEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=9vIz8raoGPyDa4jBFAYH:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: ZzLViu_bjGz0xk89ORx7QNAioPHKYP7F
X-Proofpoint-ORIG-GUID: ZzLViu_bjGz0xk89ORx7QNAioPHKYP7F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=993 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230067

On 6/22/25 8:26 PM, Antony Kurniawan Soemardi wrote:
> Add initial device tree support for the Sony Xperia SP (codename:
> sony-huashan), a smartphone based on the Qualcomm MSM8960T SoC.
> 
> There are two variants of the Xperia SP, one without LTE and one with
> LTE. This device tree should work for both variants, though it has only
> been tested on the non-LTE variant.
> 
> The following are currently supported:
> - Serial console support via gsbi8
> - GPIO keys for volume up/down buttons
> - PM8921 keypad with camera focus/capture keys
> - eMMC (sdcc1) and micro SD card (sdcc3) support
> - USB OTG support
> 
> Other hardware features are not yet implemented.
> 
> Booting notes:
> Booting a kernel requires using the Sony ELF boot image format, which
> embeds the kernel, ramdisk, RPM firmware, and cmdline. This can be
> created using the `mkelf` tool. For example:
> 
>   python2 mkelf.py -o boot.img \
>     kernel+dtb@0x80208000 \
>     ramdisk.img@0x81900000 \
>     RPM.bin@0x00020000,rpm \
>     cmdline.txt@cmdline
> 
> The resulting `boot.img` can then be flashed via fastboot. A detailed
> guide, including an alternative method, is available at:
> https://wiki.postmarketos.org/wiki/Sony_Xperia_SP_(sony-huashan)
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
