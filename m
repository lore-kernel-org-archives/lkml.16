Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0C37080E
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747661364; cv=none; b=olYEPESa5wbIAbckDEgUJkRFas/dElyrKMnWYMGkvHc7yZRn8fDM3kjRH5ru2M47FdAnRQPOg2mbRrBVFlCWOncvOyksxBEQNEzT5rCIPBrCEsVrpUq03F8RsjKj57gnbS2BV/U386QpnYX+vz2DXSJOiGs9mX495/QftpXTSBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747661364; c=relaxed/simple;
	bh=E8Yk4YKzzGOL9dH3lsguXKGcmyCh5ke1/36ZV7fbMb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAQDpe4cwZ3qgaYm+BGg3yNmEbPp63RNel0ltg1PTpyaxGcYfeg1ktTxnqBPXq/8vmJkfN+tmqAoTAaLONGjPJFtQoot2s7SJqpMjiz0WzxWinEOE5emDDjKMS9GphreR3+dESeixwtvW3vhdTcqoRQUH2e1YUnc0U3j/CM0Gpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A37TzS4+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A37TzS4+"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JCNr6u014390
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:29:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yCXrYhZQYmD6oU2A5edwO+kT
	+iKltb67bwD0nDazFII=; b=A37TzS4+dhndbh7AeY9R61JWnmdiuCHd6GxsSiPH
	XtXyIEJJMSiwm731FVKw279A4Rsl6Xg4QeGmkspitMKEBRQrpyv2aJ3j3BnOPlDG
	HoaJmfoGAMvbOPkR2MuXaXheHpna1xTAbTDny6sux29CYJHHl2qQWWlVY/l2fH8n
	xejI49ABh9sOzSqK7mbT2zcv2PHvTQ+PojrxPATg2iuonEsOFZun7+pBjLrZ8Ho9
	A6q7upTaLmGNzE5kcEkBz0szmeu76F0DD+43Tqno3COzY7RSdnvcr4u4iVglv9Vw
	YVJHzj3uNF9eMLl5sPx6AgXyArGwCOLYzDtkS9D/mxMJjQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46qwenhhrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:29:21 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so3369446d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:29:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747661361; x=1748266161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCXrYhZQYmD6oU2A5edwO+kT+iKltb67bwD0nDazFII=;
        b=cDHu1wle3n9IsiImAEUKWljTl+D8V9AdBzm5P2WDZihbQVrD9gPuD+LIDkHum8f0xl
         0DcE9WQiEkDKEmUNCKgiRb8a23LETH6/oHxvsQMIFcsUNdUP1X5yjjVey0AagZrzGpPy
         o610nQlkTR2+ELkJYMQGVCcTxpPFZcsUP9LQBJ+R0occnJejulKpgsi+3uJ635DhBMVF
         aBLCAcamtEGItj6hsDH8x01d4q/3SPchkBjmkEpl6I1v/zJHy3dmRTiXYhrAbZQ7WfVP
         3a1BD3C/xO1XTOEnlOcE72pWic8jSEBa+4xj93B0c8Yc5nHQjaUJGvKGsHX3b6NDc+CY
         xQlw==
X-Forwarded-Encrypted: i=1; AJvYcCUHDQezWmNYZsPJAdte340mXgI96XIPCuSOenjxGHOQogdG9NwhU7uH2BLkdYpR3Sb213ye/xeNapS2u9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn+YQ+SYh6HopsQU7a4shrLb4hnzXu8lKISmfw7p0sVKnsakNs
	Zc2PmCeHy6647oKpO5rao32IHNWZ3lEFLm/3yYm691QyOqBuXsDFle/Up/u2AbcLOqSyct9FBHh
	atWGHWcb1G4RGclR8Og/P2vkXM4VrH4eB+FQcW8rhZ9ASR0Xya/x7KxJhfu8ojgCrqMY=
X-Gm-Gg: ASbGncvcKCrs9k+c9T8MyetEFStL/jGvvr7dM0VgM5bs1gWIVk5MI4hntnjvAOxNda0
	Jm1fJMUp6j3DZlYnE5BoNuibzR9XWHpeYFB8/p60tktEdJH79IY5Nt6IGrDTpPQ2kNJmEUaFTYe
	MXYxT/PPdhUt/Az7C2nAddKGMDboYQPO+TMyvF/5qDoYFX7wbPJET/csRxI0IG1RvEeWb70MZJG
	BAejjuZ7hABDtHh39J9tSA04KtAHmxbJlNSJb3tQswuVtjrFu1D9IDWxJPOkd4c3xBLI2HcJF5A
	STniQ09iND0QUxJNBqERoht5eLf4IjuURxUl9itv3HZJdI2DGIZVge9uJimjZdOAIOZ9SIHmdtY
	=
