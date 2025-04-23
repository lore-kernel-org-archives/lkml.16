Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA2B19A2A3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745415304; cv=none; b=mi1y65FyofgihwNkeodXGyDC2mnMr8bmRhH/onnrRkR5onNoL9BnG56+FXKAH43vExPVBw/B+RBgkNq+gAtGMQ/K4B7BPq2lHqpPDVVS6i8iGqbCbjdPH6qfuefXvamO/Oh1MmQDs99P1gZmLlmpWa5yo7W/9/QBQUrgYZeVleM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745415304; c=relaxed/simple;
	bh=x1xM099k58e962H/jec7C2ksEWH7T+h7cL/fb7TmtjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IkTmdcaHxEENGYq5RelIOwjxpVvcS5ZCbgGd3gVYgP4//TsvY8QtylwvTzRyLSEkj4gnXrKp/1sMgUgPwmOBeL0cM3pwGRUkPYBandfEX7Bgn1pri2xs3IPJca/al52uJ7p5hsWr6p3rwrWHxBoyKFLjs8thrMB4mc8e62lFNIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mbwdTD0g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mbwdTD0g"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbk8J024513
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gesSST3I2MpEnFmeJa5ypS5I
	NGFvjsE/z3/d2bgX7FA=; b=mbwdTD0gUiHIlzwNnGcBQa9jIH7BinPCACO9hTfS
	z8O+fZDwmsUffir2JzHl2CLmdqpMbDLmWun6cj9bVdLc33PFLLFds7Ys8OG1BkmL
	IoFmNBLeRmHs2NZqKVEwyGj1lauclEzAuPHcRPm9NtwQKYWF9XQWIE/1pdqM/NTk
	Qh9aYR+Wwge19cj31Sr4y/G9KQtEUg7uos3yyWwdH1SDn/46xwVcFhuGsBiQaR6+
	r0BhQ3Fn6xJvHufcvKJNiIQXAtCq5GdO7O1wu6Tnvlyo+r3G6OsjLQE78N2N+36L
	rHwpcejcoQLoV2X895FprXVLJfB6Zglm9dvA2yv+B89gxQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3a8w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 13:35:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b94827so984118385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 06:35:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745415300; x=1746020100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gesSST3I2MpEnFmeJa5ypS5INGFvjsE/z3/d2bgX7FA=;
        b=rBZZCUBRzKeYZohZCuJNtoyKyGnopSwNw1oiMPxP71rOCWWx6v0NZpfRPOVvG3ATY5
         VtJfnWyAqdHwSmKtQkmgoRTMQQ88Ylv/3Qv9DGEp/JFy9RDCXIUfPTjaW+MySqNg26If
         Fvwrf/3wrRhCOPBC+8oW0ordOslItCzH2zOuB7/efdkN/SP0ZdNYu4xAzwlDw62YiXEH
         5mZ60f8xFUyTabMQ7753OfosfY6NsuAOFYZEWZt6gtWyc97yeX5MmJ3O3/HTX+uQ75++
         5DLrFEv9EYoIDj8XUQzvs++fqQTQV+fcFGDJGmhITJD26JmlC5OpAla4B7KEGB7/uTQ2
         DrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTXfzX5vzOfRgkFXcd6bzVCalMnCwwd1WgvUoRSdlrjGEm5wdeB67X+vfRS16Zoe1chnvl43gFhEi/3VE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQlk81sWlox/FRFFYucXqrcJYu9OXv8mxe3AyHb0GubSbUHUaC
	8/c00Y2Bh2jXeKuTvJb/c6fiHpp4NLnh4GBQmWYRcxCVAnikB8pf1RiB1e+eOT2LeJl8Z4MdsI6
	k8bZYjbmMSqP+M6lx+Kew9xBrNrOyXeHkRlkFh2HXOGQZwNVpE4zTqOiKRHjNcUU=
X-Gm-Gg: ASbGncvyOKlfnHE+3LoCbAg9Il9MHFM9oFnON6lrjqOGhpOVJHBqYVoHUxH1JJVvQDJ
	GKQVfPImw41P2q3n9BY5qOBaeOKBnYFNGAZ+pZ6KYZasSe3RwB4gAnRGQ7VsYivqIOrcDvNe30c
	fW5P4y6eBJ6GRUhSfMSH9bzeGFgRTBXp3iKS7oX02ObTLcQ0BehZ8BZSgft93NCkGXqZ+CaQ+PQ
	wbimGLujv3l3xg2T0ri1qNejtwSXou4HqGxa1AkFHKKm+KqQf3EYZG1L3NMk4BNdSgB84yL4+JU
	CyF/8MVKrOKQgi2nMGBR5cz46atgQfUWG+dePhKI30+K4PNcobpazl3QUnK6gt3EsZNtQD/1dyY
	=
X-Received: by 2002:a05:620a:3908:b0:7c7:b4ba:ebf9 with SMTP id af79cd13be357-7c927f98e4dmr3123334185a.22.1745415299657;
        Wed, 23 Apr 2025 06:34:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSwjmlcZib7gDeiGUVw/szN/iy8E/BLJscu+dW5fLmscxF+J7iPAozkJczfQ5JeB0jI4FQ8A==
