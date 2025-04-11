Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A020293B6D
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744359922; cv=none; b=DJhBhA9llJOze4P0BVQmJ9T4AJ8lHb8Kug55JNthg1LyUl/zFUhxNEiMSsXkbux73PtBouARnOSDhjVTIAEEXNSXozE3aA2Me4RRk63YAZVZjjiLelhl/gnaw8b8rZ/siOcq4qiGblTVHcfpfapBD6nADFiv2Zp13m+DDB9g1yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744359922; c=relaxed/simple;
	bh=DFEHwYI9rVelR3BcP/YQU9uSGyGHb49B/GJRonMMFkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QITpDn7SuZPu7ngDc1PwJIfhO4WJuw0Wk5JbjpbAusQyMvSjp+6UECzF05cz/QlM/q/dJAIQjUC0iFHlPOTybGcJphB0It4vCwldgN5apvZXls2NFyJmqPciezXOqKmGjWovGPdYD9JUxQULYbws0eGC3MZKzrC0mbxold2RreY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NvsYUHOH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NvsYUHOH"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B4luu2019665
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	acPZ4ugkuuEf4hjqppVya/+B+qvZwDLed16PbNGyT6k=; b=NvsYUHOHXQ5T8sge
	7nmI+PeV1opufCy/tq/PHL65ZWSwAwNxUXJZ6WjxHWgwfhXxfXbgEuobsS98uQw2
	lmaCwlKKGjUYrfaHCcIVOlgxII/JQ0aDXLQvLNHQLix2aqnjyOKF0IqO+/mWtvIp
	zs4ysgQpJDQDNlB9ElwgR38kUWDwMws+sBwRazXUiDKcu1NRlBXqKHIW3liga4Wx
	LzPVexN2aJilb0Hy0BfnG3cq3koZBPaE0RuiJ+sPmNblNPl9bHmnat+F3ryjC7ZC
	2cTeQEfAfVdLmPkK6yk+zZNqr//Aww9n/KCBNrBkXsX5qeqn4ZnhcqanIxbSntCY
	Xu/iSg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrsw41-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:25:19 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-736cb72efd5so1605263b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744359917; x=1744964717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=acPZ4ugkuuEf4hjqppVya/+B+qvZwDLed16PbNGyT6k=;
        b=wkkpDdihEdd4vMII07Ndob10nkHS2PnKBmzeXKiypP6SUAsB97AEU7Sgds63y8j0W3
         CXPkqsRl9Ltj6lICQ954WWwjNXGh6rVYZkC/lCtyMuKE9yiATB6xIKLu5CPOjEmmcId8
         yIQp46O5WUJwKQ9ddip/PnaLy8DZZTIShGf6qQJ88lz44folFKXtzw0wQuKqO/BfDqkk
         4gAQ2KI4GvPPL2Az/qTtwCtqdfzGliabyECsiZpjVwzHNBR8jhACrnt44wAxSZhq1A3l
         Hk2uLiFTQjctIhP99GXpAU4O8vcWVEAy/V9X45DdjTjYH/7DX61fPiyVxuAHgEpT0eCz
         GX1g==
X-Forwarded-Encrypted: i=1; AJvYcCUhFgMZ7YQWp8eC5ndF4srNYsojjqJF3R9UFq+ahHvKXe/YbO9udb7VVP36nI8d71PyYdGCFe1v+7erMtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0pyqu6rSQrykxRhOlULSYCOGUPoDY8xki1MtQnd/QhUEPKMxr
	upWmO2RK0i1wZrJQhWpYi+MZ4aebiPjRZ4A30fGRsoy6Gfw5nGhMFw2ZTi+8IK6CsSQJZV8Kx/T
	lobRy438l9JD0/qqc2CfWZUI3Tp7wBciojZaPeLL7xYv1pE8n28kJKY59itLTfPA=
X-Gm-Gg: ASbGnctij5t7ZWoP8mBgbjNlvvr8gqIWI1R1L0bndV7kQ6GA/K3HApcLqcPAfZa/PE0
	LOda92tBeXUCdmS+JW/gf5WKnBC2WNPTebQE5bdfixhn3ETHnE99USxZo9VbfSDsaGXGEhHfXVd
	+pRjTPPgsZRsKGaHlRD33wvSBa+mgraw/kkQ6JLMXjOtIiYMDr4dZ5wwMyKLzWNON3ewsrM1Q42
	yWEYiB4VwTAX0wdafhYq6PQO9WTN/0W4lCY97GtpQsoe6oAt0sA5Kl/NogJ121TqRXFqvZ+DkhQ
	L75S4kmQcyM/zpHv3F8bCNohVEAXnS8th4tz
