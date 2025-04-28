Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D920C1FC114
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837365; cv=none; b=g+sXCSpsVA3NQFbwSuJr+sY7HyRVER4PMyFmMJpOdq/uaJtTcGwmswg8nNbyUR/YFTa3xWL3ViN6QG/UPTmt7WfMzsTZjzICrBvwCSPdictwLlUqM/ysIqhGtRqTEiqQASMAPCve88MiLS488neg3mbDWKdCwJfg13AMao5VXuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837365; c=relaxed/simple;
	bh=c/A33H4yAtHrE0wZjDTWLJC7wnY8YFeoDowDA5ju/DU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEHBkwwP5I+fx+HbezIlWUCnrEXvQRWKbqiDV+WsHbY3hJnupSY4iLGsfAUJcJXM8payD4Ko7aEBw2mGhy9NCM5VnxKt8ZJBqYYn94em+qUI1mfmPp40ValTP0GCJ31ysDubeBL+tvQUH9NtRDWt1LIEIFzS6StO4V8crJ1pOgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MXUnkl4r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MXUnkl4r"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S6x3Xf028590
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lDmhszglaNT9fzli8c56cXMb
	J0ClF3aeFP5Tl0qaDz0=; b=MXUnkl4rNXnQo2UMaeZmkMd1wyl9argAL9z+RKBg
	wk3gtZh5prQDnQzLt7zeDeLZL/8glSo+lDd/hcySiSMU//AFOBhKII+cj1bXMFAh
	szmhvWVoo/azNO6jR4Y3LL6H/WAJgcUoGZbHnhUKKq97qkZIkms/KghLtPA//7W3
	IDKxtMiSYfS1/qBgMyC5RjvnWxjwefvm/O8nk/YTK2VFi8430zpvt+0ea361kuew
	8Yetj8tosiB1BJzAWIyX/hNazmSICzZPJUi4la8GmDxCKqDEVuQaYYtde2OvxI9Z
	QJQhpJRRSdQpDoCSKRoRfj5FLzo92hUr7O0N7JfCfypOpA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnmyt6b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:49:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ff78dd28ecso5214100a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837362; x=1746442162;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lDmhszglaNT9fzli8c56cXMbJ0ClF3aeFP5Tl0qaDz0=;
        b=P+b1kUfSHYtShraF7RiPoVCVG1eIbNn9Hx/VnHwd6eODEuTQeH4ZMdV+QbaJ7JR4XE
         LYZh6/IX2XK7DkfPGIjI8Pjl8ls6F696MeX1vdmPRPoypS2eCbAvOd1Fth8szC9nMDGl
         WXrWlc+hgpM/yERhZl6RAEG5/gXfKzsWxHPC1ML4wYp6QF9bgMBAgKGpjICJBJEDH1vp
         5OLdfFTcgPo8cqT6EsKuS8MHClmZhkO+jWr2VFwQuL7uYh2DpH5bxKSDMVTxSV2Srsuk
         SUjbXQyoss+FYYiJlcbrcqNvJsZvFwmc4vQBeBLJ8lwKw6Q7IuhMiNgO5WC7+M7o5Raw
         m2Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVgXM08LEOd3yS2NfNevdrXuLwu/p2h726u9mvFJ9KmU0lxDrfZTyMax4rnY45Kzka8xJhTcrpy7vHu0Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2ENZmR/Oo4ifczG/o2FOf7XqsykKrtw1zLzwL43hDci/KHqVu
	ZxmktpTaTT5+qCgHGZoWOmANMBrMTmC8vSGBvRoV3NkZv9KZTNvH8uKwQqkUlA34QiAS4NHAKU2
	kXRlK8H7XfnVCDYrJEHRw3tv/L6P0dFN46C7fN3Yy/GNyfAn7qK5FQbvUdG/9UQyl+2+i6BNtaQ
	wF0VQb7DIkqHyptbqMPR0WQ9klVchi8MgZNnabkQ==
