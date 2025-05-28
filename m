Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B938284662
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:15:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434506; cv=none; b=adtNwlhZw2l4Bbar2aLf7hegI5VqngFpufbYva+1BMdo7tWhZbeHnZkTpehWP96iowbSyRdgqqV2L8kuerLupDGf49GzCMgGPtNTg3rI2yZcDo33FdAJxVCJnciuA16E44uZ4z6hSAAtbOVfNeQ3SfGkraNtKnNwE6tEffsYPLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434506; c=relaxed/simple;
	bh=B4Iy4GScb0lOZr3qXJcMXNhDcnRTr1zdGPMFxHZBWQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upp6NMW5550oK0Tv0HnscZDe6lmzuL2WDJmEpd1ZvtAffCSz4n7LaPyTyvqjhyAs+Y+ZdGw20udY/Ob3THOVCdIpdvbGU9Bb09GhDEMTglJNgjoGcEqcF39/Apnq/g7FZper3TyCa72FTBbdKoUps0zj2L4vIBhe8bzeaWonUcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oRMEPjVr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oRMEPjVr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S67SM7030924
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kxSJrMywr9s+d3mPmL3Y3rsQ2dFUTAUlZhEMbytmdA=; b=oRMEPjVrCnOedfZI
	FTk+db0FQ9H+q3FFA1mBrcPBn6D3TZRIfCH1pTDhGc+QbtgRpfmzmXD0gdbuRnTd
	f1552dHaTa2uGvEhaBVbSIzt8vdOUSrE2jP7PTGfKeTvP03JrU/YrIwReS25sJpe
	uH6jGH2oDJf6g9DX7TdRQY/FNnvr/1PZeD2FarsV51SCNJmAHV9yf5cUJohyLvH9
	R/c9ArwXCxfx/dId6ZQQ3qfFtdi7szGGKglAlCcMnFXB2MbrXTap2m+hXpuReYKU
	ZqhfwDXvX+QX0LZkrMYqyvfJy0YOwKg4ATPmzWwA7jYKeyBWV8dOohrlFVg+YT41
	5rF0Hw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46whuf2h3f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:15:04 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eeb5e86c5fso37001426d6.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 05:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748434502; x=1749039302;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3kxSJrMywr9s+d3mPmL3Y3rsQ2dFUTAUlZhEMbytmdA=;
        b=oBV2RvzgL7/0K+T5izx83of+MaVO8mifF6DjZEkt8wJN9hmPaMijP4ErYZ3fj9KmZp
         l1kWfQKrZiFcE25hXRLDMySt9CW+g/D1U/idBxs4kFSHmfuMClHLPu3eRSvWOsB1KXdG
         KyhF3OFdRlJe7MV/dsnpuuK3SoWxlMlK3CWTZXVK1z1fg5CSgThiZRNQrujplyq5NjQX
         4KcmlIuvdAykt5iuGty3/iWmeUJocUmn7Wy/1pp+La9zJLK5hje4HPC+ew64SvaCKJqt
         eyO0NkEtAluRX/p7GQ6zhNqWiuMH7HcIduAzeO3N5e5+sABI6lwiH2YISfZMUJfH82Uy
         whfg==
X-Forwarded-Encrypted: i=1; AJvYcCXHzg7TKMo0sagQWB7KcL5VaBZhUGPQRLk7g9FS0Kr3cs2lZzKoLj9HPPwXGxmIx4daA3WOono1U1fHKn8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxuny0kMRFs5BXkOl4Il78jhZQrTQ4JTspxEn4qbhz8dDzIfKVk
	PJ4ynTGqULTSqsk9wuyA1eR2tCCdfVBP67WSGaL9I45GP5iTSlVyuX5bbQEImbmXoY8i4vcpfN2
	CtQzEH0f3GTmw3pmtMY6sknxagvmOpWnaYiTQLk5ppCR3/USPz8SPH65RCNe5sTrrpx3BgrpJSx
	4=
