Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D25113EFF3
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747616542; cv=none; b=rdI3YLIj5jhn11eFaTGPX6ZyBij4lyOZlL4LGDUrv8auGviTDkQqQ/7XVlqU1v4wPeLEAoZMOULnoiAwGbe9UvZszPBnapkERoUpQPEbkx2iDamzIA3eVvKQUhlhISX5/EU7D9mN97OUGyS/WwRK2ZlMkT8YZyJWoYwntRdDcNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747616542; c=relaxed/simple;
	bh=Zi/b53fJnnhA35zfupvbo2OGQXR1VbpOLSmcMW36y4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lWpM5WCt1zyN4Zhx1SxrsUJmwSFCAMs1aOwVMFYJCMNMckZjMA6iLxcfJ1WnbfnFfKRzEclGrNjftnnwyT+0pRi++pGK047LLr8W7uLAP8xRYzXXcvTWOYX4WWtmwGSlALTaeRmKtD9G8UnsDuJxZJV5rg2NBxmKJ29DRmIs5xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ctYcmrJv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ctYcmrJv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54IHwN3S031683
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8STRhgSicOn7j6XQwcVTZU7Y
	AVnVtOQI5907glRUH58=; b=ctYcmrJv9TFKbLahfFb6pG/57Y+XEF4KgOcCtgjQ
	eN68rz9yCh5qYim7QDWN4fsOAoi6p8QKNREIYbsQVjUnn0v/jqI8gT1nAKVtYE/+
	3rlsQpTi95yrgVhAb+tHfILZjwfKwbl9lGPucJwmuoPncbRZpa+NauvM+s6z5WqM
	A/ND0PGtCS3mzkr2i7o21LnB9zVedFBGUOt6SFpATKsBBbsk+102khI4iTLBMwTJ
	mtc/O/mAnBZj4jYf2NGoxszSN/xDlFYHcGPRmuEXyof3Dm5WJK6oKjRQCxVoR20d
	i5/3qlUDyn8dG/ClsGkZCyYOmObZoyzMWjaKmF9uVoB9ug==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyjpfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:02:19 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f6ea9b56c4so68763386d6.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 18:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747616538; x=1748221338;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8STRhgSicOn7j6XQwcVTZU7YAVnVtOQI5907glRUH58=;
        b=CRfZHCWQd76u1HW/icACWWcqN0700xDeub/p4XYxozox20G/gGcfMy71nO/ZJnKKCW
         VIgFa18hn4h+KZRU2rNS6iGhTuDoqO3DK7jGhLSU+DHXzeIa5cOV7WD4HqvhG9RoapgN
         a5YZ4HDH8eTBsYgnt1gjJFBpjZBMClSUjCFh2Zax4SqQmod7a2DUoO541/5SqQt2b+j/
         wFJHPTevreggmcl9ScQbsQl7kn812VBk5AmPdktTRSZhvTQg8usVAdyuFMZ9w/jic3E2
         Nwcb5fr3hH2F7bTuOCj/fLndM0v6PjA1rC9oJksGtPQgm5x02xsN9ocoBy1XPB5oTA72
         WkSg==
X-Forwarded-Encrypted: i=1; AJvYcCU2tcOSSLBt68le/b6G5KGG0qOmFqaNrmpqKGsvQP4nLjS+XcmwKpfTBgmkKdnO4w7qedUK5KMPW7LKqTs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcmeY45iNUfM0XCSxH1nDCQvZcpZHOuJ4vlQPxxlBMgJI/qV4v
	YPOY8OteZsVC/qkEiTBeLpvNJiKnOkcIEOtMzz2J0CQxbhfffygMQUeooNV5P9mxfPYXSM9gESl
	eU8DBR3zsoZri9z4AHhoYwXgAWKWFQ9Xa9LS2oFjHwIjvwG+7LGjilnNeQeyg0ejf2Bs=
X-Gm-Gg: ASbGncs2sDbUCPto2abXv8H0vRAUq6p47EJ+1Y9CEg+bA0Rx4CVaoo5zPC0h8QqJpZi
	0+HzG9OoswY9tWYV0z7Hh/IS+BUV+JyEj0XoJOBtzdjLFBNLwRgV5navjiaekdWh5AXcO0g6J5b
	S88aL2blmz37BNAr7cyDw9NKLgxaQD+Pduc0e7+tvZS93dac4cLWNKnPPllEE9xJaBSF7Ap5jdb
	kpqsL1yg0Xo3LIq17Sy/talMUmBAg97IilmcppQ0B/dqsh4FM0mWI7WhPYR9opHRKjwIApQPri1
	dVaS3cAWw9TUjW9KEeV+VH5uhPa4XDhDzUfrpcd5SDJCkf29xN4RvuXsXA8S8nffqT8k2EblSIw
	=
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6f8b2d4fa1dmr164141496d6.27.1747616538224;
        Sun, 18 May 2025 18:02:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSWo18mdSvwfxieffjfuvn66T/nACsrj+CCnE08zCXT0yroo0DlXEmo/fJG3GV1JDhV9D6gg==
X-Received: by 2002:ad4:5f8e:0:b0:6e6:5e15:d94f with SMTP id 6a1803df08f44-6f8b2d4fa1dmr164141186d6.27.1747616537857;
        Sun, 18 May 2025 18:02:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e70404desm1625222e87.252.2025.05.18.18.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 18:02:16 -0700 (PDT)
Date: Mon, 19 May 2025 04:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ayushi Makhija <amakhija@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        sean@poorly.run, marijn.suijten@somainline.org, andersson@kernel.org,
        robh@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
        konradybcio@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v7 2/2] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI
 to DP bridge nodes
Message-ID: <mlxlmh5zswt2n7jcmqvyvgiif5c2ch5gb6yq7ethh52aluo74t@ruxhcdvwhxbc>
References: <20250513102611.1456868-1-amakhija@qti.qualcomm.com>
 <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250513102611.1456868-3-amakhija@qti.qualcomm.com>
X-Proofpoint-GUID: QFEmwf36W3VN5_8YSjjI0VRZPDzHsSta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDAwNyBTYWx0ZWRfX/2GwSqQgX8oT
 /Jh6+me74KTYI/jpC1DnMNrgW9qCNXZHy9fw6IxSMMoseY+nplqpJ8gJ3tonxECaQKsMSECaes7
 7jvHhQCWgu3McrrnJpSn2xU5juChM66zYO2dMRMcpClAl+ocUvq6aTZNXPou6aKMSs7UUjpPENQ
 vJs237FseSUvDkHueFfHkOuCuvz6x/izcMWDNni+xzQPUsr673TfpKFTuhjBFdCqr1Kp76n1kOA
 gy4uibkZ79eVNUjcnrHYbqOZoaoq7fslWlBhjZu2hDTGKoAdDcF4r7zZeAgpioMINZzP8/C6x3Q
 LIfraK/e30KkWHvVZ1BfTtr/NL25qhf+jx/lcerdBIUIFGyZ4oQ1KGMh2mMK2ZGFdGtom8qILt1
 jk59Qasu8syDpBHeCi5DePCG4Kr4jXu3uqt4LHDw5ij11Ddz3vIjFP/0D8ZcruKWXclWvsqq
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682a831b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=STMA3DZVbMtk4X8eXj0A:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: QFEmwf36W3VN5_8YSjjI0VRZPDzHsSta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_12,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=770 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190007

On Tue, May 13, 2025 at 03:56:11PM +0530, Ayushi Makhija wrote:
> From: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Add anx7625 DSI to DP bridge device nodes.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 232 +++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
