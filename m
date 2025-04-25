Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189DC218EBD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745607018; cv=none; b=Nqmf+dHPXWPGtyniVcD+iYalJ1ryhn16LlnRfSJOdHCqjmiCWwmn3wTFL1AB50XYMnfnrnQGm9+Y5WQK6qpfltL+mj0sj/v9LMr8g5N5Ts9S75FQ/OYbA+bkq1Zxzz7FHGAz/kDzp2CmTWHSBLeVYh2gICw13XXuHYVcNA1dqTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745607018; c=relaxed/simple;
	bh=ZHIaZASxMUQuBW0iW22VDvjKTjRkFFMiAO3zdbIVRpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKNOTVUsf/0OQaLadyE6+W4pI0S5aFRg7tCIT+YtmGe0H/sdZNIu3mxtqp+sFzntbCJE+hxDy0fKzRf5qPjkfnuOLcwtOlhsCK/lsOaXkkdkg2BR9SKLiHffMhuCt7lFDqw7r6UZPv0EwVt8VNQ29iigTPbzSxUKFNKEktYLXIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=feEe+xp7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="feEe+xp7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGKdlF009754
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s8izVC8iekKJRn/bWtzHXEEE
	+VzixKRL8kJzvIoZjBI=; b=feEe+xp7EdlvGuWAtYa7sLIEXSmu6CPK7hjpaRWh
	ab8zrin5+FbqPXkrdRHlmb4gFnL3skeoYeCvK5pmBEhlnPpuVtVQuS+C62byJErV
	gAbX6i69/jxLn4td1E/rbL+u6t7hSI6z60W2BqTsdBKsjAZ/MjZWWfw/8RBUWBjO
	oAmzjFNQlwGHYe8Zyxexh4Cy0lrKZeBZAQJmt/XAwmg0BPL3WzPUIa7ImrRLPblK
	nMFs+TfCrLcAGkfOEQ5xy8jnP10Qnujnluv8Ypat9I2akotX1/+C8PJQaWxxcLog
	Fkjg3y4A9ZkSyn+HbQOMgWjUrPP4Vqe08sf8/oIjA9kSsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2j37u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 18:50:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c09f73873fso360111285a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745607015; x=1746211815;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8izVC8iekKJRn/bWtzHXEEE+VzixKRL8kJzvIoZjBI=;
        b=BEo78bCdfCDO7WPid1xJ37v+o8P73DDTN1q2+cTbpTy0QH05HK6YDAg7GRL3URLpXT
         f1+zhDLdrjSCK9RiUj7gSkAOMX7ktCKMT3uuhRiF43Ti3w134nLBrFU05CwKc9ov76uU
         f64BhtTgnufwRk0zOG7IfrMETx1SLb4rs1YhWtVG9VQog83yU5RWpnGwm6ZQBh7CqGlS
         Vpofs36al6iB+vLHAUug11ZqnvNyOia1O4IjHpNx8BeXO0H8be31VxOqIpAJhtjTCwWi
         +HiNAFryPLHo07rtqL0OkR7pQnNkQTiayhPoVEoXHINdGm41sAusAJS+0avleK/Xbhz6
         ve7g==
X-Forwarded-Encrypted: i=1; AJvYcCW7jnTdvv0A0OFBGDXNzVPdPMQEuzbWMchDKDvO5GunHJU/MvZGTyvtv5+DHfPI3GWG00JEj1BYywWHuy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMfiSDar3Wisrt6OdbXpLf0VpBZwgJemZY7213zkCIK1H/wISh
	AeRI0Ezd1l/e8ryHb8KrtbxWCNQIWGnAbceAFgutP7WhoBAvg2xUbMgE40RMPFCer+ZzkeuG47v
	73QNa0+rf9J2P7OWW8OrUGFGbGdmNO3QctsdmGslF9IMrbxO6lgpCq4oiIpSuL8Q=
