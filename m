Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3334CEAC6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743166109; cv=none; b=SP90A4nPl+TFZnG79aHipxt1KgBDzPj/yeI3iJUKnWCCigdTjt7COojMPMphlsrdZrVQI9jvyG+/OAJ0mr4r74iVtP/We/tk2X2s/xTfyt6O1C83aMJm9PRM54tuv7ZjlTxV9inIZ96GIVqgYROeeF9k2a2Q9y1cb3GF29Axqiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743166109; c=relaxed/simple;
	bh=Cel7ccYVMHPCCmgn+VUjmkFBM9POaj8XCxVQSuiVHQs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxanLpjYKqqIZbig6M8H4WqYD54Ug+pH65espUwEQszPSWxRt9SObK4PoOUbIXcVWds3WBAadDqFXHYhLm6jKMZcJlr5ejGLLYKybuW2EcRVY4+p6uXMJtxSXdF1KPKDY5/7imGxN9o/COHPX8dwOsMEQw8kUUIaHhg9liX+pzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gATY2C3/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gATY2C3/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52S5STVG022968
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:48:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YV+Qy/uGiVgEIzLBpOldth8y
	WefTUWIPYLBPGQJW+5M=; b=gATY2C3/LSfRGxtDXJzWTguWBUxQPe+2785QE2UI
	pN4QXbpXc1d03w2F/sEh0HbOX7JSUSlW2KEU3mAs9bDB9KJm4RUw6B4TiVhQQHWe
	uImWvq/WyyGavC8We9QFx7+lj0nisJ8IUXJb48P4g1SysGvbVqBdKo+QO4vgC/c9
	pkamoBMe9tsOzwq3DwCWWOHKM9gbvbknbni/vIr0LeG7Y3AAdHWon+1YUI5yhT5x
	dqOgsi5VLrdISlV3E6w7K+fd+OdiqBqSZS3LdJY7dUeVXF5r99Bdn0WlfdW44u0T
	vmQ9h9w51SsZALSr9FdDe7rbGsgI3qSbmWf7O7zeyeYU1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45mb9n0bgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 12:48:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5f3b94827so234638885a.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 05:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743166106; x=1743770906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV+Qy/uGiVgEIzLBpOldth8yWefTUWIPYLBPGQJW+5M=;
        b=I4j7Q55K8QOtJ+ckwtgGnfao8kW3GZPPBY6g75p8FzSbqRGJ9n1ozLW77WqV+DsN/r
         BeMyBq7b3s5Ezbq+9f/2O2r8MuZwq6HnAtcNF2egJeim1ojRH5Gsby38htKA9VdmNvhH
         ntAOxDlOMchT1qs5Nvvc+rKWNSGyvD25T83iSIRp6WwQGK6dYOzv07/Zo2I50IbQuDVH
         /KuyvXhZHPHf0NQk2Ph2JonotQtAIHc4U+RMAvpi8SDh8GSvU/wCVNKt2OuNbC68tpAb
         P8VzWGBlOufUNkx1ugMrXBZ6VV7VN/NNq0i2cmM2ak+gY5i2OAesNO1olu+wv55aKq0E
         JF8w==
X-Forwarded-Encrypted: i=1; AJvYcCV4aH+vsOhMCgCK8OvDCDAOD+o6YhWbntoipwJBEEiyXtj7T/MTNl/HHAqaVHUCkvFwGJ4L8HyKuTvWhhw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXjkUaFe6DPxDtETtYo1QrEGkTPsGFDqNQmuTUpSbPvAYba8QD
	qcvahOs9Wh0033tbQZkCq2d4MkzZBTenuhhugCnqAZkevDbpIoQW414arCeYwfdHS3H/QXW4XzR
	Is6K+GPPVRvm41C4AcX1H8P19Ll1vAsFE9g8Iud+Y3wCL1Q5ITxIgN7JIBikbF1M=
