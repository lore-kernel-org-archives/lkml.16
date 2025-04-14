Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6F51ACECD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:48:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744616937; cv=none; b=d20Zyp8X2+DMmksX7uOvoA77Ll0RcsnomQqKoO0Wsj59ydyGL1HWyS+L3jleiSkOiZVHm5q29avJaBTwrlElbZVuSlBjNKfmUUsAIT5GyERHKniJ8rD/RBGCPQ2pOR3hMHFYi49mz/krES6phE13GI6/6g05Xwqd+GF+HHGKc3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744616937; c=relaxed/simple;
	bh=MBjGe+/889eZoCKXehK23bjG7557Kqnfw3bdu0NcfEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fa7yp6AZG7oGLyqOSy9frglniS5WSLz0nU1EKPw5R9SJkvzUeSW60F9/1/WG4H+fU3o/8pcaeXeJjkyzvlNhjUyKVNy/XGiLeeZ/r8vm2AeTGvvXqRYJbdVc7h+RHj9C+Xeb27lCb3JrIMfErQWOD5m7gBUxE2F0vcrdUuo6y+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KYB3yXjF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KYB3yXjF"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DKMP1Z032031
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KREhxuaFak/oxjveI0zqqLhsiLntJShK9e09yzhhoY=; b=KYB3yXjFaHcLToGq
	qsdrkdEWzn38xTXrvVPyOJotp/zSFvebtnb07qPLfx+zSqrMLfWYkC1ZN7o5IMXp
	RXpIzhczM1LRkP+NTtXqTxWhTE9+7hr0bTaKS3r7zbwy8KVMLoOb72BtbpqqFEIG
	qSrEC+lPMjaoZVE/zfmXA+p8be1TLVLdZ3Jmy3Je3WOQDtKDyc6pKBVCBxPJrgb2
	tAgsTx7JrIfR54RvQvKTrgjpGMYchTUGe/aRBRjCmfUrd71Igtg8D0OzrEMqEWoY
	qyCWQT2UBfh5YkJQGlAvrBGi55ef6XyZtE4F1FBVngq3QT29KwQRH2a1XoTlcJlP
	Q+e1aA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydvj3vrf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 07:48:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c572339444so564775985a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 00:48:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744616932; x=1745221732;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8KREhxuaFak/oxjveI0zqqLhsiLntJShK9e09yzhhoY=;
        b=YPLcDb4fOi8IpqVHUu2LHF6qAo/vQtxmNib9Hqpd6QC5CUOH0s02eop8xGGh4weHcf
         bKnrAszMvPlwzqhLkGr7e2G962QqunvtdNQaposFpSBdmGTg7gnT+fvsBSfcKgpuxRFa
         vNwaEtixfw9j3GBPCG8MXg/uI+yq0O+bF4HHh7i0R2eUBWs4zovUifT3CJeImcMbHi7h
         otVUUs3JCXvDTwv0fBZPs+uIrytQwqE7t043BIoUj8is1N80vzHuDJn4Vj1ael8alaiB
         sH99Ks3XSO25/sLLLtLyZUtql+brhTk/l7c/Jkqrgq5RaDnF1/McoqYou1Z9CfoYAO9b
         mclw==
X-Forwarded-Encrypted: i=1; AJvYcCUydQK5/ROjr4t8SRdePjpXAOE4ljV5Ul/4cCOCpP/Faqur/OHnoqar3T3YkgQetxiItyuYVOInk4oALNw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT1yX51dHuxWeepPodTaM95/W3UWmwwsLxsz8K9FnIk5Lmy2Lr
	IjXE0XygS4fI+MEiJiT2HahbjigDlKDsYkDV1VJYqqjLdZQq3+kIH8+c6+Xd9ms3O04Ez0ZR0oF
	tCVPOjE1FJXQpzdLlSUJlqoB9FcsVDrDDVrBrqYkeo8tGlbR0U6ZAktAFrAG0LTU=
X-Gm-Gg: ASbGnctvAI/sKELpjpXQOC9eA4F0zxm0P21ZiwnIURDrhfHB9WKyYngtzSbsFbXoczo
	TIK8UAEexthRpJSjEjfQ8uyUxkZYmHngF1oWjWVRl0Ht9WYlhuSmqdHiYZ0WbkxEbe92lc0tLE2
	dVB+OHcbNdm7iCUMNiA4e/THRv4ZILhw6/qmv2Fx5dITSmUUhjixOMFu18p9uWvcQIkPCnIVHmK
	6i6/Okr+PkhQOTZ1i3itFh6zh1tRsR2Y2RWC3l2TO3t77Bphbf2DX4VbySl7gzM47bKasJzQ5Ot
	/He8+6avQhaXkGpun9d3Lm+d41ag7BonJWt/ccBbsfBLO18lghiQXwRRzHow5vg3h71vS2noGck
	=