X-Received: by 2002:a05:6214:f0a:b0:6e6:6505:ceb2 with SMTP id 6a1803df08f44-6f8b09024a5mr232402146d6.36.1747661360972;
        Mon, 19 May 2025 06:29:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3rI1V/ERgBIDo4kWBtOHyZPM0eXvcKh2xnWOKsYh+CbN/YsCOa2sGfsQeT+Uoo+59e9dIGg==
X-Received: by 2002:a05:6214:f0a:b0:6e6:6505:ceb2 with SMTP id 6a1803df08f44-6f8b09024a5mr232401726d6.36.1747661360623;
        Mon, 19 May 2025 06:29:20 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702c9d8sm1877106e87.181.2025.05.19.06.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:29:19 -0700 (PDT)
Date: Mon, 19 May 2025 16:29:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1 2/5] misc: fastrpc: Move all remote heap allocations
 to a new list
Message-ID: <tdae3jb7zbkbzvk546j5jnxnfkeux2bwrbz3i5gsehecj65n7v@2hseuptlk2a2>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
 <20250513042825.2147985-3-ekansh.gupta@oss.qualcomm.com>
 <sgfcaujjpbvirwx7cwebgj46uwlcvgr4cgcnav5fmwmjsf4uku@iytanuqqiwxo>
 <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71eb4b35-51a3-411c-838d-4af19631325a@oss.qualcomm.com>
X-Proofpoint-GUID: -H-gr_ydH4K3c95hbutvM3ekdWUUR6c5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNSBTYWx0ZWRfX9UI2hqOs7b71
 DYf5tBkrIdmA5xrzp2PkET9OWZ73TDexOU+lrI+eBYd5iQ6uJ3i+Mj0YjywORX1XmjfFLZqD5jZ
 yMfc4GBZlXpCHXOzc+eqAjeMvxLily2iYR2SP9D0eDLg25qeg3n/caHGJLKb0Z1B8fxv6vX9u3s
 c3nSDPApQqRAkLKzLGxE18zcjU/aLuwb3XYGwXhgRBV40UvS1gDioMtSaSNiAs5kBPkbfAYGPtO
 FokMrh6STuoxKSuet3WA1OIuYlNhUuxOjbo+E3Jx/T/RO9SesrFTrKblwVrjsioCHnqWlDdAxEK
 ictgNiJzaNjdgshTQ7n+bljIDY6S+ub3s6odqimvlIV1SsqZ+l6P4h74GYUm/7/wuTkkjUVcx9u
 vjL1EWFM1FMfzpoicKTZog4oIQGoabXguzhLACe3+cxmo30Xoqe3NWhmAxdgnwscosl9baHk
X-Authority-Analysis: v=2.4 cv=Wd8Ma1hX c=1 sm=1 tr=0 ts=682b3231 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=adbQxVoRvbMUv2LSGikA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: -H-gr_ydH4K3c95hbutvM3ekdWUUR6c5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190125

On Mon, May 19, 2025 at 04:36:13PM +0530, Ekansh Gupta wrote:
> 
> 
> On 5/19/2025 3:46 PM, Dmitry Baryshkov wrote:
> > On Tue, May 13, 2025 at 09:58:22AM +0530, Ekansh Gupta wrote:
> >> Remote heap allocations are not organized in a maintainable manner,
> >> leading to potential issues with memory management. As the remote
> > Which issues? I think I have been asking this question previously.
> > Please expand the commit message here.
> This is mostly related to the memory clean-up and the other patch where
> unmap request was added, I'll try to pull more details about the issue
> scenario.

Thanks.

> >
> >> heap allocations are maintained in fl mmaps list, the allocations
> >> will go away if the audio daemon process is killed but there are
> > What is audio daemon process?
> As audio PD on DSP is static, there is HLOS process(audio daemon) required to
> attach to audio PD to fulfill it's memory and file operation requirements.
> 
> This daemon can be thought of to be somewhat similar to rootPD(adsprpcd) or
> sensorsPD(sscrpcd) daemons. Although, there is a slight difference in case of audio
> daemon as it is required to take additional information and resources to audio PD
> while attaching.

I find it a little bit strange to see 'required' here, while we have
working audio setup on all up platforms up to and including SM8750
without any additional daemons. This is the primary reason for my
question: what is it, why is it necessary, when is it necessary, etc.

-- 
With best wishes
Dmitry
