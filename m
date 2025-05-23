Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECEE18E1A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748021146; cv=none; b=TMkDiJP4uCCAepO8L7TRsDfyoz+EY3N/4ab61lk9b6JLiOT6Ct0WO2Y8MqRhKBmxfQ1lSOX3YXY39XQyeIYuiN8SAiB/qSlzNTCW0lSz/vxifh0O2M6IiQb9iu7dSUSLzpDRzZUL7zYV3h1OkFevZGpBMAT0DoIWtzUOg865Wdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748021146; c=relaxed/simple;
	bh=7rcCNSJVSwEq1xrZ1u5/+ky+mLguy6zK/o7fp7M5HSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LjBNpPOtvL2vJxXXC5ZvOcd7pTv7gx4CKVRlE8HPxhs+xp2AS1x6GfJltLpyRjCPF50mP+rdy/MqxBsLz/vaqLGX4u7pF1+CTpSRP/1Hpej5Lru4p0Zg3njS3pE6k5nv7dCcqTt4ifeCKa70ArssOdckQJUEQ4WCWJlDlnYQzYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U6nUPANF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U6nUPANF"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NBbAxB024842
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HT0F8cGHWEQc238afO9TzLz/
	3SBoXaCqVeKXpo6ggCQ=; b=U6nUPANFVoIfiIjVAy1DYa/qEGq5CTqTkPzfytOb
	vuZaF/v8H1JQzFY9x5XaSVNhyS/X6m+fKK8W6f+oS0eDHdIVw9As/VSiE3+3E7VO
	UsfEg8WVkI+u3Vn1xdESU/35fmlgqaQCEv0O0nwKqxx85bPButM8M5kOKyYr1LBG
	MOkXhzv3U4Dz3pvVFEVPxkkoIqYqOE1ALP5Oa7QSj1wefkbhTIFTrggq9pavBZm/
	R4kZoGjzly7rwYK37F/+0HzyZPPnz5lmBA0Ak/y+ivx1MHZ+lYrOQgbW3+wxLFha
	bU1F0HPFDcauw5QQ5l3hNnk2IQVCXWTBFT6OCw6ruNcHBQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf52ny2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:25:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8b2d2fef5so1217566d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:25:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748021143; x=1748625943;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HT0F8cGHWEQc238afO9TzLz/3SBoXaCqVeKXpo6ggCQ=;
        b=WNLcmCj9oNyOyjhJBCsZeN3gWpaQ618D2RgT1jDotTehMvN9bcP2J7ZYQ+ky9zs/s4
         U+575INCOIzJczcqqACNfGoYv6TrtVhoxhRF+YFey/4BPXh6GYTKrlmEuiIdwNti8tzy
         8ar751OgpW0PU5ZALylWqxHkl+lxRRMPUXHq+CJAUfIG2PTYtZBaqqASZ9SEf3Hcuykb
         ZYkR1X+1rAOOO/b6hc4C91VFeuw7a3uUIIejiHY6npvWj5flGFJIjtePRrX5hpKX8ZI3
         bWiP+UHPan6zpVCkJLNF6sd3tc9xnZwXOHYOQb0wjoh8LuOOgDlSu3XCzFL2Qpoihd8B
         z2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvFC9PLTpuXQRZcX719VmRBiSEqelYmaGhRvuqlejMJ1vK8xxp3dT1WtsJiMXDG3+U19Pl95lSFfS1rfo=@vger.kernel.org
X-Gm-Message-State: AOJu0YydkukEDbrmnC1CQgT90dUATZB4YLMCTCWlyu8nZyY++v2a8MEj
	ywtl7H0h2gO6HZjk2lwyLMYh69dMLKVQbHvX/yn8beW2SpBiJG5pIv0lYnCLDzqsGckoHpV9vYE
	9URxeECKAbpSkWuXo6batykk39OUFx6iKFa5YcF7fpyNlVOhslQZiEGSubmkiJ/Fw8BY=