X-Received: by 2002:a05:620a:294f:b0:7c7:9813:4ad9 with SMTP id af79cd13be357-7c7af12ecabmr1855493985a.58.1744616932376;
        Mon, 14 Apr 2025 00:48:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELuwZiuGPOp2ywagbb8DlbtGjDVWS3p1pK1YfIAR7tk7an46KHKZ21m6K4NMeRUXXe8ijK9Q==
X-Received: by 2002:a05:620a:294f:b0:7c7:9813:4ad9 with SMTP id af79cd13be357-7c7af12ecabmr1855491385a.58.1744616931836;
        Mon, 14 Apr 2025 00:48:51 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d238d5dsm1019115e87.93.2025.04.14.00.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 00:48:50 -0700 (PDT)
Date: Mon, 14 Apr 2025 10:48:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Deepika Singh <quic_dsi@quicinc.com>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
Message-ID: <pczibldk4nzu2zvyca4ub4kxiyvismuy46a4rcxkqwy7ncaf4d@ktm2vpaejdmg>
References: <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
 <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
 <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
 <a3addff2-1ee6-45aa-ac2c-693ffe804948@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a3addff2-1ee6-45aa-ac2c-693ffe804948@quicinc.com>
X-Authority-Analysis: v=2.4 cv=ZIrXmW7b c=1 sm=1 tr=0 ts=67fcbde6 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Hs2GHKzTOm3QEpZ-OeEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: BhL1plMQlO-zndTpl7DXYlSo1tUkScJd
X-Proofpoint-ORIG-GUID: BhL1plMQlO-zndTpl7DXYlSo1tUkScJd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 impostorscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140055