X-Gm-Gg: ASbGncs6ohYRUcN4MJpSDzfsP46006HcPdLwN4MnusBgYlQ0TDlCNzLgPZeQkkcCAYP
	6+RnCdKLoOyaUxpTVuAtvJJpzryOPfhcuSRMosMvLrXLtFdR2nkRl6R9hJEOZS03rIb3ZD/zNT1
	BPOfX4Tq6wmm6VcwqIvzCqLenO5WPW9XSN6GiJ7g7s+WrmBUh91+FqLxeUw+JkszwvjJjzeaelC
	E3CcfBzPj6SmSDJ9d2R2SqFUk+SoGMN0SJPTFeeCo9mXlcWP/t6TvIEur+nhhwttpuWWMgrDxb1
	DJjvjEqZ+vC3yWfcgYYSlkU2zEx8Z6V6UkAGHZm1pr73D2EiO7AP8hkPzOTRHvpnJ2cRhmGSiok
	=
X-Received: by 2002:a05:620a:414f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c9619919c9mr458856385a.21.1745607015146;
        Fri, 25 Apr 2025 11:50:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhR1NZLY7BGC5Mfvlo+SU9zIgsaWaKu0tufB1sLU7y11Gxi8SqjznxAoySupZ+VO50OAzzvw==
X-Received: by 2002:a05:620a:414f:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c9619919c9mr458851885a.21.1745607014703;
        Fri, 25 Apr 2025 11:50:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1c9007asm8488531fa.110.2025.04.25.11.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 11:50:14 -0700 (PDT)
Date: Fri, 25 Apr 2025 21:50:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 08/11] arm64: dts: qcom: sdm845*: Use q6asm defines for
 reg
Message-ID: <cgb4aiwqjxmrcdgcrujk5nbt3sebh3ekjudgcchlmbye6pqtco@nyf6ulfnvnwi>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
 <20250425-q6asmdai-defines-v1-8-28308e2ce7d4@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425-q6asmdai-defines-v1-8-28308e2ce7d4@fairphone.com>
X-Proofpoint-GUID: UTP0VkvGrZgrLgoyqkQGxe90QkEBBpJE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEzMyBTYWx0ZWRfX2UupXTJ9HLFE FfYQdkxOiPDkKxpE5Z0DK2wQW4uXielTkqnAmrDr5Pt1iOHpqgco4ZsnVeOtLzkvFXf+FTjDgK4 8JpOch67smzSIh3bNtCqC0HTiiGjnBo2RVvsRntBy7MgW4LutQhRzz+IR86JQBaZAYzemV5Q+7/
 QWZffgneIuwIusqBerPVY83OpvQSYOzYpXxo5I2ffptvK6skAFP7sqnG0tDbksxd9/CXh88Euc+ X+wgxtxpgaBNWEpi4grvGxaknkTkJcJf6RSvN8fnYdfaxJF4AlrCOGvXSXflBjx+P2B+yE458AY dRL3SkBp6MzjU9DWSY+aCsW5yuih3d7BGamQFOy/UxnGIX8jkvp5zYexBGsqa6r5NvGE2e+6p2N
 QGpAM4qbg0KeQmrK4nyHXfiYkJz5UfnA59u3WGa+eu6rtpsMQm1XOXbV5kHe76iR3+Z9neyz
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bd968 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=0uHdMyS-I8ESt-gxu3MA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: UTP0VkvGrZgrLgoyqkQGxe90QkEBBpJE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=571 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250133

On Fri, Apr 25, 2025 at 01:53:47PM +0200, Luca Weiss wrote:
> Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
> readable. No functional change intended.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts                   |  8 ++++----
>  arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi          | 12 ++++++------
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  6 +++---
>  arch/arm64/boot/dts/qcom/sdm845-xiaomi-polaris.dts           |  6 +++---
>  4 files changed, 16 insertions(+), 16 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