X-Received: by 2002:a05:6a21:32a2:b0:1f5:7007:9eb7 with SMTP id adf61e73a8af0-20179983274mr3130884637.37.1744359917533;
        Fri, 11 Apr 2025 01:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGf/yDIti3vULh6ct7+T4yDuSTfe9j7Wfzot0G78yH4iaP8e0+/c/Dj17WpHRm7uU+QR65Zw==
X-Received: by 2002:a05:6a21:32a2:b0:1f5:7007:9eb7 with SMTP id adf61e73a8af0-20179983274mr3130850637.37.1744359917112;
        Fri, 11 Apr 2025 01:25:17 -0700 (PDT)
Received: from [10.204.65.49] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd21c62c3sm937039b3a.52.2025.04.11.01.25.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:25:16 -0700 (PDT)
Message-ID: <e1c23027-94c3-4fdf-b842-b154179aa2b8@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 13:55:12 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/4] misc: fastrpc: Add debugfs support for fastrpc
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, quic_dsi@quicinc.com
Cc: Greg KH <gregkh@linuxfoundation.org>, srinivas.kandagatla@linaro.org,
        linux-arm-msm@vger.kernel.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20241118084046.3201290-1-quic_ekangupt@quicinc.com>
 <20241118084046.3201290-5-quic_ekangupt@quicinc.com>
 <2024111804-doze-reflected-0feb@gregkh>
 <c3b285b0-33d1-4bfa-b8ab-6783ff5ed78d@quicinc.com>
 <cn7pqvhw4x4y7s5hbgzjpvyjnw4g6hoyepic4jai7x2fjdenxr@ikr4hkorbuwb>
 <365c4709-b421-4af8-b521-a195630242de@quicinc.com>
 <nsaq3zungvyhuikz35arvxmle2fovxh422jpyqxuleh57ufqnk@bekeh7qr7y76>
 <697e90db-6ecc-44ac-af86-6c7f910fc902@quicinc.com>
 <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <CAA8EJppbptPryu_O3G3YAapHT=Ai+MAdA38FtSU=YvWb+mqa1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KE5iv9tA3aPZbIslKLvcDccVLpMVtODu
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f8d1ef cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=bRUorU-10DnGX_eTzEgA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: KE5iv9tA3aPZbIslKLvcDccVLpMVtODu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049



