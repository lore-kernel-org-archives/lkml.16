Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEA0214A8F
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743457624; cv=none; b=cLLzEaGKyQrJi4Pv4NmFh7ses12lwj3uVOwBUDkLw5iZtu3WCx6DC7vtJCCpBt3DW2J+PpfJucogpVaEFXLVGDu89Yn/yr8X530k2ZTkE6GX+Jn0cLLcMhhGgqq2AoKnYWc+iIBhg4MV/Xta8E1RdHdjTk/+cHsd3dfNidYPldU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743457624; c=relaxed/simple;
	bh=0W8Yhf56VLA+zLbZceUmvUaPvdsvvqd7uiFVijCU4ho=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rN8JIEUped7DsiCzkGj1kf0CGEzbtkikHKlwf6AgNLMGQGdG5BE++xlr1QJAoSDvA/t5V7Na3YgOuhkMVFdqKbQT6soTM/YN73HCKoUTV01D7IBJK5VBDJlpjkR0pSXx9JM6Uxs0kPtLkrxXKENK45qtnwW5RBWBUzh396n7elE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GXeqDmld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXeqDmld"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFCuqV026705
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NS2zcXptxcgcU0tPvmrUCO30qFIX1zPhS7qEmUqi3zU=; b=GXeqDmldmketFn1n
	5ygpr8H2o8Lt2ywjHkHaf4PWtDpwiIavmK31LWe9vNRtgKJF7i5k1BamQb+L7CtW
	F17QVAxNjHNJYwaCRYRxwcXBJB5vZhqgyAMYqry7xpGTcBQruPCXNLtl3KJOX+ci
	ddKbaX+fUnUnLOdGYR5hZow7t6n8lsmFXKPT8saDkC4oE7Ls1ExXlgswTVCeWguQ
	WfuXVMmHaVO0S5rV3ENbtL07FMzc3XXEI5lzEmqRDReh6lieNhxt8Iu0ucAIbdz6
	Jn6sg+ySihX30vBNtRK+jGlOY6Lf5sTYfERIHH+WTRRts97rXrzqxnFlk1xsuMKa
	c1OO9g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7v8dsty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 21:47:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-225974c6272so75779025ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 14:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743457619; x=1744062419;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NS2zcXptxcgcU0tPvmrUCO30qFIX1zPhS7qEmUqi3zU=;
        b=WLQqeSnYddxABWg0z+IxzSqgXuoTkDhRiAHHgaTgPYMCFMKcxlIIXqos0fC/y/eFVY
         j3oAy2YQ2jAkONAow99Q5sduk4d56NXGXVYWKU/eqmaG3eczgYPwPKmtrN/YeY1VlHx5
         bleVYU/cW4hpFtgGS35gD/Q4NIMcIawl+RnrS1lJ0nCn5jpQDYFUw97FYzHc/ofvAjBB
         prhxxqYoEUz9PV1jIIzayUkVollQb3N0S8FB+kwJaP0GamgQtO2V0dYr0D0C5S8mkZvh
         V4nkv3wQnlhOtQyMHizgGa3duDWlPaledAsKWH955odxC9AVJxNC1RTGgfQCpTMBZhN8
         MVGg==
X-Forwarded-Encrypted: i=1; AJvYcCXzcnDVYSbJSnBVG2h0NOtUmPvdvtbQszvA3cMZDNJ9zJ/W47uwgmP7vS4bt77o9HUQjYIeXs8b/aqoRw4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAfjkV3p+NMfDl5vf4mND+zwTO4cfmIt7/jgoyv4B60qNpszpP
	whVCwKgzoKu4uHKkNTW//EFN4N1p5h8hWAx1Qkl0msCh9vBhFvQK5f3YVODRfvSCn0I2mxboh8t
	rVAE7xqINJIko4Gd2pHcqcMb1dTzyg04mbrurQsXFzDNWxIePJo5/Z/ab4w8b7bmdh+sRLR8=
