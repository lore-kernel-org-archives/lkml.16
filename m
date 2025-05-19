Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DD3269AFA
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747646751; cv=none; b=RCeQLGeVGPsig5X4XOGrlf+khJ0fOL5kWGBypnIACIYKywdgLm4Vma1LZo9DiSMRGghsKpijrk6iAEpiNZSag2xrcTycL08uxQbLYtRfI38cJyohSxI3aGLq77QxHiWDo9k51429k37hTK3qgm7bOLfaOIE/PpMe77f0sWJ8eUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747646751; c=relaxed/simple;
	bh=w0g4PRmkicbmBv0K6QnY9IMFR6OueDieCzcnUpTktuA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tij8bL4Ie75YwCrcXL6rm6kAFLBEivFAhRg2AZVuIPFfsdzpAtL0zxoZuIg5Poy3vGoCTZ3DV/aMe3bPGiHPCPMVp/aW6Ip4BdeEVk0pgRSl7lTRSgvIMtbjwwDdIRTg4/mxDJPd9OOpc4cxm0dhFWiovW8RTjPdZHEgnv7ZgPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L9HXMhgn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L9HXMhgn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8wvFQ005909
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uVk9PQQmr/kXOrlyU29F1Wn6mjyOqipYEkv8MRojHec=; b=L9HXMhgn+sALb2cU
	vGZM3AXs3u9JKi+1eXAPTTIDY+C7wAXEPqWQH4hYJCsKdbex+OoLKoxfi57MQW2p
	10E6bUMthb+v7R7A5TEHtCgSheBz1PJFJqhov9kutEohNBa9RBZMLDu3pz/fEN6r
	UW1c6qPM4MDaGxSjWSzdYFBG644ClCSXBgW8dgbf1ZQ4/DbdZbwnsdU5l7SJoWLf
	cnimjiIAwyofN7jiISmebuKMCpEuCPwV1bpPh5UXyGwWRxAYzs8sLuWVnTfjxLUX
	pS2Mye5zSRSwIaQa3VLvvOoGJtqb60A7SQLZi6992peIAcidXwdJ43w1yTdC8doy
	eLw+iQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4uu9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 09:25:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8ae0417b6so74541096d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 02:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747646748; x=1748251548;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uVk9PQQmr/kXOrlyU29F1Wn6mjyOqipYEkv8MRojHec=;
        b=mYNjgkgBzUCwsNi4gbPQ2s5JzXlQBRIe22jAJh9iNfrcFKibk6M/CVR6KyNnKoE0eR
         DjIaRRbwdT81wXD74qua+BS2+5g6yGAlH95F1HOIh3h7TdZY/28RPhkGi+TminQj0WBc
         V99Xbq0KikuKmaxNoGdov5733SWzCp8dDZXmMX/UFWo8QkCLlZpKFO/yREdXgHgXW7C8
         9RBjn57MGb6+OrUBtYgM3iEX04OCntSqSmylcsYBhep/P+kKWKMliTIH6BleconyguuN
         tlStE92g/BzOHb1MrfVUDu6a3NKc5AgY/dAKQID3GGOrPTBbijZGx4Rl0m64H7HL418s
         LxBg==
X-Forwarded-Encrypted: i=1; AJvYcCWi49bAO+D/dSoEWXLH3OazPBmCNcs/R143/zaVUi/xEpLqJakdvgbmS0TyA7aRcpLIVhxEZzvcwGV0KWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw54HCCUeWTDmtS299VqDCthPJScZ9eS8L5egFj+x4IoaKwyMq8
	0W/kjAGYKrKF11j8fzf6yTDm4s6dTdYmVfins3bWT2xRlL9NBT2lWzVpqTjhW7ufM+Hj/C7Zilp
	zyjR28LdHkYhphAe+SA9O8kEiCUd8R/TtqjmegkRfyJLshX3XI3/qUVD3qJxEzueudac=