On Mon, Apr 14, 2025 at 12:41:47PM +0530, Deepika Singh wrote:
> 
> 
> On 4/11/2025 1:55 PM, Ekansh Gupta wrote:
> > 
> > 
> > On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
> > > On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
> > > > 
> > > > 
> > > > On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
> > > > > > On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
> > > > > > > On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
> > > > > > > > On 11/18/2024 7:32 PM, Greg KH wrote:
> > > > > > > > > On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
> > > > > > > > > > Add changes to support debugfs. The fastrpc directory will be
> > > > > > > > > > created which will carry debugfs files for all fastrpc processes.
> > > > > > > > > > The information of fastrpc user and channel contexts are getting
> > > > > > > > > > captured as part of this change.
> > > > > > > > > > 
> > > > > > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > > > > > ---
> > > > > > > > > >   drivers/misc/fastrpc/Makefile        |   3 +-
> > > > > > > > > >   drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
> > > > > > > > > >   drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
> > > > > > > > > >   drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
> > > > > > > > > >   4 files changed, 205 insertions(+), 3 deletions(-)
> > > > > > > > > >   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > >   create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
> > > > > > > > > > 
> > > > > > > > > > diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > index 020d30789a80..4ff6b64166ae 100644
> > > > > > > > > > --- a/drivers/misc/fastrpc/Makefile
> > > > > > > > > > +++ b/drivers/misc/fastrpc/Makefile
> > > > > > > > > > @@ -1,3 +1,4 @@
> > > > > > > > > >   # SPDX-License-Identifier: GPL-2.0
> > > > > > > > > >   obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
> > > > > > > > > > -fastrpc-objs    := fastrpc_main.o
> > > > > > > > > > \ No newline at end of file
> > > > > > > > > > +fastrpc-objs    := fastrpc_main.o \
> > > > > > > > > > +                fastrpc_debug.o
> > > > > > > > > Only build this file if debugfs is enabled.
> > > > > > > > > 
> > > > > > > > > And again, "debug.c"?
> > > > > > > > I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
> > > > > > > > few more debug specific changes, maybe then I'll need to change the build rules again.
> > > > > > > > > > diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > new file mode 100644
> > > > > > > > > > index 000000000000..cdb4fc6845a8
> > > > > > > > > > --- /dev/null
> > > > > > > > > > +++ b/drivers/misc/fastrpc/fastrpc_debug.c
> > > > > > > > > > @@ -0,0 +1,156 @@
> > > > > > > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > > > > > > +// Copyright (c) 2024 Qualcomm Innovation Center.
> > > > > > > > > > +
> > > > > > > > > > +#include <linux/debugfs.h>
> > > > > > > > > > +#include <linux/seq_file.h>
> > > > > > > > > > +#include "fastrpc_shared.h"
> > > > > > > > > > +#include "fastrpc_debug.h"
> > > > > > > > > > +
> > > > > > > > > > +#ifdef CONFIG_DEBUG_FS
> > > > > > > > > Please put the #ifdef in the .h file, not in the .c file.
> > > > > > > > Ack
> > > > > > > > > > +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
> > > > > > > > > > +{
> > > > > > > > > > +        char cur_comm[TASK_COMM_LEN];
> > > > > > > > > > +        int domain_id, size;
> > > > > > > > > > +        char *debugfs_buf;
> > > > > > > > > > +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
> > > > > > > > > > +
> > > > > > > > > > +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
> > > > > > > > > > +        cur_comm[TASK_COMM_LEN-1] = '\0';
> > > > > > > > > > +        if (debugfs_dir != NULL) {
> > > > > > > > > > +                domain_id = fl->cctx->domain_id;
> > > > > > > > > > +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
> > > > > > > > > > +                                current->pid, fl->tgid, domain_id) + 1;
> > > > > > > > > > +                debugfs_buf = kzalloc(size, GFP_KERNEL);
> > > > > > > > > > +                if (debugfs_buf == NULL)
> > > > > > > > > > +                        return;
> > > > > > > > > > +                /*
> > > > > > > > > > +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
> > > > > > > > > > +                 * domain_id in debugfs filename to create unique file name
> > > > > > > > > > +                 */
> > > > > > > > > > +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
> > > > > > > > > > +                        cur_comm, current->pid, fl->tgid, domain_id);
> > > > > > > > > > +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
> > > > > > > > > > +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
> > > > > > > > > Why are you saving the debugfs file?  What do you need to do with it
> > > > > > > > > that you can't just delete the whole directory, or look up the name
> > > > > > > > > again in the future when removing it?
> > > > > > > > fl structure is specific to a process using fastrpc driver. The reason to save
> > > > > > > > this debugfs file is to delete is when the process releases fastrpc device.
> > > > > > > > If the file is not deleted, it might flood multiple files in debugfs directory.
> > > > > > > > 
> > > > > > > > As part of this change, only the file that is getting created by a process is
> > > > > > > > getting removed when process is releasing device and I don't think we
> > > > > > > > can clean up the whole directory at this point.
> > > > > > > My 2c: it might be better to create a single file that conains
> > > > > > > information for all the processes instead of that. Or use fdinfo data to
> > > > > > > export process / FD information to userspace.
> > > > > > Thanks for your review. The reason of not having single file for all processes is that
> > > > > > I can run 100s of iteration for any process(say calculator) and every time the properties
> > > > > > of the process can differ(like buffer, session etc.). For this reason, I'm creating and
> > > > > > deleting the debugfs files for every process run.
> > > > > > 
> > > > > > Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
> > > > > > the information(like in debugfs) here.
> > > > > Which information is actually useful / interesting for application
> > > > > developers? If not for the fdinfo, I might still vote for a single file
> > > > > rather than a pile of per-process data.
> Let’s say I am trying to do debugfs read when 10+ or more sessions are
> active per channel, then for pushing data of nth process in a single file, I
> would have to wait for n-1 processes, by that time process data might get
> changed. How do you suggest handling this?

I'm yet to see the response to my question, what kind of information are
you outputting? What is actually relevant? Could you please provide an
example from the running system, so that we don't have to guess?

> > > > I have tried to capture all the information that could be useful.
> > > > 
> > > > I can try changes to maintain single file for all active processes. Having this file specific
> > > > to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
> > > > carry information of all processes using that remoteproc.
> > > I think it's a better idea, yes.
> > 
> > Hi all,
> > 
> > I'm adding Deepika <quic_dsi@quicinc.com> to this thread who is reworking
> > on this patch series.
> > 
> > //Ekansh
> > 
> > > > --ekansh
> > > > > > --ekansh
> > > 
> > 
> 

-- 
With best wishes
Dmitry
