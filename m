Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA6B28A72E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747915804; cv=none; b=rnhS2ca7WczBiqzsufeWObHi26OpVNIUhhCOtyrceKFVyo765OHVcy/D6CmHJO8YXR/qL8qvwtwfKhjhEm8G9PdifZzp8gyc+YGZjRko71gZPG0Ism2gYW21sh49Mv1XfeCfYD9D1oii3A8V6SSbL/JpbriATJZPY8pzePjENgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747915804; c=relaxed/simple;
	bh=lnm28Rpc5lq581XHErrZj8GDudLHSBmNCFWcJ2epunE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DrGxSGs4hTJl0JmD6+L+jVLDIOeJNfSKrN+7lETHmunzFfB0N8O3ppnz9uMzJoDho4ZeFxBYmmjNoV8miegMd2KHK/z7yfyE0Td1B9EPmc+fIJsVs+V3i8yXyAtaxD1zcIlw0YmIXAZbCnT83gyZD/S5nVAjDHhU0EA7dGS9HMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KhMa7NUv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhMa7NUv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M8eSbn023439
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BvoQG4hxN3v9pTAKmz1SDn44
	poE7d7zcfXIMZbDRh+w=; b=KhMa7NUvYXtiGvcQRGxQKGttbjFCq3st5bxBgLm9
	bXv8sAxKKSzHr76mykyJWqpiFKwR/VcgtuzKMxzI7qP3CpdBU0OU0QStL++NH9HN
	XB4OM9hRHXx66FgbsKSlT0TT6MimbnfEBs4GIw9D8F5wM4DC/PyUeRk/g0tnLmRK
	9BxTDglpF+98INIs0WFy+6op3UjBtILbpVRcTv/3iKwKcT7lzFLNpoH7hqSyyFVz
	VHJzTKy6KW8tMgiHeT+tZPZtmvlykCmjCwGEctb/evarY+gSEIAh/9bkECwNE2fm
	Thvuc9VOHeqC4uYNSh1rpO6bH3mX9ogMVZk02ekXCA+bMg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6x5je-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:10:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-23209d8ba1bso50154535ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:10:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747915799; x=1748520599;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BvoQG4hxN3v9pTAKmz1SDn44poE7d7zcfXIMZbDRh+w=;
        b=uq+mc9bDuwtlibf9GN8Cp69fc3hnhzFw3ltaXTBO2b6cfTp2rBy//3KP6veHIAYYKI
         wAPMbF4MyDOZxyp5S0886730PD3MdyGZhacf8Ov5bSODqt+qwA2FgivyCRaN2UQOybuz
         0pHJDrjofDqan2B6EbbWUq/eVIWtO0p9qJCoYfWaB9fQggmgIz2zH8JE3FDpIAgHmzAW
         fP53B3cdIg8AisO/faAtTmFAka5c3OT4F0JBAOcoS3zy7jAB7iBfQnTy/X3T4LBeRbE3
         6XoCItx+G21lZ4r3JzvbdtdZ50njPqHKqD9+tJPiKBcD36aYxp888v2v+tdGEwyQv/b5
         Os9g==
X-Forwarded-Encrypted: i=1; AJvYcCVN+icTwdqfS0IEK2klrUxQgBsC93G0kVxDTipssWmBe6zPuwYUjZrOK0pNKyAaJk/ZdOjVF7/ewZWPBvo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzs/AzO5MBVhmJ48pqrDJLF8lvl5oq0Pdck/SEM2sSdlY+RTDao
	Hghu5xnWdLogOmdSnUIhAW7NUcmF05BUI/EsPhiBd4tclbpSGIDZyBVz/x8s6xKdBi7UXTAPrGz
	QhL2gY040DwbdLzbBVVU3bl4a90QfYrG1pJXZRw9cIoju4OaFIALo0hYt2QAF9TfuiSGRiKSeGC
	/5aVJp/A8OyCiWpslVm7qAuOCcaM9n89cDcgtp+NbbwA==
X-Gm-Gg: ASbGncsJLTc06XlhVXunKZyDV5K9Jh5jVUaAKdpK4vsADkHLSMEwwgVENfHtugp+uW9
	BFLmhvG7PxIB5fuGqExnIts1f0jdNy86rnUG6ru5hEHjPR9chFOVtz25hz3FLZCXBCcyE/N2/NF
	x8SYXtevY=
X-Received: by 2002:a17:903:2ece:b0:21f:988d:5758 with SMTP id d9443c01a7336-231d4596fe8mr400738355ad.35.1747915799374;
        Thu, 22 May 2025 05:09:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdCEwriPVhJPw7aBmQjyQWGffLnnxmkS+nFx7YdAAALnEIq7gGUgxBOtu3WCTCH7z5TqwWGCJc6wYpPvnz8mw=
