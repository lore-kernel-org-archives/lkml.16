Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2A91284685
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 07:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749196421; cv=none; b=QJ9dlK5nhUixlP9bI+tmPg+HXE00+kKllU3nFl6ytu05CRSgGhCdAcmuC1Jxuznz1TS0IMXMcNCJLXa+z8SZWkavbvZDsDRaLMh0SO63w1KP1MuXlPbvltXGi/LNY3C85jKINDUJXAQciZ+U87lHJThyb7ZV3MJO4ESJXoft9Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749196421; c=relaxed/simple;
	bh=VedvAdrk0UYsIcSq4+g2X7qKC0IU3ySa5DfrStg1g9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o0DMMQ0OJx3KsR6xbHsf0cC59ZNSKU9HwcDnOLzesnPqJCNvl8OwEHrIIYeBm+maP7p37pDR7FK8hRlLUpXvoj9eAyZxCbf/fNERiQhu+lP9AP52sEfcAurkxuxV+z2cloP112z1bEmlWEfp1TeU+K6RgWszh8Aj4TuK0wZUt2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XkPPhlPM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XkPPhlPM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565omXn000698
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 07:53:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c4DWEQmRQ+i2IbBTLmrZiOQE2x9PEkpFgFS9oq7Dy+s=; b=XkPPhlPMJLXyi9f7
	me975QOOnekEnZz2gXeNhHC6aD8F8ZC+x7ecr9nYsKCq4da+xPOTmPHNYN7wY70g
	1wZ38ximQacLDP/AfPlNKXbyLxe+gkcydwv0SYSkggW+822jOl+t9oD3jK5NptyT
	s6nBZPOE1qY/CmrivCjDo6cB+V0eYZayeGgWdo1fM+hhmsmdSY9ZjCzPU5d8TkGw
	v7VZlSGvzCJZ6v37C6UzsB5D1w0MdtqTpdfP4GS+zQueg5a6QFI19QD+qWYY3Gdc
	J1yO6ERnbyhWZvwb/EZwrhUAjv7I0Cxxzv0FepzW7D8TPbGyBfAigPon0SI6QXCG
	HT//lA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8qbwbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 07:53:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23494a515e3so14505665ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 00:53:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749196416; x=1749801216;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4DWEQmRQ+i2IbBTLmrZiOQE2x9PEkpFgFS9oq7Dy+s=;
        b=nnwbxP6h3NHoDea5lgnpEXTuFLfaLGfydADLCogTGWYovzT3EzoviGb9gSWw+imeAr
         vWtka1ePpOFeC4SPGIrFx/umsf4NExwl+Sho9JSMTQHveERpBbYGZLFpzsvC8Ne5VZbp
         T/GwT4/XKM9gFOvcMRnByth8O9es5ulmdvW4FO/OSLpvShoG78gSlfUYrRIWMxcUqyn9
         tGpccws+nphldhnz4rl2oQMFMOzA4F9B5ouvBviU3zdose7zlkaEs+J9HR8DEWQg6uzb
         Eypx4GF2gyMbEetKRo8ka2BEcUoQbGOEqsBxrij1YAqu1GWhKYUO+eeNcKu9Bvtrr3x6
         ekmA==
X-Forwarded-Encrypted: i=1; AJvYcCVeSIV1NeuS9iJuFHep+z5XvMwKY9jucE1wfTGgJAzSHLvg9/XZctnUmQ9FI9bpe+KQsoyWzLjIZJFFdxg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjzZeEbmfsw+AsVLlSDyfVwqkaEP0nSpAxm+L/mZVny67TV6kV
	f9RuR+R/994S7rsv5eBs3UdGJM3hvge6G/8Eflez/nlPdJxsujW3H2Hwcl62qkmCZPch8RFGnOs
	U0KbF0Q1xJwFe8qPLY7ytPCImE1RsoT41FTzf0lueSGwHYrvmXGrVGNzHaXmOCKLZCBg=
X-Gm-Gg: ASbGncvQ90C9BfVOd1FZuKyTNiD1tf8TMd52098SgLDuSRqELZFcp++gHTKDO/Qj4Mh
	+reC9Kmq2HlNjvBASX4Gi56hZYb5NVyH6z1t6nfFyaUpGzwnanukZ/xYffOVEPPalSCbO0x842z
	9g3O2tazCRy+P+J2Il6DuLOPCCTE9ewlVIHaOYIIFEMzGBVqZF3QuJZVlP7PogLe04K6R8xUcKv
	mqW9vbKrFIRcwZAUXAVWc3867hoqBdcZJICUAMfasejR7eK1EgICovbcqu1G18ThSLyl6Z4uDCR
	qgDKgvJMwYEYOftvOkxlJTLiBTF7Nb8riRLq3eGOPtkbPEgKP0avoQDQEV0=
X-Received: by 2002:a17:902:dad1:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23601d16effmr33765605ad.27.1749196415998;
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmLeNT0jN4KGfW+N/v1tEX9Oe0BlAkplrf6kG+pT3ie2tPkD3R+nDj5hUiv2s54Auns9oNpA==
X-Received: by 2002:a17:902:dad1:b0:235:f3b0:ae81 with SMTP id d9443c01a7336-23601d16effmr33765305ad.27.1749196415603;
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fe704sm7056245ad.138.2025.06.06.00.53.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 00:53:35 -0700 (PDT)
Date: Fri, 6 Jun 2025 00:53:33 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_bqiang@quicinc.com, can.guo@oss.qualcomm.com,
        Mayank Rana <mayank.rana@oss.qualcomm.com>
Subject: Re: [PATCH v2] mhi: host: Add standard elf image download
 functionality
