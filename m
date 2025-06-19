Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 097F52AEF5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750304669; cv=none; b=kHc3klfaviBtLqGAHq58sXbxhkfkyLnZQ6K2CBsI1qcKCqHg+NQ8G3Bwgm6wuzZZd3en9+/aNHwEZVIMwlv3mv0fEMfz28p4hxDOXXO0SZazqKzIVOcTCRrAOqqMDnQKi9JV118vKgNAdnrodhtN++H+D6Oj5lUCdsCS+ZwZEHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750304669; c=relaxed/simple;
	bh=r9bEY7GBNI+f4W0qFdTtSzPy54h3PUtuOsmYJA0PBfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NPc80R43W3XG5DrpVBzR1vlhmlFqe6fmAe8SVmwqUATHyi1r3D7D+5tnpZVGmYFru+UEDLP5jpMZh2uuO8WPOB3s/XP+Z/CxuoUSLtSX3zfXhpRXOD+33wHGBnJMYUcJST6EbG8sLGeISLpht1xYpDXx6lHwxOGzcNn0Tjrns7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RJ9j6xfg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RJ9j6xfg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J2F3FZ007427
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+scRbnc9DB9ul454aKhxI5Nurcon1EsQyC5VkFAXI5w=; b=RJ9j6xfgHY5b9Mrv
	AJxFlkf/IWk7MbgbpcseY8v70tAiKpKhVqEc3AUYV1uoUzfCNxwPnxUmWXZQE5Ax
	YjvqJovDSjVrpKPlXyFWdZv5awQLqjul+bV+xh+KiwZeEBs3YW6FKm6AeM0YLMRK
	h54cmSE+wA0pkovDODCTRDQO4oGJz86fQKOL44qoJkGkCS7AKAS+iA9Gx50Vxub3
	16lOfnQwkrQIDeik0buZs3O9628vyHMQGMDgWWjhzJ+pxfNN9ULB7TJwRKXHdtLb
	YwKsPJgs00K6DL/MgNJ9rz/NBVP+p+uUiH/YGDbesRzps7yS0veRODSHto1qi7o5
	hmbQXQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47c9krr66w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 03:44:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b31831b0335so537618a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 20:44:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750304658; x=1750909458;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+scRbnc9DB9ul454aKhxI5Nurcon1EsQyC5VkFAXI5w=;
        b=La9uXf4ULeQ8or5GwKJB9NRX3AusEEqtIfQO8H/oELznz+P4Nnw+Id2KLZmJO4EJtz
         wo4/EnnUyK0Qluga9s7AZPndI0HBTkO4g0W2fQoHw041dn+VDZWL5zD3x7L1d6H4nv79
         bDuxHXopy+P5rvN8Cd6UqKyuLt6JqV1LCTHlRoAMDWteNVQOAqT8h3wR/c+ZSudCk+2C
         RLO2sQOlCahZR2AZTekWDfSKup6S99gcH6tn8ChoD6cRxd5fL2cUXTrUyLDvK7UesgWQ
         NZEROwIrnzaD5Zx88KFO+mVkpjXaCEoXEzdiWyeHswOH5+Q+36Fy5PyPIDFx5fwoJ6sc
         pRSg==
X-Forwarded-Encrypted: i=1; AJvYcCVZJbycP59jPGWWqs+btM+vbcLE6NshPg3oA4tKMb0oQJbpy00udMmJlp4mkIDJCiJW4H1YNk+2PqpoTv0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUn59jscxFz87XjLM5m5wRchvrsTZRrQTFk7qNRC3ZNmPyjxdC
	EJ6U6RQzo+GqndP2KBlxJBDfPJg73hPF7MJl2ug4w5vEHVgfw1wU/tdzp/UUIFlqLpAeeAlQPIi
	HLJVwl8/rJ61AqDs7pW13XQqroYTGRw6HxUMONQFDBklPlham57ruAfE+1T8Kws7Tj08=
