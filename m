Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D817FAC2
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748102782; cv=none; b=qAu9//rBtj/Kn3RRvy3DTR7fFtBFRPXHupu6fn0r5JQsPWCppQyu5MLjtIr2Xuxm273VnClH7+WU/ZUFOsHniWFkjRyyzHIhPtmzjxELKsrvqlIAIOi3lS6FEHbcgBcOjrSkBCm+DtB/0lTzAp8g1EcHOf0HGZV/1WPjZIm2EVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748102782; c=relaxed/simple;
	bh=9q/JShL3By0t4leek7AotwidoLPZPL0RwLW5nGVe5+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aWVwIDZOhbnMDuvdtHnf/XYvOB3087DfYxwCtwRFJeG0pKBG8lyjGlboi7M9Wz1FA+g6R0jQ+yUFFxga0/D2gTrJ/AqstaNEmL+TIeG1ZSFraVJalsvEtFjfKwZBAfa9uRSvZhRA2U57PI0hikhwVVMYjHYq1d/aCsxbSfgdpyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YiHZ9HNV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YiHZ9HNV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OCe2rs019181
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=; b=YiHZ9HNVNtH2gNwj
	7WHHK0+apf+0Cv5/v/qmyCUN9D+064lld3QxPE+Vwa9CQJuMA/BuTVpWk2+zYm2T
	HnD5pBh+zjGNoP0+roqajSH6MavQ7foATxv/NO/n23QsXAR82cNrrGADNZROVztX
	XNg2DlY9JxD7phtbjJvIyA2FnVN4EecmdvIzC+cEGOxIvOB0jsIGjnrX+Ejg0KZw
	u1/FeogRIr8p2j9shvPtcM1g9637N5/IIadz6nRtGhu/gaE1DVcinUD32PDEYBxm
	3AMRU1Wmuiik5VWibR25IHW1SIOlgMFwEqUIpeb9f3S8cnOErmNwoxutD2QsUiq/
	eEp2dw==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u79p0ssg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:06:20 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-70a5434825cso14210367b3.3
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 09:06:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102779; x=1748707579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvWre4NwLlEhheV6UhBdS9zth/I+k8wEV1eM6J753YQ=;
        b=LB+oyvi10QzAxnEOS1TJc2HDP0MUXx4uxb2B8/mj1K2E+FwhjJf4Y2JezWrIyvNLOI
         pN3T/7FNzf8Sq+FHO2uUg0FIW3Kxx4vRmyB2Sj8l0yMoowTUACMYFZGvGLJ0azDs1Vax
         5nky9ww0kKlPH5NvwO6AQWqr5jHpENp+HhJUQVIbfpAlqCb4YE4oMZdJKYgtmq/9x7GK
         T5enKqNcoKbfgUYWisVswJcBiIWoYqr7DFrQYXRLFQ6qxsEghpsyB0TQtlNUMWfsQ+yN
         ZxNVIx06ruCk3yoCko1Pagkuw1Dx8hAt2miUlrc5xolqR38+fPCl3KwdJxyGgTQq/B9T
         CA+g==
X-Forwarded-Encrypted: i=1; AJvYcCXt+I1xak0xa+HvuPwpweEvL4Tin777IswOh9c4WA62PR/PhBQgg+06qkFfHOyzKsifcXCtMU4yz8RqF9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+WqU9CIjXYH3YKYfCj3QqNsNyxeLmbSEoR1x3Dn9iy4xSqeuV
	IsxJ6iP9py8q7slhptTsaXl7IZe+1uTlHfpPBEnsI7I70/1n1F28lWuCs1RY+nhtprCYNwME1FF
	1cKdd0ZYjniM7XNfqAM1nhGx4yfsUZS1y52+ySg/lRf3wJlguueWr52WilRE6Ub4US73S/6KQOy
	lxTiTSvLtNRcTS0mbAO384sO9I1Xugz/5iNPQse9YHAw==
