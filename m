Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCB561CAA4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750727621; cv=none; b=GKVyYXiLjKGwSnuYbF0llmPk+GFUyUk8nlcRnPJMYWzkjdA8OMgtLnxXCGszI4Q6l1zMFvoILwXh9WUjpalxAJKhqGEfpGBZP7BQuhdYfrRGoMnkbK1S9odtClrF3I2ixbyL7sbOFnOJ7z3tMsmZ3EKuWwLru4I2G0ouIkdZSzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750727621; c=relaxed/simple;
	bh=VGy/OrSdS+zEFlmp155vWuQT9qZwR0kehtJ/PDkK2tU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Sgv+VToMYkwKeDBJUkIqm6F8N7fMeJ1Oz6Dpx8DDC8HhE7Ori2r7ObNvQIQQVrbpnM7DkbsteuUTl8LbWk8YsZyoXq6I8iZf3p89TLwbVPa/+NxgmNpeJZnnNqxClPPrvC3FpB1fsnbvHPk1i+v5bGulUcIlkTe4ps/Q6BCoJu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0qZF8Sm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0qZF8Sm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NJBsQH020768
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=omXN1QrVaEAiubR5W6h2cDwi
	TSFzei86M2WLLnOPK30=; b=a0qZF8SmTs7735/XCiRuZZs4mxqKXYVSoc7aUyPx
	dcDwp4CPxO+lr7gNSHJQNWdbUBs2mel9+vucNtHy3iLhzGw8Md3N9hfwsnk/+t4x
	a+zSXB4CwkrgaTy+GJVyPL6nB/eNaxYG4aHm+OytwYR+TtxF7Zd4k+VuRdJgP0Qh
	+W+S8vf/MYauBLwbktii/LMppVIY9lk/1rPyChuUfWXvzHoPU4WzHRarhgPSvgZ3
	gVD//TB+PbhkraPwmK9Gnz8ZoTLCjlLBZoCD11NG6whfNLupawYo0khaL4pMqou/
	I/qvJDXRNTw+emFi8j4o0oFkwkoIdpS5BttrRiDvJS5qtA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3t8fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:13:38 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6fabb9286f9so105595606d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:13:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750727617; x=1751332417;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omXN1QrVaEAiubR5W6h2cDwiTSFzei86M2WLLnOPK30=;
        b=EfH7b6Sx82Ck8m5pDtrX2sGUnhsKVmzrmtHO300NXVaJ4VqGlLwJxmy/10gAOxZSrt
         FBEjup637DHe9vAoUvqi72shK6eO94hRseybugdf7LGLNaPlcQWUbSHNBQdGQeuuagm/
         jJIzf3M1/lFXcafHlEDyCOl2CbNgbydpwao58f4afq9uYcPlCh1tjHG+lPK68F/mbTum
         eE0yragzah0GLxbZDSXGSDDuKgS/7hrC6QTreiXnRBZSNro5UHyDl09zg0Y1HrS6tADj
         R/xlxjZaJYFHZ0oYDT+qk8CWXxT6WIpCdneQxpetcXNyyYLFOgpyFMJaWlW+a0TADvyR
         bD5g==
X-Forwarded-Encrypted: i=1; AJvYcCUsmAuCEjKr3c2aICz6BoOu4VWwqXRnEFPmyZqY0OCeIAEbA/0/avH5rAXR1sGcmEsCXDRzPctnnXbWrrM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5eo9lcXHfRcg/vU3qDKUEGTXetO/6HKjFE8qgWgDqUw4ATRme
	oJvwd8nTs1drA/oHl/tzOxvubwGzjSkKX43o7U0oeIyoWzzBtNK+FQ/LjO6zfu2qPLcUDeoSY6H
	MSXYy/eJI1xu92BkNYk7PCC8wjhDjcuV2YXqSLIhZjpFQv0hXvmMoEPGnHD3WF/RixWI=
X-Gm-Gg: ASbGncv6F1QPLz1c37v/e5D1uUpX4lxgw4wamxgt57V/h1gG/n8punC/msuK7Dji4Jb
	C4aRa72wDOTZ44ZeBD8lJVQEjkIVz8BJns3prdXbsBBmqLrbvebGzWCGm0GAH6L9xhjF14oTHBF
	7zxxXmjZn1KnkA2tGR9SA1RQdqRRvFliSDSwArAw5APx4++xIY89GLWcZLxEX9lkNsFYqG7maD5
	JLvUpjrT6OAQ/RdvcXVNfiZzGRs5TJFpdYpK6tAfn9aG1CDKF1qSs6pC+CqYMZBzw7NmQYUBaJj
	u6jk11Y06nmul+87ZmhCqmjZXLSrB0zajdH64XG4059/LcJdRM1xtLmDeP4I5qK9EAgygNlZMD5
	gtj/RnEefBVi2Q08FD5Job5odMOTIjtpuAjQ=
