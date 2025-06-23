Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93BCB1B423B
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750657453; cv=none; b=eR6snzFlofnptR6saDifarCellqFYtBzykVK2bkVCeH8OAcATM911TnUOiyYVUeMyI/6cuS/RH+00oxPgwvCxGWtDaCzEw2cACjGijfkBGgSreF8VSCCjxcn3PbvfK5eUV0/i2wwnmznxsEbBe7ss8nuMQR1PI+HuF83H/d8+es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750657453; c=relaxed/simple;
	bh=fbkogLp9uZr5f//hXhJ5Gtx3cE3QJe4HM7LwsfeOrf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MefBNLckRzkB/gZKB08rgouHVOBzD+pG8gRSaRy/q0oYJZ1NlLIggCJKbv3gZhhtcPefiNYuGyVsz11gM5vUCsV+rR1uhOFZ2VZvt4bNXknx8/KvL5zQic5WFlMgYdvNgh+N0+jjkO/3kOt6mUlWgHomGm0ZK8j79nLllZZPvyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MzSpZJu1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MzSpZJu1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MMvEiP011465
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:44:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZE1jK+fran5zJP4vF84ura1eqbV0f9kchFGUeeWMxCU=; b=MzSpZJu1ChJfEvGI
	lrYDQfCXjPueYbV1RiTsVUn3XUkd2Iau+NvDIRO4n1cpwO/vaGLSFdjdRDDPP62Z
	aFHaPF+WD8VwbScs8jhrG/mVxrdLGLWu0epyxrGJ8zdmjo/o0c0cxMugpchgELvH
	o1YLS2R96K1DlpOyKeFISS/3RRgdscPmF5NRhc9SjYpl8FSZZ5xWewmYELa5E7E+
	CfjaAsWZqElGFbbgBDk2r4wQ7bMZDfXZs+6eguPoQkUfFbMUEtJvFAiqbyWPxD/t
	Oxkao5la791MVc5xo46kQhm0wWhC1cL1YRq9TcJVC/QQ9zSFMPIx63zGA5FbfMIL
	X9vZwg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcmh1xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 05:44:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b1442e039eeso2590302a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 22:44:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750657449; x=1751262249;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZE1jK+fran5zJP4vF84ura1eqbV0f9kchFGUeeWMxCU=;
        b=C9SLv8g00yqO0m7dUzDeRkC1R6KbXJGbFuMBxdaphfl8bICZvqLX8R85sjBU6tLdBA
         sUC7bFN4brmHOLzVOJMeeo/kGV94azOkzN/75m82aA3B3ZCjVHxcPBnpNgXnCWsyfybY
         2Dibjs6jtIR1PMWHmqTIXovzPwx/3CJ+F9ZM0D2p/+a+zjookNlGKu4e8NK1XKEVDGZJ
         esfE6/FwmD8PMnM9jj3mWHHou7wtHUz5vOjwz14gghaSzlSBeJO1Zq/+jgld7Cb4bRvK
         tj0lgOO6XIMJPyjKLhWhC97UCSmxCnrJoTQUKB9DdDssYG0KO2/2b7dh9iBKliz/9PdJ
         U8eA==
X-Forwarded-Encrypted: i=1; AJvYcCVUdfrML4/+nQ/lP3OqPAv1rLB15qi7rgzI6j+xXSRI+50MHMFTerpxC/mx9/j3HMXBUs0Q02uNDNsNeOQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGu+QDtolbiwVp3tOw/oY3HUAVPZbpRVSsifMCZyC/kK2af3MI
	ndgWlsYUspwaHDxCQvhaNEY30I55SiVZqrSt17ONiiRR0NHMRc6wJ1Y9NMI9mLq4KM7lQ5DbPpx
	ksXFze1XzE0oCzRE9dLX4ft0hjGyaP4juVVbMcM9FWexo+11a6qKCv8OkRzU07T/gr9U=