X-Gm-Gg: ASbGncvzcv+PJmiaUVpDZZe4z8/tPGaathXX5WC1Hd5Tlha+KPa05ZNJb7xxPOZUiIN
	StinU4et7dt69dhgrXVBRnVTEIzf6qlJQyI325dTvE+gQVUsn9VRh4Uvj9kQ/EqFLjcgE81O96I
	q7j+OjQfRH5mP8vQQq6wgtbOnBOJghhecSWZiAxsiQLa4yNcI/QL3tTgg2PpJtI7fivDqRlMDJL
	O0jKlZTRZIcv9iiZ0AA17ZiliFH0ra8+UsMG9P2S2XmlEbr/rRnu1h+anD84OMM1kOxiPVVm1W6
	g0sqX56j4dL0EOk9SB2n6k4hflsNt+A9zhipGqIXem7U0ZHZPGZat+Hm+6fC6XCZNZGMgQ==
X-Received: by 2002:a05:6a20:6f89:b0:21f:a8fd:6938 with SMTP id adf61e73a8af0-21fbd57b5bcmr36360064637.36.1750304657710;
        Wed, 18 Jun 2025 20:44:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsdAGHVir91RhaZ0NNhcSSvKvJF/rY80yQk7blyq3sFyZzlQKRDY1UhTZGX3iQt/XLrErE3Q==
X-Received: by 2002:a05:6a20:6f89:b0:21f:a8fd:6938 with SMTP id adf61e73a8af0-21fbd57b5bcmr36360025637.36.1750304657260;
        Wed, 18 Jun 2025 20:44:17 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-748d8093c63sm4556579b3a.57.2025.06.18.20.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 20:44:16 -0700 (PDT)
Date: Wed, 18 Jun 2025 20:44:15 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_bqiang@quicinc.com, can.guo@oss.qualcomm.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <aFOHjw8WZRqI6xVp@hu-qianyu-lv.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
 <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>
 <5g6j4guzrbhl4zqmt7amdgewdusycccsh5rdxlpjbkhjdhbdoa@h6tlwam4i3kq>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5g6j4guzrbhl4zqmt7amdgewdusycccsh5rdxlpjbkhjdhbdoa@h6tlwam4i3kq>
X-Proofpoint-GUID: T3LDAv88ej-VERdNkP2vzBS_8_ZK-vIj
X-Authority-Analysis: v=2.4 cv=UPTdHDfy c=1 sm=1 tr=0 ts=68538792 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=y1Uosm5IMMVjWa0GvE4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDAzMSBTYWx0ZWRfX1h1kuuoM5Soa
 TMl5RXMPtx+H7/uQZFt6zfpLdOmdo7j0JBIuoQay6KhxWKC2D0Vs9LvJ44d4ky4aqWpZ70Eq/0x
 MpJDnU5/P6iyO55sOvF4AxSxNRrcZs+dCjPUD4O+j1AV/AdovfPvQPXjxfrJF3S1+rITj3cSq+z
 USfAlUjDp524NwWbuBalVP8fTjTyTYwBdiQjqUJOgPfFZOLR5oGbfBYogyq4AwCnssnvzt6n64m
 QmeV0OCLFG03tyY2a9NiuBkmybdL1mrLDMYhJjng14Ze0MdlKUSxIuZFNvFZPvUxFYlrkWJ9VIZ
 xRYtaCIaEV+mhdhvw+cVGnslyqcJPib2PWVBijpXDBYatAWJHU9G6ihSLUhClZl2v1DRS4Gb5wM
 MfyJ0pHklVYYpio1ABHIl0GQvan9Vh/s/3ZadYgz+JK+q23+nCwX6qnTJX0IQgg26gmzJ0rS
X-Proofpoint-ORIG-GUID: T3LDAv88ej-VERdNkP2vzBS_8_ZK-vIj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_01,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506190031

