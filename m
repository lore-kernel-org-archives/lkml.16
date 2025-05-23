Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F3D1E5210
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748033931; cv=none; b=XDC/UYDcNwFVE7e5PzBYhhzHj/6LVwkHzfjDecoqUmCMzn+txoNklhXronpbUVXpq4hhXQMuX0LnCB2cETxC0495mK7FBHeNn8cg8RPUUqhn6okF5p/ZerKsbL9SwEtfFO20dFVsB+pFSfNAooie91glYUF4MRI98zrx2rGsloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748033931; c=relaxed/simple;
	bh=KhchUkMXopiVYtuMhs7NfRJ6TsT9EjgduXabu6HMif4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=teVwr76yIDn2xAUbUrdo4Z21yp2TpJI+IAThdJ8UZSDiLvQUj3MF7Z0WyBXmbFeEIj1UCkfw7HIAO0oAnlpauennNlunH99JvJIBXpyQVeFdmkZl9IyVMdciMZvSiBqufqCBrudvEt5tAHw/NxTFprVWTpHolVepbx+VtF626kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tj1TlwU2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tj1TlwU2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NFSln8028753
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PG1nY6nmcmywooCS6OocVe2p4hgyCLtuWCSLyVZc7A=; b=Tj1TlwU2bFMG6bHf
	rpuggWVXicBpRSLbksa4y2VTQm47ycIIPhR0LDameUs6eolBcMen8eujuejpsfKl
	g7uUlp+/VI0HM8xvYqKlGEZamE7/TMFxBBSsd+3tj3FjCuKuL/1gCzRj9aSe9Ga7
	Eu5mFLbnvMIYRoEAHZ4tQI/rAbeeor3Sx+/qOC4iIvi9TGHXWo5az2ESxC3G2lf1
	OpRZ+ITtkTSfYUsNvXsBrbQoEmyf6NK4JygYTtmC1HZbzES93YQ1TAANgc0awpBJ
	pI2kJAe+LP6CVVgj1EacVt2AawJLHkC44zMfT7yFiq6/RP/pMVSHnUG4RBjGD/dP
	9V+Djg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c29txy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 20:58:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8b2d2fef5so4401946d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748033923; x=1748638723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PG1nY6nmcmywooCS6OocVe2p4hgyCLtuWCSLyVZc7A=;
        b=nrOfhh8SZp84cOqi6ICbd4uRgIRAaXXJiQpUCHPhIlcG183nssyZde3TI5hCW4uSSy
         tHL8V2d4bvOmWhUAK+HFsb+lXURe445MdsscVj9ywx//HbCvUuEnBT8O/LxvSUr9q+5m
         CwpobNiO5z5VxQuGb0jgb/+2ilWtioMGevwjkUeKsjZiu/vrKWuAIotiKy1oMwvmzSmA
         pn8MtVaZvxpOYmC3Kh6g8/ftiEzAJkdhLLX1OHbzrGEbLjC21upzd6u8n3PsoXG8LTJd
         toBYYE7/qeaaQu19M1YV/+LGfpM4sEf6pI3w9AMuvDygjZXy7iR+1eOhW8L4bcSIc3Pa
         FLSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo0SI/W1ec01xQRW6uPP30dcaptXYEhMRTHZ4vPRlmm11uDj9Sz5wxmQFI2FESSKuDmgCC2MUVtQ4QF8w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJhAzSIJj1b3R10lFVu/8FODuTWZ8hpA+rMX3cOnNKUbCGUX/i
	cD5Z2Q0AeRwnWvLfN+x79lS7MCvddWc2Sur1siy01mMX9iW6K7MUbp3QWs+dx+wyILLHFCDOcw9
	DQMhRx1v6RCpPrq11R7Zv9yW9dvR7BqaLI7UjMcpRNNQGtjNhxAEBTl75hg9NqA6PQMk=
