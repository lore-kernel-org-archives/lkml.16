Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C06F15990C
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750978032; cv=none; b=b7AxY6mKLuRs00eY1TN8vM9VxsfUeDQGr+37c8vpD1QfcGVeEhvVOG45/Cau5z6k8xnkcUvPuAK/4TsvEFuadYunsNMZ8S4+0ha2Mf9rfi7GIdts3Z3T4+3ALC48o+YZnIkwKNd74Q9lnbmyI216HKZTu9TJq5B7MP/C/fE4rdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750978032; c=relaxed/simple;
	bh=k/WLttcj9Kp3cQ4uWeQLm05Crh8H/kiYV7NaB+9UZSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WMpqQltxTWLMses6qb0M8jl0wiugwK8ccZa4fje7KgI8zyYMLrQLbj847OlzrdDUc40UVv0FVKW20eYBmhFp6q3ZuH3NpFD7g9kex487J53V/f+K9RsoOEz+F2sSHh4fVBDzwgKMLyKEtzaj7mZ94IeXJA9NNs6dNb6QHmJh/js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DmLUJcLS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DmLUJcLS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJ38Rb021525
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=; b=DmLUJcLS0w+IF4ju
	mlBGlsPbAW+fReM3XDpVtw5ER/J6uRpK7PbGvyeaQxUPwZtWRpBL/ajsNXUFfbQi
	aYoZmMoQw82RlY1HVAStmFw7q0ob8oNhYGpa+kBc7dayYbG6KO2J+c+n9TNjQ+TT
	5yHJEU5y05QWGaaBLGewI1FdFPDetApInyJuUI7aFmaay4Z/UMsoHU7wkCeT2m7E
	axP5Ju5NOUDA/woLlcrXbIcxSLoH+MqwU98WdW8tCMO+kG4J3LtBOw3Be/AeHSAw
	Bi6P/xeVKyW7CZHVpJFN1kHo/t/cxGuLH9hRUthSRM/KTwcjyiFOc5uI0H/SK+0n
	lWnrTw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx33ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 22:47:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c7c30d8986so399820185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750978028; x=1751582828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmoMifDvBvDGBNVMAClJOdl8gLaZitfPh+a35hkvPHI=;
        b=fz1IgBoDvU1XfQ/VQ3dp3x35eiuAW2uQtYOLyTediWBHXHBaeOaghiOZIZ5JoCVMa1
         p2CksV4GmfMatE4vhkUvZSBW4eiWjHGnSVGbpxdcQRSbpmWUvvxTRIaL7e8o8XJyYn4v
         CRb1tT3REdolsHiiBUT7Cq2KsQo48LrI4kL7pgjI5XTp47Nc8bc68dDCLLpUyWiqu4lB
         eSmvyS9BMhE8ILpT4yUN/4/fAXeoP9oel/IwQgxTts0Bh/wEOmJIDQfyoB9f7OzHrRZ6
         LEDTMCqRRjilzlaE/jsHVdr/vP0Z6l/0BipF1jH1EGeHR7qraCpVBdFFcOMfZjbsbAJ4
         uYyA==
X-Forwarded-Encrypted: i=1; AJvYcCWK97ev87EN+QHqqfug18LgV5iQz98cY/WKNQr+GjgOyh+eyCFcXuG6cBITClQk+oPPuVmrzv0PEHnO03E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu8SSH9b3BLHWvODQJHzsDhRFLvGumJwzETVBeV/z4AOn0FD+z
	AQzXj9YmGI/pkv2qpZ1lKkIV9rFQu1m7rM21+Aba+YCiaHiPtGdJ8ZnS25h24hPkDTZJasVOGEh
	oIwozcCapHSwa8JYMgwvFQSlgxo4mdUoKYVBoxqlPHe2pjxJxM+8zFD1SYvwJiAcc2Ds=
