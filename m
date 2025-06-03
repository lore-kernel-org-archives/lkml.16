Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF1713AA2A
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 13:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748956921; cv=none; b=s6jJl6VxSLiu4D7I+6PBt9p8BxIv52MWa80NHlRdqMf/0Tz0oC064qLOoChpaxd32DtihsM3/v4gRB4F9jUqn+U3BfyVtV5r8oXSODTKrzAvb5OPbPvVwFl5E29P8p7uhWT4NLS2trkDn1JHjBOvdAhfE0zZb98uWuzhaMLbEiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748956921; c=relaxed/simple;
	bh=JYe6k00hY3KhqKNWZZYfrcga6wMeu5mCl8qy/F3JZ/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4NNVR1cJd1s8O4cdUHqnzd8zE/scHDRyW/aRwiB1859OAKi23lILQ48DOLVsxTc9GcV7a5i58q75bnGIe5lVFJR9oQVn4PvGo396K18CXTKgRpTkLFdmkMam1d5JQnrkaP/3O8U3iD3+RPfF/pmKVx2FMcWSDvKlQi27Dmya2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o152PGGX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o152PGGX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JJRn032523
	for <linux-kernel@vger.kernel.org>; Tue, 3 Jun 2025 13:21:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/QCS45DMhIwg/CzFK0EOT/Et0qY2IoNb/r6dL3eUVU=; b=o152PGGXC3Ybpcrb
	qPGaW/9vi7py8OlNRmkJrupgdfDC8HBpMkzVCOR+XS6/rPU1jfXeRkpu5QjR5lmd
	oofVEmjIKEIM1bmOdq17Uc6iF/JdoM2F5QeVrl5fvOJd2mv/yXnqx9YDJSYTtK55
	oBPGBPqWW3Hy39U7rqWYdSDm8xTtwQ9EqSgyAPT1TQoZcrF3IwbsZHM3ldj32V6n
	RcCFc6++9VvEQ1f6BhUtb8fBlnqAYWgwDE3KafGYzPprftuiJlxmD9n8fs1UdPAE
	ixjRcNCmlryZaRGLnsIhGA0hFeLpAeYV/r9al6EYOkqJ0X4/H6IrNjomgc5wVKxk
	9WUNSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471gb2amvj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:21:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d09f7052bcso803685985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 06:21:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748956917; x=1749561717;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1/QCS45DMhIwg/CzFK0EOT/Et0qY2IoNb/r6dL3eUVU=;
        b=qNvRo/Vs2o6npUQzMLQxgPH3rq+l/FVrbG2wUX/U+2nhWF2iFFHz1xXxp0Wmr/CsTT
         QePvLDPLiyRrsQmpqRYQP+nGVV1eYTffLeDfadCnz6hn1UbQqHBbZKColJrNqKxDmiRC
         1Is7DjZbTUv0P2DsYOVR9VrsVtEIBYOb6d+RmZGLmXjzBTOyGIZxH3hdeJ1K4gCRVE+a
         rh2QLKpl1bdJCMCzabfbNkm3aNLO77DoBVcREvAvnN9Xhz31nOnKVEzBQExNU46tVJG/
         FfHrRTpppg75vH/8HAyEdqODLtr510DEX3XDSDFw4mFnVUIBpD0YsX/d/rCNkXyqkdyH
         1Ybw==
X-Forwarded-Encrypted: i=1; AJvYcCUMEMss9XI55//A6DKoIO+gHulMAYmqpPD0fy0aIqzcjdWic18VylVpnkI9YnJQGD7lGg4bV001dmbyewg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG8uiAn1zZAMvMqD5Bt785JcNKUeq2IRfgXN7KIB0nlmkeJaWt
	0aeXf+2nEzambO/EAdSyEsV5jpSykdmd/1uPcbLFDJxn6BxnKIt8v7bOIVBc/cKuMT6RRO2yukI
	5Q2z+AwOhT8lCnpC3BHM2mytss2KZMf7B8QRjchPFPEnhwKP+zVNkeSElQli4yXctnuw=
