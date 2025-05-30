Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A556910F1
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748583500; cv=none; b=NpX4Q2L5pmzDwHWNuFHK5sIQLjo8SlGKOemDnHBQMQ7U00hbKzLrXtbxWumhc2/N0vrPkPWiJgKl0iOpI8rOiGHqYrrndan73Oc4OLoVJ3jPgcqwBmm+o8hT/TC8rhMZSK413G6HzkWz44JSk13aJEJ/wQhXgFv0sOUejtRGuTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748583500; c=relaxed/simple;
	bh=DAM1xv4aIcHbG+44NWHL5X8a66NMADDmmoa/uAs40V0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPouMJurg0fc8ZVTtS5BrgiYt9PwFJY0f/a4Ftr6Q54Q7IAbl7PE9zp0iBlWCQJ78/Y/C0Wd2Uhg6zFsVmsmkb81mo414pdg8a0LumkqYIQoFbW2f/qeqUL6sHgQ3KPr9s+8fEkQh/PUEJHAeK7M+VzMG4p+9CiQoXKi7twQ9WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeRC5F+J; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeRC5F+J"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54U0UZ8d006984
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAM1xv4aIcHbG+44NWHL5X8a66NMADDmmoa/uAs40V0=; b=CeRC5F+JSf4KVN3C
	4nyAdI7/AZkOzvoiFdnzNbY+nVVmiZs+tCb8g1ZnfOHurXlghIxc1j60OpGA6MP1
	Iq0x4XixKmdVvmfIzvviNElSssmARGSyFglKHHQu1CATaYgq91CZO6Q8sARLXcrz
	yXQqveRVpawvf3RbkwmUNRnxYNJno+tMuMn598YtSfnIVDW6B3jiAHjDjt0wYHc6
	qDlGzVWItPBwANgFJgHtn89B9GomQWkFfnG59AfCPI4A7e9G+4QiAr8LlePYpQOK
	wD0rILVIYzrj2h8QVlkE4s5n1QkWBAtuh7IPY5n7BVm1M2uplRsr4HWjGUe4tMQX
	/ejv/g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqg28b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:38:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-311f4f2e761so1734854a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 22:38:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748583496; x=1749188296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAM1xv4aIcHbG+44NWHL5X8a66NMADDmmoa/uAs40V0=;
        b=ewRUerXpMVUOrkU6yVqAfT7p3wDZMKHhedmy3JKB8dBUdhwaaxdx8DnwOTjYd66SkC
         /Bf9Htvqq7sMT1HuEwqo8ibkAOXFG1baTUvhOitd3hP8LeDrjlbsAIfges0ezNE3Bf35
         KwLCwQ+e0IqtjWqczPyCve+hWiJhzzYzN2JYqke59/P7eybpFPAWooADJUzQxRPFDXJ/
         0FMAjMDQFuo5AoChSz1XAdJ0FLLgM52xGjAT6Q0G/rbs+YlIxjZOZ8SZuA40aVU4ANZ4
         WFlPUl2mBpFnZiDcvtKHo0b3y7NFE3TfUoliDzAQj2hEL3RHsZ1vgyrf8QFqR11BmrTT
         OTlg==
X-Forwarded-Encrypted: i=1; AJvYcCXj7kC1daeu3XcDNfmI8swfcfMjC9pxMx/nfBjNTfrI/caF4e9BYW2ucUe98iUu+BuvX9fAvekaujhbCQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywb7kZwgTDagOR129yCfLxDqnmiyc5/Tn0rpthxZs5oENE2X/Ua
	x0ZCONemqVJt67tUUM40845XTwcOg9zPxm+0Tk4lYxlhH/y4XrT1li9Vb11mBKNzw8hd4UjiHlE
	NIypiFG9kyu+eva1od+Umzu+rWPDhdwg6QVHlQeUBY79yAyqp/WYu+uhlwfTE3WcNDvGyt+CK2a
	4431fUbpGP7lAJXds3clXKL11sh5TfXToESxyBcYNrAw==