X-Gm-Gg: ASbGncvWs3mlBx5qJGPyOb4CrgehFYHCUVeJ/DKqHznSQTBnxX/RMXNsExDIsTwM2Bq
	Ka0jP+VmRhgUgqLQ1xG12T0b/+0ABQBAVvRnv+jL7c6Dl/7r6ubZyDaaTU6k6AolIByliCfqXz3
	+8s0/pwMKWv+lQ+0pGQYz5HQEFx2mEJOP+34lKpaNXHAbar1xW5RseWOZEj2kzuM3m0nlytxNNd
	JEoyEEKS7ITjLUcHnry0hmsTjN9+8Rne4f5NQvs/ESNOdeWcikv9sgksrqpJsvsTSXMXY0UgzwP
	JTikIaYJQTlZUOxq+gUnJXZwwRUI1H6SM742Dq7JTFJx1At3GMZYuvEID5+ZQaIzYIIUAX1nxXA
	=
X-Received: by 2002:a05:6214:1d0d:b0:6f8:e2ab:cb8a with SMTP id 6a1803df08f44-6fa9cfff18fmr5886666d6.5.1748021142758;
        Fri, 23 May 2025 10:25:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1fuehJqloS19yc8HH7Owq/jk518Mad4i90LYUjgFgeJsI99YBxj75Y2MxKlxrFuXWwV/Y8Q==
X-Received: by 2002:a05:6214:1d0d:b0:6f8:e2ab:cb8a with SMTP id 6a1803df08f44-6fa9cfff18fmr5886246d6.5.1748021142385;
        Fri, 23 May 2025 10:25:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328085b9033sm40183991fa.80.2025.05.23.10.25.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:25:41 -0700 (PDT)
Date: Fri, 23 May 2025 20:25:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        quic_msavaliy@quicinc.com, quic_vtanuku@quicinc.com
Subject: Re: [PATCH v1] serial: qcom-geni: Add support for 8 Mbps baud rate
Message-ID: <fmt3prey5rrm5pqz7wn3p4g6lqpupazbbcahuzp6giod7l2v5j@u64bykj7pi7j>
References: <20250523103721.5042-1-quic_jseerapu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523103721.5042-1-quic_jseerapu@quicinc.com>
X-Proofpoint-GUID: ebwqvKpM6Q_ryPeLQLFblA0k4cQxcghU
X-Proofpoint-ORIG-GUID: ebwqvKpM6Q_ryPeLQLFblA0k4cQxcghU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE1OSBTYWx0ZWRfX5t3Xi+vcXUCa
 fdSMjJnU5q1DlcB1/jxAi+yBq+Os6Z/whL3I6tJ8qV3nJKDf7bzB/WHwGVg9ekdhA7ZSGplLHdD
 riokUPMIVX56/N5oaIDRf44vZvykMtsautSQG9Dd5+7/epxhsqhRSseEH5zd9RdPEKdDrJIWh4v
 lvHugIWDy7vEiHj8AhAc+xwVSEMOJJOHYNZ9iZ+hzMlLeRW6UMImtqP4HTM7dzdqvdiL5jBgJoX
 rQGqIcjzQujCZYj+sG7MVr60SzJ8giLsAa3fsfw0lQC4aa9mqLjn4HMr/qA9ajOZ0Ou00F7oKCv
 hQKlUc3JSmbiGltC19JCVvpvpea873tSIFkfT9pZIk/G+/4wiezfjec5NG18scBYXjxvbT07Asz
 td4vYHfGZwsPXsNaDJe7js/jYnaH46UkpgDxj+K7wQ35jn+LkjSrSBuW7hwMCcV2209UcAKC
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=6830af97 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=yKaScz8-J4BNzvBwqzMA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=881 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230159

On Fri, May 23, 2025 at 04:07:21PM +0530, Jyothi Kumar Seerapu wrote:
> Current GENI UART driver supports Max Baud rate up to 4 Mbps.
> Add support to increase maximum baud rate to 8 Mbps.
> 
> Signed-off-by: Jyothi Kumar Seerapu <quic_jseerapu@quicinc.com>
> ---
>  drivers/tty/serial/qcom_geni_serial.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
