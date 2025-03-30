Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CEF48F5B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743358303; cv=none; b=Yc9mC+/ed/XSTCfo8wDb2z5/jqvSk9psHX9IzPP/xHs86xlObhdA4RvkgyR3T2myuZSuQ3xuiLi9Atntz/4pSNGDeHKlQbA7TEmj/uOUhF0s1qwtsB95BpVE/T8sHOAWxuViL3HL2Fev6pEWpzg+GPH/wTnJ3G3TckIFxbFMDkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743358303; c=relaxed/simple;
	bh=20opEHAy31WH45doL9KVps+O6U4uPdyWdHEem1vjTXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MJ0UyGq9Hpt5LNUW0oh/R5rQ5s6UUIL5/1YrCqa4g2Rg9YmCIxtN8NP/LsKmNNgtPHpez2mzLTRcdo7dtGfY5sR+Z9JI2XdyC7W0JYp9hi0oCOa9Wbdgu5nNg7Ca+4d7t4UDVs2fS56JAOg+pn/MFvTHcsDUGDzuClJ6QYV4Hy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cdW1dZ5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdW1dZ5K"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UCoFnZ010565
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IHCLsgwndVdO8FLjUW7q+Y9fKZsm0ip45s3E7IUNxT4=; b=cdW1dZ5K6G4WJfKY
	g+biGwAiaa45bJa6blyuVjEiRog9cUpM65BRHaKfsxieDig4/oN278cIgx6gAJQS
	4PWyy3MINHTorcUFGcifur9ZkEkMTwDfHodlNF7JZJVnJNOYM60pzp6Wu2bpV8vd
	EZoK/mydvs4GIBvOG4XHJeyDq2f9JqxgV6XL3/TTCiQEL2SXWVKXyPYAcz///eZ+
	CpDx0gQdih0iFmuSyVINrl2kKKMr8orpY0cgcvDn3iOeNGCBX+P/OnnL7cDcy3qs
	YYrG+xoMiFmO7NohJlHJSLTi2BWF70XIsNT79lzJGYU1p7keSQkNhM2v0SGw2NWU
	Y+H3gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935tk7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:11:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c77aff55so914125185a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:11:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743358299; x=1743963099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHCLsgwndVdO8FLjUW7q+Y9fKZsm0ip45s3E7IUNxT4=;
        b=PP5N7XdL2XxFocBPr76N1ihpHLdrKN4Ds0I8A5R/nAJREPWLyunUZZ9t4eKgfrKbqV
         MgDHWK+VmSVfbvHVCw13BQm85b13EW8K4jjh0ToZmFCzvkF0NI0maVbwWMUwUv1Bz9oq
         wG7zwrXPSinNwox8SJFm4019FWHJDL4NbNbfw6T2Yxoeqsqr6N8BwGOV7cj4dNrJjpwn
         NPbdby1lnV4/aPjBPOCU8v8rAoCXLEyy1EWjGWzS3l6sdlnCxr25LQpDWIuMomqcypU+
         e6f2SdYrmyv4qVEXAemGwZuaVzERN3ewB+WHodFLlYyH6yMYBen5qJtgT1vmbManwM9S
         e76g==
X-Forwarded-Encrypted: i=1; AJvYcCXPXGeuFUA3bTkZBSnHokvSN41IJQLoNjGdnYv2kP+SIWpVx9Ob9WQlSov32xpj58NQdLQl0wVhvtflA1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMOY20kGsgEnSmxVAwJykAVp5K7m82NfWKnAkZs+WwhR3Odrve
	Zac5bk+OHcn/szZ0xaknlqi3m56F8CpYdfLIkNB5JrJxicPsqaNUTp9vjiaCDIU6uraqWIDqk9i
	kIHnaX3EtA1aUmb2TbtwcKUEeDmrn0i062O17VkPQLNhR8tt1Ts4h51uS/Spqgac=
X-Gm-Gg: ASbGncvN6m+XDh3UjU74DKraUXRNlIQNmrDQVihto3K06BDXATnqsJ6YLiSVxGlVdkO
	za6NtioB8VFsTtrEMM2scn5cZ/N2ZR2JH1YIi29o8vUPUfB90LFUyRQe3RK+lHeQWrSPuvApf1x
	eKyLSKAFcfFKrJXGpnFqsUeUc6Phc+7SVa14+VNQ1oGVc2eiJ+A6L6vmgPCkhMCKmzWUJrQZmpi
	CJhrjbI3aTMFmvMGXIZ7WCb+VhCDwQwcMyT8i9t1On0/7p1OnRmvbUQZlKCkfb/aXZb3ufuJCqT
	Sp7NJLQ3cV1O4q6Qf8WFRShHIzAkV8jAzRXN0oUvlzwWazev/fcyZTeee6wRpPczgPU=
X-Received: by 2002:a05:620a:240d:b0:7c5:47c6:b888 with SMTP id af79cd13be357-7c690875554mr1077466685a.40.1743358299214;
        Sun, 30 Mar 2025 11:11:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCxKgPTocdwQ0XAErOu8+9sjdwXmOoRIq6BagPPCMyfRgTINzYG2F09NWNBN2nPg7Q11HjYA==
X-Received: by 2002:a05:620a:240d:b0:7c5:47c6:b888 with SMTP id af79cd13be357-7c690875554mr1077461685a.40.1743358298784;
        Sun, 30 Mar 2025 11:11:38 -0700 (PDT)
Received: from eriador.lan (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa9c56sm11478831fa.4.2025.03.30.11.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:11:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, megi@xff.cz, javierm@redhat.com,
        Tejas Vipin <tejasvipin76@gmail.com>
Cc: quic_jesszhan@quicinc.com, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: himax-hx8394: transition to mipi_dsi wrapped functions
Date: Sun, 30 Mar 2025 21:11:30 +0300
Message-ID: <174335828698.2569365.403291486244545977.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250325094707.961349-1-tejasvipin76@gmail.com>
References: <20250325094707.961349-1-tejasvipin76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zQLpwPe4i345mICE1pAQ7svfoXc6bfvU
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67e9895c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=XaNsSy3_rJ97ry3LfhwA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: zQLpwPe4i345mICE1pAQ7svfoXc6bfvU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=971 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300127

On Tue, 25 Mar 2025 15:17:07 +0530, Tejas Vipin wrote:
> Changes the himax-hx8394 panel to use multi style functions for
> improved error handling.
> 
> 

Applied to drm-misc-next, thanks!

[1/1] drm/panel: himax-hx8394: transition to mipi_dsi wrapped functions
      commit: 4658f363fe67065d968bb9f6cbf611523846f27c

Best regards,
-- 
With best wishes
Dmitry