On 12/3/2024 5:27 PM, Dmitry Baryshkov wrote:
> On Tue, 3 Dec 2024 at 07:22, Ekansh Gupta <quic_ekangupt@quicinc.com> wrote:
>>
>>
>> On 12/2/2024 6:18 PM, Dmitry Baryshkov wrote:
>>> On Mon, Dec 02, 2024 at 03:27:43PM +0530, Ekansh Gupta wrote:
>>>> On 11/22/2024 12:23 AM, Dmitry Baryshkov wrote:
>>>>> On Thu, Nov 21, 2024 at 12:12:17PM +0530, Ekansh Gupta wrote:
>>>>>> On 11/18/2024 7:32 PM, Greg KH wrote:
>>>>>>> On Mon, Nov 18, 2024 at 02:10:46PM +0530, Ekansh Gupta wrote:
>>>>>>>> Add changes to support debugfs. The fastrpc directory will be
>>>>>>>> created which will carry debugfs files for all fastrpc processes.
>>>>>>>> The information of fastrpc user and channel contexts are getting
>>>>>>>> captured as part of this change.
>>>>>>>>
>>>>>>>> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>>>> ---
>>>>>>>>  drivers/misc/fastrpc/Makefile        |   3 +-
>>>>>>>>  drivers/misc/fastrpc/fastrpc_debug.c | 156 +++++++++++++++++++++++++++
>>>>>>>>  drivers/misc/fastrpc/fastrpc_debug.h |  31 ++++++
>>>>>>>>  drivers/misc/fastrpc/fastrpc_main.c  |  18 +++-
>>>>>>>>  4 files changed, 205 insertions(+), 3 deletions(-)
>>>>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>>  create mode 100644 drivers/misc/fastrpc/fastrpc_debug.h
>>>>>>>>
>>>>>>>> diff --git a/drivers/misc/fastrpc/Makefile b/drivers/misc/fastrpc/Makefile
>>>>>>>> index 020d30789a80..4ff6b64166ae 100644
>>>>>>>> --- a/drivers/misc/fastrpc/Makefile
>>>>>>>> +++ b/drivers/misc/fastrpc/Makefile
>>>>>>>> @@ -1,3 +1,4 @@
>>>>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>>>>>  obj-$(CONFIG_QCOM_FASTRPC)      += fastrpc.o
>>>>>>>> -fastrpc-objs    := fastrpc_main.o
>>>>>>>> \ No newline at end of file
>>>>>>>> +fastrpc-objs    := fastrpc_main.o \
>>>>>>>> +                fastrpc_debug.o
>>>>>>> Only build this file if debugfs is enabled.
>>>>>>>
>>>>>>> And again, "debug.c"?
>>>>>> I'll add change to build this only if debugfs is enabled. Going forward I have plans to add
>>>>>> few more debug specific changes, maybe then I'll need to change the build rules again.
>>>>>>>> diff --git a/drivers/misc/fastrpc/fastrpc_debug.c b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..cdb4fc6845a8
>>>>>>>> --- /dev/null
>>>>>>>> +++ b/drivers/misc/fastrpc/fastrpc_debug.c
>>>>>>>> @@ -0,0 +1,156 @@
>>>>>>>> +// SPDX-License-Identifier: GPL-2.0
>>>>>>>> +// Copyright (c) 2024 Qualcomm Innovation Center.
>>>>>>>> +
>>>>>>>> +#include <linux/debugfs.h>
>>>>>>>> +#include <linux/seq_file.h>
>>>>>>>> +#include "fastrpc_shared.h"
>>>>>>>> +#include "fastrpc_debug.h"
>>>>>>>> +
>>>>>>>> +#ifdef CONFIG_DEBUG_FS
>>>>>>> Please put the #ifdef in the .h file, not in the .c file.
>>>>>> Ack
>>>>>>>> +void fastrpc_create_user_debugfs(struct fastrpc_user *fl)
>>>>>>>> +{
>>>>>>>> +        char cur_comm[TASK_COMM_LEN];
>>>>>>>> +        int domain_id, size;
>>>>>>>> +        char *debugfs_buf;
>>>>>>>> +        struct dentry *debugfs_dir = fl->cctx->debugfs_dir;
>>>>>>>> +
>>>>>>>> +        memcpy(cur_comm, current->comm, TASK_COMM_LEN);
>>>>>>>> +        cur_comm[TASK_COMM_LEN-1] = '\0';
>>>>>>>> +        if (debugfs_dir != NULL) {
>>>>>>>> +                domain_id = fl->cctx->domain_id;
>>>>>>>> +                size = snprintf(NULL, 0, "%.10s_%d_%d_%d", cur_comm,
>>>>>>>> +                                current->pid, fl->tgid, domain_id) + 1;
>>>>>>>> +                debugfs_buf = kzalloc(size, GFP_KERNEL);
>>>>>>>> +                if (debugfs_buf == NULL)
>>>>>>>> +                        return;
>>>>>>>> +                /*
>>>>>>>> +                 * Use HLOS process name, HLOS PID, fastrpc user TGID,
>>>>>>>> +                 * domain_id in debugfs filename to create unique file name
>>>>>>>> +                 */
>>>>>>>> +                snprintf(debugfs_buf, size, "%.10s_%d_%d_%d",
>>>>>>>> +                        cur_comm, current->pid, fl->tgid, domain_id);
>>>>>>>> +                fl->debugfs_file = debugfs_create_file(debugfs_buf, 0644,
>>>>>>>> +                                debugfs_dir, fl, &fastrpc_debugfs_fops);
>>>>>>> Why are you saving the debugfs file?  What do you need to do with it
>>>>>>> that you can't just delete the whole directory, or look up the name
>>>>>>> again in the future when removing it?
>>>>>> fl structure is specific to a process using fastrpc driver. The reason to save
>>>>>> this debugfs file is to delete is when the process releases fastrpc device.
>>>>>> If the file is not deleted, it might flood multiple files in debugfs directory.
>>>>>>
>>>>>> As part of this change, only the file that is getting created by a process is
>>>>>> getting removed when process is releasing device and I don't think we
>>>>>> can clean up the whole directory at this point.
>>>>> My 2c: it might be better to create a single file that conains
>>>>> information for all the processes instead of that. Or use fdinfo data to
>>>>> export process / FD information to userspace.
>>>> Thanks for your review. The reason of not having single file for all processes is that
>>>> I can run 100s of iteration for any process(say calculator) and every time the properties
>>>> of the process can differ(like buffer, session etc.). For this reason, I'm creating and
>>>> deleting the debugfs files for every process run.
>>>>
>>>> Do you see any advantage of using fdinfo over debugfs? I'm not sure if we can add all
>>>> the information(like in debugfs) here.
>>> Which information is actually useful / interesting for application
>>> developers? If not for the fdinfo, I might still vote for a single file
>>> rather than a pile of per-process data.
>> I have tried to capture all the information that could be useful.
>>
>> I can try changes to maintain single file for all active processes. Having this file specific
>> to a channel should be fine, right? like fastrpc_adsp, fastrpc_cdsp, etc.? Each file will
>> carry information of all processes using that remoteproc.
> I think it's a better idea, yes.

Hi all,

I'm adding Deepika <quic_dsi@quicinc.com> to this thread who is reworking
on this patch series.

//Ekansh

>> --ekansh
>>>> --ekansh
>

