Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589991FC7CB
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750665127; cv=none; b=sT4iL8mwd59irKLjMvtrk0M6ZrC+k8NXxCujt0yyhFuyevuPiDUPVsMaLCLvSjibyZVJgz+qrz7fqzskdNz96DOFrXT263IdI7CLLQzNsdpMbo+ezdDLChBjaaex5/Rfx0kizGJDEAZjZwaMq4Ua40i79YdGEBuOJs7Z8582FL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750665127; c=relaxed/simple;
	bh=uPzPLbno4uVQ6hlHmPSJ1p3r01sApeqRX2/GUkNLw54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b10qGfmQC+zvWYXrIU7edX4iH1hRwjFmuMTXHR49IBrzSrOUur11w4a/TRK8TiCzvzXzXPBcSXfIiQa/z7s5qVUqRWUzerjoonfUx2fj9buKbl15cL3kmt1ZEbW20j/I9kct0aTcac1qVZ/hOZjCraXkJrS2O34uz0HTug+VEBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RCFHL/ZI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RCFHL/ZI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4dYii015169
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:52:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R8KlMl6rNEnyTnB7QdDvjs+I2KkPy2RCoYHmWXPUL3k=; b=RCFHL/ZIallji1Sh
	eh6Z3rKDDIzs2m4/Vi9wn+3Ap7D1+uGkK7MD0EyZh4tvnIZf0wbgaOJU4k7hBAGQ
	kOcTeBaVdEIOc892GrEjFTBc8bor8BVAdXyQksL2YHgyvKg17AviTnWJuXEkO4uM
	MCTMbd3DusU6mzM0jBcs9mnoj5CTHRDV7r00q6iCNMMNq5C4MsknlfxGOjalkqYE
	7rCHRXR7Vbm45G2LKoOMSD1YgLG2jqdXSo3y8tC9nK7CMeLO8gxIJ1hJiJcRPx2M
	B8Mr3SvjpoKYE6/tjuQsLtPkxoxPuJ+d+A2JJ0RhSdeiu793cvNw2Zc+mQNilr2d
	xvExsw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f03b0ggv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:52:05 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74928291bc3so1179778b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 00:52:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750665124; x=1751269924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R8KlMl6rNEnyTnB7QdDvjs+I2KkPy2RCoYHmWXPUL3k=;
        b=kbvmFtfZFHBx97QA1HknXmJoD5ql27DWWudqXlbNZERNQOp1U6cHTM8D2jB3JF4XlS
         ALlQkC2Zqeyww5JwVEyTkvNd/SqDnYyFumWO2h0xrFsjiP7YYoCx3jlBIXOQQez3FcoZ
         8KqQES14wERv0O83baZxVIafABCHAJtyd1g86CoSf1dyIBL6l9s2pO8nRal7IAKdk35i
         JbolZDPGbzyWIEGNlk8uLyOnWGq9FgtfNj5GxTiz9Eip3kWMgGMDDvR5p5WMMnjhYcqd
         IDlilCDIXYAkgZwYzQgk9NSM/D66ZLgs8Gt1asPu4Dq8yOSrWzVzdUFPP8LJw7l2WIgm
         Li3A==
X-Forwarded-Encrypted: i=1; AJvYcCXEd3in7vWastYJDbNAbTI1ybmxOK1BBJXeJfNR8QtW1BUGjIzNnbL3CtypGIN/z6FssykT1BAqbShd46o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh+gH1MHZQf4ie6eC6ZyrQPYHDycq+Ddj46YfXaPclxMTxl2oM
	Azd23rSIsrB4wqOOpbcmYzJg8CeWJviLNdFrD5OJoGhA0NpOQrFAmwa7DSNkbMWPQhbPzGKdpGa
	dGhIOZuGIvlRrNqZ7t9qt/w4laHOQa3QeJd0hVNIiREkaJChhv8+fZUFPdKsMvKovHi0=
X-Gm-Gg: ASbGnct6mXvxNfOD+eDGk/qaD2cZcMIJymQZ8nHGNeDw42tmUHgpJpqi4qpceutmuQK
	UGhF5SJomMPWARIhaBjnjwpiRJP8knskzzFF6WtTa4pX9Hcp0PGZHSysvuhbOREVZYOy0GJ2e1w
	KHNJ+avyojlntFs8Qsyo5y9B7O2E5JnNaX5fz09XnPRJ8WgyaJlcA5yarlzUk+YUoAV489c/Fvf
	KTiaLj2iJaJW/6NG/IXZ8fTXz2OJ0FdaGK90CJx8D+eHGlPsuXaOs7nxiyRf54gYDRVAWsVvcpe
	i/ugIaxaILA1YQ2rqbzmj1LI/aqGAi3he0Qd2teLvzTnyBERFm94
