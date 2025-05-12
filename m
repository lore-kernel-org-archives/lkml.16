Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C70F1E5705
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747075616; cv=none; b=KSfQAgL8ZFernbWOyw8cxTnO8GGhbaJZQh+XrhAlLJj80CdEBKhbD6BpHNkE0vSqhMNIIKkDbD4xsNevS0REuRfUTaZbos4nQ9O4wHYApsgLBgQ2zqMSzUI7zHuYs4PeupWB261inTcaMAc7H94WhBS7QACTQP6LamxYQudOyEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747075616; c=relaxed/simple;
	bh=WC0QSSHSaDJIeTky6FYZ5/aW/w4NwUet7G5HfGnRlTY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jw5BTkmE3RcjUZcaasnGaV/zxLT/BVAXwox5eWnK8/6gLA6bbCJVItK7wL+de8j2r6aKxKtvs/7vLQKhcdBre3QqqzYouia5WR/y9Pprqwjra0evMXuExaEp8SVnWJp3YbkZELn6vcDR2f4cxNa80H+BQpQLP4cEPeZbpeOubBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W0l+3+AP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W0l+3+AP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CILjNh025317
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=; b=W0l+3+APuqQo0LFX
	g236I3NUxXGKMXbpA9Ke8JlmNzDqNPDyW4VzT/UwxtmB7CTbs6741vrCtp3yQhxv
	LE3WZP5kQs2r/ac/oIMXrwbK8yZqcKruQ0t5vn32fCUeGvoPyVAGhNxk0dWJJ1UU
	RWjxbP/p/7x8udGOocwqsc+TUG+5tcNpSSQJjcI/Z2mlLNLKMp+0AZ2bxsGgHCr5
	v9gT2V+ETI9JA/WGD4qw3d86DbfmQicXYFccIp/6wsOBKLbynlBxgfI2QOT7Rwz6
	x3foFKY+dql18044P/cwdSvDVc+13ffx1rPJUwChZaXZ4Iw2xmX6pFB/vfJAMgw2
	Q8wYWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hyynw6h1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:46:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e68e50f80so32968665ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075613; x=1747680413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=;
        b=hcgTFS+Dza5sD+tzDJblnljZBkCI5H3s3Cam0+IdD83qM70bgI4U/ZKz89WF8jDB3Y
         VD7h+0R0BNUCUUG2ueO2GdvK5f0dOzmxSrDm804MI92umObBQEGa0YK3E8Q/MxdcbiKi
         4HdZXBxmYyIi6Aj1skZjhMIDlMRz+qZGfUuKO1dzweNY9VHhmReMnCoTCWs7vCXbVEWi
         11ZxT3vfDwS9d5V+/DXwQalpir4wg9dHLB7NXtX6G/Cffnql+I4eujVhvsGAq9dcix2J
         qiUZQHmjRKb2h8eznFmW7wf1BiysHHJlpciTU6i+YO+KG++YrBlgV2TNk5N+C9GrP3Z+
         rg6w==
X-Forwarded-Encrypted: i=1; AJvYcCU3WiDDqMNNKhYdydcxfU6+lPySrhu51o/8WD4JyLP1x3gVW/KD84O6UtbIwEejoDjLIq7n9hOUdaLyO+o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVCHp32cnJwRiXwKNNJqCVmAfHyXRSMPCs6bZbfd2R0knzu+Te
	zVt3YTX8jss8tWCdDXV0z7TvEj4szzLvdM5/4H6ikj/kr2/Fklc8A1zrXo76ZpjMiLGLONAPj6a
	l2VlhbwAybBxTHyQqNH150uYKWI9tFwU0iuJu42lpwcHXazaYcCCU9lW1mjyCnVc=
X-Gm-Gg: ASbGncscI2A7O8S+eZDfsFhhRgJmzH69C6mJ8G0j9bfLsR9NJyAl08NeEmW8wF+5COV
	yZYX5QUgC1RVJ/dBDvgmZCnwsNUeq19yF41aNesVKGj294Ql6vAKQNybP9+hGKfxqGJuC607j6e
	lfP0MREjV9AdlESiypo4ybhpJ7Xrs/vAxTDgkSfA1zVJURMuuaZaQsW4xKelWoicZeDrkoCA+/S
	RPcOOwZ5FFm+dMpWGdz+yNjFSKgW90BgOWwUZLTd7KOsl8RwWtQ+ivwm9Ph+S8j8fGaaeG6wam7
	7iqK0Pq9T4n248PrfjMbNOGAfP0TM6yDTa35sUa9u7Ni7c4nT1710tGfc/Hf4A==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280565ad.22.1747075613184;
        Mon, 12 May 2025 11:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsWqOd3L30u9cjxgIPmURHi+KkJtpXwBIuouO1S+U1W3n2h4To43nTOBZ4I/fyhCvVNGYpGg==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280045ad.22.1747075612588;
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544f5esm66669185ad.36.2025.05.12.11.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Message-ID: <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:46:49 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MyBTYWx0ZWRfXztG6li0e/jhT
 8Jr8tJOpcJEvusfYcNMALxY04zqZFXppyxPsVbupDB+Ss4jK0Mi6Dre088zWfJseK3Ya0KFkhYO
 /YTN9GTuUDX1GUcWCX9PWlN/GKm8N/k+ukQRSvn66bZ+Qy43Kr0gbc1lHcNwaUGtvW+TIXAeeAV
 1SjaMdnnupAQwPnNCNcANXRqQx3eLby1S9ttKQEZHA2ViVoiqJq+UnqAImglhthPsoQE2joT3FV
 ieM0xj+ydJiyZrMjd/0WHvibojAp1qaHhzGFvOFY0xCOkhah04ORl65usijSykoerVNGBZrdTWQ
 HqB2ZWi37t7moepecGglAgmQWL/V2/vy7oWFL05tiOZZrnYdDnAErC7t+Xwu+JulAXfnxdIOq17
 fcP2PpAcDBMjFt6z4iaj9CUynaKj/Mv355SP41Jowx7Rh8mLC5zmG+lwWLp7VeIwttEPfzkP
X-Proofpoint-ORIG-GUID: 0jDpYQocr7DS_Q49D_crIDzsFFYKjls2
X-Authority-Analysis: v=2.4 cv=Uo9jN/wB c=1 sm=1 tr=0 ts=6822421e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mx74GWaVK5euFb1038QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 0jDpYQocr7DS_Q49D_crIDzsFFYKjls2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505120193

On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.

Why is it valid to load new firmware as a result of suspend?  I don't 
users would expect that.

> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2..bc8459798bbee 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	 * device transitioning into MHI READY state
>   	 */
>   	if (fw_load_type == MHI_FW_LOAD_FBC) {

Why is this FBC specific?

> -		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> -		if (ret) {
> -			release_firmware(firmware);
> -			goto error_fw_load;
> +		if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
> +			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
> +			mhi_cntrl->fbc_image = NULL;
> +		}
> +		if (!mhi_cntrl->fbc_image) {
> +			ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> +			if (ret) {
> +				release_firmware(firmware);
> +				goto error_fw_load;
> +			}
> +			mhi_cntrl->prev_fw_sz = fw_sz;
>   		}
>   
>   		/* Load the firmware into BHIE vec table */
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index e6c3ff62bab1d..107d71b4cc51a 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>   }
>   EXPORT_SYMBOL_GPL(mhi_power_down);
>   
> +static void __mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
> +{
> +	mhi_cntrl->bhi = NULL;
> +	mhi_cntrl->bhie = NULL;

Why?

> +
> +	mhi_deinit_dev_ctxt(mhi_cntrl);
> +}
