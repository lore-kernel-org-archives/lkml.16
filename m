Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E581A27F73A
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747420444; cv=none; b=SeF4FnSQa/eXUehMvo2MUkMjVOW15aO74yVpb9yoxsxgBTABwhhXNaJqt9B3wHw9Ig5pEePyg+T8VHvw0yNFEK1DW9lmDo1qhkRcy3KbJaYwdlr/sy3MHv5YJuwg3pG/iSDaXxKdzuBGrGT8YIBN1gj5g2p69/K1np8d6cOqvOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747420444; c=relaxed/simple;
	bh=htZuv6pashv36afkkYS9hF3nExlSsrWAT5iKAXx/kUM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=O1JNcN+O7BcHG4yOzHI3K1q/p/ejDI9NOR6yZUr6T6FVIksn1Y1f2bU1VgATrp/UfekYccvHlKOiMMtW70g5sGQ+H8srdzOkEWroGKvYKJgV9AED36oyseL8BGzlBp3dhJUALvA0smctILJwQA7ShOKRw4ylOjM/VhknfI2DZqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JhcQeGgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JhcQeGgB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54GBQh0K014760
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0svL+8Yfeg+vJiix8AzKhUs8Lq4dqmn7QH+/xdemwo=; b=JhcQeGgBnVPwHm0K
	nqmnDYrEUMdwqOlosGD588McBjTdMLNQpL7Xz9am2PPVrJl2illbMknGVgZvV1xI
	INOhZtdhKHYxBGAxZJwrxfYBF5XgNCqMxR3bV2SAZ7nvZ/qKvwXDDgY7AtSLPj9F
	KZUKWJJrTY0p3MWQecMjiJ85qJHbhHyda1tOii/GbG4gtfdU2TYuQ3PniMvpvYB2
	zJTjsvS86Y21GgaWRNJLtmPsM2KI+Nc6s/vrjCn+6acZ8TrGe+6Da4qlsF1+5/ro
	ztg5pCnnIOqJd1sT+jUp1q/tzZZFcItcP5S+hZ08l9Y61ywUmL52odWU0fQTjf4Y
	iUqb2g==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcpk1c2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 18:34:01 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-30ab5d34fdbso2578566a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 11:34:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747420441; x=1748025241;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q0svL+8Yfeg+vJiix8AzKhUs8Lq4dqmn7QH+/xdemwo=;
        b=TwPc49svXPm13jFw8iAHjFAX89fFzyfqKXNFQpaYew+v0/Yr00UJ6YIlUWPBie/E5L
         X4JlyDsVdwCFkQ0BuDxIF3fyNT+yoZAiXe1cxxQ3NdjQ+HLSwBE0VPXiNacQohHC3LyJ
         6WoFmIZNzzLFsC5oYvK0X+v2smBFDL8CAYoUUrkPVAmaGQflZQPK9KEBukCTOcKMxKop
         jvDNoWJTdR+N9ZSEs1BJfSMcqUFFEvIWMoNg3YxYXnNSbd34bHwUQF0jgsflYD8ARs0m
         rcSpeKDCqQkeDibuRmG4Thl4Lwre4qjjbDVaXaIptNv3d1ZzDYPHjJMag/Qir1teYoBS
         waQA==
X-Forwarded-Encrypted: i=1; AJvYcCUFm/NZquE9AKnL2+p29WVNjaeNmCGSVMQmXp0oXwuNZ5xu85Znox+iX1+NaCIdGjzW5co4qby0E4bKCEg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSmq585lrhpBWeXAQyykz5pDMC0ywjYEJBXcMB2JHhgAWFEYhx
	nip1b8sW07s7+BmzJHATIPIJh/R5dPtyvCZerAhJcMy4Pjjhat5872ONXI2DQxa0aA0UIp5oC5v
	4FB6b9ccNqbDkXGYHEn/A6Es/+iFBnVwuZtSE5NMzJNrd/knPPN1CNXmRLn5CfEcXDxU=