X-Received: by 2002:a05:6a00:4650:b0:748:e149:fa89 with SMTP id d2e1a72fcca58-7490d5a6b8bmr20059531b3a.8.1750665124593;
        Mon, 23 Jun 2025 00:52:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnefZLmLyw9BZQNOzK+M4PlREh/+03ub4fmgKHNxasTDiuFUjhGZCrR5KVOGMUWET11DC9SQ==
X-Received: by 2002:a05:6a00:4650:b0:748:e149:fa89 with SMTP id d2e1a72fcca58-7490d5a6b8bmr20059468b3a.8.1750665124143;
        Mon, 23 Jun 2025 00:52:04 -0700 (PDT)
Received: from [10.92.214.105] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6275b1sm7797294b3a.79.2025.06.23.00.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 00:52:03 -0700 (PDT)
Message-ID: <29bdba7e-63f6-4084-901d-beaab0e74894@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:21:57 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: amd-mdb: Add reset-gpios
 property for PCIe RP PERST# handling
To: Sai Krishna Musham <sai.krishna.musham@amd.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, mani@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, cassel@kernel.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, michal.simek@amd.com,
        bharat.kumar.gogada@amd.com, thippeswamy.havalige@amd.com
References: <20250618080931.2472366-1-sai.krishna.musham@amd.com>
 <20250618080931.2472366-2-sai.krishna.musham@amd.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250618080931.2472366-2-sai.krishna.musham@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: YpfmZdRjo0FB5H4mBjkCGhmLwAUhFQC6
X-Proofpoint-GUID: YpfmZdRjo0FB5H4mBjkCGhmLwAUhFQC6
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=685907a5 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=zd2uoN0lAAAA:8 a=5_Q9n8kPR3DJOernC3cA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA0NSBTYWx0ZWRfX2CfxAi1naTFG
 XXeMbrWmSyMryGVOXmugRYdnzoJ9kVaeqGqDx49AyHCoEb1gLu8shc7QTtzJ6n+g/rH4b+RHcT/
 Q9WJANm1ceuK5BJ8dMuF9HgL0o4EUZ0NVBYRB96qQOOPmK6GMJ6RnYgCwkJuhasMdL5cBehbDYT
 6UKVOM9SEQgQrkoa7lICgoYYTt0+OBcafiCZbsVJn/XAFxIlENm/L6wdywWIicm2Mb5F4KnmrZa
 A+9gvWcpDce+a+LF8wy7pBQUQtAd58P9fiBO0EhVqCj6FmfE5W8sqBqgDFE/T1AiNl/4o738D0k
 6rx0YF/3guUj2sM9QQomN+PD61eOsCqnYAsXFYNC39Fhrd8oawQXI3zdQQOtYsRSu4gqu0VcFUb
 +BdHPN0P1RmMN6pIUZh+NxeGqw9JdfBBiJzMUCZU4ImMvGoqL6zCM42H++iJGTov7kZApyD2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230045



On 6/18/2025 1:39 PM, Sai Krishna Musham wrote:
> Add support for the `reset-gpios` property in the PCIe Root Port (RP)
> child node to handle the PERST# signal via GPIO. Update the example
> to reflect this addition.
> 
> Signed-off-by: Sai Krishna Musham <sai.krishna.musham@amd.com>
> ---
> Changes in v3:
> - Move reset-gpios to PCI bridge node.
> 
> Changes in v2:
> - Update commit message
> ---
>   .../bindings/pci/amd,versal2-mdb-host.yaml    | 26 +++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml b/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml
> index 43dc2585c237..3ffe4512650d 100644
> --- a/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/amd,versal2-mdb-host.yaml
> @@ -71,6 +71,21 @@ properties:
>         - "#address-cells"
>         - "#interrupt-cells"
>   
> +patternProperties:
> +  '^pcie@[0-2],0$':
> +    type: object
> +    $ref: /schemas/pci/pci-pci-bridge.yaml#
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      reset-gpios:
> +        description: GPIO controlled connection to PERST# signal
> +        maxItems: 1
> +
This is already part of pci-bus-common.yaml in dtschema no need to
define it again here.

- Krishna Chaitanya.

> +    unevaluatedProperties: false
> +
>   required:
>     - reg
>     - reg-names
> @@ -87,6 +102,7 @@ examples:
>     - |
>       #include <dt-bindings/interrupt-controller/arm-gic.h>
>       #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
>   
>       soc {
>           #address-cells = <2>;
> @@ -112,6 +128,16 @@ examples:
>               #size-cells = <2>;
>               #interrupt-cells = <1>;
>               device_type = "pci";
> +
> +            pcie@0,0 {
> +                device_type = "pci";
> +                reg = <0x0 0x0 0x0 0x0 0x0>;
> +                reset-gpios = <&tca6416_u37 7 GPIO_ACTIVE_LOW>;
> +                #address-cells = <3>;
> +                #size-cells = <2>;
> +                ranges;
> +            };
> +
>               pcie_intc_0: interrupt-controller {
>                   #address-cells = <0>;
>                   #interrupt-cells = <1>;