X-Received: by 2002:a17:903:2ece:b0:21f:988d:5758 with SMTP id
 d9443c01a7336-231d4596fe8mr400738015ad.35.1747915798973; Thu, 22 May 2025
 05:09:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com> <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com> <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
 <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
In-Reply-To: <999d2ca0-b3d3-4fa2-b131-092bef4951c8@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 15:09:47 +0300
X-Gm-Features: AX0GCFsNC0SwHmC2cAOj9-xXlmg4In_ViGMOryv4sEh8pgb9XcJxs6N1I7dggY4
Message-ID: <CAO9ioeUW=v_CBUchJEt3PArbzBbUgznFO8TK-j=2yUkv8S1Baw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations to
 a new list
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org,
        Alexey Klimov <alexey.klimov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: OcA3MKn-CXtOdIlbPTJ9fMPzstPIUJmM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDEyMyBTYWx0ZWRfX04UE4l706I2S
 kg541S3TcC16sj5NxTdGvLywbp2LeQhIzqy4K4EeWApxgyIoWCGSiyrYxCiGlRXcNx2UkVdpRtb
 CG+e9XhH6fPN5ZW71oPBZ2t9nF5Evh5fF+ed/N+dy48D1F/0P2uEKqF8FtR98NmjUw+VwDOWLod
 LH0FSlcLC85vWIv3fMBBmLeVJQJpzz/3fp3oZ/zha16cFxX8RBCcTvbMzfAxH+ptXo8LZ1kaAK1
 ZPP7+MsGeBskjDufMZGT41twLev1d825I6zN6Vw6jSbpbYj2FYk4edxbm4ElwOOHSmOBv5LsyWB
 ZTYqJfNvC7EarSZ4z7WHYKWG/pTnKQzV/di6zoegQ++lhhXcc7/TUxMoQK0KHdmtxXmU7S7jRaa
 Ys/qRHxW0lbl0hxaPt2fZlBnN1RqeX7IdtK9z3h8mzm6Ywh2dtciJLW1zKjSzkzK/HBuOWLA
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f1418 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=EUspDBNiAAAA:8 a=mJARKV2re0eqfElz6OYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: OcA3MKn-CXtOdIlbPTJ9fMPzstPIUJmM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=925
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220123

On Thu, 22 May 2025 at 07:54, Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 5/19/2025 6:59 PM, Dmitry Baryshkov wrote:
> > On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
> >>
> >> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> >>> On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> >>>> Remote heap allocations are not organized in a maintainable manner,
> >>>> leading to potential issues with memory management. As the remote
> >>> Which issues? I think I have been asking this question previously.
> >>> Please expand the commit message here.
> >> This is mostly related to the memory clean-up and the other patch where
> >> unmap request was added, I'll try to pull more details about the issue
> >> scenario.
> > Thanks.
> >
> >>>> heap allocations are maintained in fl mmaps list, the allocations
> >>>> will go away if the audio daemon process is killed but there are
> >>> What is audio daemon process?
> >> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
> >> attach to audio PD to fulfill it's memory and file operation requirements.
> >>
> >> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
> >> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
> >> daemon as it is required to take additional information and resources to audio PD
> >> while attaching.
> > I find it a little bit strange to see 'required' here, while we have
> > working audio setup on all up platforms up to and including SM8750
> > without any additional daemons. This is the primary reason for my
> > question: what is it, why is it necessary, when is it necessary, etc.
>
> This daemon is critical to facilitate dynamic loading and memory
> requirement for audio PD(running on DSP for audio processing). Even
> for audio testing on SM8750, I believe Alexey was enabling this daemon.

Could you please point out the daemon sources?

As far as I remember, we didn't need it on any of the platforms up to
and including SM8650, that's why I'm asking.

>
> What is it?
> - HLOS process to attached to audio PD to fulfill the requirements that
> cannot be met by DSP alone(like file operations, memory etc.)
>
> Why is it necessary?
> - There are limitation on DSP for which the PD requirements needs to be
> taken to HLOS. For example, DSP does not have it's own file system, so
> any file operation request it PD(say for dynamic loading) needs to be
> taken to HLOS(using listener/reverse calls) and is fulfilled there.
> Similarly memory requirement is another example.
>
> When is it necessary?
> - When audio PD needs to perform any task that requires HLOS relying
> operations like dynamic loading etc.

This doesn't exactly answer the question. I can play and capture audio
on most of the platforms that I tested without using extra daemon. So,
when is it necessary?


-- 
With best wishes
Dmitry
