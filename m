Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB7725229D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744642966; cv=none; b=Kk3fQZiD1mc92sOQOAQXwweMUhIGwj7c4Eh6+jVn66dnEz/lYbfxumW9U1QOFYfdOKTyx/7FaD0aEphyWF14bhahfJLBLprytyTloE5chJ9gXNn63usZGBBBM0eBPy+KJxmXK8DvWcFBDqD2QniTepXGeLz0ctQ8Ezcg5YNGhS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744642966; c=relaxed/simple;
	bh=RaBjxibi9OpSLsL0pgUQXBGLegZ2HPMaVA4aQ8D2I9Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aTVr3KGw2QS4pCZRin1i+7LfjGS0MUzHDUV9veoW9vDkI4sIWQ/bsF4r1qRNcuvkrUbUIvU0Cn8ZzamerwJWyuAfLN1SSInZUB1I9YwjQASdHNxT86x/NyT0BELNuspcB6Z01Pp1Em6I6bjskToimZBEkE8rA7IbnfGodHl80sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kFYSey27; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kFYSey27"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qFa002933
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fx9CLNx6B9Vh7w2Q67gBVSliKW/Q6vuPCUUdblElgFI=; b=kFYSey27HL8ztTDg
	RdpAvxgZ9m4z4naV34qjlKe322EcwPVu0dTVnfPZZoyOdXUJ5E7wux2TeOqRJ4cg
	2I23PD7rdAlxiI0HYOEieepyI1mShxQcF8F6Y1o6s3QYkTAyNatHpR3StJnJHmOe
	n0lIZfIVSP02j0rp4r8uiD7Tk5zoWDd1em3eS3Q37qd5aF+3T6OY9AqQFyTVpJ4B
	TrXR/Rrm3wfGoSnWErszLRs4u1X6Tb16EmX8Q9/jInhOi4z5JarRPgcVFD6QRjsM
	cI/1f4oldAetzdjVh8rgjuL2xxugaN6sKplOEl3/wFEr8GZggBwlvk6fkfz+6Ou/
	0XmDpg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpmsjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 15:02:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395d07a3dcso3207655b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 08:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744642963; x=1745247763;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fx9CLNx6B9Vh7w2Q67gBVSliKW/Q6vuPCUUdblElgFI=;
        b=G9pAfnw7yT1vyAO5qNkq2kb/ImmuXHhkYDpWK6pXc4pC4QdHe7TYrKhllM8hJ+6F6h
         rY20swWK7yRtL/e+g1o9OkvY+Ac5KOA1WiCb8dA5/BAcanNnwU2gDi7ZJ0TfBq13KUp4
         gSRXwUcuTarAHulVk/RBws7krZqQTIlSOx8+P7YfJDclMjoDcTDcTMlCVaklsyAtgWp2
         ioTDVX8HU0H2ALPWZPqtv64H4xeiArLpnIAMI8+ZAgx1t+lUc6u2PlSLraEpTUkvnbv5
         Cano2YFj7T3B7Ug047C3ITyvycMrNHXE7i3uRqmyfvlC6PVvM8TRmnW0de1B5JxSBRYo
         Vr8Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfu+TABSJh8jYmBm/Tw/yLiAWAu5ySJba/Ot4HWCVBIhvS6jmCf+RsrViOlMnZzHe61yrd7nlghVa4/p4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxemmz8C+sCkN0KEx2kmc7uIJ2axhssURiaAByw7oG4CPMB1ni0
	KLK9Hkbc3TmvZ9VRlWdsjEldzZG3uKq26ampgRMP0Dm1N5pW+UdjlmANpUdeSdZ9y2YzI/sKIgv
	c5rQk3MwrLrWAUYWAfe7wE5y3Au5B9Ok4M5OGhaGMFHPK3uwCV+HB6UP/Dd4cs9A=
X-Gm-Gg: ASbGncvn4MHe4PwtOvm9oyFvdrzbVTbOyW06jN3EtjcqrbQjC8h+aTDVDhvGRyzm7vI
	YLmh4rx4Tw1iVuSw/MN8tGG3Q+RKnaH6bsM0MiFAZ2mWpm9+f3YHdnvDirvQUEvBwYNWNLuTu1L
	OcJO7f5o6QMUBwEBHLTauhwTVWS+zAUZ6Y05NoEagx5veA7+WC9OA2tP9X8PdH51LQtIUor5pQv
	zINpNglDoqVd6COkNc+BM7qKA+xQ7WBLoIW4O1Z5cF0+V8FqhdIvM9hgCcjiDvh2PWYqkLNJ1GV
	STl2s0DtuVLV2mzgxhhR70AjLSvlCai6utao7xSx8/Uudtc3LoFQDV9NA88rFYYdo3nDSTO9L1j
	qa7/R
X-Received: by 2002:a05:6a20:94c9:b0:1f5:9024:3246 with SMTP id adf61e73a8af0-201797a39c1mr17925501637.17.1744642962968;
        Mon, 14 Apr 2025 08:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1bvcHXdGUC9wzx8xCOFjLvQn3x2hUBSOQvCCcOvrLi0D37ffqN0AxJ/2rFL/I3g9ErbikTQ==
X-Received: by 2002:a05:6a20:94c9:b0:1f5:9024:3246 with SMTP id adf61e73a8af0-201797a39c1mr17925443637.17.1744642962376;
        Mon, 14 Apr 2025 08:02:42 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a0de8926sm7855972a12.30.2025.04.14.08.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 08:02:41 -0700 (PDT)
Message-ID: <9c53011a-0e00-49f8-bf7e-b04ddc8c575b@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 08:02:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 0/7] net: Don't use %pK through printk
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Brian Norris <briannorris@chromium.org>,
        Francesco Dolcini <francesco@dolcini.it>,
        Tony Nguyen <anthony.l.nguyen@intel.com>,
        Przemek Kitszel <przemyslaw.kitszel@intel.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Saeed Mahameed <saeedm@nvidia.com>,
        Leon Romanovsky <leon@kernel.org>, Tariq Toukan <tariqt@nvidia.com>
Cc: ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        wcn36xx@lists.infradead.org, linux-wireless@vger.kernel.org,
        intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
        linux-rdma@vger.kernel.org
References: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250414-restricted-pointers-net-v1-0-12af0ce46cdd@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pqjCHxKCX5VF5nDNgLq3JRZn_T4rSIEU
X-Proofpoint-GUID: pqjCHxKCX5VF5nDNgLq3JRZn_T4rSIEU
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fd2394 cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=e70TP3dOR9hTogukJ0528Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=2xVh5uQ6XZRltrFgOl4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=582 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140109

On 4/14/2025 1:26 AM, Thomas Weißschuh wrote:
>       wifi: ath10k: Don't use %pK through printk
>       wifi: ath11k: Don't use %pK through printk
>       wifi: ath12k: Don't use %pK through printk
>       wifi: wcn36xx: Don't use %pK through printk

the first four should go through ath-next and not net-next

>       wifi: mwifiex: Don't use %pK through printk

this should go through wireless-next

/jeff