X-Gm-Gg: ASbGncuhKFUt1kH7qq/yLA99c+I7JiGCJnH6764n8ES+oHcn6vcogOgQwJsO/47uKPy
	Gprmk0fqvS5g3hPgA3+vFojv+zrVBlhhO5//yQFUPVTI0FuNRlovsckFdfVur5C6hyHYtC8BY9D
	ei2lJyWIhwjMAVfxscbg309d8uWI3skLWlIwq9QM4QoZx9mI6ejMf/JxUk9F+6kGurOudHIYTKw
	aUT2Wkq8i3uKOYA3rehI7Db13gsTk+ciFbZNrHd9gfcrmoJkpKw3LpXiPIWBYLICR22SdzfmK+x
	dQN6DigE4US91h1odYGkcdimH9e25Jx88rPSKa6Y5ZuTNxQxQees
X-Received: by 2002:a17:903:98b:b0:224:7a4:b31 with SMTP id d9443c01a7336-2292ee06c99mr163911585ad.6.1743457619539;
        Mon, 31 Mar 2025 14:46:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtOEsVjvWiGJctpJPUZiJwd6njJX7AeXk869duUJ/FtkKLtpSuBHJ8GhZpYHgaGaLnzk8gTg==
X-Received: by 2002:a17:903:98b:b0:224:7a4:b31 with SMTP id d9443c01a7336-2292ee06c99mr163911265ad.6.1743457618981;
        Mon, 31 Mar 2025 14:46:58 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1f7dcdsm74092055ad.216.2025.03.31.14.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 14:46:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Takashi Iwai <tiwai@suse.de>
In-Reply-To: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
References: <20250328-ath11k-bring-hibernation-back-v3-0-23405ae23431@quicinc.com>
Subject: Re: [PATCH ath-next v3 0/6] wifi: ath11k: bring hibernation
 support back
Message-Id: <174345761819.1161294.6011866628558951179.b4-ty@oss.qualcomm.com>
Date: Mon, 31 Mar 2025 14:46:58 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: IBJyRN6WJPEIgkKviWbZOhS-bxhAG12H
X-Authority-Analysis: v=2.4 cv=fdaty1QF c=1 sm=1 tr=0 ts=67eb0d55 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=EgwDjV4hzmH0pz7qutYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: IBJyRN6WJPEIgkKviWbZOhS-bxhAG12H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_10,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=826 clxscore=1015 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310149


On Fri, 28 Mar 2025 13:32:23 +0800, Baochen Qiang wrote:
> To handle the Lenovo unexpected wakeup issue [1], previously we revert
> commit 166a490f59ac ("wifi: ath11k: support hibernation"). However we
> need to bring it back, of course with additional changes such that Lenovo
> machines would not break.
> 
> For suspend (S3), as those machines work well in WoWLAN mode, the thought
> here is that we put WLAN target into WoWLAN mode on those machines while
> into non-WoWLAN mode (which is done in the reverted commit) on other
> machines. This requires us to identify Lenovo machines from others. For
> that purpose, read machine info from DMI interface, match it against all
> known affected machines. If there is a match, choose WoWLAN suspend mode,
> else choose non-WoWLAN mode. This is done in patches [1 - 4/6]
> 
> [...]

Applied, thanks!

[1/6] wifi: ath11k: determine PM policy based on machine model
      commit: ce8669a27016354dfa8bf3c954255cb9f3583bae
[2/6] wifi: ath11k: introduce ath11k_core_continue_suspend_resume()
      commit: 3d2ce6ad9126b96a721542c6299a2f0967b5a63f
[3/6] wifi: ath11k: refactor ath11k_core_suspend/_resume()
      commit: 662cc5b92c327e94587a959d7ed75862eda4b059
[4/6] wifi: ath11k: support non-WoWLAN mode suspend as well
      commit: 88fd03cf51a7d67dac976ecce079ccfc79376966
[5/6] wifi: ath11k: choose default PM policy for hibernation
      commit: 32d93b51bc7e2e557771abe4a88da69c609e3d52
[6/6] Reapply "wifi: ath11k: restore country code during resume"
      commit: 3b199a58cc585f423a85af2e57045c9a783361bb

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>