X-Gm-Gg: ASbGncse9aLt6ECUm4bWVrrmMON9DKMedwKmuz600CgulEF/lCaSIDTEC61a3PQIloz
	d4sPo88BvzoTwijOMEwh3iarZhMZG5pJIWY7F1tkmT1HN4xKXHgULX6+LXMVTv2dXXzETeAJMS+
	CQkwGHbADJt1DhH348lVUo3tNnDTKoQLrH4wDYSn43m90xb7Iesl272WREUkbJnlVnGwYr9wpI4
	vvMn2mtFNxNzjotm5LPvnhFsOaDq66xC7JiuMhVD0L8tXDSxwKLsUgtzz4pRM7Qr2XE33aYNkSg
	XPI/TDXmKt3PVO/LmDO2fXch9Q4pTs7KpOh4zE3MEPjNHSyg8z+E6jOdeSrdPz5KTV5nSoCE6lo
	=
X-Received: by 2002:a05:620a:600d:b0:7cf:4d0:32ca with SMTP id af79cd13be357-7d0a1f9817cmr2666074985a.7.1748956916998;
        Tue, 03 Jun 2025 06:21:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG61Q5Fuf4lCs/bjxvDWw40qTbdRGjOr1Yrj23L146uOkG+6rBGInFbVy3+zf7+2f5RoMF6Mg==
X-Received: by 2002:a05:620a:600d:b0:7cf:4d0:32ca with SMTP id af79cd13be357-7d0a1f9817cmr2666069885a.7.1748956916431;
        Tue, 03 Jun 2025 06:21:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553510a7905sm409284e87.134.2025.06.03.06.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:21:55 -0700 (PDT)
Date: Tue, 3 Jun 2025 16:21:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 2/3] arm64: dts: qcom: qcs615: add venus node to
 devicetree
Message-ID: <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
X-Authority-Analysis: v=2.4 cv=EsXSrTcA c=1 sm=1 tr=0 ts=683ef6f6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=amOMt7fZymVLnIenHDcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: xF_g8OPBm8Qgbsgw79rvF13s2jaISSSV
X-Proofpoint-ORIG-GUID: xF_g8OPBm8Qgbsgw79rvF13s2jaISSSV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDExNSBTYWx0ZWRfX4PmQne4cqgsN
 +XUXqrhj7jklXc0LqEPQSuoZ7OVdiQ5k3GFA3w2B+k3SsiN6PpfZSk/EnOrXC8GRh87m0xaP6wh
 9NjeB8PIl1xjdDOkaFYCrpbfHho7z8ZsRdMXIKgG/lJG25SqNZlbcI1N6OvSNTRv4delmOyp5Zz
 Mj3CwVezE8dxyXU2C8X5xcnkmd6sfdDx9XzEmDjrZ3b1hgJ5mJaEPOclU/d0YbcZFeKOtQWXWMP
 IkoLyPjWoOVkU8BBkQn0uQ7cGFXAc3N01XMaD0LLOx5j7IpAK8WhXKOiCeoZGV2BfMoI37SLNsh
 7asOPFmVSpX63LghYCEGtBdlgZBhdzFrJJ6Lm7aAtPfz+qVGABoJ3y69+BC1iQTtO+koDybBFk3
 Zoz1knsptUFAZOSNqQquAvnNGsIqCV9lSjLYlKLSg+9zzpg4PJDS32gHf+6IZeAbtrzI583e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxlogscore=849 suspectscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030115

On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
> 
> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
> > On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
> > > On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
> > > > On 5/27/25 5:32 AM, Renjiang Han wrote:
> > > > > Add the venus node to the devicetree for the qcs615 platform to enable
> > > > > video functionality. The qcs615 platform currently lacks video
> > > > > functionality due to the absence of the venus node. Fallback to sc7180 due
> > > > > to the same video core.
> > > > > 
> > > > > Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> > > > > ---
> > > > [...]
> > > > 
> > > > > +			interconnect-names = "video-mem",
> > > > > +					     "cpu-cfg";
> > > > > +
> > > > > +			iommus = <&apps_smmu 0xe40 0x20>;
> > > > fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
> > > OK. Will update it with next version.
> > How would you update this?
> Thanks for your comments. I'll update it like this.
> iommus = <&apps_smmu 0xe60 0x20>;
> 
> This 0xe40 SID was based on a previous project. However, after rechecking
> the documentation yesterday and confirming with colleagues, the correct
> SID value should be 0xe60. I’ve also validated it on local device, it
> works as expected. The reason 0xe40 seemed to work earlier is due to the
> mask value being 0x20, which causes the effective SID derived from 0xe40
> to be the same as 0xe60.

Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.

-- 
With best wishes
Dmitry