X-Gm-Gg: ASbGncszp+ojBTiJ0d08mMn3wslzSPaNlE8Shqkt5gvvSMO+uE7YFgwcimFEnLGg0Mv
	Mg6mFqIX0yXNp+pMb2xjFJLEnmuy4lt44mG2maKcJWH+4w0Ic7hjubavmZOwYzWJoKBS0tJE7iq
	vkjjE0lSc+dGG0W6BlPwXg5BtZPkJpaoiIOxYCKM0fctPP7PUoyRTcxhBpj9qB+V8Ky+Nl+jKdy
	X5hd71wsTF8NAeXr/dhGhjCRG7009xXxmvI3YpJIPWzEE2hloOc++7Tox0Xutfz3ZlMqcxr5iuf
	KBWePV1KLnLa7ioVdyd5wLilQjcVDLmdd+HOA8od5kQu67cG
X-Received: by 2002:a17:90b:33c2:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30e7d548c90mr6850103a91.15.1747420441005;
        Fri, 16 May 2025 11:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDN0c6qarJQvD++Jh93GB0pXnmRuirKipjsMNV6jsu1UQrfj/SFWZkZbDZFNWhmtdcINcZQA==
X-Received: by 2002:a17:90b:33c2:b0:2ee:edae:780 with SMTP id 98e67ed59e1d1-30e7d548c90mr6850072a91.15.1747420440579;
        Fri, 16 May 2025 11:34:00 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e7d576babsm1886299a91.33.2025.05.16.11.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 11:33:59 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: quic_bqiang@quicinc.com, Jeff Johnson <jjohnson@kernel.org>,
        Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: kernel@collabora.com, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250428080242.466901-1-usama.anjum@collabora.com>
References: <20250428080242.466901-1-usama.anjum@collabora.com>
Subject: Re: [PATCH v5] wifi: ath11k: Fix memory reuse logic
Message-Id: <174742043941.3092151.9479454399125527127.b4-ty@oss.qualcomm.com>
Date: Fri, 16 May 2025 11:33:59 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: F3TCqpCZg73PS7WuU4g3qN-8z7X5-9sk
X-Proofpoint-ORIG-GUID: F3TCqpCZg73PS7WuU4g3qN-8z7X5-9sk
X-Authority-Analysis: v=2.4 cv=cO7gskeN c=1 sm=1 tr=0 ts=6827851a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=fqv9DNJugNdUxR9BDUUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDE4MiBTYWx0ZWRfXxuyTh/Z1HuVN
 9GDVBZdDl5oANVBnw7rtOjs4ng680HrgrU96jigFv6IwHzxgmEpQuhXXpmxU5NoLv6iwAuXaWdG
 GlJaEBLCrwOO+TcFJnNbluG3XByvA2GzNdCAIb7Mfcr9iZaClo18Ioh+ShpBSGQuDEPSoj1LOaO
 0RLaKbjZ10ReUs4FAJuFKnQoQKgJ/IlmHblq74nF00Jyh3CQX5SBILR5mdr/1xPxnInKeknQobf
 xlU7/sImWhT1AmIt2NPvd6sCW0FupwJF+/RgpjuCgc51j3VX7Kng947UFJ+rJL27bh9ufxYGo2a
 Tz3nGnwaaso+SI4bpE1AOwnq7GSrtGRFysOMipO8fdVtWC3jMjMx0O8aCAEfzRXX6TjVagqjH6t
 oLngWNfySv3VQbhtE3qOEAjcZFSw7eU4m0i+LwPQDHE6FE2iTT1eD9qE8sOI4RvtQA5p4oLO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-16_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160182


On Mon, 28 Apr 2025 13:02:41 +0500, Muhammad Usama Anjum wrote:
> Firmware requests 2 segments at first. The first segment is of 6799360
> whose allocation fails due to dma remapping not available. The success
> is returned to firmware. Then firmware asks for 22 smaller segments
> instead of 2 big ones. Those get allocated successfully. At suspend/
> hibernation time, these segments aren't freed as they will be reused
> by firmware after resuming.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: Fix memory reuse logic
      commit: cd2e7bae92bd7e65063ab8d04721d2b711ba4cbe

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

