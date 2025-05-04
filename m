Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB51F3FC0
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 16:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375238; cv=none; b=EBahccduC5EvQMg+0qLAUvMahWtOZ4qWF1yHeXUh7hTKX3hcgcRzcezWVfcEW9tjZw87y4fl94VYBpmjmmn7ShVANANLGm12AUmljpp/IJ2xZgZeR8x0PEi6xv84tefpuySX/pnOnZfmwg4TSVsFHwhMxNRTwU6ThYn9YRhOp/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375238; c=relaxed/simple;
	bh=LiiIOXZeFcrFR5Wr0strWiFYZsNp/GL21CWg7UxWNPg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L4WOTXGBBINVCJpVAv6uJs6n//q1F3JEvazwdXslA7n735ErW418DNf2a/L9rHUUE0I9zQjunHWVRBau2MMix46E+hwy9BC0QPw71W2jXH4pNQvZTNGexM4s3dd6UWC8RSKgL/wLpXwR9RNS2/ET3RDgezCSByT/hv19uTmZc0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N6XVvHgG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N6XVvHgG"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544DPAc3029374
	for <linux-kernel@vger.kernel.org>; Sun, 4 May 2025 16:13:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=; b=N6XVvHgGqVq3Z7nF
	Dp/qgyhEEixJjIPcyfF/FVcF3tF8iAb0lPBL4wN7eUcHf/9BPKZmPls3EXW7Ow8+
	DmXSjGiJXrvY8HkXyCLb4uXat8Jqaf88jwMilaK7aKcT/qH583+aO4h5U9h/R2Ra
	Drb0QYDMSb4YjcrUn93uJLVkpE8RoiEc3ow7FMXxFPkPeBckF2VmDi+V85hvuyiO
	fhqs4fRsyrVjmnCPB2GlLA8HnKzqAhFN3ZjfnhDeeI0G2Gl/WrgJ+EbgJ9uxoJh1
	r5Ys0wic3+ERFACI7yTsdSPwaUfOztpsF9r8KQRf7iehupnxHC5CaFLSp9o59ELu
	zARDPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dcakj343-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 16:13:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4853364ad97so46945621cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 09:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375234; x=1746980034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpRdgnHDvP7D1x0JNflI0yCjzYKAnzgn37H44xlpJs4=;
        b=oVlGugU327AML2Ze5VZHu5QF5KvWuXI7lJYMlbCxQax6+p6GD4qmC6MTLdKGXquxxY
         mZU/Afz43y1TiivxuBLrwtf5So+1S7kJmB78c4C5cE112uWIgVMBbfqDEPEuu4oLutKF
         D8eHcEMIpC+UBVS9FERVuaqs165QbCHGo0X1SV6pbSUlFOKw7bh9U+5wOu5SXlbPQOdK
         oRedm9vqobwdwsQXh7n9RVn5CiZQ+1a6jLBEeFnVUUw+TE34ACEKln56/RKI0EB8tPov
         yDLt817qbZUUhcXGShTzASiNYx4e8atBgqZNVS8+IomuLu0zg8zCnkskwiXzUZkAPOmI
         ACaA==
X-Forwarded-Encrypted: i=1; AJvYcCUdCyoDD4RCWKb2vZVwX/VkQwezrQxBSBcd5dx5pOuCDEk6dBS1z/KzGqp579IWFLQN52mohgpG89ncnqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDiEVIMLSOf6QP0IytLf/oQYiovJSizypKgaK4Mqk3p8Phnhna
	5RWdcax6kaQV8cmNxqBTxrlO/pb7VhvCreeIktg29PLdOKMrfycXCbMQ4fM0wCSXSRhDXQyjt38
	8diGb0SyE55y78LVueZ5R8PsMR2KXc7OOLdJ6PEExgKvJNuQ4282Vng2Mwk+z/rA=
X-Gm-Gg: ASbGnctN/w8ksnZHOgSYltEje3F8dc64IDRFNLrxWRt+6A1POcAqVQyKAKsSx5+PQXt
	pqTHe4JJ65j4bq/j7yxRNmY1yCINSXw/2oIdioVg/6vBeFZJgszD2k44kekWAZZlPT+QZ7wUWH/
	xazygeEQtaw+l92xHRYK3sWzMLgkccAcmIKhcWDMtAH614gZOIp3Owh1p+MDxquYj2dGhG0Rk4q
	aIysgTi82/fP+QyL2Ums4Bn3wkpFk6KEuNEp6XPqhQVHsqXmH5QhXQThdpIixpyBc1wj4IOJndC
	srL5OALdQWGCq/r7oKJNYTpAuDRjQ2PpCc+FTxMc74wOrmf9YaPeyBM1vMMla93A3xiV507TXEJ
	FTQh1QqvLyumHsERwuUYqJoG0
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id d75a77b69052e-48e01552584mr75446021cf.50.1746375234625;
        Sun, 04 May 2025 09:13:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhEOxFwHYPaRivE5KuBUUSrIQdtLUQdGkwtMO2jrXIxKo/JL2oOjaGV22aEcp+VehZmah9tA==
X-Received: by 2002:ac8:7f0d:0:b0:476:a895:7e82 with SMTP id d75a77b69052e-48e01552584mr75445631cf.50.1746375234338;
        Sun, 04 May 2025 09:13:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robdclark@gmail.com, sean@poorly.run, konradybcio@kernel.org,
        quic_abhinavk@quicinc.com, lumag@kernel.org,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        Chen Ni <nichen@iscas.ac.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Convert comma to semicolon
Date: Sun,  4 May 2025 19:13:30 +0300
Message-Id: <174637445763.1385605.2171270817711925653.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250410025221.3358387-1-nichen@iscas.ac.cn>
References: <20250410025221.3358387-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX4fAyucT8FK5w
 daLNIYlbeS5foqr2Yn4Ti1gPJdC4y+Pgo/pVDMBRRGekosdZrMwlUTVdTvSjxMB8Llzq9jkEmsm
 3+ySwfa9zfrInZ7aaZRc0zTdnRP1+5VFFEcP6Q2OE445iUaFYXIMfR8U7Xyn+/Z9uBcXskIcm/8
 kni1ud8Py9rf15Q8CnsJ9keTriqY48aW9KIx7O/WfaPCgekQiHZLoIAsO0CNvEW3yihUs1zdbLZ
 q8yDnoR8imZp/w2ceYTCu0ESy8O0WvV8zVnJQVbSz57tAlw3ep3q2m1z45JaJZSQhDHekgQyOQv
 mI78zTL+th3comwuAHfPEk1AeUlnW+5UtBd6JPAa8tLJHA86VBAauCrPz4FlZgnPaMCZb4O79Sl
 OydILsX7TT5khKB4EMIKHH31HldEyWxAUtXaM9cY98utj87OFcZEz+bafXMwXLJ6G17NBCwE
X-Proofpoint-ORIG-GUID: 19e5HhldHADXIrLqhBkIMXBMo3CCMXCv
X-Authority-Analysis: v=2.4 cv=JtvxrN4C c=1 sm=1 tr=0 ts=68179243 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=sNhlO-HqowW9r6Pg40gA:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 19e5HhldHADXIrLqhBkIMXBMo3CCMXCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 mlxscore=0 suspectscore=0 mlxlogscore=798 clxscore=1015
 malwarescore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505040152


On Thu, 10 Apr 2025 10:52:21 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] drm/msm: Convert comma to semicolon
      https://gitlab.freedesktop.org/lumag/msm/-/commit/5db5401c2455

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