X-Gm-Gg: ASbGncueCV2A1SceeXlRI5FCGLTJPKG7hNvM9L/cwdxSSR+52P34xdLmeGUAMyzi5pj
	KNe5MFGmTOXRe1niyAZuiAGPSDy3Bj9eXhgrdygwm1XZWOdta2R99ovBgbP3B11f7dDMVcdqrl6
	SPP3BnN0kBQP++FSwoyzyWoQM7
X-Received: by 2002:a17:90a:e70b:b0:2f8:49ad:4079 with SMTP id 98e67ed59e1d1-30a012fe1b5mr12489595a91.6.1745837362147;
        Mon, 28 Apr 2025 03:49:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEz+/aYe6LvOR+KmeDd0jMeJ2lt5sUppcByWexbXLICBrt9fYXv9DequtQGO3Qn8Puh7URm/6CRCB6zgv3HI9w=
X-Received: by 2002:a17:90a:e70b:b0:2f8:49ad:4079 with SMTP id
 98e67ed59e1d1-30a012fe1b5mr12489560a91.6.1745837361738; Mon, 28 Apr 2025
 03:49:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com> <20250428-prudent-hasty-pheasant-aecec4@kuoka>
 <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
In-Reply-To: <29d15e93-8f5e-4cec-97b8-8592beb01d6a@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 13:49:10 +0300
X-Gm-Features: ATxdqUESaAcsAnz3fLSqCu2cYjvTXl2dF4AhQuMy8hC7LO1Y3nzIdjCZakO_n24
Message-ID: <CAO9ioeUo_vO+-wuC4JGi4JfSMZx+JZkvLvsi=ppBD_LvuV2ZLA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb"
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: 95vILOjYj-4lPFHW0hYYyJnG-Is0xVTx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA4OSBTYWx0ZWRfXx8+ThH8IFGuE DqMfscu5GoiYQd4So333myHbur0RCYgjqZ3YcoZBoiuVZ8CbkZaBGahzL06enlyxfKck6SafJNG Nclx/Uk3Yug4waaV1ZvMcIPQTMyhcXt9Oyw3zrNQJ4xKh2DsuL5/iHjPJoLwCWacttmOVcM0iMW
 kxfRAfnpmgmGBFpVdJT/phzOyvbx7E3w3meoMXVAruE3J8ktsdbXhDOyTU/3PtMMefZSmlEH3P7 efarbONo3d2Gn94VwThZpqPkiMktRX/AZU5R5vX59Dm2VB0oGZtr0kQMAaj8g7XtTGZzW18+pUJ zs/3SybH903RDVmgtmvHWC0djnFBQfwLKazE5aViJkGjG+seYZRQUNuBoos+Vp5zv+8y4kG66Py
 NHl29WxSEQA47+rCn6DDP31i152HnDHXLZctviaQW36DtqBrApp/LywC7gth54jEpXA90qmn
X-Proofpoint-GUID: 95vILOjYj-4lPFHW0hYYyJnG-Is0xVTx
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=680f5d33 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=L9MUveKbg8kMJ_lLYs4A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280089

On Mon, 28 Apr 2025 at 10:09, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 28/04/2025 09:07, Krzysztof Kozlowski wrote:
> > On Fri, Apr 25, 2025 at 08:47:01PM GMT, Dmitry Baryshkov wrote:
> >> For some reason Lee has mis-squashed two commits, picking up one chunk
> >> from the first patch and one chunk from the second one. Rather than
> >> trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
> >> Add qcom,apq8064-mmss-sfpb").
> >
> > I don't understand: that commit looks like direct, proper result for
> > https://lore.kernel.org/all/20250318-fix-nexus-4-v2-5-bcedd1406790@oss.qualcomm.com/
> > so where is squashing two commits? The diff markers have offset by few
> > lines, but it's still just few lines and they do not matter - there is
> > no diff/patch mismatch from that point of view.
>
> Ah, difference in compatibles. I see the error. Anyway, I don't think
> revert is correct. Just add missing compatibles.

Why? The commit that went in is invalid, didn't come from my patches
and was produced in some weird way.



-- 
With best wishes
Dmitry