X-Gm-Gg: ASbGnctDxOv4EA/dHTD7pPIoRTgDbiPDbIgshmoTmsP3v9YwdvU0LXuD9wscU637McH
	kqpeT3ITUEjh3wNU6NYWPtmSnAFIU0cISSaeKW/OcjpmNXmWEO0sT8I2dhZroTlovf8G3pFgg8u
	EUSUfL6ZuCP/FzDKM7wivZLrRCBU4pN+t26iP3DawmywLuXt6oNvSdF+qpRj6CDrpQIGb3EZ7kx
	qamu3RdFTIv2NaGFH3/58yufXCajy8lWYk3B+b9+CtvBSXVh8bEIkYEgluNKvi+ZOh+hpkL+kSS
	MXf/HN6pAC/X5QfR7HlKWbWPN8NsPBqbU57Bx8+n5K3eBbI/n9/4IvS92NKEkjEpLiJ03Q4hRL/
	d90i5g5fSdVeMfrXH17kEWAEfzsEA41hIdKU=
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7d443992d51mr155164985a.32.1750978028104;
        Thu, 26 Jun 2025 15:47:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7QvvBbuRQht/PX77z92dSw11SIpFRHu9NAfpMGbcKSTVTrTrYOF0CEnsJFm4LXzUIjnqOGg==
X-Received: by 2002:ae9:e20e:0:b0:7d4:28d9:efbe with SMTP id af79cd13be357-7d443992d51mr155162685a.32.1750978027682;
        Thu, 26 Jun 2025 15:47:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b24e4dasm185172e87.73.2025.06.26.15.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 15:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Simona Vetter <simona@ffwll.ch>, Daniel Stone <daniels@collabora.com>,
        David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 0/2] drm/fourcc: Add additional float formats
Date: Fri, 27 Jun 2025 01:47:04 +0300
Message-Id: <175097802066.519545.3760408226884035937.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
References: <20250625173712.116446-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: o86qMuyobS4wWtQ1dP0WxWWBDrRi016A
X-Proofpoint-ORIG-GUID: o86qMuyobS4wWtQ1dP0WxWWBDrRi016A
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685dcdec cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=yB-vDBVxPvN9sSdsvdIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5NSBTYWx0ZWRfXwe+keE7IaLrb
 oIGQ6zAVOD5swenIfgeFgSV2PfPyNPJKZTFzsHU0IaGis9XusDJoL731RJLYvM8G4cmmZJbkjCT
 d+6t6XrJz9ze71v4pFTthEmGiYMWCKWKxpaKzHiRYhPUqarut5m8tbFJ2fIgiOpsD3/qYHFqwA8
 Ro20g80VH4NZsVdXhlpc0tgRiRrd5Nj7Bjd5D/1QR4Muekw7Zy17uSX7+zpFts8j6btZQ81xhOV
 bsuAP7DnyytsuQitVYTzWLtQYylriXLKVgHeHMsZ3HiK59AiwyeGp7BzdsD3tExoHTmu5eG2KdB
 nOdEw/spHbIzcIdF4L47D3gjSKpRfhI1cqSOoKGBiSLDTN/9R6lnOer/VVneW+9SuE9ibh1N8i0
 X0e2TAR2jyLSEbwRACJST5aTVH8LtdQoU2hUiYjFD/voVu7FZE/L6ps4kP3URP2CxvC8IuRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260195

On Wed, 25 Jun 2025 10:37:09 -0700, Rob Clark wrote:
> GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
> fourcc's needed to import/export these formats, and/or create with gbm.
> 
> Rob Clark (2):
>   drm/fourcc: Add missing half-float formats
>   drm/fourcc: Add 32b float formats
> 
> [...]

Applied to drm-misc-next, thanks!

[1/2] drm/fourcc: Add missing half-float formats
      commit: e04c3521df073b688b9e9e2213cd3c588e3b6e68
[2/2] drm/fourcc: Add 32b float formats
      commit: 3529cb5ab16b4f1f8bbc31dc39a1076a94bd1e38

Best regards,
-- 
With best wishes
Dmitry