X-Gm-Gg: ASbGnct5YgvO6cPMXlag3oYSz4wjmcbCnzCNBQfenp1KLCQIXEd2pkRSQRtLAD5cIDS
	YiOKbXFI/VgiZzMEurSz4zEnxI+jgzTPPWcomroeTWNldRxaAKQpx2y+RHTXdArtOGXL/GuWay2
	OHP9VdrUuOUF9TFv45hpaLbrrns+ez4k8+nTRWQOFsw4PYK1rh+1fqXg3mrYDSxXEJnnZRTZ5Jw
	nvKViIfQZJB7NzH16PL0YLy8I4uzY/nateZts030oWAQcpGECGKO0fT8OSxCA9X7HbQDcyzxEde
	ZMUUwItdjjygB/f9Al4w3hYnAhFjG1sz8Po0u70WVirySXg+uQMK7jHI5mFahidJ
X-Received: by 2002:a17:903:98c:b0:235:5d1:e366 with SMTP id d9443c01a7336-237d977557amr211329595ad.10.1750657449535;
        Sun, 22 Jun 2025 22:44:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2fjA6yXvbrte46QeaUhRGDd0j4oR6dZsEFJZhHK+trgT9ehHcZxq+DgkT0YeTB9qXSCO0cQ==
X-Received: by 2002:a17:903:98c:b0:235:5d1:e366 with SMTP id d9443c01a7336-237d977557amr211329365ad.10.1750657449125;
        Sun, 22 Jun 2025 22:44:09 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d86c49d4sm75260425ad.200.2025.06.22.22.44.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:44:08 -0700 (PDT)
Message-ID: <ed04a28a-3fe1-0f25-0f0c-d5b61f894c25@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 11:14:05 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: install pairwise key first
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250523-ath12k-unicast-key-first-v1-0-f53c3880e6d8@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 964-QasigJbPMo_DD8GcBQ95nZKda03o
X-Proofpoint-ORIG-GUID: 964-QasigJbPMo_DD8GcBQ95nZKda03o
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=6858e9aa cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_9NqMhxDF2Aqya9w-eoA:9 a=QEXdDO2ut3YA:10
 a=zZCYzV9kfG8A:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzMSBTYWx0ZWRfXwforPYkoA0bL
 7l1miSfAJokr5LzBjZpnPILAgRn01wSxS4Uxc1RRHqrrUYgoGqILPJntnOHM2jY9tiwwo0XFolU
 fFkGrI/NAwBvjYdni+aqreaF1xGYGqjS8M9Qy/mxzeoj5or1OrFwWkGy+jGyRNZWF1rEzVrdgrs
 Ske5jGzSBTT+xzYqjlN7tJ7I5tWu6VTqXSBZmSSiV0On8MY/bsj8kr+oKCN90KtgksYZMYeciNr
 ZpgmDGzAOeph0nBX900MDZrnTpCWMNu34GRCIx6aB9tCqE5sOC+tygfI6NE/BES7LvPlILuW8Hr
 S6GBmKHMiP8v2HcNIyHPB6wLbijNMCeDEjncrVIzOv/ofFFBiCUc8dGV0Lk/Yx075GwraTL8wIT
 EJXxe6tCKpxb9SOYudL4CapAQij/BUkV5d1ggC8+EtYMOynzD1ZqYGOJQCEgXRLTfLX1Wna+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=932 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230031



On 5/23/2025 9:19 AM, Baochen Qiang wrote:
> We got report that WCN7850 is not working with IWD [1][2]. Debug
> shows the reason is that IWD installs group key before pairwise
> key, which goes against WCN7850's firmware.
> 
> Reorder key install to workaround this.
> 
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=218733
> [2] https://lore.kernel.org/all/AS8P190MB12051DDBD84CD88E71C40AD7873F2@AS8P190MB1205.EURP190.PROD.OUTLOOK.COM
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> ---
> ---
> Baochen Qiang (2):
>        wifi: ath12k: avoid bit operation on key flags
>        wifi: ath12k: install pairwise key first
> 
>   drivers/net/wireless/ath/ath12k/core.h |  4 ++
>   drivers/net/wireless/ath/ath12k/mac.c  | 80 ++++++++++++++++++++++++++++++----
>   drivers/net/wireless/ath/ath12k/wmi.h  |  1 +
>   3 files changed, 76 insertions(+), 9 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
