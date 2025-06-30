Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE8E3D69
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291183; cv=none; b=txref7PjIC6WVm+R2J5JksIHRqClxYov4LQnx0HL1qlMbY4VPRT1iqVrRnLa6uAbGflBYEdGRliXs6DjI7WJQeL3rkniYNGpr64Qbn+Y2FQdR5Y8QMb7bh7A1JpV+CvlVZf9ZmUy40UEuFwXSwLX/abS/lWQ7DQBauM/bL5bIBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291183; c=relaxed/simple;
	bh=kFNJt0XYPtU4pD5AfSIvYtEE9BPgTXWPKB+BM9PyUcA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M+Snvh/RTUO/qB8zEjZnAKfhkBf1pXVSgJ4ZKUCEy5hkVvlzzsQf0WdnwbeWkrpNz4kQRfKO+aYy3LYkcPoMNV+WMsxQfH0FGKk6vHHhdrOMfO/vBKCXOcG/M3rEveo9bCQun9BHTII22x/6d/1KzLuZOozOFL/NnpTMMunRFr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/x7GnYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/x7GnYP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DiXd029531
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=; b=d/
	x7GnYPjDfc5+P3s5A4GfdW6ZT7EzDKVz4SYgw21z9BPf71LWmPsRJC1BX1vXebAH
	7fJoLOs2hTPImwXK8p0PwzUvPShJTt6yDQasSoTPdNJeMfdk7o+xhsC5uMwcs4mz
	wUhSYYcWfDXf5QN3iN7OwyvkrIvdEV4AmJsQpjdZ79pCqCJNMOqfixPZ4pybcn0k
	JFkpUWjZm4L6AcNOaMmmjPVsMvzYMgMwelxCKqSOGCDghqNDkQS+dw+LAy46u1lX
	PhWqFei0v7GigR4J5/9BWhXi1lfQGAmyQ5gIb9a+5TP2DwD+60bhavkmiS9GAXt3
	HgYSX25pl1EHBQsQbGUQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7bvmyus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 13:46:20 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-40b5955b907so1140776b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291179; x=1751895979;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+sYnLgd8EuSPJsu+25KS1pMeFZ2cMLM0v+K0r09oi+A=;
        b=lpO+JhB2btUryjldm2MP8Jbi/wf27Nh88NRGQhlFD8IDnt4E/kpni22xcoLarWQBqd
         LQOKrI8EBjClg9qoYBtZuiTVoJ7NJdz9KXXygXyOZejZCvMnvVFEo74FuqYh1qCFB5TW
         lVKHe8lNRO3BiS8UVhGay4fkarx/3D7iAThBXu0FvumbukKy0EvFI3ALxsszgdL1bWnV
         I/2guVNC1S06KI13/ziqu9h3jZ9HJ5cyBtOV6XihCLcrkhcFyW1mbjKY61ywtXTtO1Z1
         Rq2biIu9dg1YF3HIo+I44TJ8hmbgxN+ktiF7IkG/Gu4Bp5n433Tfnjk0Y30GDN6os2uX
         yL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9eCVNa6o7DQXCelQT52S5HufbEXT0qb0soaDLNutMwYeaIJQc91K/0wn3KfPR/dzmy2rk2Kj32avehRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSJKtx8mnNVBegTGXnvu91eBFCHpdvQF+KV8tDQsr+C/V8k/Yv
	AAW0s+Fbwlx0yWGwc+S8B4bUIKOfvcXaBho9wsJRzK/vzJptaKgVPxNndwi9chjqN5eDGnpRkmD
	2v3ila04WMjTuNF2s9Qo5JRYNcJQKZ1DRfUpT5WmSyohEYnPsiKMVYO38VIplUR9R0nN14yvkKZ
	oRt0Uvq1EWhEYTakHFVA8a3fFplltSu5ElzDI+T8MCpw==
X-Gm-Gg: ASbGncsYcQIfPzE8pOzqpOC1rPqDSkVJTQY0IWwkO6wSlHcueHATRGhgn8LkYXk75Ta
	Tut9VWGZ2WrJjtr7tzXgDlL6V58Z3Kf+Qi+LeNHQu0lGps8T6vgRuiXMTbdKaA5nYPf1paAequV
	2/3hFCUI1gRc7BtjdcfY4y1ndZGz5mkPaWrlE=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id 5614622812f47-40b33d8ff56mr10677499b6e.11.1751291179438;
        Mon, 30 Jun 2025 06:46:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGC/ZONBovjaxT4as2yCPYzH6bLcayS9bEQ9eiCn71Z5acFjEn88qadQUxBV/FIurbHxcQ5liO5UIZuHKwhFlA=
X-Received: by 2002:a05:6808:1887:b0:404:e0b3:12f with SMTP id
 5614622812f47-40b33d8ff56mr10677478b6e.11.1751291179085; Mon, 30 Jun 2025
 06:46:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250629135843.30097-1-robin.clark@oss.qualcomm.com> <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
In-Reply-To: <92314f06-e6a8-4882-a31c-914438d7761d@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 06:46:08 -0700
X-Gm-Features: Ac12FXz1ANfzhNdQG9PbXKs-9CTqnjt4T4STXGnoeX_oH1xYF5iTCEgVXLupVM0
Message-ID: <CACSVV01AUOp7vZ7kLt+gwxvfv4CYLtAQg6MhUccygbi1NpVJMg@mail.gmail.com>
Subject: Re: [PATCH] drm/ci: Remove sdm845/cheza jobs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Helen Koike <helen.fornazier@gmail.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: DVNwNUz2Ht6CQRq14PMYfx_B7Qwjj39m
X-Authority-Analysis: v=2.4 cv=RJCzH5i+ c=1 sm=1 tr=0 ts=6862952c cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=EUspDBNiAAAA:8 a=0RMLDebWjREeJsuOEsEA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: DVNwNUz2Ht6CQRq14PMYfx_B7Qwjj39m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDExMyBTYWx0ZWRfX3TKgxymDK814
 hI9xDVM2filz+qZnjgvgBPJl3uIjF6VTJDO+zB7cp85yhgKr8sCdelnJ0L9hoQA9n+aGmnG0vci
 P0X7fMx3a40poYZqDl3MWsSfsVc4HIzkmYyuf8Ysqy58hA2T2JSX4v7l++qcye0TTpYbYQ+hmNf
 h9O2HypeaM7uNusF6GZRaysnnLVSISr9QCMpsjKXbywLPEWSdN4EMWeaFZoIsa5W+SEkJXueB2Y
 3vkBzHjaJg0qb+2ZzNrzPY1dPMbqdlA6d+nyBadYkYgo3El2dEetsXDW3rfW7su/0sc6iUCFVIe
 XGyYfrQjwXjczVn9O+eRw4f+/acq2bXUTDoUgcaQpS9r3/o97egIoPDDmCDH9HZaodK00qQ3y91
 wXMlcMravR/zUcHRZdQu9HiUgLNCKGksF4IltTjk2I5navCF40+K3wuHX6WoH/GVa+gQyiVp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=726 adultscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300113

On Mon, Jun 30, 2025 at 3:34=E2=80=AFAM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
>
>
> On 29-Jun-25 15:58, Rob Clark wrote:
> > These runners are no more.  So remove the jobs.
> >
> > Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> > ---
>
> Do we have anyone using cheza at all anymore then?

Probably not

BR,
-R
