Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1A2144C0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743452903; cv=none; b=gdfyR9qmkqKi2MBNGC/cxRtraUog8FLN/OGwaMRQS62WwY1FM6BbgMpS/KifoPgDA6OSEM2dPmbY5OER6QN0pbVz1as9LKegZLLLgT2lQZ1g/RjCkelzhuZZMp8/1Pog55ezPEfz8k75P5UF3Sp+lB2oZeO8YVW/zqk8eWia2UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743452903; c=relaxed/simple;
	bh=aeGyfdMZLf7+UsI6/vhKAJEd3wrd0uULXQHq6JP/5gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IfdoAO0fK+1bbgp/z6f7R07X0eh4x/c4YIxvBeeTLQZJynpUr6RAmJ49u8fzO3YDlaJr63Fjke7bg8r1KC6TRP1WGk79FV6upSHpLTuH4ofcO5Ic0gz2oJw6XXgmBARvNBvomgcTuT/6KuSScetgldw+9iZjHFfSI3VpcmkiVVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o6CIYMZj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o6CIYMZj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VFDKoI012624
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3K1rbl6qLD0AtNbSIccTfCXz55A/TcpEH0lxj5Tjkgk=; b=o6CIYMZjS0eTH2pW
	DwtcHer2I2PH2+rmXWG0qUSITBqjCOxqK/ouXEns8OcSAZgvrCtlMdbv4mIO61qF
	j8QLgiV66fCb8Yk+o8LZs4LQ8wmfl8yP8lIq9m4KqKxqo99JWeZUUD8kQl53drp1
	Hj+VvglfDlSRAMsFJTHnblsbDO/pqt74bp3wapT6pWkvD8Gf1oqYylBvfu5PGUak
	bcRFZqy9zCkTm4zj2mqGqR237ICIq3+RGOlv+5PIHORyCMUU7yjdrOZPLY4UnAAh
	29RnM0PjYD6YawuJBmqLqmdM7oeJE4UhL4nb9ZEBrp1nu3WmyzUgIRLj0mtCcAVm
	1323Sw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjneuw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 20:28:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5bb68b386so429195085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 13:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743452899; x=1744057699;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3K1rbl6qLD0AtNbSIccTfCXz55A/TcpEH0lxj5Tjkgk=;
        b=VcLWfl2xqCjpVaIFS0U1JPrLpJ87PK5G6XpOEwjmeP68bCof5cTv0rzYEtw1PfqY+q
         YYRhvOJaWwbtKur6enGMNCqASL64nkGKCFgAn/uCHgmiu7o3AJT7sVuXGW/E4vmhkyyV
         RKLsU/sKh6ZmlCTHbgBYzaLCNxEoMCMkD6r46qaEXyq8rU+OYZDC+hc80Is3sCy8M6u8
         4eWzGezdmfsgpGUmVii3UnkBhfiCzp7maxDO1YZyoukfMTv1jBpwPOdcoBZdje0VdEoy
         MSrgICOVanNMtZaANtqmVwntUeJplqdV5c2rpA+MGVG/sl93/MdT33DO/F+bCaBym7V9
         DY/g==
X-Forwarded-Encrypted: i=1; AJvYcCXN6iTKwwLvARq5EvCrRH34zLWgU5CJlnwE/ATSkzkFQ1ST9gR6yVVE45DiThDmHK3JR1EsVgUc/RJJAhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdI8oloqzeZETTp87ibGjIyFaRkbUQ35xU8U++GfRE31/upc1Y
	Vr7ASJXk9rD/EqJHpCy2lbhY+QNMKlx2FX+S9j0PaaDOO0l9zC3R10y5tYqzumPieno9v/LIvXj
	LqjtsixSuOcUNhVmwYAA0iu812Bmn3SdLmAIONj3USrqHKqospoSUVfJSmzUrobo=
X-Gm-Gg: ASbGnctuOdGCHqZntp7w7Lu+b/G1Hr1b9n5S9qUbhGsBlpitZJxY6PRdgwmwpKLZ0Ea
	wy2cqTSCT4jeWmYDc64gdwo64PZggPN1srTlZjPSxXPSLfYX2zMh3N0/Wiimk432pdw8PJEiR8V
	SO9XZoWh009q8D7kAQCKy9BZmOZdiHpnXvgX5WYFEo3biAC2AZMpWbzRS2YqBitO3d8aktybk2P
	7x0k3WXYPqJV/kv7fyVRN2IwyOC+2hsakqSJ6Vdr6pr5upHOzP7eNeLUC1KZh/4aw9kD0WLKMqf
	dTKXNPSRf2TkP4O3fXFvZQSReXMuocco1KCjp4CVsfdMBcbgxFpBX9H0SEjJAu/oZGHEl7aQ6Fh
	m0cc=
X-Received: by 2002:a05:620a:468d:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c690897454mr1407868485a.51.1743452899558;
        Mon, 31 Mar 2025 13:28:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZsy3ubrttJKu3HDyw18jx9OGKPzoNm6q9xzA+s2DW7AytAK8ZIKxMqQnEzQcoeHb/Y6PrMg==
X-Received: by 2002:a05:620a:468d:b0:7c5:5e05:df33 with SMTP id af79cd13be357-7c690897454mr1407865485a.51.1743452899194;
        Mon, 31 Mar 2025 13:28:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2acf72dsm14925951fa.48.2025.03.31.13.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 13:28:18 -0700 (PDT)
Date: Mon, 31 Mar 2025 23:28:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
        quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, asrivats@redhat.com
Subject: Re: [PATCH v2] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <jlqxx47vzlp6rmwpi3tskig4qu4bgyqd7vletxbzzn7xdpep72@42tzrjkg65lh>
References: <20250331061838.167781-1-tejasvipin76@gmail.com>
 <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=UbUqNf4WoWzqMe5bDQmxiT+bRG_cn0n1dBrkFRijx0Cw@mail.gmail.com>
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67eafae4 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=z-ExhNoxjeCmSYn54VYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 7pnTXOm5IlGCWQk5Z5ehGRkP6nE-0rUn
X-Proofpoint-GUID: 7pnTXOm5IlGCWQk5Z5ehGRkP6nE-0rUn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310141

On Mon, Mar 31, 2025 at 08:06:36AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Sun, Mar 30, 2025 at 11:18 PM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> >
> > @@ -157,7 +137,6 @@ static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)
> >
> >         ret = boe_bf060y8m_aj0_on(boe);
> >         if (ret < 0) {
> > -               dev_err(dev, "Failed to initialize panel: %d\n", ret);
> >                 gpiod_set_value_cansleep(boe->reset_gpio, 1);
> >                 return ret;
> 
> It's not new, but the error handling here looks wrong to me. Instead
> of just returning after setting the GPIO, this should be turning off
> the regulators, shouldn't it? That would mean adding a new error label
> for turning off "BF060Y8M_VREG_VCI" and then jumping to that.

We should not be turning off the regulator in _prepare(), there will be
an unmatched regulator disable call happening in _unprepare(). Of course
it can be handled by adding a boolean, etc, but I think keeping them on
is a saner thing.

> 
> Given that we're already squeezing an error handling fix into this
> patch, maybe it would make sense to add this one too (and, of course,
> mention it in the commit message).
> 
> -Doug

-- 
With best wishes
Dmitry