X-Received: by 2002:a05:620a:3908:b0:7c7:b4ba:ebf9 with SMTP id af79cd13be357-7c927f98e4dmr3123327885a.22.1745415299093;
        Wed, 23 Apr 2025 06:34:59 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5f61a1sm1563103e87.241.2025.04.23.06.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 06:34:58 -0700 (PDT)
Date: Wed, 23 Apr 2025 16:34:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V3 5/9] phy: qcom-qmp-ufs: Remove qmp_ufs_com_init()
Message-ID: <w2fuv2xnvszlbwdlxvakkex6sce2mm32uslft5ma2zvz2gscvd@chgzsflkgxvs>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-6-quic_nitirawa@quicinc.com>
 <zvc3gf7mek7u46wlcrjak3j2hihj4vfgdwpdzjhvnxxowuyvsr@hlra5bmz5ign>
 <4557abf9-bcd2-4a06-8161-43ad5047b277@quicinc.com>
 <CAO9ioeXyDWOhe1cbGO_tR=ppZd1aC0GSdeMzQjir4XmDRMQ3Jg@mail.gmail.com>
 <64216a90-e2e0-435c-87bc-388c72a702c0@quicinc.com>
 <sajcoh34gyfcvhik3yairil65guvp2rt2xdmbmlpmlcjvst5ci@qojbxhmrnrxj>
 <0d763853-5b1a-433e-9fa1-23ea0184b9bb@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d763853-5b1a-433e-9fa1-23ea0184b9bb@quicinc.com>
X-Proofpoint-ORIG-GUID: k7RCPA9kbn5SvzELMC2lfU6skyYqboJa
X-Proofpoint-GUID: k7RCPA9kbn5SvzELMC2lfU6skyYqboJa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA5NSBTYWx0ZWRfXxLeX7D4s2giP orBx1+olXZxca6Ktaq9uBs+GmK7+3NeKAyPVd/Eim1Eka+482rz6GWpN0eLaTMQhNlTOXqcoG8a ir6OCuJr5FQctnLSELZ9R+93cGnfRMMuoxuYwtLXv7gMLXLSql+MdOIxr46vJrEgMiyg7WXmRyM
 rh490FoPlOs5zaYxsFNyFp9Glv4qhqwhr+v918A9QZshCeFLkFwmuGE1UCt5NWbyYPZrHiDbsj4 8a04xXV1HnUDcW3wUPgHtIZ2ide2X9JVwNZDiDD6NXWQyesQwp98K/IRpGu/6ZYm36h1IofJImA TG+gSdndj/lP+26ge07ot1tNeyUniX/jy4aDY7kHh6hPMo7X3dYhp9FU45wF8+aLXIrvig1rXuM
 KPigUCgB51M9Hd5VN8T4wEHJhTvEKOhyVyqGpnJhbyEwAF8EZmHNU9RKKXxmIujVtBotF04g
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6808ec85 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=aCPLThnsKnsU9gi7CwAA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_08,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230095

On Sun, Apr 20, 2025 at 01:38:40AM +0530, Nitin Rawat wrote:
> 
> 
> On 4/14/2025 1:13 PM, Dmitry Baryshkov wrote:
> > On Mon, Apr 14, 2025 at 12:58:48PM +0530, Nitin Rawat wrote:
> > > 
> > > 
> > > On 4/11/2025 4:26 PM, Dmitry Baryshkov wrote:
> > > > On Fri, 11 Apr 2025 at 13:42, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
> > > > > 
> > > > > 
> > > > > 
> > > > > On 4/11/2025 1:39 AM, Dmitry Baryshkov wrote:
> > > > > > On Thu, Apr 10, 2025 at 02:30:58PM +0530, Nitin Rawat wrote:
> > > > > > > Simplify the qcom ufs phy driver by inlining qmp_ufs_com_init() into
> > > > > > > qmp_ufs_power_on(). This change removes unnecessary function calls and
> > > > > > > ensures that the initialization logic is directly within the power-on
> > > > > > > routine, maintaining the same functionality.
> > > > > > 
> > > > > > Which problem is this patch trying to solve?
> > > > > 
> > > > > Hi Dmitry,
> > > > > 
> > > > > As part of the patch, I simplified the code by moving qmp_ufs_com_init
> > > > > inline to qmp_ufs_power_on, since qmp_ufs_power_on was merely calling
> > > > > qmp_ufs_com_init. This change eliminates unnecessary function call.
> > > > 
> > > > You again are describing what you did. Please start by stating the
> > > > problem or the issue.
> > > > 
> > > > > 
> > > Hi Dmitry,
> > > 
> > > Sure, will update the commit with "problem" first in the next patchset when
> > > I post.
> > 
> > Before posting the next iteration, maybe you can respond inline? It well
> > might be that there is no problem to solve.a
> 
> Hi Dmitry,
> 
> Apologies for late reply , I just realized I missed responding to your
> comment on this patch.
> 
> 
> There is no functional "problem" here.
> ===================================================================
> The qmp_ufs_power_on() function acts as a wrapper, solely invoking
> qmp_ufs_com_init(). Additionally, the code within qmp_ufs_com_init() does
> not correspond well with its name.
> 
> Therefore, to enhance the readability and eliminate unnecessary function
> call inline qmp_ufs_com_init() into qmp_ufs_power_on().
> 
> There is no change to the functionality.
> ==================================================================
> 
> 
> I agree with you that there isn't a significant issue here. If you insist,
> I'm okay with skipping this patch. Let me know your thoughts.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