X-Gm-Gg: ASbGnct9e8oN8U1GzBzRxn5ulx5PWMGYFFkzAf9tbLxAOrq2dL+38b9KxxyGZZy7ze7
	fU+gAmYPu135ftzCX7wOhfHXGSlsExFM+3lLA1eKjJJ6VnOw4zTT8DcY7YgPjzwP3f6hMOVbS3x
	2L0tZGAJJvzf3r4vLm4TORFXEzU5c0z94ZeeokdfhhPnDx60nofqW5JnCrUWS9oKOzaxcHVhY9T
	5etSen5i1CFjmdgGn4O9RmzXJZhThZ+8igeY7rg2VuWHAZqGQSaz+gfZtl4c0tKi8OsJNkK7jLN
	A7KAGgoxFQRJ0sjSQNLtffL2egsmb1RNqnpsk1d+OqRmLzH8czXvg8QfMQlL3lfobLTF1iTeuCb
	XFo8=
X-Received: by 2002:a05:620a:4611:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c5ed9fda61mr1196563085a.21.1743166106044;
        Fri, 28 Mar 2025 05:48:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSfe1qoUpF/M62b+DetpqtJpHgBbIPS3Qb5a03OKSWkEGQgYqUXvfCuAM6pN4enFdUj9Ee0Q==
X-Received: by 2002:a05:620a:4611:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c5ed9fda61mr1196558685a.21.1743166105567;
        Fri, 28 Mar 2025 05:48:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b095a0cc4sm289651e87.226.2025.03.28.05.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 05:48:24 -0700 (PDT)
Date: Fri, 28 Mar 2025 14:48:21 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yuvaraj Ranganathan <quic_yrangana@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sa8775p: add QCrypto node
Message-ID: <gkjdjzmhtsr4la5ami4qnsqgrd3zzdvu46eyaxpwh2brfsqm6m@wwkuxljbfwa4>
References: <20250227180817.3386795-1-quic_yrangana@quicinc.com>
 <ea79cee4-8c47-4054-bd17-2097ada4e583@kernel.org>
 <b57fa204-d3d2-4b74-8834-3f2d93726a99@quicinc.com>
 <73ed6108-27ab-43ac-abd3-82656693404d@kernel.org>
 <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4a205725-af49-4f28-ab78-7059451d66c8@quicinc.com>
X-Authority-Analysis: v=2.4 cv=cs+bk04i c=1 sm=1 tr=0 ts=67e69a9b cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=XIGxjvZd5PgJVFysyh4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ZjX2z6QcMFIV7f-3k_w31TPO441gjYnW
X-Proofpoint-ORIG-GUID: ZjX2z6QcMFIV7f-3k_w31TPO441gjYnW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_06,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280088

On Fri, Mar 28, 2025 at 11:34:58AM +0530, Yuvaraj Ranganathan wrote:
> 
> 
> On 3/27/2025 12:38 PM, Krzysztof Kozlowski wrote:
> > On 26/03/2025 18:40, Yuvaraj Ranganathan wrote:
> >> On 3/25/2025 1:00 PM, Krzysztof Kozlowski wrote:
> >>> On 27/02/2025 19:08, Yuvaraj Ranganathan wrote:
> >>>> The initial QCE node change is reverted by the following patch 
> >>>> https://lore.kernel.org/all/20250128115333.95021-1-krzysztof.kozlowski@linaro.org/
> >>>
> >>> Use commit SHA syntax (see submitting patches, checkpatch).
> >>>
> >>>> because of the build warning,
> >>>>
> >>>>   sa8775p-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
> >>>>     ...
> >>>>     'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
> >>>
> >>> Not relevant warning.
> >>>
> >>>
> >>>
> >>> Best regards,
> >>> Krzysztof
> >>
> >> Are you saying this is not the warning seen at merging?
> > Tell me how it is relevant? Tell me how can I reproduce it.
> > 
> > Best regards,
> > Krzysztof
> 
> Below commands will show the above warnings without the fix,
> make clean && make qcom/qcs9100-ride.dtb CHECK_DTBS=1
> make clean && make qcom/qcs8300-ride.dtb CHECK_DTBS=1

You are probably running those commands on a tree where the patch was
not reverted. That's useless. Please update your patches to stop
mentioning the (outdated) warning and just describe your changes (i.e.
adding the QCE nodes, you are not fixing any warnings with your change).

-- 
With best wishes
Dmitry