X-Gm-Gg: ASbGncvycjaZrZgQ0bkNeIE36ID93JXCkNFcpKwvFmaf+3t11mggHnQU+hgDt0K0GA5
	K5CDUoS0VqdpkdYdJ0A8j40E3qmDQT5sc/vxeR9BcdEpKFGWZLDXwPXGpoic56/VVLQLfiEwzaq
	v0VjcSSGurRKXCYLCwm5nLyG/HtW64cVD6xm2nR3r2svJ9BBSnAgTugthxcY2K68ww1DGbyGapd
	ZTwdwtD7fcgZ/mcp3kNr3axzC3zD+TODr/lSdKmel17BY6b8R36WVco7DaeROpv4ZqzLb1oRSEH
	iz7Up/1bkxNqGLhnpRIMTKVQxPMDpBGqXhMy8T3a5s2hyJp8zE7FbZ9feBTM/Hq7t58EgYdTMIo
	=
X-Received: by 2002:a05:6214:1805:b0:6fa:c0f8:4dff with SMTP id 6a1803df08f44-6fac0f84fb3mr19984766d6.37.1748434502649;
        Wed, 28 May 2025 05:15:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6Xjdm32wkahk/ntIryyXQ0dV0UAu8jmCUZQcY0SDaEWnx0pvAxtAjn4+fgoBP7skc2unmMQ==
X-Received: by 2002:a05:6214:1805:b0:6fa:c0f8:4dff with SMTP id 6a1803df08f44-6fac0f84fb3mr19984406d6.37.1748434502242;
        Wed, 28 May 2025 05:15:02 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3f02sm258525e87.236.2025.05.28.05.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:15:01 -0700 (PDT)
Date: Wed, 28 May 2025 15:14:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kornel =?utf-8?Q?Dul=C4=99ba?= <korneld@google.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] power: supply: qcom_battmgr: Report battery capacity
Message-ID: <q6zxkzuvczjuewapb5jrk6bnp3t6lsvu5mgqb7gpq7bbdsgprd@ozgvgbtapdjw>
References: <20250528112328.1640743-2-korneld@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250528112328.1640743-2-korneld@google.com>
X-Authority-Analysis: v=2.4 cv=OslPyz/t c=1 sm=1 tr=0 ts=6836fe48 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=zIzJRpkdUK6dvKgA1CAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: E_-C-YcUnHDxLJF7U-UrdROStkyOoiEw
X-Proofpoint-GUID: E_-C-YcUnHDxLJF7U-UrdROStkyOoiEw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwNiBTYWx0ZWRfXxaIz3O3t4fqu
 Wgq7pm7+T9ZJVEe+k6CwdexrUOdXgYqYM1DzeixVbqe/PPNrdZo0JYrahgiT4mJrQ1+cgut8RY7
 /olZvLiEILS2pSiJIU1AjR87LZqONbALJS1FOjAu2iuDlYXML1L4PWZy30E2iDw7ZPddFepw0U9
 A2B369ril7A/M8Q770cuVwBLlVyrDLBz+zps7gKPBUO596sHt5OPE4sxBsIzM8NARicJ8cU03Tv
 9nFlrXfC0JQqPAnj5s516OLqhDaFCOhqOAOHWOve/HRnSFTKX/+fzNDoMU9eJuDLZ/nNMgy0WYp
 b9x1EBJpFJE2onsk6G++jySvr+4G6oFrnEfJPTBZnVJ8x7HX4mw+5lr3wb52PrsQ05CDPdwmZ5i
 jYUClmG0mRsF0duCm6VW+0rQanGrSXjvYJ4PQTGT5VXVNwth7zvrsk5KZ5X6K72iC4pgkuIW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280106

On Wed, May 28, 2025 at 11:23:29AM +0000, Kornel Dulęba wrote:
> Battery charge can be reported in several different ways. One of them is
> is charge percentage referred to as POWER_SUPPLY_PROP_CAPACITY in the
> power supply API. Currently the driver reports the capacity in this way
> on SM8350, but not on the newer variants referred to as SC8280XP in the
> driver. Although this is not a bug in itself, not reporting the
> percentage can confuse some userspace consumers.
> Mimic what is done in the ACPI driver (drivers/acpi/battery.c) and
> calculate the percentage capacity by dividing the current charge value
> by the full charge.
> 
> Signed-off-by: Kornel Dulęba <korneld@google.com>
> ---
> v2: Change the logic to avoid u64 division, which is problematic on
>     32bit platforms.
> 
>  drivers/power/supply/qcom_battmgr.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