X-Gm-Gg: ASbGnct7+LNTucUy7eskpQPDaHiN46WYeBwUnOwf4aYPmhjCme4EtWz9S5q7qBopDDD
	/wGWovpoNpXxNsj7vYlMqi8HhEXgEtWnhtTI7ipICa/NCJmCka1JAJD33q8V2p79VCHtYsBCDOG
	hCagOafAPNR2sQO6orB846MiqqsoQSPVU72MwRrfYPp2XJ6L28YOYu9tbdv6xtbvSGvBw7Nb2D6
	QJY2epTNCIHobQT0sYIlSAMmQLD6hJXgjn2B+ZOZhoVBTcIUSWRbQgpoURNczhZgls9rDGwU1qc
	mE+OFT4qkvO9C+rYanT0ngBYyjRnyH6DuzBAEYYfnffos6q4tseo6tIlx0Zj3D97cdaiU08RY72
	mO8TKTsfPCopv8YBh5QfWDLN1
X-Received: by 2002:a05:6214:21c4:b0:6f8:9b78:1bf6 with SMTP id 6a1803df08f44-6fa9d142a39mr13406706d6.18.1748033923559;
        Fri, 23 May 2025 13:58:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpPJU3Dz3JV1lZv8KpLRwysM3EM8AjoGOJPp7HAfxm+IuiaTq9yBMCZWfKIiYqCOklhONbLA==
X-Received: by 2002:a05:6214:21c4:b0:6f8:9b78:1bf6 with SMTP id 6a1803df08f44-6fa9d142a39mr13406316d6.18.1748033923215;
        Fri, 23 May 2025 13:58:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f859sm4039146e87.242.2025.05.23.13.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 13:58:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Jessica Zhang <quic_jesszhan@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Jakob Hauser <jahau@rocketmail.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Hironori KIKUCHI <kikuchan98@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
Date: Fri, 23 May 2025 23:58:41 +0300
Message-Id: <174803391440.3670773.17140482624435282913.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250523121127.2269693-1-arnd@kernel.org>
References: <20250523121127.2269693-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE5MiBTYWx0ZWRfXyXu4R3VJ7hZY
 yeDbX7oQ/ktdJrF+8/yos/Q41hkuNnbPH8X8WCgflgs0GhR2nlTlxNiTdvhLW7HfYzvSyBVaWsG
 eRp66ug++Fe7AwxmyzixdtyvvtSh0W6k+58FBfn7+tjAFg3mmBsGrm27ftjhxk+qSb1+kDJFqoj
 VK+JOodyjCrNo9mJ1dhiE903CSgCXHGkDJjLuAZO59aQF4fELUplYxHkV2XDNz7fnggIhHmuGrK
 nak8xtLq2N6BSTvvbrwQFzNMbIJE9TIsxxnPVmWt+EwXYcll7F44yasuZ9sK21VWqDEMZEaDh9E
 x0oc/dHSO//L74F0erluKNbKbN7aSMzZhfPRXYW/5vq/uj+9OSVucR07Xcn89CXt8xaq1In9bWi
 kbSzyQi8pUBzITPDP8ntex2G2bN89e2GKbD5O6/BBbrv+tA0bbiKYzHcjD5ujsCSvmil6/1L
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=6830e189 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=irnscpC_bN6KN00xGVgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: Sjm9c7l-etQIsJ-KR8bkISrAQTBqU3x1
X-Proofpoint-GUID: Sjm9c7l-etQIsJ-KR8bkISrAQTBqU3x1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230192

On Fri, 23 May 2025 14:11:22 +0200, Arnd Bergmann wrote:
> The newly added driver uses the DSC helper module, but does not
> select its Kconfig symbol, so configurations are possible that
> cause a link failure:
> 
> ERROR: modpost: "drm_dsc_pps_payload_pack" [drivers/gpu/drm/panel/panel-novatek-nt37801.ko] undefined!
> 
> 
> [...]

Applied to drm-misc-next-fixes, thanks!

[1/1] drm/panel: nt37801: select CONFIG_DRM_DISPLAY_DSC_HELPER
      commit: 022546cdbf26ec6f42af7e2706702d5703df42f6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