Message-ID: <aEKefb87GTR/scbO@hu-qianyu-lv.qualcomm.com>
References: <20250603-standard_elf_image_load_support-v2-1-cce97644e99e@oss.qualcomm.com>
 <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sdhop6vyvt4y63tbbtorqfd5xa4ckbiwxdad5g6zzwlljqvd6q@eoaqmairdeey>
X-Proofpoint-GUID: i12zpTLMG-WzHZ1M51pU5T_zupMu83So
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA3MiBTYWx0ZWRfXyCyOzsEl2CAO
 fJ4TGMpb/cEZ3QnZyZpiT1AC4N5yJQmg+/UZWgjtIAeXjnJDznkp3v4yaTZN9q8MEYqBi/Xgd/S
 tJhD7Cnaqk5DYr7CK419GyHtL96L2DpByCibztoFi9E6/dAyZwm/nuJDWQ+kDkCLb3Jsz3WNxfI
 x0deqtIFgIFfAN+42sxbyIME2GGbrDNDvyvgMCg0j8V+yL1RHqInpZVmEtoADt0xwtWvuLHmM4H
 W5FaNPZsUmbcpxpctuadzI03Rkc8TxlMebIfiv8qyKVP7kBw63QJsyQAS1hAUWvyGm4ka2OkO1L
 gw2p1w1mgkF/waPMeQmjLVbMAxW0IC4bePxNSkK42RB6MBZKkZBHUu5lNff0KWvpqwRtOFxSfmS
 sKTtK+EoLKwpCiZvQMMAOVTrY+0HazHEgmLBHTG/jkYEE21YA+hITZhGNyDU0vd1b+FrYURx
X-Proofpoint-ORIG-GUID: i12zpTLMG-WzHZ1M51pU5T_zupMu83So
X-Authority-Analysis: v=2.4 cv=PrmTbxM3 c=1 sm=1 tr=0 ts=68429e81 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=3eKJ-SLyz9EkZku_pjEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_02,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060072

On Thu, Jun 05, 2025 at 10:34:50PM +0530, Manivannan Sadhasivam wrote:
> On Tue, Jun 03, 2025 at 02:05:44AM -0700, Qiang Yu wrote:
> > From: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > 
> > Currently, the FBC image is a non-standard ELF file that contains a single
> > ELF header, followed by segments for SBL, RDDM, and AMSS. Some devices are
> > unable to process this non-standard ELF format and therefore require
> > special handling during image loading.
> > 
> 
> What are those "some devices"? Why are they not able to process this format

Eg. QCC2072

> which is used across the rest of the Qcom devices?

These devices include TME-L (Trust Management Engine Lite).
Currently, the FBC image is a non-standard ELF file containing an ELF
header followed by segments for SBL and WLAN firmware. The ELF header and
SBL segment within the first 512KB are loaded via BHI, while the full FBC
image is loaded via BHIe.

Due to TME-L limitations, the full FBC image loaded via BHIe cannot be
processed, as it does not conform to the standard ELF format. 
> 
> > Add standard_elf_image flag to determine whether the device can process
> > the non-standard ELF format. If this flag is set, a standard ELF image
> > must be loaded, meaning the first 512 KB of the FBC image should be
> > skipped when loading the AMSS image over the BHIe interface.
> 
> Please explain what is present in the first 512KiB and why skipping that is
> required.

ELF header and SBL segment are in the first 512KiB.

New FBC image format adds second ELF header in the start of WLAN FW
segment on top of current format. After loading SBL, second ELF header
and WLAN FW segment is loaded using BHIe.
> 
> > Note that
> > this flag does not affect the SBL image download process.
> > 
> > Signed-off-by: Mayank Rana <mayank.rana@oss.qualcomm.com>
> > Co-developed-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > - V1 patch is paused because of no user. WLAN team plan to add support for
> >   new WLAN chip that requires this patch, so send v2.
> > - Change author and SOB with new mail address.
> > - Reword commit message.
> > - Place standard_elf_image flag after wake_set in struct mhi_controller
> > - Link to v1: https://lore.kernel.org/mhi/1689907189-21844-1-git-send-email-quic_qianyu@quicinc.com/
> > ---
> >  drivers/bus/mhi/host/boot.c | 7 +++++++
> >  include/linux/mhi.h         | 4 ++++
> >  2 files changed, 11 insertions(+)
> > 
> > diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> > index efa3b6dddf4d2f937535243bd8e8ed32109150a4..f1686a8e0681d49f778838820b44f4c845ddbd1f 100644
> > --- a/drivers/bus/mhi/host/boot.c
> > +++ b/drivers/bus/mhi/host/boot.c
> > @@ -584,6 +584,13 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
> >  	 * device transitioning into MHI READY state
> >  	 */
> >  	if (fw_load_type == MHI_FW_LOAD_FBC) {
> > +		dev_dbg(dev, "standard_elf_image:%s\n",
> > +			(mhi_cntrl->standard_elf_image ? "True" : "False"));
> 
> This print is just a noise even for debug.

Will drop it.

> 
> > +		if (mhi_cntrl->standard_elf_image) {
> > +			fw_data += mhi_cntrl->sbl_size;
> > +			fw_sz -= mhi_cntrl->sbl_size;
> 
> Is it possible to detect the image type during runtime instead of using a flag?
> Also, the flag is currently unused. So it should come along an user.

Perhaps we can check the second ELF Magic Number, but I don't think it's
safe to determine the format by doing such check. Using a flag is simple
and safe.
> 
> - Mani
> 
> -- 
> மணிவண்ணன் சதாசிவம்