X-Gm-Gg: ASbGncsijJQ+Z9AfBdI9ASwGUT5MPGDOCGwRbu0FvHthVIvxOlrbHD9aPQi/U9o8p1O
	QxU2pJ+3d5pfJJTZ1TE6p6zhJ+ht3hfwFuh3jgRNuB+TxSVLMsDGEHF9VAFSeXz/TygOr9no=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id 00721157ae682-70e2d9d50c6mr27826017b3.20.1748102779189;
        Sat, 24 May 2025 09:06:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4tL39voPqdTiKIP3IIIX1ysehsTY0iOqhgM4UabaxxGpMrBca877TkCTIF4JkmyrzRULHgkdJPd2B9DdtaSI=
X-Received: by 2002:a05:690c:6710:b0:70d:f53d:dd34 with SMTP id
 00721157ae682-70e2d9d50c6mr27825507b3.20.1748102778853; Sat, 24 May 2025
 09:06:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250523-binrep-v1-1-c3a446518847@oss.qualcomm.com> <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
In-Reply-To: <76xrcy5lvic7mucwuph7a5mgq47atuoocukanjf2q7g5ov6ffa@wbfks6f4hvpk>
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Date: Sat, 24 May 2025 21:36:08 +0530
X-Gm-Features: AX0GCFtYDaH1Ic7QEuPAQQ8ozFwzgT7xoanbWmVWsm-9FahKFxoR6k6aeF5-CQ0
Message-ID: <CAHyS93o+zgBK=zP6N9O+qvKDgPTe+OWtpp70D5ciYUfQyqAf7Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: gpu: drm: msm: registers: improve reproducibility
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Ryan Eatmon <reatmon@ti.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: jHirbycdJ2G1XWeOeBmtsx-Ptf4S-Nw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDE0NyBTYWx0ZWRfX07d4ooU/ar0Z
 GH/xiMoTcQGdtW3ajenqX0MY38zi4dGIydS/9fmNYUv55+tLwkq9smeiCY/0LmkSVBwzXhE907r
 WkcwPxIWUP0ZCnz9j/mdoROC8KpPlyaQRVX2czL6vXE8mpH9Rl5lzkQqP10cLidjL6Mx3rBt+rt
 OYCB91g6J14l2VvRveQX8UvFQzM9IbxtxMhjZSJ1+rCVZrZnSH7+ga9fTHAi7BIMFidFoylU68v
 yUk0x19etOzQOtww8Ew6yFOFowmU3rEwLcSEiKGfOwZIlpiO8Pw6zyj+Vd5EH1NtX1i4P2VXjnH
 t1ZET8c5bp/rY8KVXe5bhzenMtNvRBWaucbn+SZE5CzVZEnakXXdnIWHI5BbcmsYiysZ0lMSH9w
 KwjppTFkNizibEGkLcMZ6uATbOtyed8EJ0+jdkLd+tr1PPqVSL4b9QxCh1zYaXEZlnxyJLOb
X-Authority-Analysis: v=2.4 cv=HNnDFptv c=1 sm=1 tr=0 ts=6831ee7c cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=sozttTNsAAAA:8 a=pGLkceISAAAA:8 a=DbLYaGFL_cwN43_H1DIA:9
 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: jHirbycdJ2G1XWeOeBmtsx-Ptf4S-Nw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=406 phishscore=0 mlxscore=0 spamscore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240147

On Fri, May 23, 2025 at 10:30=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Fri, May 23, 2025 at 06:36:16PM +0530, Viswanath Kraleti wrote:
> > The files generated by gen_header.py capture the source path to the
> > input files and the date.  While that can be informative, it varies
>
> You are not the author of this patch. Why did you drop authorshop
> information when picking it up and resending?
>
Apologies for the oversight. I've corrected the author ID in the v2 posting=
.
> > based on where and when the kernel was built as the full path is
> > captured.
> >
> > Since all of the files that this tool is run on is under the drivers
> > directory, this modifies the application to strip all of the path befor=
e
> > drivers.  Additionally it prints <stripped> instead of the date.
> >
> > Signed-off-by: Ryan Eatmon <reatmon@ti.com>
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
>
> --
> With best wishes
> Dmitry