X-Gm-Gg: ASbGncs9pid77OGG9z3dfOI5N0JEDAPbJXRq/BF9wMgUGNGY+ceAnS08bwaRdeBUHrZ
	rdsmXmUdKvmIOlwZiqKzVACHYlATedv9kUjRBb8rkuFB5j+/++T+7qAl3eAhiV4M3gp04Bo1ah+
	z2CU2SCohTSGXoofrOwwpoLc6lUDJQ7aLSj909cYgtxmq91kdf+d/GIwbjLwiIQSGKhT7gEeuYb
	9gjmWif0G+pMrd6hAjCs85tLXAEsFIjMXBzesSJELYnPdZgEq52buOTQdMSk/n7vIb+VbEX0tEX
	zOBXg9NdHwat+v3Ze3NAp+QvAVQEq7i2kp6sSw==
X-Received: by 2002:a05:6214:19e9:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f8b085283amr192919986d6.29.1747646747722;
        Mon, 19 May 2025 02:25:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGiafe5ZWJ8f8DrhbWyQziFJ8QjaA0cqULFEHnBX08KZJAH9eyIz0zuHOhiSLANggQAhMIAA==
X-Received: by 2002:a05:6214:19e9:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6f8b085283amr192919816d6.29.1747646747371;
        Mon, 19 May 2025 02:25:47 -0700 (PDT)
Received: from [192.168.68.115] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a35ca8caaasm11928555f8f.83.2025.05.19.02.25.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 02:25:46 -0700 (PDT)
Message-ID: <0afd9fc3-3748-40b0-934b-ba5b5f6b0bc7@oss.qualcomm.com>
Date: Mon, 19 May 2025 10:25:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] misc: fastrpc: Add NULL check to fastrpc_buf_free
 to prevent crash
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250513042825.2147985-2-ekansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682af91d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=cMXQlDtNq5-FbXNvT68A:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: iNG6mqDUv-m68j1-GtjwmtBY8McnNUhy
X-Proofpoint-GUID: iNG6mqDUv-m68j1-GtjwmtBY8McnNUhy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDA4OSBTYWx0ZWRfX1HyFfT6ynNMo
 F1UmxNGlhpxFdZ18nc2R0ddUWHs6l8jWlYRXBwJmPSOGghdJnr/pC+NgFa2Tgltn+DrL/PDc0Zj
 gjjj6u+KqgqKhq1CtBu+Owuix0LA0FGqPjx9h4S3jbBfAyIwp1Qrt1t+CsVYw2gOqoOw+Hr94BL
 a0wZMoTgMeNnLKOeXQw3GcntyDzk3JeQcmvtNg8MqzYv+aUVx9TDkSpFy9P+LTW1/zAKEO6RaP4
 qzUpevolWyrh40pq/VNWsj1ktbQ1zGPdJ3bL46iPt0Moa0LvyOwNBYbNAe5sTM1M8nRL9ZdFH+O
 AF7+904V9DlDefLHWi7OIsbzrO2WWJZzeNsYaJbDeiQee8z3ehKLWyXQMXmLTd0iHkF/nygdXvS
 uASt35A0jPcKtQXQRPPjvUkyBisOo5C0E2gLBP3VyqQ8lta6WKVXWCw2Y4KJyyrw6nC1xo++
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190089

On 5/13/25 05:28, Ekansh Gupta wrote:
> The fastrpc_buf_free function currently does not handle the case where
> the input buffer pointer (buf) is NULL. This can lead to a null pointer
> dereference, causing a crash or undefined behavior when the function
> attempts to access members of the buf structure. Add a NULL check to
> ensure safe handling of NULL pointers and prevent potential crashes.
> 
You are mostly defining the code here, but not the root cause of it,
What exactly is the call trace for this crash?

> Fixes: c68cfb718c8f9 ("misc: fastrpc: Add support for context Invoke method")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..ca3721365ddc 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -394,6 +394,9 @@ static int fastrpc_map_lookup(struct fastrpc_user *fl, int fd,
>  
>  static void fastrpc_buf_free(struct fastrpc_buf *buf)
>  {
> +	if (!buf)
> +		return;
> +
Most of the users of the fastrpc_buf_free() already have the null
checks, It will be Interesting to know.

If we decide to make this function to do null null check, then the
existing checks in the caller are redundant.

--srini
>  	dma_free_coherent(buf->dev, buf->size, buf->virt,
>  			  FASTRPC_PHYS(buf->phys));
>  	kfree(buf);