On Tue, Jun 17, 2025 at 02:49:30PM +0530, Manivannan Sadhasivam wrote:
> On Fri, Jun 06, 2025 at 12:53:33AM -0700, Qiang Yu wrote:
> > On Thu, Jun 05, 2025 at 10:34:50PM +0530, Manivannan Sadhasivam wrote:
> > > On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > > > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > 
> > > > Currently, the FBC image is a non-standard ELF file that contains a single
> > > > ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > > > unable to process this non-standard ELF format and therefore require
> > > > special handling during image loading.
> > > > 
> > > 
> > > What are those "some devices"? Why are they not able to process this format
> > 
> > Eg. QCC2072
> 
> Is it a new kind of WLAN chipset using the ath12k driver?

Yes

> 
> > 
> > > which is used across the rest of the Qcom devices?
> > 
> > These devices include TME-L (Trust Management Engine Lite).
> > Currently, the FBC image is a non-standard ELF file containing an ELF
> > header followed by segments for SBL and WLAN firmware. The ELF header and
> > SBL segment within the first 512KB are loaded via BHI, while the full FBC
> > image is loaded via BHIe.
> > 
> > Due to TME-L limitations, the full FBC image loaded via BHIe cannot be
> > processed, as it does not conform to the standard ELF format. 
> 
> Okay. These information should be part of the patch description.

OK, will add it in commit message.

> 
> > > 
> > > > Add standard_elf_image flag to determine whether the device can process
> > > > the non-standard ELF format. If this flag is set, a standard ELF image
> > > > must be loaded, meaning the first 512 KB of the FBC image should be
> > > > skipped when loading the AMSS image over the BHIe interface.
> > > 
> > > Please explain what is present in the first 512KiB and why skipping that is
> > > required.
> > 
> > ELF header and SBL segment are in the first 512KiB.
> > 
> > New FBC image format adds second ELF header in the start of WLAN FW
> > segment on top of current format. After loading SBL, second ELF header
> > and WLAN FW segment is loaded using BHIe.
> > > 
> > > > Note that
> > > > this flag does not affect the SBL image download process.
> > > > 
> > > > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > > > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > > > ---
> > > > Changes in v2:
> > > > - V1 patch is paused because of no user. WLAN team plan to add support for
> > > >   new WLAN chip that requires this patch, so send v2.
> > > > - Change author and SOB with new mail address.
> > > > - Reword commit message.
> > > > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > > > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > > > ---
> > > >  drivers/bus/mhi/host/boot.c | 7 +++++++
> > > >  include/linux/mhi.h         | 4 ++++
> > > >  2 files changed, 11 insertions(+)
> > > > 
> > > > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > > > index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > > > --- a/drivers/bus/mhi/host/boot.c
> > > > +++ b/drivers/bus/mhi/host/boot.c
> > > > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> > > >  	 * device transitioning into MHI READY state
> > > >  	 */
> > > >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > > > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > > > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> > > 
> > > This print is just a noise even for debug.
> > 
> > Will drop it.
> > 
> > > 
> > > > +		if (mhi_cntrl->standard_elf_image) {
> > > > +			fw_data += mhi_cntrl->sbl_size;
> > > > +			fw_sz -= mhi_cntrl->sbl_size;
> > > 
> > > Is it possible to detect the image type during runtime instead of using a flag?
> > > Also, the flag is currently unused. So it should come along an user.
> > 
> > Perhaps we can check the second ELF Magic Number, but I don't think it's
> > safe to determine the format by doing such check. Using a flag is simple
> > and safe.
> 
> Why do you think it is not safe? IMO, relying on a flag is the not so safe
> option. What would happen if an user has used old FW? The driver would blindly
> assume that the FW is always of the new format, but the user is not aware of it.
> It may lead to weird FW crash that would be difficult to debug.
>

It's possible that the WL firmware segment could contain the sequence 0x7f
'E' 'L' 'F', which might lead to a false detection of the second ELF
header.

- Qiang Yu

> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
> 