X-Received: by 2002:a05:6214:4885:b0:6fa:9f9b:8df0 with SMTP id 6a1803df08f44-6fd0a534772mr247011496d6.20.1750727617396;
        Mon, 23 Jun 2025 18:13:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf0auLpYN0CUaZzjP0PLyXb21cf4Pz4vSa1TJZLvFhizd8MrDZr4jH9F8IbE472UXCsUvp7g==
X-Received: by 2002:a05:6214:4885:b0:6fa:9f9b:8df0 with SMTP id 6a1803df08f44-6fd0a534772mr247011186d6.20.1750727616959;
        Mon, 23 Jun 2025 18:13:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b980dd1bcsm14793011fa.95.2025.06.23.18.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 18:13:36 -0700 (PDT)
Date: Tue, 24 Jun 2025 04:13:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Message-ID: <diarijcqernpm4v5s6u22jep3gzdrzy7o4dtw5wzmlec75og6y@wlbyjbtvnv3s>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
 <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
 <aFloifxONXnQbVg6@hovoldconsulting.com>
 <aFlps9iUcD42vN4w@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlps9iUcD42vN4w@hovoldconsulting.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAwOCBTYWx0ZWRfX2Prfx422IjTV
 xUyFeHz1Fnv8lUsPXmPVL78/SrdWVa5x8F7ce6U4Z8qcSdHNjoFMqIdWB/AcTZQcT2UBLB6EUKc
 VBTyM4qUFdfxqC3fMMsX5zC4cRmIQIMiY0uE1Ji8ZQ1DOjM+Jppex6D7OWiOhXlQIkewRk0fXix
 eH2pKmzVcJKDeh5zmKPOqGZCfgHnGMJDU+fgz/7hFmerR4OZtOpHhWS88Ew6NFi0eSpkrIgPeY+
 F/ed1B1Lb4jobQUjbyWlfGXBZO3Co7iWox3wzJ0SZgM2eLaBkivN9olrR5GjpWo5FbnL3We63SB
 J1ViVuKgZ+sKXGbWE1TG/dSVPBZ+a4WSQNM+c02CKTzwTpQBOUD+55ynv7NsZURrB0D55I8keg7
 2QXIGExuLct7zJoOuROzuophMBihE9MWnN85ZBkBDdHRYayepqm8F2CtTC1Bx63yKjF/MwHQ
X-Proofpoint-ORIG-GUID: S-clbjohoJJb2of2_EY0IyS87oAm3-nh
X-Proofpoint-GUID: S-clbjohoJJb2of2_EY0IyS87oAm3-nh
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=6859fbc2 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=kl57v_HrwZeO2vo7P20A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_08,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240008

On Mon, Jun 23, 2025 at 04:50:27PM +0200, Johan Hovold wrote:
> On Mon, Jun 23, 2025 at 04:45:30PM +0200, Johan Hovold wrote:
> > On Sat, Jun 21, 2025 at 10:56:11PM +0300, Dmitry Baryshkov wrote:
> > > For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
> > > update variables in the permanent storage. However being able to read
> > > the vars is still useful as it allows us to get e.g. RTC offset.
> > > 
> > > Add a quirk for QSEECOM specifying that UEFI variables for this platform
> > > should be registered in read-only mode.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > ---
> > >  drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
> > >  include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
> > >  2 files changed, 19 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> > > index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
> > > --- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> > > +++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
> > > @@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
> > >  	return status;
> > >  }
> > >  
> > > +static const struct efivar_operations qcom_efivars_ro_ops = {
> > > +	.get_variable = qcuefi_get_variable,
> > > +	.get_next_variable = qcuefi_get_next_variable,
> > > +	.query_variable_info = qcuefi_query_variable_info,
> > > +};
> > 
> > It looks like the efivars implementation does not support read-only
> > efivars and this will lead to NULL pointer dereferences whenever you try
> > to write a variable.
> 
> Ok, efivarfs seems to support it, but you'd crash when setting a
> variable from the kernel (e.g. from the RTC driver).

Ack, I'll fix it.

> 
> > Also not sure how useful it is to only be able to read variables,
> > including for the RTC where you'll end up with an RTC that's always
> > slightly off due to drift (even if you can set it when booting into
> > Windows or possibly from the UEFI setup).
> > 
> > Don't you have any SDAM blocks in the PMICs that you can use instead for
> > a proper functioning RTC on these machines?

I'd rather not poke into an SDAM, especially since we don't have docs
which SDAM blocks are used and which are not.

I think the slightly drifted RTC is still much better than ending up
with an RTC value which is significantly off, because it was set via the
file modification time.

Anyway, let me pick up some more patches in the next revision, maybe it
would be more obvious why I'd like to get R/O support.

-- 
With best wishes
Dmitry
