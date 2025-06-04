Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E320728FAB7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749044486; cv=none; b=dkc0FX3EaOw+OCcuwAVq1sIPcwBmFrBS0VI8bbgoeweaI/k8fmBE25iPtfIuz3ZxkNuQOxt+uwPukD64Q9twJzGkSovm2a50U5vbjnw4rhsqSbr5SS8k5FndJpWeA7niKhq0WGbu8DeaswirivVBRcWgHKjWeSK8wUSmPPk2/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749044486; c=relaxed/simple;
	bh=1kU0n2bW3hlLIxRCbwHPbQyi7Fb4CY9XVqE2C/Sy8+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ObWeV35CuwmrLEaHmiVENa6V5TTYxk/e8pOpp6SJjh0WPR7JfXaAI1uhlW4fqYk9op0Wa2Oe569RwcLV9sWiGV+lO510bmPvou7zBeoQXn66K1V7d2QCujlV+1tk9PRoVSDE1aBTUdu3ZgegpiLO+2I+xDwk3LIClbTMkgRNIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K87g+iFJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K87g+iFJ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5547YaQg028363
	for <linux-kernel@vger.kernel.org>; Wed, 4 Jun 2025 13:41:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3/ZLOV/HNol/MkyrbMnKs/oh0VOFuPImZUzRQhw3LY8=; b=K87g+iFJ17Kk+tbC
	74pCfHp6SL7Pp2K1xutgdSGMASlUdO+fSbB65gb8DBREgBlvfPZDzfzq2B73uvNs
	BCyH2xbXDX2iWh6KZaJONs2C41NWZOkRGlxhqjY8CnjHVCPbx+L3oLUZvQ5+bkZ/
	hZIjNCqkoB2CMVFSdmN/Pz+piZ4mARhPrveY7h69ngDohNQpnpbQCSHU0tOCXUwE
	F6CxPH5YLX6tH66C8TkbqZ17K8EGg3u3kRqXVGPlK9eEEWDSWb3tNVqgcm/63k/M
	tgy8HZrgOLFZ1AtyAdURvuaS/NNLiSJvUWdh39nEpWoKBChGEZD2MYab/GmWYj/R
	rBE5og==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471g8tx89b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 13:41:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d09ed509aaso1025214385a.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749044483; x=1749649283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/ZLOV/HNol/MkyrbMnKs/oh0VOFuPImZUzRQhw3LY8=;
        b=C3X86z+gi44/kbhBzeEYMDRmwLT+T9NVGzEOqCwqN20UnuXwzeDkNL1nRfZnfaTyhk
         QsiKOm1KqH2yeICmRUQM5zmSFoc1bYA+o2vowOAcejW4lQEXCb542VpW6Mx9qmLP1FFM
         iFEv/1sXEajU8737qptjWfRpfRNAQ5pf5Uwfb++bEPCVOLz15fQJkfi386rh4VlWgnyL
         En37gpqV5cuCksTtaCpgmFOdRVIsAnem4gqW/kHqKDn0+K1/sdiS080yYrbAabF/tm4B
         x6WGuam+tuynG1ocUXW3UR7dvP7cJ2AivkF04FFTnoD54MZxHQ+KDBNA2xlWJycUumX1
         j+vA==
X-Forwarded-Encrypted: i=1; AJvYcCVoKEueD53LPgvG8sxmeTnsDHbtjgxzzje1vL5R0vV3MdvyMrsgxklS6XE4nNdQxINsEmdejkEat+ViIoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIoGxnaztIgU1hV394qQajx23MILk3Ca61RqLN8Iyb4RUiFtX0
	/+Q5V22B5SmXcB+KJ637d6w3wuFPv3Y1h2twP59gSFwEZTzyF6Zq+JndRa/ECeUS2wHbuCNBKO1
	JXojvGs0Bxylnk5uF7gAsp7YKHSNnuxCtVrMn+GqLIRlkECLSpUkIybpLpEfNYcRz5EI=
X-Gm-Gg: ASbGncs8JdWjYGfPA6AOsnG23Sr8mvXsDtX4dVkFJ8TMF/CwHOPQtZkmbRd6ai2xfpu
	RmzXIlDwnXqJ8Z61a5OuhZKNgCI8KvzGCbSOFltNrKROOTlu9ciox8o6S5f3xK1xGG/DJgQn+Y9
	WXauZy2vbD3+1dmUfpFKYAsP+sC6dx+5PEZ9IWgep1/N6WkLY4jHw7U7IQ3AQlY6TizDrwjQqut
	TBVMxdykZo9ECov5waKeqZo/yimFegLSDBK2lrg286yKpzuXLYjJ+0DjfolNK1u9NQ5H2kFAAVu
	lWvQXlkMyaVj5aIk5DItPX19uJS82eKitsNQ7hlSjG1z5/PQw1Irbpi7lqgdK0/5YJc0a2zL6u8
	=
X-Received: by 2002:a05:620a:44ca:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d21997cd79mr512472085a.25.1749044482833;
        Wed, 04 Jun 2025 06:41:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3op8LTfjOLqxZdhVw2i4Biz6kY73hnDxhxU2RIwZnTe0rdyBP1Nv6BjhIaJZeMxqSKmPUpQ==
X-Received: by 2002:a05:620a:44ca:b0:7d0:9782:9b05 with SMTP id af79cd13be357-7d21997cd79mr512464685a.25.1749044482199;
        Wed, 04 Jun 2025 06:41:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a85bd2a3asm21611731fa.90.2025.06.04.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 06:41:21 -0700 (PDT)