X-Gm-Gg: ASbGncvYSEB1Wdyd9fDAux6ZTxzn8PmxnSQIny03V8iycxKw/bG5RvHp1GaWMp3YgaB
	MGcTXLElMZ2+8dGHTQvOPhcDOoZ5GIwXkSY1sgN8Ym2B9NlnMmbT1SeBdd/xipLOgVzbhJQ==
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id 98e67ed59e1d1-31241e8cb1dmr3480989a91.24.1748583495943;
        Thu, 29 May 2025 22:38:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFlRKedberL2RSYX+Cuqh6kpcKHhbGZ6knyFtPkPCsJbClMKOFQ0UxpJuVW1yGijcS7W1vDNS6L1UHnnyNYTAk=
X-Received: by 2002:a17:90b:55cb:b0:311:e8cc:424e with SMTP id
 98e67ed59e1d1-31241e8cb1dmr3480961a91.24.1748583495522; Thu, 29 May 2025
 22:38:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525-update_phy-v3-0-5b315cd39993@quicinc.com>
 <20250525-update_phy-v3-2-5b315cd39993@quicinc.com> <mcmpmaapzv3vbiynlrp6sijdjvj6a5j3dxzoixz6b4cxqsvbsl@ecljexn3zg2e>
 <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
In-Reply-To: <0aef1687-0158-4d7e-8e3d-b6eafc38d049@oss.qualcomm.com>
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 30 May 2025 11:08:04 +0530
X-Gm-Features: AX0GCFukz3bJpAGapqXqQc3NL2QHl1v8ESUc1ESnOp93Hj9Tp8FIwCGUoDy2dG8
Message-ID: <CAMyL0qPd2HRv4nr2C9=5SgzSkuKO_1cfZbOUO2aUj3vPWnmJbA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: sa8775p: Remove max link speed
 property for PCIe EP
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: Pxn1e3xB6PdeTIyd7KxXUPBRFe4cc4Fo
X-Proofpoint-ORIG-GUID: Pxn1e3xB6PdeTIyd7KxXUPBRFe4cc4Fo
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=68394449 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=eed2zNinQUnWPIZz8mYA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDA0NSBTYWx0ZWRfXxctCFn5/kiLI
 mwX7y/YGS4TEywMIVB69mw0W9cUtRXIecbLMBUIVGCyyvgMhsT9VN1efUc6htM7oOOpHT8o8A7t
 wooU0/hjEmjs4hctv3WVxVm0T2d7TpOdu1hKxprxDXHhgmg3oSoqTl+XdYvw1tJC/O0d+ASceU4
 wycStaPltwe1P6qYWq61B7hIgQYNOIcQncUgMffknqZILdKUgjDFnssIUHVG3RWn1i07e/ntn/H
 BgxRWXgthz8Ii1BFv7RpTWwPn386W/Ph6rQULfva7aRbCSqR5p8J5S+KcwYZyhUb4UwpMubJPrK
 TwF2Xi+5vS8Y6VcidiRXmXJZ4QIKn5kP18hQg5t4MUvt7/lTXwDcpwnUW43rE3ah23U6Dc46/Uo
 Rf2MQPMiS1k4vZjXtuXhiT73qce0IS1uIXGwEuOyahLayQJCh6fOJkJgarI6CNySYffbV8uG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_02,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=885
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300045

On Tue, May 27, 2025 at 4:06=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/25/25 3:29 PM, Dmitry Baryshkov wrote:
> > On Sun, May 25, 2025 at 11:27:18AM +0530, Mrinmay Sarkar wrote:
> >> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
> >>
> >> The maximum link speed was previously restricted to Gen3 due to the
> >> absence of Gen4 equalization support in the driver.
> >>
> >> Add change to remove max link speed property, Since Gen4 equalization
> >> support has already been added into the driver.
> >
> > As Gen4 equalization is already supported by the XYZ driver remove the
> > max-link-speed property.
> >
> > "Add change to remove" is a bit clumsy.
>
> I'm more worried about this node not having these gen4 eq settings
> (i.e. the part talking about driver support landing is true, but it's
> unused without the presets being explicitly defined in eq-presets-16gts)
>
> Konrad

Hi Konrad,

Actually stability issue was resolved by this patch series:
https://lore.kernel.org/linux-pci/20240911-pci-qcom-gen4-stability-v7-3-743=
f5c1fd027@linaro.org/
and I don't think we need to define eq-presets-16gts for this.

Thanks,
Mrinmay