Date: Wed, 4 Jun 2025 16:41:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Renjiang Han <quic_renjiang@quicinc.com>,
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
Message-ID: <wyzyffaksofnubx72dy6uj6wuv5nk3bxii2ncdvb7ga3fegynj@z44aoiu4ywt6>
References: <20250527-add-venus-for-qcs615-v7-0-cca26e2768e3@quicinc.com>
 <20250527-add-venus-for-qcs615-v7-2-cca26e2768e3@quicinc.com>
 <429b4c99-b312-4015-8678-0371eac86de4@oss.qualcomm.com>
 <6a9e7daf-c0df-42db-b02d-96d9893afcde@quicinc.com>
 <idc4476ibh4geraklzpas5536jnwvbp6xhjjaajcdcwxicorrf@myh7kyz77rxy>
 <43e1f8db-5ab1-44ce-97c8-50910704788f@quicinc.com>
 <d6udpwmocodvlsm5ljqz7zbyonj2yahtlzmm2jjjveqrm2hmkz@andh5j4jgixr>
 <9faff664-9717-4259-8b23-bc44e64f6947@quicinc.com>
 <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77ea49c3-f042-4ba9-a0da-1d0e4e4088d3@oss.qualcomm.com>
X-Proofpoint-GUID: bDKk_XkzXIZQGOI5ximkCsqx8pCTqVuM
X-Authority-Analysis: v=2.4 cv=Qspe3Uyd c=1 sm=1 tr=0 ts=68404d03 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=i_0oWf60KM-UqR_2WRwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDEwNCBTYWx0ZWRfX79FSQCfMJjEe
 IU695IXe0TngqHFOa2uePod/vhHm1ofk+DDpVs8EhqgDKeYpDDCwbv7Si7N59bELEtEM2xCPJdB
 7jBX1txKuUu13jcri4vYilkdfgKDfyNqn9g6VwEpzDo5KJefA03jenjp5nNZY/afF4B4OuOp9Wv
 LrL1Rtlj45U97M+2HAYPTU3n4Ts+1HL0H3bnLosVf5Uftw2cQftSSyGFzoJGErHRthBAsyKs0+9
 h/WgVqOgJkUExRQR7tLV6ofGQtH9iBFstnV1m4QAbqCjLVtVRMOPz5Ad/4CZK4xw7ME0zs+cKpq
 WidghZKGdnIMHcxEoWaZE+rt6JzWwY2BV07dw2TvUkv6hjU25b7IOISrgUniaKJUf/mNddgk4Mm
 Ft4011NVICZbqp42AbQgllhbkA5we8LexBhLQUsI40k19vpvTT69xUesv9huH+QbBXvhVmsW
X-Proofpoint-ORIG-GUID: bDKk_XkzXIZQGOI5ximkCsqx8pCTqVuM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040104

On Wed, Jun 04, 2025 at 03:24:25PM +0200, Konrad Dybcio wrote:
> On 6/4/25 2:05 PM, Renjiang Han wrote:
> > 
> > On 6/3/2025 9:21 PM, Dmitry Baryshkov wrote:
> >> On Thu, May 29, 2025 at 10:29:46AM +0800, Renjiang Han wrote:
> >>> On 5/28/2025 7:04 PM, Dmitry Baryshkov wrote:
> >>>> On Wed, May 28, 2025 at 05:13:06PM +0800, Renjiang Han wrote:
> >>>>> On 5/27/2025 9:57 PM, Konrad Dybcio wrote:
> >>>>>> On 5/27/25 5:32 AM, Renjiang Han wrote:
> >>>>>>> Add the venus node to the devicetree for the qcs615 platform to enable
> >>>>>>> video functionality. The qcs615 platform currently lacks video
> >>>>>>> functionality due to the absence of the venus node. Fallback to sc7180 due
> >>>>>>> to the same video core.
> >>>>>>>
> >>>>>>> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> >>>>>>> ---
> >>>>>> [...]
> >>>>>>
> >>>>>>> +            interconnect-names = "video-mem",
> >>>>>>> +                         "cpu-cfg";
> >>>>>>> +
> >>>>>>> +            iommus = <&apps_smmu 0xe40 0x20>;
> >>>>>> fwiw docs mention 0xe60 0x20 (which result in the exact same resulting sid)
> >>>>> OK. Will update it with next version.
> >>>> How would you update this?
> >>> Thanks for your comments. I'll update it like this.
> >>> iommus = <&apps_smmu 0xe60 0x20>;
> >>>
> >>> This 0xe40 SID was based on a previous project. However, after rechecking
> >>> the documentation yesterday and confirming with colleagues, the correct
> >>> SID value should be 0xe60. I’ve also validated it on local device, it
> >>> works as expected. The reason 0xe40 seemed to work earlier is due to the
> >>> mask value being 0x20, which causes the effective SID derived from 0xe40
> >>> to be the same as 0xe60.
> >> Using 0xe60 would be counterintuitive, as we have a non-zero masked bits
> >> in the base value. It should be either <0xe60 0x0> or <0xe40 0x20>.
> > 
> > Hi Dmitry
> > 
> > Thank you for your comment.
> > 
> > I’ve followed up on this sid with a colleague from the kernel team,
> > and based on our discussion, it seems that the sid in this case should
> > be the result sid. The actual sid is 0xe60, and with a mask of 0x20,
> > the resulting sid would be 0xe40. Therefore, it should be <0xe40 0x20>.
> > 
> > @Konrad, I’d appreciate any thoughts or suggestions you might have on it.
> 
> What our docs describe as 'result sid' is literally 'base ~& mask', so if
> we used that, setting the mask would be useless..
> 
> Now, some old NHLOS builds are known to cause issues if the values aren't
> exactly what they expect (some whitelisting must be going on there).
> 
> I don't think this should be an issue on this platform, but let's just
> use 0xe60 0x20 here to reflect the real values

Isn't 0xe40 also 'real'?

-- 
With best wishes
Dmitry
